import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow149
import Grothe.UpperChaos.OriginalRow227TriangleForward1711
import Grothe.UpperChaos.OriginalRow227TriangleForward1712
import Grothe.UpperChaos.OriginalRow227TriangleForward1713
import Grothe.UpperChaos.OriginalRow227TriangleForward1714
import Grothe.UpperChaos.OriginalRow227TriangleForward1715
import Grothe.UpperChaos.OriginalRow227TriangleForward1716
import Grothe.UpperChaos.OriginalRow227TriangleForward1717

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1711 : OriginalRow227TriangleForward1711.entries.size = 32 := rfl

def entry1711 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1711.entries[i.val]'(by rw [size1711]; exact i.isLt)

theorem fields1711 (i : Fin 32) :
    (entry1711 i).IA = shift ∧ (entry1711 i).ID = S (148 + i.val + 1) ∧
      (entry1711 i).IC = S 149 ∧ (entry1711 i).Inext = T 148 (148 + i.val + 1) ∧
      (entry1711 i).Icur = T 148 (148 + i.val) ∧
      (entry1711 i).output = T 149 (148 + i.val) ∧
      (entry1711 i).charge = charge 148 (148 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1720_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1727_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1711 (i : Fin 32) :
    forwardStepOK (-768) (charge 148 (148 + i.val)) shift
      (S (148 + i.val + 1)) (S 149) (T 148 (148 + i.val + 1))
      (T 148 (148 + i.val)) (T 149 (148 + i.val))
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1711.entries OriginalRow227TriangleForward1711.checked
    ⟨i.val, by rw [size1711]; exact i.isLt⟩
  change (entry1711 i).check = true at h
  rcases fields1711 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1712 : OriginalRow227TriangleForward1712.entries.size = 32 := rfl

def entry1712 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1712.entries[i.val]'(by rw [size1712]; exact i.isLt)

theorem fields1712 (i : Fin 32) :
    (entry1712 i).IA = shift ∧ (entry1712 i).ID = S (180 + i.val + 1) ∧
      (entry1712 i).IC = S 149 ∧ (entry1712 i).Inext = T 148 (180 + i.val + 1) ∧
      (entry1712 i).Icur = T 148 (180 + i.val) ∧
      (entry1712 i).output = T 149 (180 + i.val) ∧
      (entry1712 i).charge = charge 148 (180 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1721_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1728_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1712 (i : Fin 32) :
    forwardStepOK (-768) (charge 148 (180 + i.val)) shift
      (S (180 + i.val + 1)) (S 149) (T 148 (180 + i.val + 1))
      (T 148 (180 + i.val)) (T 149 (180 + i.val))
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1712.entries OriginalRow227TriangleForward1712.checked
    ⟨i.val, by rw [size1712]; exact i.isLt⟩
  change (entry1712 i).check = true at h
  rcases fields1712 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1713 : OriginalRow227TriangleForward1713.entries.size = 32 := rfl

def entry1713 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1713.entries[i.val]'(by rw [size1713]; exact i.isLt)

theorem fields1713 (i : Fin 32) :
    (entry1713 i).IA = shift ∧ (entry1713 i).ID = S (212 + i.val + 1) ∧
      (entry1713 i).IC = S 149 ∧ (entry1713 i).Inext = T 148 (212 + i.val + 1) ∧
      (entry1713 i).Icur = T 148 (212 + i.val) ∧
      (entry1713 i).output = T 149 (212 + i.val) ∧
      (entry1713 i).charge = charge 148 (212 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1722_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1729_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1713 (i : Fin 32) :
    forwardStepOK (-768) (charge 148 (212 + i.val)) shift
      (S (212 + i.val + 1)) (S 149) (T 148 (212 + i.val + 1))
      (T 148 (212 + i.val)) (T 149 (212 + i.val))
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1713.entries OriginalRow227TriangleForward1713.checked
    ⟨i.val, by rw [size1713]; exact i.isLt⟩
  change (entry1713 i).check = true at h
  rcases fields1713 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1714 : OriginalRow227TriangleForward1714.entries.size = 32 := rfl

def entry1714 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1714.entries[i.val]'(by rw [size1714]; exact i.isLt)

theorem fields1714 (i : Fin 32) :
    (entry1714 i).IA = shift ∧ (entry1714 i).ID = S (244 + i.val + 1) ∧
      (entry1714 i).IC = S 149 ∧ (entry1714 i).Inext = T 148 (244 + i.val + 1) ∧
      (entry1714 i).Icur = T 148 (244 + i.val) ∧
      (entry1714 i).output = T 149 (244 + i.val) ∧
      (entry1714 i).charge = charge 148 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1723_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1730_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1714 (i : Fin 32) :
    forwardStepOK (-768) (charge 148 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 149) (T 148 (244 + i.val + 1))
      (T 148 (244 + i.val)) (T 149 (244 + i.val))
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1714.entries OriginalRow227TriangleForward1714.checked
    ⟨i.val, by rw [size1714]; exact i.isLt⟩
  change (entry1714 i).check = true at h
  rcases fields1714 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1715 : OriginalRow227TriangleForward1715.entries.size = 32 := rfl

def entry1715 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1715.entries[i.val]'(by rw [size1715]; exact i.isLt)

theorem fields1715 (i : Fin 32) :
    (entry1715 i).IA = shift ∧ (entry1715 i).ID = S (276 + i.val + 1) ∧
      (entry1715 i).IC = S 149 ∧ (entry1715 i).Inext = T 148 (276 + i.val + 1) ∧
      (entry1715 i).Icur = T 148 (276 + i.val) ∧
      (entry1715 i).output = T 149 (276 + i.val) ∧
      (entry1715 i).charge = charge 148 (276 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1724_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1731_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1715 (i : Fin 32) :
    forwardStepOK (-768) (charge 148 (276 + i.val)) shift
      (S (276 + i.val + 1)) (S 149) (T 148 (276 + i.val + 1))
      (T 148 (276 + i.val)) (T 149 (276 + i.val))
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1715.entries OriginalRow227TriangleForward1715.checked
    ⟨i.val, by rw [size1715]; exact i.isLt⟩
  change (entry1715 i).check = true at h
  rcases fields1715 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1716 : OriginalRow227TriangleForward1716.entries.size = 32 := rfl

def entry1716 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1716.entries[i.val]'(by rw [size1716]; exact i.isLt)

theorem fields1716 (i : Fin 32) :
    (entry1716 i).IA = shift ∧ (entry1716 i).ID = S (308 + i.val + 1) ∧
      (entry1716 i).IC = S 149 ∧ (entry1716 i).Inext = T 148 (308 + i.val + 1) ∧
      (entry1716 i).Icur = T 148 (308 + i.val) ∧
      (entry1716 i).output = T 149 (308 + i.val) ∧
      (entry1716 i).charge = charge 148 (308 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1725_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1732_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1716 (i : Fin 32) :
    forwardStepOK (-768) (charge 148 (308 + i.val)) shift
      (S (308 + i.val + 1)) (S 149) (T 148 (308 + i.val + 1))
      (T 148 (308 + i.val)) (T 149 (308 + i.val))
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1716.entries OriginalRow227TriangleForward1716.checked
    ⟨i.val, by rw [size1716]; exact i.isLt⟩
  change (entry1716 i).check = true at h
  rcases fields1716 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1717 : OriginalRow227TriangleForward1717.entries.size = 13 := rfl

def entry1717 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1717.entries[i.val]'(by rw [size1717]; exact i.isLt)

theorem fields1717 (i : Fin 13) :
    (entry1717 i).IA = shift ∧ (entry1717 i).ID = S (340 + i.val + 1) ∧
      (entry1717 i).IC = S 149 ∧ (entry1717 i).Inext = T 148 (340 + i.val + 1) ∧
      (entry1717 i).Icur = T 148 (340 + i.val) ∧
      (entry1717 i).output = T 149 (340 + i.val) ∧
      (entry1717 i).charge = charge 148 (340 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root149).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow148.block1726_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow149.block1733_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1717 (i : Fin 13) :
    forwardStepOK (-768) (charge 148 (340 + i.val)) shift
      (S (340 + i.val + 1)) (S 149) (T 148 (340 + i.val + 1))
      (T 148 (340 + i.val)) (T 149 (340 + i.val))
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1717.entries OriginalRow227TriangleForward1717.checked
    ⟨i.val, by rw [size1717]; exact i.isLt⟩
  change (entry1717 i).check = true at h
  rcases fields1717 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 148 ≤ d) (hhi : d < 353) :
    forwardStepOK (-768) (charge 148 d) shift (S (d + 1)) (S 149)
      (T 148 (d + 1)) (T 148 d) (T 149 d)
      (OriginalRow227Roots.root_pos 149 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 148 (by decide)) = true := by
  by_cases h244 : d < 244
  ·
    by_cases h180 : d < 180
    ·
      have hi : d - 148 < 32 := by omega
      have heq : 148 + (d - 148) = d := by omega
      simpa only [heq] using step1711 ⟨d - 148, hi⟩
    ·
      by_cases h212 : d < 212
      ·
        have hi : d - 180 < 32 := by omega
        have heq : 180 + (d - 180) = d := by omega
        simpa only [heq] using step1712 ⟨d - 180, hi⟩
      ·
        have hi : d - 212 < 32 := by omega
        have heq : 212 + (d - 212) = d := by omega
        simpa only [heq] using step1713 ⟨d - 212, hi⟩
  ·
    by_cases h308 : d < 308
    ·
      by_cases h276 : d < 276
      ·
        have hi : d - 244 < 32 := by omega
        have heq : 244 + (d - 244) = d := by omega
        simpa only [heq] using step1714 ⟨d - 244, hi⟩
      ·
        have hi : d - 276 < 32 := by omega
        have heq : 276 + (d - 276) = d := by omega
        simpa only [heq] using step1715 ⟨d - 276, hi⟩
    ·
      by_cases h340 : d < 340
      ·
        have hi : d - 308 < 32 := by omega
        have heq : 308 + (d - 308) = d := by omega
        simpa only [heq] using step1716 ⟨d - 308, hi⟩
      ·
        have hi : d - 340 < 13 := by omega
        have heq : 340 + (d - 340) = d := by omega
        simpa only [heq] using step1717 ⟨d - 340, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.fields1711,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.step1711,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.fields1712,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.step1712,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.fields1713,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.step1713,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.fields1714,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.step1714,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.fields1715,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.step1715,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.fields1716,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.step1716,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.fields1717,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.step1717,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow149
