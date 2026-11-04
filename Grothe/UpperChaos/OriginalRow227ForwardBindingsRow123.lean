import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow122
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123
import Grothe.UpperChaos.OriginalRow227TriangleForward1511
import Grothe.UpperChaos.OriginalRow227TriangleForward1512
import Grothe.UpperChaos.OriginalRow227TriangleForward1513
import Grothe.UpperChaos.OriginalRow227TriangleForward1514
import Grothe.UpperChaos.OriginalRow227TriangleForward1515
import Grothe.UpperChaos.OriginalRow227TriangleForward1516
import Grothe.UpperChaos.OriginalRow227TriangleForward1517
import Grothe.UpperChaos.OriginalRow227TriangleForward1518
import Grothe.UpperChaos.OriginalRow227TriangleForward1519

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1511 : OriginalRow227TriangleForward1511.entries.size = 32 := rfl

def entry1511 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1511.entries[i.val]'(by rw [size1511]; exact i.isLt)

theorem fields1511 (i : Fin 32) :
    (entry1511 i).IA = shift ∧ (entry1511 i).ID = S (122 + i.val + 1) ∧
      (entry1511 i).IC = S 123 ∧ (entry1511 i).Inext = T 122 (122 + i.val + 1) ∧
      (entry1511 i).Icur = T 122 (122 + i.val) ∧
      (entry1511 i).output = T 123 (122 + i.val) ∧
      (entry1511 i).charge = charge 122 (122 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1518_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1511 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (122 + i.val)) shift
      (S (122 + i.val + 1)) (S 123) (T 122 (122 + i.val + 1))
      (T 122 (122 + i.val)) (T 123 (122 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1511.entries OriginalRow227TriangleForward1511.checked
    ⟨i.val, by rw [size1511]; exact i.isLt⟩
  change (entry1511 i).check = true at h
  rcases fields1511 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1512 : OriginalRow227TriangleForward1512.entries.size = 32 := rfl

def entry1512 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1512.entries[i.val]'(by rw [size1512]; exact i.isLt)

theorem fields1512 (i : Fin 32) :
    (entry1512 i).IA = shift ∧ (entry1512 i).ID = S (154 + i.val + 1) ∧
      (entry1512 i).IC = S 123 ∧ (entry1512 i).Inext = T 122 (154 + i.val + 1) ∧
      (entry1512 i).Icur = T 122 (154 + i.val) ∧
      (entry1512 i).output = T 123 (154 + i.val) ∧
      (entry1512 i).charge = charge 122 (154 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1519_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1512 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (154 + i.val)) shift
      (S (154 + i.val + 1)) (S 123) (T 122 (154 + i.val + 1))
      (T 122 (154 + i.val)) (T 123 (154 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1512.entries OriginalRow227TriangleForward1512.checked
    ⟨i.val, by rw [size1512]; exact i.isLt⟩
  change (entry1512 i).check = true at h
  rcases fields1512 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1513 : OriginalRow227TriangleForward1513.entries.size = 32 := rfl

def entry1513 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1513.entries[i.val]'(by rw [size1513]; exact i.isLt)

theorem fields1513 (i : Fin 32) :
    (entry1513 i).IA = shift ∧ (entry1513 i).ID = S (186 + i.val + 1) ∧
      (entry1513 i).IC = S 123 ∧ (entry1513 i).Inext = T 122 (186 + i.val + 1) ∧
      (entry1513 i).Icur = T 122 (186 + i.val) ∧
      (entry1513 i).output = T 123 (186 + i.val) ∧
      (entry1513 i).charge = charge 122 (186 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1520_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1513 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (186 + i.val)) shift
      (S (186 + i.val + 1)) (S 123) (T 122 (186 + i.val + 1))
      (T 122 (186 + i.val)) (T 123 (186 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1513.entries OriginalRow227TriangleForward1513.checked
    ⟨i.val, by rw [size1513]; exact i.isLt⟩
  change (entry1513 i).check = true at h
  rcases fields1513 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1514 : OriginalRow227TriangleForward1514.entries.size = 32 := rfl

def entry1514 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1514.entries[i.val]'(by rw [size1514]; exact i.isLt)

theorem fields1514 (i : Fin 32) :
    (entry1514 i).IA = shift ∧ (entry1514 i).ID = S (218 + i.val + 1) ∧
      (entry1514 i).IC = S 123 ∧ (entry1514 i).Inext = T 122 (218 + i.val + 1) ∧
      (entry1514 i).Icur = T 122 (218 + i.val) ∧
      (entry1514 i).output = T 123 (218 + i.val) ∧
      (entry1514 i).charge = charge 122 (218 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1521_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1514 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (218 + i.val)) shift
      (S (218 + i.val + 1)) (S 123) (T 122 (218 + i.val + 1))
      (T 122 (218 + i.val)) (T 123 (218 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1514.entries OriginalRow227TriangleForward1514.checked
    ⟨i.val, by rw [size1514]; exact i.isLt⟩
  change (entry1514 i).check = true at h
  rcases fields1514 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1515 : OriginalRow227TriangleForward1515.entries.size = 32 := rfl

def entry1515 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1515.entries[i.val]'(by rw [size1515]; exact i.isLt)

theorem fields1515 (i : Fin 32) :
    (entry1515 i).IA = shift ∧ (entry1515 i).ID = S (250 + i.val + 1) ∧
      (entry1515 i).IC = S 123 ∧ (entry1515 i).Inext = T 122 (250 + i.val + 1) ∧
      (entry1515 i).Icur = T 122 (250 + i.val) ∧
      (entry1515 i).output = T 123 (250 + i.val) ∧
      (entry1515 i).charge = charge 122 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1522_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1515 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 123) (T 122 (250 + i.val + 1))
      (T 122 (250 + i.val)) (T 123 (250 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1515.entries OriginalRow227TriangleForward1515.checked
    ⟨i.val, by rw [size1515]; exact i.isLt⟩
  change (entry1515 i).check = true at h
  rcases fields1515 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1516 : OriginalRow227TriangleForward1516.entries.size = 32 := rfl

def entry1516 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1516.entries[i.val]'(by rw [size1516]; exact i.isLt)

theorem fields1516 (i : Fin 32) :
    (entry1516 i).IA = shift ∧ (entry1516 i).ID = S (282 + i.val + 1) ∧
      (entry1516 i).IC = S 123 ∧ (entry1516 i).Inext = T 122 (282 + i.val + 1) ∧
      (entry1516 i).Icur = T 122 (282 + i.val) ∧
      (entry1516 i).output = T 123 (282 + i.val) ∧
      (entry1516 i).charge = charge 122 (282 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1523_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1516 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (282 + i.val)) shift
      (S (282 + i.val + 1)) (S 123) (T 122 (282 + i.val + 1))
      (T 122 (282 + i.val)) (T 123 (282 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1516.entries OriginalRow227TriangleForward1516.checked
    ⟨i.val, by rw [size1516]; exact i.isLt⟩
  change (entry1516 i).check = true at h
  rcases fields1516 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1517 : OriginalRow227TriangleForward1517.entries.size = 32 := rfl

def entry1517 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1517.entries[i.val]'(by rw [size1517]; exact i.isLt)

theorem fields1517 (i : Fin 32) :
    (entry1517 i).IA = shift ∧ (entry1517 i).ID = S (314 + i.val + 1) ∧
      (entry1517 i).IC = S 123 ∧ (entry1517 i).Inext = T 122 (314 + i.val + 1) ∧
      (entry1517 i).Icur = T 122 (314 + i.val) ∧
      (entry1517 i).output = T 123 (314 + i.val) ∧
      (entry1517 i).charge = charge 122 (314 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1524_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1517 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (314 + i.val)) shift
      (S (314 + i.val + 1)) (S 123) (T 122 (314 + i.val + 1))
      (T 122 (314 + i.val)) (T 123 (314 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1517.entries OriginalRow227TriangleForward1517.checked
    ⟨i.val, by rw [size1517]; exact i.isLt⟩
  change (entry1517 i).check = true at h
  rcases fields1517 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1518 : OriginalRow227TriangleForward1518.entries.size = 32 := rfl

def entry1518 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1518.entries[i.val]'(by rw [size1518]; exact i.isLt)

theorem fields1518 (i : Fin 32) :
    (entry1518 i).IA = shift ∧ (entry1518 i).ID = S (346 + i.val + 1) ∧
      (entry1518 i).IC = S 123 ∧ (entry1518 i).Inext = T 122 (346 + i.val + 1) ∧
      (entry1518 i).Icur = T 122 (346 + i.val) ∧
      (entry1518 i).output = T 123 (346 + i.val) ∧
      (entry1518 i).charge = charge 122 (346 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1525_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1518 (i : Fin 32) :
    forwardStepOK (-768) (charge 122 (346 + i.val)) shift
      (S (346 + i.val + 1)) (S 123) (T 122 (346 + i.val + 1))
      (T 122 (346 + i.val)) (T 123 (346 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1518.entries OriginalRow227TriangleForward1518.checked
    ⟨i.val, by rw [size1518]; exact i.isLt⟩
  change (entry1518 i).check = true at h
  rcases fields1518 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1519 : OriginalRow227TriangleForward1519.entries.size = 1 := rfl

def entry1519 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1519.entries[i.val]'(by rw [size1519]; exact i.isLt)

theorem fields1519 (i : Fin 1) :
    (entry1519 i).IA = shift ∧ (entry1519 i).ID = S (378 + i.val + 1) ∧
      (entry1519 i).IC = S 123 ∧ (entry1519 i).Inext = T 122 (378 + i.val + 1) ∧
      (entry1519 i).Icur = T 122 (378 + i.val) ∧
      (entry1519 i).output = T 123 (378 + i.val) ∧
      (entry1519 i).charge = charge 122 (378 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings03.S_eq_root123).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow122.block1526_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1535_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1519 (i : Fin 1) :
    forwardStepOK (-768) (charge 122 (378 + i.val)) shift
      (S (378 + i.val + 1)) (S 123) (T 122 (378 + i.val + 1))
      (T 122 (378 + i.val)) (T 123 (378 + i.val))
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1519.entries OriginalRow227TriangleForward1519.checked
    ⟨i.val, by rw [size1519]; exact i.isLt⟩
  change (entry1519 i).check = true at h
  rcases fields1519 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 122 ≤ d) (hhi : d < 379) :
    forwardStepOK (-768) (charge 122 d) shift (S (d + 1)) (S 123)
      (T 122 (d + 1)) (T 122 d) (T 123 d)
      (OriginalRow227Roots.root_pos 123 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 122 (by decide)) = true := by
  by_cases h250 : d < 250
  ·
    by_cases h186 : d < 186
    ·
      by_cases h154 : d < 154
      ·
        have hi : d - 122 < 32 := by omega
        have heq : 122 + (d - 122) = d := by omega
        simpa only [heq] using step1511 ⟨d - 122, hi⟩
      ·
        have hi : d - 154 < 32 := by omega
        have heq : 154 + (d - 154) = d := by omega
        simpa only [heq] using step1512 ⟨d - 154, hi⟩
    ·
      by_cases h218 : d < 218
      ·
        have hi : d - 186 < 32 := by omega
        have heq : 186 + (d - 186) = d := by omega
        simpa only [heq] using step1513 ⟨d - 186, hi⟩
      ·
        have hi : d - 218 < 32 := by omega
        have heq : 218 + (d - 218) = d := by omega
        simpa only [heq] using step1514 ⟨d - 218, hi⟩
  ·
    by_cases h314 : d < 314
    ·
      by_cases h282 : d < 282
      ·
        have hi : d - 250 < 32 := by omega
        have heq : 250 + (d - 250) = d := by omega
        simpa only [heq] using step1515 ⟨d - 250, hi⟩
      ·
        have hi : d - 282 < 32 := by omega
        have heq : 282 + (d - 282) = d := by omega
        simpa only [heq] using step1516 ⟨d - 282, hi⟩
    ·
      by_cases h346 : d < 346
      ·
        have hi : d - 314 < 32 := by omega
        have heq : 314 + (d - 314) = d := by omega
        simpa only [heq] using step1517 ⟨d - 314, hi⟩
      ·
        by_cases h378 : d < 378
        ·
          have hi : d - 346 < 32 := by omega
          have heq : 346 + (d - 346) = d := by omega
          simpa only [heq] using step1518 ⟨d - 346, hi⟩
        ·
          have hi : d - 378 < 1 := by omega
          have heq : 378 + (d - 378) = d := by omega
          simpa only [heq] using step1519 ⟨d - 378, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1511,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1511,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1512,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1512,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1513,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1513,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1514,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1514,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1515,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1515,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1516,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1516,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1517,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1517,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1518,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1518,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.fields1519,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.step1519,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow123
