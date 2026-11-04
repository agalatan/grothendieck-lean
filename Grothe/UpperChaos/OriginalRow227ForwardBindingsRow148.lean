import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148
import Grothe.UpperChaos.OriginalRow227TriangleForward1704
import Grothe.UpperChaos.OriginalRow227TriangleForward1705
import Grothe.UpperChaos.OriginalRow227TriangleForward1706
import Grothe.UpperChaos.OriginalRow227TriangleForward1707
import Grothe.UpperChaos.OriginalRow227TriangleForward1708
import Grothe.UpperChaos.OriginalRow227TriangleForward1709
import Grothe.UpperChaos.OriginalRow227TriangleForward1710

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1704 : OriginalRow227TriangleForward1704.entries.size = 32 := rfl

def entry1704 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1704.entries[i.val]'(by rw [size1704]; exact i.isLt)

theorem fields1704 (i : Fin 32) :
    (entry1704 i).IA = shift ∧ (entry1704 i).ID = S (147 + i.val + 1) ∧
      (entry1704 i).IC = S 148 ∧ (entry1704 i).Inext = T 147 (147 + i.val + 1) ∧
      (entry1704 i).Icur = T 147 (147 + i.val) ∧
      (entry1704 i).output = T 148 (147 + i.val) ∧
      (entry1704 i).charge = charge 147 (147 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1704 (i : Fin 32) :
    forwardStepOK (-768) (charge 147 (147 + i.val)) shift
      (S (147 + i.val + 1)) (S 148) (T 147 (147 + i.val + 1))
      (T 147 (147 + i.val)) (T 148 (147 + i.val))
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1704.entries OriginalRow227TriangleForward1704.checked
    ⟨i.val, by rw [size1704]; exact i.isLt⟩
  change (entry1704 i).check = true at h
  rcases fields1704 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1705 : OriginalRow227TriangleForward1705.entries.size = 32 := rfl

def entry1705 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1705.entries[i.val]'(by rw [size1705]; exact i.isLt)

theorem fields1705 (i : Fin 32) :
    (entry1705 i).IA = shift ∧ (entry1705 i).ID = S (179 + i.val + 1) ∧
      (entry1705 i).IC = S 148 ∧ (entry1705 i).Inext = T 147 (179 + i.val + 1) ∧
      (entry1705 i).Icur = T 147 (179 + i.val) ∧
      (entry1705 i).output = T 148 (179 + i.val) ∧
      (entry1705 i).charge = charge 147 (179 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1705 (i : Fin 32) :
    forwardStepOK (-768) (charge 147 (179 + i.val)) shift
      (S (179 + i.val + 1)) (S 148) (T 147 (179 + i.val + 1))
      (T 147 (179 + i.val)) (T 148 (179 + i.val))
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1705.entries OriginalRow227TriangleForward1705.checked
    ⟨i.val, by rw [size1705]; exact i.isLt⟩
  change (entry1705 i).check = true at h
  rcases fields1705 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1706 : OriginalRow227TriangleForward1706.entries.size = 32 := rfl

def entry1706 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1706.entries[i.val]'(by rw [size1706]; exact i.isLt)

theorem fields1706 (i : Fin 32) :
    (entry1706 i).IA = shift ∧ (entry1706 i).ID = S (211 + i.val + 1) ∧
      (entry1706 i).IC = S 148 ∧ (entry1706 i).Inext = T 147 (211 + i.val + 1) ∧
      (entry1706 i).Icur = T 147 (211 + i.val) ∧
      (entry1706 i).output = T 148 (211 + i.val) ∧
      (entry1706 i).charge = charge 147 (211 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1706 (i : Fin 32) :
    forwardStepOK (-768) (charge 147 (211 + i.val)) shift
      (S (211 + i.val + 1)) (S 148) (T 147 (211 + i.val + 1))
      (T 147 (211 + i.val)) (T 148 (211 + i.val))
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1706.entries OriginalRow227TriangleForward1706.checked
    ⟨i.val, by rw [size1706]; exact i.isLt⟩
  change (entry1706 i).check = true at h
  rcases fields1706 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1707 : OriginalRow227TriangleForward1707.entries.size = 32 := rfl

def entry1707 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1707.entries[i.val]'(by rw [size1707]; exact i.isLt)

theorem fields1707 (i : Fin 32) :
    (entry1707 i).IA = shift ∧ (entry1707 i).ID = S (243 + i.val + 1) ∧
      (entry1707 i).IC = S 148 ∧ (entry1707 i).Inext = T 147 (243 + i.val + 1) ∧
      (entry1707 i).Icur = T 147 (243 + i.val) ∧
      (entry1707 i).output = T 148 (243 + i.val) ∧
      (entry1707 i).charge = charge 147 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1707 (i : Fin 32) :
    forwardStepOK (-768) (charge 147 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 148) (T 147 (243 + i.val + 1))
      (T 147 (243 + i.val)) (T 148 (243 + i.val))
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1707.entries OriginalRow227TriangleForward1707.checked
    ⟨i.val, by rw [size1707]; exact i.isLt⟩
  change (entry1707 i).check = true at h
  rcases fields1707 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1708 : OriginalRow227TriangleForward1708.entries.size = 32 := rfl

def entry1708 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1708.entries[i.val]'(by rw [size1708]; exact i.isLt)

theorem fields1708 (i : Fin 32) :
    (entry1708 i).IA = shift ∧ (entry1708 i).ID = S (275 + i.val + 1) ∧
      (entry1708 i).IC = S 148 ∧ (entry1708 i).Inext = T 147 (275 + i.val + 1) ∧
      (entry1708 i).Icur = T 147 (275 + i.val) ∧
      (entry1708 i).output = T 148 (275 + i.val) ∧
      (entry1708 i).charge = charge 147 (275 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1708 (i : Fin 32) :
    forwardStepOK (-768) (charge 147 (275 + i.val)) shift
      (S (275 + i.val + 1)) (S 148) (T 147 (275 + i.val + 1))
      (T 147 (275 + i.val)) (T 148 (275 + i.val))
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1708.entries OriginalRow227TriangleForward1708.checked
    ⟨i.val, by rw [size1708]; exact i.isLt⟩
  change (entry1708 i).check = true at h
  rcases fields1708 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1709 : OriginalRow227TriangleForward1709.entries.size = 32 := rfl

def entry1709 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1709.entries[i.val]'(by rw [size1709]; exact i.isLt)

theorem fields1709 (i : Fin 32) :
    (entry1709 i).IA = shift ∧ (entry1709 i).ID = S (307 + i.val + 1) ∧
      (entry1709 i).IC = S 148 ∧ (entry1709 i).Inext = T 147 (307 + i.val + 1) ∧
      (entry1709 i).Icur = T 147 (307 + i.val) ∧
      (entry1709 i).output = T 148 (307 + i.val) ∧
      (entry1709 i).charge = charge 147 (307 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1709 (i : Fin 32) :
    forwardStepOK (-768) (charge 147 (307 + i.val)) shift
      (S (307 + i.val + 1)) (S 148) (T 147 (307 + i.val + 1))
      (T 147 (307 + i.val)) (T 148 (307 + i.val))
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1709.entries OriginalRow227TriangleForward1709.checked
    ⟨i.val, by rw [size1709]; exact i.isLt⟩
  change (entry1709 i).check = true at h
  rcases fields1709 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1710 : OriginalRow227TriangleForward1710.entries.size = 15 := rfl

def entry1710 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1710.entries[i.val]'(by rw [size1710]; exact i.isLt)

theorem fields1710 (i : Fin 15) :
    (entry1710 i).IA = shift ∧ (entry1710 i).ID = S (339 + i.val + 1) ∧
      (entry1710 i).IC = S 148 ∧ (entry1710 i).Inext = T 147 (339 + i.val + 1) ∧
      (entry1710 i).Icur = T 147 (339 + i.val) ∧
      (entry1710 i).output = T 148 (339 + i.val) ∧
      (entry1710 i).charge = charge 147 (339 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root148).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1710 (i : Fin 15) :
    forwardStepOK (-768) (charge 147 (339 + i.val)) shift
      (S (339 + i.val + 1)) (S 148) (T 147 (339 + i.val + 1))
      (T 147 (339 + i.val)) (T 148 (339 + i.val))
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1710.entries OriginalRow227TriangleForward1710.checked
    ⟨i.val, by rw [size1710]; exact i.isLt⟩
  change (entry1710 i).check = true at h
  rcases fields1710 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 147 ≤ d) (hhi : d < 354) :
    forwardStepOK (-768) (charge 147 d) shift (S (d + 1)) (S 148)
      (T 147 (d + 1)) (T 147 d) (T 148 d)
      (OriginalRow227Roots.root_pos 148 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 147 (by decide)) = true := by
  by_cases h243 : d < 243
  ·
    by_cases h179 : d < 179
    ·
      have hi : d - 147 < 32 := by omega
      have heq : 147 + (d - 147) = d := by omega
      simpa only [heq] using step1704 ⟨d - 147, hi⟩
    ·
      by_cases h211 : d < 211
      ·
        have hi : d - 179 < 32 := by omega
        have heq : 179 + (d - 179) = d := by omega
        simpa only [heq] using step1705 ⟨d - 179, hi⟩
      ·
        have hi : d - 211 < 32 := by omega
        have heq : 211 + (d - 211) = d := by omega
        simpa only [heq] using step1706 ⟨d - 211, hi⟩
  ·
    by_cases h307 : d < 307
    ·
      by_cases h275 : d < 275
      ·
        have hi : d - 243 < 32 := by omega
        have heq : 243 + (d - 243) = d := by omega
        simpa only [heq] using step1707 ⟨d - 243, hi⟩
      ·
        have hi : d - 275 < 32 := by omega
        have heq : 275 + (d - 275) = d := by omega
        simpa only [heq] using step1708 ⟨d - 275, hi⟩
    ·
      by_cases h339 : d < 339
      ·
        have hi : d - 307 < 32 := by omega
        have heq : 307 + (d - 307) = d := by omega
        simpa only [heq] using step1709 ⟨d - 307, hi⟩
      ·
        have hi : d - 339 < 15 := by omega
        have heq : 339 + (d - 339) = d := by omega
        simpa only [heq] using step1710 ⟨d - 339, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.fields1704,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.step1704,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.fields1705,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.step1705,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.fields1706,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.step1706,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.fields1707,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.step1707,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.fields1708,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.step1708,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.fields1709,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.step1709,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.fields1710,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.step1710,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow148
