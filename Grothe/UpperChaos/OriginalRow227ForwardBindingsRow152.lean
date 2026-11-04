import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152
import Grothe.UpperChaos.OriginalRow227TriangleForward1732
import Grothe.UpperChaos.OriginalRow227TriangleForward1733
import Grothe.UpperChaos.OriginalRow227TriangleForward1734
import Grothe.UpperChaos.OriginalRow227TriangleForward1735
import Grothe.UpperChaos.OriginalRow227TriangleForward1736
import Grothe.UpperChaos.OriginalRow227TriangleForward1737
import Grothe.UpperChaos.OriginalRow227TriangleForward1738

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1732 : OriginalRow227TriangleForward1732.entries.size = 32 := rfl

def entry1732 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1732.entries[i.val]'(by rw [size1732]; exact i.isLt)

theorem fields1732 (i : Fin 32) :
    (entry1732 i).IA = shift ∧ (entry1732 i).ID = S (151 + i.val + 1) ∧
      (entry1732 i).IC = S 152 ∧ (entry1732 i).Inext = T 151 (151 + i.val + 1) ∧
      (entry1732 i).Icur = T 151 (151 + i.val) ∧
      (entry1732 i).output = T 152 (151 + i.val) ∧
      (entry1732 i).charge = charge 151 (151 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1732 (i : Fin 32) :
    forwardStepOK (-768) (charge 151 (151 + i.val)) shift
      (S (151 + i.val + 1)) (S 152) (T 151 (151 + i.val + 1))
      (T 151 (151 + i.val)) (T 152 (151 + i.val))
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1732.entries OriginalRow227TriangleForward1732.checked
    ⟨i.val, by rw [size1732]; exact i.isLt⟩
  change (entry1732 i).check = true at h
  rcases fields1732 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1733 : OriginalRow227TriangleForward1733.entries.size = 32 := rfl

def entry1733 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1733.entries[i.val]'(by rw [size1733]; exact i.isLt)

theorem fields1733 (i : Fin 32) :
    (entry1733 i).IA = shift ∧ (entry1733 i).ID = S (183 + i.val + 1) ∧
      (entry1733 i).IC = S 152 ∧ (entry1733 i).Inext = T 151 (183 + i.val + 1) ∧
      (entry1733 i).Icur = T 151 (183 + i.val) ∧
      (entry1733 i).output = T 152 (183 + i.val) ∧
      (entry1733 i).charge = charge 151 (183 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1733 (i : Fin 32) :
    forwardStepOK (-768) (charge 151 (183 + i.val)) shift
      (S (183 + i.val + 1)) (S 152) (T 151 (183 + i.val + 1))
      (T 151 (183 + i.val)) (T 152 (183 + i.val))
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1733.entries OriginalRow227TriangleForward1733.checked
    ⟨i.val, by rw [size1733]; exact i.isLt⟩
  change (entry1733 i).check = true at h
  rcases fields1733 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1734 : OriginalRow227TriangleForward1734.entries.size = 32 := rfl

def entry1734 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1734.entries[i.val]'(by rw [size1734]; exact i.isLt)

theorem fields1734 (i : Fin 32) :
    (entry1734 i).IA = shift ∧ (entry1734 i).ID = S (215 + i.val + 1) ∧
      (entry1734 i).IC = S 152 ∧ (entry1734 i).Inext = T 151 (215 + i.val + 1) ∧
      (entry1734 i).Icur = T 151 (215 + i.val) ∧
      (entry1734 i).output = T 152 (215 + i.val) ∧
      (entry1734 i).charge = charge 151 (215 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1734 (i : Fin 32) :
    forwardStepOK (-768) (charge 151 (215 + i.val)) shift
      (S (215 + i.val + 1)) (S 152) (T 151 (215 + i.val + 1))
      (T 151 (215 + i.val)) (T 152 (215 + i.val))
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1734.entries OriginalRow227TriangleForward1734.checked
    ⟨i.val, by rw [size1734]; exact i.isLt⟩
  change (entry1734 i).check = true at h
  rcases fields1734 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1735 : OriginalRow227TriangleForward1735.entries.size = 32 := rfl

def entry1735 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1735.entries[i.val]'(by rw [size1735]; exact i.isLt)

theorem fields1735 (i : Fin 32) :
    (entry1735 i).IA = shift ∧ (entry1735 i).ID = S (247 + i.val + 1) ∧
      (entry1735 i).IC = S 152 ∧ (entry1735 i).Inext = T 151 (247 + i.val + 1) ∧
      (entry1735 i).Icur = T 151 (247 + i.val) ∧
      (entry1735 i).output = T 152 (247 + i.val) ∧
      (entry1735 i).charge = charge 151 (247 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1735 (i : Fin 32) :
    forwardStepOK (-768) (charge 151 (247 + i.val)) shift
      (S (247 + i.val + 1)) (S 152) (T 151 (247 + i.val + 1))
      (T 151 (247 + i.val)) (T 152 (247 + i.val))
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1735.entries OriginalRow227TriangleForward1735.checked
    ⟨i.val, by rw [size1735]; exact i.isLt⟩
  change (entry1735 i).check = true at h
  rcases fields1735 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1736 : OriginalRow227TriangleForward1736.entries.size = 32 := rfl

def entry1736 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1736.entries[i.val]'(by rw [size1736]; exact i.isLt)

theorem fields1736 (i : Fin 32) :
    (entry1736 i).IA = shift ∧ (entry1736 i).ID = S (279 + i.val + 1) ∧
      (entry1736 i).IC = S 152 ∧ (entry1736 i).Inext = T 151 (279 + i.val + 1) ∧
      (entry1736 i).Icur = T 151 (279 + i.val) ∧
      (entry1736 i).output = T 152 (279 + i.val) ∧
      (entry1736 i).charge = charge 151 (279 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1736 (i : Fin 32) :
    forwardStepOK (-768) (charge 151 (279 + i.val)) shift
      (S (279 + i.val + 1)) (S 152) (T 151 (279 + i.val + 1))
      (T 151 (279 + i.val)) (T 152 (279 + i.val))
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1736.entries OriginalRow227TriangleForward1736.checked
    ⟨i.val, by rw [size1736]; exact i.isLt⟩
  change (entry1736 i).check = true at h
  rcases fields1736 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1737 : OriginalRow227TriangleForward1737.entries.size = 32 := rfl

def entry1737 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1737.entries[i.val]'(by rw [size1737]; exact i.isLt)

theorem fields1737 (i : Fin 32) :
    (entry1737 i).IA = shift ∧ (entry1737 i).ID = S (311 + i.val + 1) ∧
      (entry1737 i).IC = S 152 ∧ (entry1737 i).Inext = T 151 (311 + i.val + 1) ∧
      (entry1737 i).Icur = T 151 (311 + i.val) ∧
      (entry1737 i).output = T 152 (311 + i.val) ∧
      (entry1737 i).charge = charge 151 (311 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1737 (i : Fin 32) :
    forwardStepOK (-768) (charge 151 (311 + i.val)) shift
      (S (311 + i.val + 1)) (S 152) (T 151 (311 + i.val + 1))
      (T 151 (311 + i.val)) (T 152 (311 + i.val))
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1737.entries OriginalRow227TriangleForward1737.checked
    ⟨i.val, by rw [size1737]; exact i.isLt⟩
  change (entry1737 i).check = true at h
  rcases fields1737 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1738 : OriginalRow227TriangleForward1738.entries.size = 7 := rfl

def entry1738 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1738.entries[i.val]'(by rw [size1738]; exact i.isLt)

theorem fields1738 (i : Fin 7) :
    (entry1738 i).IA = shift ∧ (entry1738 i).ID = S (343 + i.val + 1) ∧
      (entry1738 i).IC = S 152 ∧ (entry1738 i).Inext = T 151 (343 + i.val + 1) ∧
      (entry1738 i).Icur = T 151 (343 + i.val) ∧
      (entry1738 i).output = T 152 (343 + i.val) ∧
      (entry1738 i).charge = charge 151 (343 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root152).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1738 (i : Fin 7) :
    forwardStepOK (-768) (charge 151 (343 + i.val)) shift
      (S (343 + i.val + 1)) (S 152) (T 151 (343 + i.val + 1))
      (T 151 (343 + i.val)) (T 152 (343 + i.val))
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1738.entries OriginalRow227TriangleForward1738.checked
    ⟨i.val, by rw [size1738]; exact i.isLt⟩
  change (entry1738 i).check = true at h
  rcases fields1738 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 151 ≤ d) (hhi : d < 350) :
    forwardStepOK (-768) (charge 151 d) shift (S (d + 1)) (S 152)
      (T 151 (d + 1)) (T 151 d) (T 152 d)
      (OriginalRow227Roots.root_pos 152 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 151 (by decide)) = true := by
  by_cases h247 : d < 247
  ·
    by_cases h183 : d < 183
    ·
      have hi : d - 151 < 32 := by omega
      have heq : 151 + (d - 151) = d := by omega
      simpa only [heq] using step1732 ⟨d - 151, hi⟩
    ·
      by_cases h215 : d < 215
      ·
        have hi : d - 183 < 32 := by omega
        have heq : 183 + (d - 183) = d := by omega
        simpa only [heq] using step1733 ⟨d - 183, hi⟩
      ·
        have hi : d - 215 < 32 := by omega
        have heq : 215 + (d - 215) = d := by omega
        simpa only [heq] using step1734 ⟨d - 215, hi⟩
  ·
    by_cases h311 : d < 311
    ·
      by_cases h279 : d < 279
      ·
        have hi : d - 247 < 32 := by omega
        have heq : 247 + (d - 247) = d := by omega
        simpa only [heq] using step1735 ⟨d - 247, hi⟩
      ·
        have hi : d - 279 < 32 := by omega
        have heq : 279 + (d - 279) = d := by omega
        simpa only [heq] using step1736 ⟨d - 279, hi⟩
    ·
      by_cases h343 : d < 343
      ·
        have hi : d - 311 < 32 := by omega
        have heq : 311 + (d - 311) = d := by omega
        simpa only [heq] using step1737 ⟨d - 311, hi⟩
      ·
        have hi : d - 343 < 7 := by omega
        have heq : 343 + (d - 343) = d := by omega
        simpa only [heq] using step1738 ⟨d - 343, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.fields1732,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.step1732,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.fields1733,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.step1733,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.fields1734,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.step1734,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.fields1735,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.step1735,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.fields1736,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.step1736,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.fields1737,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.step1737,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.fields1738,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.step1738,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow152
