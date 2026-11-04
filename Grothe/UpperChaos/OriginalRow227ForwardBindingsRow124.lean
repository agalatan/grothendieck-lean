import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow123
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow124
import Grothe.UpperChaos.OriginalRow227TriangleForward1520
import Grothe.UpperChaos.OriginalRow227TriangleForward1521
import Grothe.UpperChaos.OriginalRow227TriangleForward1522
import Grothe.UpperChaos.OriginalRow227TriangleForward1523
import Grothe.UpperChaos.OriginalRow227TriangleForward1524
import Grothe.UpperChaos.OriginalRow227TriangleForward1525
import Grothe.UpperChaos.OriginalRow227TriangleForward1526
import Grothe.UpperChaos.OriginalRow227TriangleForward1527

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1520 : OriginalRow227TriangleForward1520.entries.size = 32 := rfl

def entry1520 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1520.entries[i.val]'(by rw [size1520]; exact i.isLt)

theorem fields1520 (i : Fin 32) :
    (entry1520 i).IA = shift ∧ (entry1520 i).ID = S (123 + i.val + 1) ∧
      (entry1520 i).IC = S 124 ∧ (entry1520 i).Inext = T 123 (123 + i.val + 1) ∧
      (entry1520 i).Icur = T 123 (123 + i.val) ∧
      (entry1520 i).output = T 124 (123 + i.val) ∧
      (entry1520 i).charge = charge 123 (123 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1527_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1536_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1520 (i : Fin 32) :
    forwardStepOK (-768) (charge 123 (123 + i.val)) shift
      (S (123 + i.val + 1)) (S 124) (T 123 (123 + i.val + 1))
      (T 123 (123 + i.val)) (T 124 (123 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1520.entries OriginalRow227TriangleForward1520.checked
    ⟨i.val, by rw [size1520]; exact i.isLt⟩
  change (entry1520 i).check = true at h
  rcases fields1520 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1521 : OriginalRow227TriangleForward1521.entries.size = 32 := rfl

def entry1521 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1521.entries[i.val]'(by rw [size1521]; exact i.isLt)

theorem fields1521 (i : Fin 32) :
    (entry1521 i).IA = shift ∧ (entry1521 i).ID = S (155 + i.val + 1) ∧
      (entry1521 i).IC = S 124 ∧ (entry1521 i).Inext = T 123 (155 + i.val + 1) ∧
      (entry1521 i).Icur = T 123 (155 + i.val) ∧
      (entry1521 i).output = T 124 (155 + i.val) ∧
      (entry1521 i).charge = charge 123 (155 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1528_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1537_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1521 (i : Fin 32) :
    forwardStepOK (-768) (charge 123 (155 + i.val)) shift
      (S (155 + i.val + 1)) (S 124) (T 123 (155 + i.val + 1))
      (T 123 (155 + i.val)) (T 124 (155 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1521.entries OriginalRow227TriangleForward1521.checked
    ⟨i.val, by rw [size1521]; exact i.isLt⟩
  change (entry1521 i).check = true at h
  rcases fields1521 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1522 : OriginalRow227TriangleForward1522.entries.size = 32 := rfl

def entry1522 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1522.entries[i.val]'(by rw [size1522]; exact i.isLt)

theorem fields1522 (i : Fin 32) :
    (entry1522 i).IA = shift ∧ (entry1522 i).ID = S (187 + i.val + 1) ∧
      (entry1522 i).IC = S 124 ∧ (entry1522 i).Inext = T 123 (187 + i.val + 1) ∧
      (entry1522 i).Icur = T 123 (187 + i.val) ∧
      (entry1522 i).output = T 124 (187 + i.val) ∧
      (entry1522 i).charge = charge 123 (187 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1529_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1538_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1522 (i : Fin 32) :
    forwardStepOK (-768) (charge 123 (187 + i.val)) shift
      (S (187 + i.val + 1)) (S 124) (T 123 (187 + i.val + 1))
      (T 123 (187 + i.val)) (T 124 (187 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1522.entries OriginalRow227TriangleForward1522.checked
    ⟨i.val, by rw [size1522]; exact i.isLt⟩
  change (entry1522 i).check = true at h
  rcases fields1522 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1523 : OriginalRow227TriangleForward1523.entries.size = 32 := rfl

def entry1523 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1523.entries[i.val]'(by rw [size1523]; exact i.isLt)

theorem fields1523 (i : Fin 32) :
    (entry1523 i).IA = shift ∧ (entry1523 i).ID = S (219 + i.val + 1) ∧
      (entry1523 i).IC = S 124 ∧ (entry1523 i).Inext = T 123 (219 + i.val + 1) ∧
      (entry1523 i).Icur = T 123 (219 + i.val) ∧
      (entry1523 i).output = T 124 (219 + i.val) ∧
      (entry1523 i).charge = charge 123 (219 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1530_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1539_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1523 (i : Fin 32) :
    forwardStepOK (-768) (charge 123 (219 + i.val)) shift
      (S (219 + i.val + 1)) (S 124) (T 123 (219 + i.val + 1))
      (T 123 (219 + i.val)) (T 124 (219 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1523.entries OriginalRow227TriangleForward1523.checked
    ⟨i.val, by rw [size1523]; exact i.isLt⟩
  change (entry1523 i).check = true at h
  rcases fields1523 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1524 : OriginalRow227TriangleForward1524.entries.size = 32 := rfl

def entry1524 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1524.entries[i.val]'(by rw [size1524]; exact i.isLt)

theorem fields1524 (i : Fin 32) :
    (entry1524 i).IA = shift ∧ (entry1524 i).ID = S (251 + i.val + 1) ∧
      (entry1524 i).IC = S 124 ∧ (entry1524 i).Inext = T 123 (251 + i.val + 1) ∧
      (entry1524 i).Icur = T 123 (251 + i.val) ∧
      (entry1524 i).output = T 124 (251 + i.val) ∧
      (entry1524 i).charge = charge 123 (251 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1531_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1540_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1524 (i : Fin 32) :
    forwardStepOK (-768) (charge 123 (251 + i.val)) shift
      (S (251 + i.val + 1)) (S 124) (T 123 (251 + i.val + 1))
      (T 123 (251 + i.val)) (T 124 (251 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1524.entries OriginalRow227TriangleForward1524.checked
    ⟨i.val, by rw [size1524]; exact i.isLt⟩
  change (entry1524 i).check = true at h
  rcases fields1524 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1525 : OriginalRow227TriangleForward1525.entries.size = 32 := rfl

def entry1525 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1525.entries[i.val]'(by rw [size1525]; exact i.isLt)

theorem fields1525 (i : Fin 32) :
    (entry1525 i).IA = shift ∧ (entry1525 i).ID = S (283 + i.val + 1) ∧
      (entry1525 i).IC = S 124 ∧ (entry1525 i).Inext = T 123 (283 + i.val + 1) ∧
      (entry1525 i).Icur = T 123 (283 + i.val) ∧
      (entry1525 i).output = T 124 (283 + i.val) ∧
      (entry1525 i).charge = charge 123 (283 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1532_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1541_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1525 (i : Fin 32) :
    forwardStepOK (-768) (charge 123 (283 + i.val)) shift
      (S (283 + i.val + 1)) (S 124) (T 123 (283 + i.val + 1))
      (T 123 (283 + i.val)) (T 124 (283 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1525.entries OriginalRow227TriangleForward1525.checked
    ⟨i.val, by rw [size1525]; exact i.isLt⟩
  change (entry1525 i).check = true at h
  rcases fields1525 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1526 : OriginalRow227TriangleForward1526.entries.size = 32 := rfl

def entry1526 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1526.entries[i.val]'(by rw [size1526]; exact i.isLt)

theorem fields1526 (i : Fin 32) :
    (entry1526 i).IA = shift ∧ (entry1526 i).ID = S (315 + i.val + 1) ∧
      (entry1526 i).IC = S 124 ∧ (entry1526 i).Inext = T 123 (315 + i.val + 1) ∧
      (entry1526 i).Icur = T 123 (315 + i.val) ∧
      (entry1526 i).output = T 124 (315 + i.val) ∧
      (entry1526 i).charge = charge 123 (315 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1533_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1542_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1526 (i : Fin 32) :
    forwardStepOK (-768) (charge 123 (315 + i.val)) shift
      (S (315 + i.val + 1)) (S 124) (T 123 (315 + i.val + 1))
      (T 123 (315 + i.val)) (T 124 (315 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1526.entries OriginalRow227TriangleForward1526.checked
    ⟨i.val, by rw [size1526]; exact i.isLt⟩
  change (entry1526 i).check = true at h
  rcases fields1526 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1527 : OriginalRow227TriangleForward1527.entries.size = 31 := rfl

def entry1527 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1527.entries[i.val]'(by rw [size1527]; exact i.isLt)

theorem fields1527 (i : Fin 31) :
    (entry1527 i).IA = shift ∧ (entry1527 i).ID = S (347 + i.val + 1) ∧
      (entry1527 i).IC = S 124 ∧ (entry1527 i).Inext = T 123 (347 + i.val + 1) ∧
      (entry1527 i).Icur = T 123 (347 + i.val) ∧
      (entry1527 i).output = T 124 (347 + i.val) ∧
      (entry1527 i).charge = charge 123 (347 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings03.S_eq_root124).symm,
      (OriginalRow227TriangleBindingsRow123.block1535_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow123.block1534_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow124.block1543_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1527 (i : Fin 31) :
    forwardStepOK (-768) (charge 123 (347 + i.val)) shift
      (S (347 + i.val + 1)) (S 124) (T 123 (347 + i.val + 1))
      (T 123 (347 + i.val)) (T 124 (347 + i.val))
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1527.entries OriginalRow227TriangleForward1527.checked
    ⟨i.val, by rw [size1527]; exact i.isLt⟩
  change (entry1527 i).check = true at h
  rcases fields1527 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 123 ≤ d) (hhi : d < 378) :
    forwardStepOK (-768) (charge 123 d) shift (S (d + 1)) (S 124)
      (T 123 (d + 1)) (T 123 d) (T 124 d)
      (OriginalRow227Roots.root_pos 124 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 123 (by decide)) = true := by
  by_cases h251 : d < 251
  ·
    by_cases h187 : d < 187
    ·
      by_cases h155 : d < 155
      ·
        have hi : d - 123 < 32 := by omega
        have heq : 123 + (d - 123) = d := by omega
        simpa only [heq] using step1520 ⟨d - 123, hi⟩
      ·
        have hi : d - 155 < 32 := by omega
        have heq : 155 + (d - 155) = d := by omega
        simpa only [heq] using step1521 ⟨d - 155, hi⟩
    ·
      by_cases h219 : d < 219
      ·
        have hi : d - 187 < 32 := by omega
        have heq : 187 + (d - 187) = d := by omega
        simpa only [heq] using step1522 ⟨d - 187, hi⟩
      ·
        have hi : d - 219 < 32 := by omega
        have heq : 219 + (d - 219) = d := by omega
        simpa only [heq] using step1523 ⟨d - 219, hi⟩
  ·
    by_cases h315 : d < 315
    ·
      by_cases h283 : d < 283
      ·
        have hi : d - 251 < 32 := by omega
        have heq : 251 + (d - 251) = d := by omega
        simpa only [heq] using step1524 ⟨d - 251, hi⟩
      ·
        have hi : d - 283 < 32 := by omega
        have heq : 283 + (d - 283) = d := by omega
        simpa only [heq] using step1525 ⟨d - 283, hi⟩
    ·
      by_cases h347 : d < 347
      ·
        have hi : d - 315 < 32 := by omega
        have heq : 315 + (d - 315) = d := by omega
        simpa only [heq] using step1526 ⟨d - 315, hi⟩
      ·
        have hi : d - 347 < 31 := by omega
        have heq : 347 + (d - 347) = d := by omega
        simpa only [heq] using step1527 ⟨d - 347, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1520,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1520,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1521,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1521,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1522,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1522,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1523,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1523,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1524,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1524,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1525,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1525,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1526,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1526,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.fields1527,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.step1527,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow124
