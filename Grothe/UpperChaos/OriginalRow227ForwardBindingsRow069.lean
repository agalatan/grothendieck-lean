import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow068
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow069
import Grothe.UpperChaos.OriginalRow227TriangleForward0956
import Grothe.UpperChaos.OriginalRow227TriangleForward0957
import Grothe.UpperChaos.OriginalRow227TriangleForward0958
import Grothe.UpperChaos.OriginalRow227TriangleForward0959
import Grothe.UpperChaos.OriginalRow227TriangleForward0960
import Grothe.UpperChaos.OriginalRow227TriangleForward0961
import Grothe.UpperChaos.OriginalRow227TriangleForward0962
import Grothe.UpperChaos.OriginalRow227TriangleForward0963
import Grothe.UpperChaos.OriginalRow227TriangleForward0964
import Grothe.UpperChaos.OriginalRow227TriangleForward0965
import Grothe.UpperChaos.OriginalRow227TriangleForward0966
import Grothe.UpperChaos.OriginalRow227TriangleForward0967

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0956 : OriginalRow227TriangleForward0956.entries.size = 32 := rfl

def entry0956 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0956.entries[i.val]'(by rw [size0956]; exact i.isLt)

theorem fields0956 (i : Fin 32) :
    (entry0956 i).IA = shift ∧ (entry0956 i).ID = S (68 + i.val + 1) ∧
      (entry0956 i).IC = S 69 ∧ (entry0956 i).Inext = T 68 (68 + i.val + 1) ∧
      (entry0956 i).Icur = T 68 (68 + i.val) ∧
      (entry0956 i).output = T 69 (68 + i.val) ∧
      (entry0956 i).charge = charge 68 (68 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0960_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0972_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0956 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (68 + i.val)) shift
      (S (68 + i.val + 1)) (S 69) (T 68 (68 + i.val + 1))
      (T 68 (68 + i.val)) (T 69 (68 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0956.entries OriginalRow227TriangleForward0956.checked
    ⟨i.val, by rw [size0956]; exact i.isLt⟩
  change (entry0956 i).check = true at h
  rcases fields0956 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0957 : OriginalRow227TriangleForward0957.entries.size = 32 := rfl

def entry0957 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0957.entries[i.val]'(by rw [size0957]; exact i.isLt)

theorem fields0957 (i : Fin 32) :
    (entry0957 i).IA = shift ∧ (entry0957 i).ID = S (100 + i.val + 1) ∧
      (entry0957 i).IC = S 69 ∧ (entry0957 i).Inext = T 68 (100 + i.val + 1) ∧
      (entry0957 i).Icur = T 68 (100 + i.val) ∧
      (entry0957 i).output = T 69 (100 + i.val) ∧
      (entry0957 i).charge = charge 68 (100 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0961_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0973_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0957 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (100 + i.val)) shift
      (S (100 + i.val + 1)) (S 69) (T 68 (100 + i.val + 1))
      (T 68 (100 + i.val)) (T 69 (100 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0957.entries OriginalRow227TriangleForward0957.checked
    ⟨i.val, by rw [size0957]; exact i.isLt⟩
  change (entry0957 i).check = true at h
  rcases fields0957 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0958 : OriginalRow227TriangleForward0958.entries.size = 32 := rfl

def entry0958 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0958.entries[i.val]'(by rw [size0958]; exact i.isLt)

theorem fields0958 (i : Fin 32) :
    (entry0958 i).IA = shift ∧ (entry0958 i).ID = S (132 + i.val + 1) ∧
      (entry0958 i).IC = S 69 ∧ (entry0958 i).Inext = T 68 (132 + i.val + 1) ∧
      (entry0958 i).Icur = T 68 (132 + i.val) ∧
      (entry0958 i).output = T 69 (132 + i.val) ∧
      (entry0958 i).charge = charge 68 (132 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0962_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0974_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0958 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (132 + i.val)) shift
      (S (132 + i.val + 1)) (S 69) (T 68 (132 + i.val + 1))
      (T 68 (132 + i.val)) (T 69 (132 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0958.entries OriginalRow227TriangleForward0958.checked
    ⟨i.val, by rw [size0958]; exact i.isLt⟩
  change (entry0958 i).check = true at h
  rcases fields0958 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0959 : OriginalRow227TriangleForward0959.entries.size = 32 := rfl

def entry0959 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0959.entries[i.val]'(by rw [size0959]; exact i.isLt)

theorem fields0959 (i : Fin 32) :
    (entry0959 i).IA = shift ∧ (entry0959 i).ID = S (164 + i.val + 1) ∧
      (entry0959 i).IC = S 69 ∧ (entry0959 i).Inext = T 68 (164 + i.val + 1) ∧
      (entry0959 i).Icur = T 68 (164 + i.val) ∧
      (entry0959 i).output = T 69 (164 + i.val) ∧
      (entry0959 i).charge = charge 68 (164 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0963_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0975_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0959 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (164 + i.val)) shift
      (S (164 + i.val + 1)) (S 69) (T 68 (164 + i.val + 1))
      (T 68 (164 + i.val)) (T 69 (164 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0959.entries OriginalRow227TriangleForward0959.checked
    ⟨i.val, by rw [size0959]; exact i.isLt⟩
  change (entry0959 i).check = true at h
  rcases fields0959 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0960 : OriginalRow227TriangleForward0960.entries.size = 32 := rfl

def entry0960 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0960.entries[i.val]'(by rw [size0960]; exact i.isLt)

theorem fields0960 (i : Fin 32) :
    (entry0960 i).IA = shift ∧ (entry0960 i).ID = S (196 + i.val + 1) ∧
      (entry0960 i).IC = S 69 ∧ (entry0960 i).Inext = T 68 (196 + i.val + 1) ∧
      (entry0960 i).Icur = T 68 (196 + i.val) ∧
      (entry0960 i).output = T 69 (196 + i.val) ∧
      (entry0960 i).charge = charge 68 (196 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0964_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0976_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0960 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (196 + i.val)) shift
      (S (196 + i.val + 1)) (S 69) (T 68 (196 + i.val + 1))
      (T 68 (196 + i.val)) (T 69 (196 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0960.entries OriginalRow227TriangleForward0960.checked
    ⟨i.val, by rw [size0960]; exact i.isLt⟩
  change (entry0960 i).check = true at h
  rcases fields0960 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0961 : OriginalRow227TriangleForward0961.entries.size = 32 := rfl

def entry0961 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0961.entries[i.val]'(by rw [size0961]; exact i.isLt)

theorem fields0961 (i : Fin 32) :
    (entry0961 i).IA = shift ∧ (entry0961 i).ID = S (228 + i.val + 1) ∧
      (entry0961 i).IC = S 69 ∧ (entry0961 i).Inext = T 68 (228 + i.val + 1) ∧
      (entry0961 i).Icur = T 68 (228 + i.val) ∧
      (entry0961 i).output = T 69 (228 + i.val) ∧
      (entry0961 i).charge = charge 68 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0965_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0977_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0961 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 69) (T 68 (228 + i.val + 1))
      (T 68 (228 + i.val)) (T 69 (228 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0961.entries OriginalRow227TriangleForward0961.checked
    ⟨i.val, by rw [size0961]; exact i.isLt⟩
  change (entry0961 i).check = true at h
  rcases fields0961 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0962 : OriginalRow227TriangleForward0962.entries.size = 32 := rfl

def entry0962 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0962.entries[i.val]'(by rw [size0962]; exact i.isLt)

theorem fields0962 (i : Fin 32) :
    (entry0962 i).IA = shift ∧ (entry0962 i).ID = S (260 + i.val + 1) ∧
      (entry0962 i).IC = S 69 ∧ (entry0962 i).Inext = T 68 (260 + i.val + 1) ∧
      (entry0962 i).Icur = T 68 (260 + i.val) ∧
      (entry0962 i).output = T 69 (260 + i.val) ∧
      (entry0962 i).charge = charge 68 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0966_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0978_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0962 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 69) (T 68 (260 + i.val + 1))
      (T 68 (260 + i.val)) (T 69 (260 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0962.entries OriginalRow227TriangleForward0962.checked
    ⟨i.val, by rw [size0962]; exact i.isLt⟩
  change (entry0962 i).check = true at h
  rcases fields0962 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0963 : OriginalRow227TriangleForward0963.entries.size = 32 := rfl

def entry0963 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0963.entries[i.val]'(by rw [size0963]; exact i.isLt)

theorem fields0963 (i : Fin 32) :
    (entry0963 i).IA = shift ∧ (entry0963 i).ID = S (292 + i.val + 1) ∧
      (entry0963 i).IC = S 69 ∧ (entry0963 i).Inext = T 68 (292 + i.val + 1) ∧
      (entry0963 i).Icur = T 68 (292 + i.val) ∧
      (entry0963 i).output = T 69 (292 + i.val) ∧
      (entry0963 i).charge = charge 68 (292 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0967_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0979_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0963 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (292 + i.val)) shift
      (S (292 + i.val + 1)) (S 69) (T 68 (292 + i.val + 1))
      (T 68 (292 + i.val)) (T 69 (292 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0963.entries OriginalRow227TriangleForward0963.checked
    ⟨i.val, by rw [size0963]; exact i.isLt⟩
  change (entry0963 i).check = true at h
  rcases fields0963 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0964 : OriginalRow227TriangleForward0964.entries.size = 32 := rfl

def entry0964 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0964.entries[i.val]'(by rw [size0964]; exact i.isLt)

theorem fields0964 (i : Fin 32) :
    (entry0964 i).IA = shift ∧ (entry0964 i).ID = S (324 + i.val + 1) ∧
      (entry0964 i).IC = S 69 ∧ (entry0964 i).Inext = T 68 (324 + i.val + 1) ∧
      (entry0964 i).Icur = T 68 (324 + i.val) ∧
      (entry0964 i).output = T 69 (324 + i.val) ∧
      (entry0964 i).charge = charge 68 (324 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0968_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0980_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0964 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (324 + i.val)) shift
      (S (324 + i.val + 1)) (S 69) (T 68 (324 + i.val + 1))
      (T 68 (324 + i.val)) (T 69 (324 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0964.entries OriginalRow227TriangleForward0964.checked
    ⟨i.val, by rw [size0964]; exact i.isLt⟩
  change (entry0964 i).check = true at h
  rcases fields0964 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0965 : OriginalRow227TriangleForward0965.entries.size = 32 := rfl

def entry0965 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0965.entries[i.val]'(by rw [size0965]; exact i.isLt)

theorem fields0965 (i : Fin 32) :
    (entry0965 i).IA = shift ∧ (entry0965 i).ID = S (356 + i.val + 1) ∧
      (entry0965 i).IC = S 69 ∧ (entry0965 i).Inext = T 68 (356 + i.val + 1) ∧
      (entry0965 i).Icur = T 68 (356 + i.val) ∧
      (entry0965 i).output = T 69 (356 + i.val) ∧
      (entry0965 i).charge = charge 68 (356 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0969_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0981_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0965 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (356 + i.val)) shift
      (S (356 + i.val + 1)) (S 69) (T 68 (356 + i.val + 1))
      (T 68 (356 + i.val)) (T 69 (356 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0965.entries OriginalRow227TriangleForward0965.checked
    ⟨i.val, by rw [size0965]; exact i.isLt⟩
  change (entry0965 i).check = true at h
  rcases fields0965 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0966 : OriginalRow227TriangleForward0966.entries.size = 32 := rfl

def entry0966 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0966.entries[i.val]'(by rw [size0966]; exact i.isLt)

theorem fields0966 (i : Fin 32) :
    (entry0966 i).IA = shift ∧ (entry0966 i).ID = S (388 + i.val + 1) ∧
      (entry0966 i).IC = S 69 ∧ (entry0966 i).Inext = T 68 (388 + i.val + 1) ∧
      (entry0966 i).Icur = T 68 (388 + i.val) ∧
      (entry0966 i).output = T 69 (388 + i.val) ∧
      (entry0966 i).charge = charge 68 (388 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0970_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0982_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0966 (i : Fin 32) :
    forwardStepOK (-768) (charge 68 (388 + i.val)) shift
      (S (388 + i.val + 1)) (S 69) (T 68 (388 + i.val + 1))
      (T 68 (388 + i.val)) (T 69 (388 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0966.entries OriginalRow227TriangleForward0966.checked
    ⟨i.val, by rw [size0966]; exact i.isLt⟩
  change (entry0966 i).check = true at h
  rcases fields0966 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0967 : OriginalRow227TriangleForward0967.entries.size = 13 := rfl

def entry0967 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0967.entries[i.val]'(by rw [size0967]; exact i.isLt)

theorem fields0967 (i : Fin 13) :
    (entry0967 i).IA = shift ∧ (entry0967 i).ID = S (420 + i.val + 1) ∧
      (entry0967 i).IC = S 69 ∧ (entry0967 i).Inext = T 68 (420 + i.val + 1) ∧
      (entry0967 i).Icur = T 68 (420 + i.val) ∧
      (entry0967 i).output = T 69 (420 + i.val) ∧
      (entry0967 i).charge = charge 68 (420 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings02.S_eq_root69).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow068.block0971_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow069.block0983_value ⟨12, by decide⟩).symm, rfl⟩

theorem step0967 (i : Fin 13) :
    forwardStepOK (-768) (charge 68 (420 + i.val)) shift
      (S (420 + i.val + 1)) (S 69) (T 68 (420 + i.val + 1))
      (T 68 (420 + i.val)) (T 69 (420 + i.val))
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0967.entries OriginalRow227TriangleForward0967.checked
    ⟨i.val, by rw [size0967]; exact i.isLt⟩
  change (entry0967 i).check = true at h
  rcases fields0967 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 68 ≤ d) (hhi : d < 433) :
    forwardStepOK (-768) (charge 68 d) shift (S (d + 1)) (S 69)
      (T 68 (d + 1)) (T 68 d) (T 69 d)
      (OriginalRow227Roots.root_pos 69 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 68 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    by_cases h164 : d < 164
    ·
      by_cases h100 : d < 100
      ·
        have hi : d - 68 < 32 := by omega
        have heq : 68 + (d - 68) = d := by omega
        simpa only [heq] using step0956 ⟨d - 68, hi⟩
      ·
        by_cases h132 : d < 132
        ·
          have hi : d - 100 < 32 := by omega
          have heq : 100 + (d - 100) = d := by omega
          simpa only [heq] using step0957 ⟨d - 100, hi⟩
        ·
          have hi : d - 132 < 32 := by omega
          have heq : 132 + (d - 132) = d := by omega
          simpa only [heq] using step0958 ⟨d - 132, hi⟩
    ·
      by_cases h196 : d < 196
      ·
        have hi : d - 164 < 32 := by omega
        have heq : 164 + (d - 164) = d := by omega
        simpa only [heq] using step0959 ⟨d - 164, hi⟩
      ·
        by_cases h228 : d < 228
        ·
          have hi : d - 196 < 32 := by omega
          have heq : 196 + (d - 196) = d := by omega
          simpa only [heq] using step0960 ⟨d - 196, hi⟩
        ·
          have hi : d - 228 < 32 := by omega
          have heq : 228 + (d - 228) = d := by omega
          simpa only [heq] using step0961 ⟨d - 228, hi⟩
  ·
    by_cases h356 : d < 356
    ·
      by_cases h292 : d < 292
      ·
        have hi : d - 260 < 32 := by omega
        have heq : 260 + (d - 260) = d := by omega
        simpa only [heq] using step0962 ⟨d - 260, hi⟩
      ·
        by_cases h324 : d < 324
        ·
          have hi : d - 292 < 32 := by omega
          have heq : 292 + (d - 292) = d := by omega
          simpa only [heq] using step0963 ⟨d - 292, hi⟩
        ·
          have hi : d - 324 < 32 := by omega
          have heq : 324 + (d - 324) = d := by omega
          simpa only [heq] using step0964 ⟨d - 324, hi⟩
    ·
      by_cases h388 : d < 388
      ·
        have hi : d - 356 < 32 := by omega
        have heq : 356 + (d - 356) = d := by omega
        simpa only [heq] using step0965 ⟨d - 356, hi⟩
      ·
        by_cases h420 : d < 420
        ·
          have hi : d - 388 < 32 := by omega
          have heq : 388 + (d - 388) = d := by omega
          simpa only [heq] using step0966 ⟨d - 388, hi⟩
        ·
          have hi : d - 420 < 13 := by omega
          have heq : 420 + (d - 420) = d := by omega
          simpa only [heq] using step0967 ⟨d - 420, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0956,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0956,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0957,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0957,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0958,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0958,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0959,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0959,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0960,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0960,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0961,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0961,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0962,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0962,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0963,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0963,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0964,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0964,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0965,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0965,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0966,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0966,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.fields0967,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.step0967,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow069
