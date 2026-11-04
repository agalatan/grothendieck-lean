import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow082
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083
import Grothe.UpperChaos.OriginalRow227TriangleForward1117
import Grothe.UpperChaos.OriginalRow227TriangleForward1118
import Grothe.UpperChaos.OriginalRow227TriangleForward1119
import Grothe.UpperChaos.OriginalRow227TriangleForward1120
import Grothe.UpperChaos.OriginalRow227TriangleForward1121
import Grothe.UpperChaos.OriginalRow227TriangleForward1122
import Grothe.UpperChaos.OriginalRow227TriangleForward1123
import Grothe.UpperChaos.OriginalRow227TriangleForward1124
import Grothe.UpperChaos.OriginalRow227TriangleForward1125
import Grothe.UpperChaos.OriginalRow227TriangleForward1126
import Grothe.UpperChaos.OriginalRow227TriangleForward1127

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1117 : OriginalRow227TriangleForward1117.entries.size = 32 := rfl

def entry1117 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1117.entries[i.val]'(by rw [size1117]; exact i.isLt)

theorem fields1117 (i : Fin 32) :
    (entry1117 i).IA = shift ∧ (entry1117 i).ID = S (82 + i.val + 1) ∧
      (entry1117 i).IC = S 83 ∧ (entry1117 i).Inext = T 82 (82 + i.val + 1) ∧
      (entry1117 i).Icur = T 82 (82 + i.val) ∧
      (entry1117 i).output = T 83 (82 + i.val) ∧
      (entry1117 i).charge = charge 82 (82 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1122_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1117 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (82 + i.val)) shift
      (S (82 + i.val + 1)) (S 83) (T 82 (82 + i.val + 1))
      (T 82 (82 + i.val)) (T 83 (82 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1117.entries OriginalRow227TriangleForward1117.checked
    ⟨i.val, by rw [size1117]; exact i.isLt⟩
  change (entry1117 i).check = true at h
  rcases fields1117 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1118 : OriginalRow227TriangleForward1118.entries.size = 32 := rfl

def entry1118 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1118.entries[i.val]'(by rw [size1118]; exact i.isLt)

theorem fields1118 (i : Fin 32) :
    (entry1118 i).IA = shift ∧ (entry1118 i).ID = S (114 + i.val + 1) ∧
      (entry1118 i).IC = S 83 ∧ (entry1118 i).Inext = T 82 (114 + i.val + 1) ∧
      (entry1118 i).Icur = T 82 (114 + i.val) ∧
      (entry1118 i).output = T 83 (114 + i.val) ∧
      (entry1118 i).charge = charge 82 (114 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1123_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1118 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (114 + i.val)) shift
      (S (114 + i.val + 1)) (S 83) (T 82 (114 + i.val + 1))
      (T 82 (114 + i.val)) (T 83 (114 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1118.entries OriginalRow227TriangleForward1118.checked
    ⟨i.val, by rw [size1118]; exact i.isLt⟩
  change (entry1118 i).check = true at h
  rcases fields1118 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1119 : OriginalRow227TriangleForward1119.entries.size = 32 := rfl

def entry1119 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1119.entries[i.val]'(by rw [size1119]; exact i.isLt)

theorem fields1119 (i : Fin 32) :
    (entry1119 i).IA = shift ∧ (entry1119 i).ID = S (146 + i.val + 1) ∧
      (entry1119 i).IC = S 83 ∧ (entry1119 i).Inext = T 82 (146 + i.val + 1) ∧
      (entry1119 i).Icur = T 82 (146 + i.val) ∧
      (entry1119 i).output = T 83 (146 + i.val) ∧
      (entry1119 i).charge = charge 82 (146 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1124_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1119 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (146 + i.val)) shift
      (S (146 + i.val + 1)) (S 83) (T 82 (146 + i.val + 1))
      (T 82 (146 + i.val)) (T 83 (146 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1119.entries OriginalRow227TriangleForward1119.checked
    ⟨i.val, by rw [size1119]; exact i.isLt⟩
  change (entry1119 i).check = true at h
  rcases fields1119 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1120 : OriginalRow227TriangleForward1120.entries.size = 32 := rfl

def entry1120 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1120.entries[i.val]'(by rw [size1120]; exact i.isLt)

theorem fields1120 (i : Fin 32) :
    (entry1120 i).IA = shift ∧ (entry1120 i).ID = S (178 + i.val + 1) ∧
      (entry1120 i).IC = S 83 ∧ (entry1120 i).Inext = T 82 (178 + i.val + 1) ∧
      (entry1120 i).Icur = T 82 (178 + i.val) ∧
      (entry1120 i).output = T 83 (178 + i.val) ∧
      (entry1120 i).charge = charge 82 (178 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1125_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1120 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (178 + i.val)) shift
      (S (178 + i.val + 1)) (S 83) (T 82 (178 + i.val + 1))
      (T 82 (178 + i.val)) (T 83 (178 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1120.entries OriginalRow227TriangleForward1120.checked
    ⟨i.val, by rw [size1120]; exact i.isLt⟩
  change (entry1120 i).check = true at h
  rcases fields1120 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1121 : OriginalRow227TriangleForward1121.entries.size = 32 := rfl

def entry1121 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1121.entries[i.val]'(by rw [size1121]; exact i.isLt)

theorem fields1121 (i : Fin 32) :
    (entry1121 i).IA = shift ∧ (entry1121 i).ID = S (210 + i.val + 1) ∧
      (entry1121 i).IC = S 83 ∧ (entry1121 i).Inext = T 82 (210 + i.val + 1) ∧
      (entry1121 i).Icur = T 82 (210 + i.val) ∧
      (entry1121 i).output = T 83 (210 + i.val) ∧
      (entry1121 i).charge = charge 82 (210 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1126_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1121 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (210 + i.val)) shift
      (S (210 + i.val + 1)) (S 83) (T 82 (210 + i.val + 1))
      (T 82 (210 + i.val)) (T 83 (210 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1121.entries OriginalRow227TriangleForward1121.checked
    ⟨i.val, by rw [size1121]; exact i.isLt⟩
  change (entry1121 i).check = true at h
  rcases fields1121 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1122 : OriginalRow227TriangleForward1122.entries.size = 32 := rfl

def entry1122 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1122.entries[i.val]'(by rw [size1122]; exact i.isLt)

theorem fields1122 (i : Fin 32) :
    (entry1122 i).IA = shift ∧ (entry1122 i).ID = S (242 + i.val + 1) ∧
      (entry1122 i).IC = S 83 ∧ (entry1122 i).Inext = T 82 (242 + i.val + 1) ∧
      (entry1122 i).Icur = T 82 (242 + i.val) ∧
      (entry1122 i).output = T 83 (242 + i.val) ∧
      (entry1122 i).charge = charge 82 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1127_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1122 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 83) (T 82 (242 + i.val + 1))
      (T 82 (242 + i.val)) (T 83 (242 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1122.entries OriginalRow227TriangleForward1122.checked
    ⟨i.val, by rw [size1122]; exact i.isLt⟩
  change (entry1122 i).check = true at h
  rcases fields1122 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1123 : OriginalRow227TriangleForward1123.entries.size = 32 := rfl

def entry1123 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1123.entries[i.val]'(by rw [size1123]; exact i.isLt)

theorem fields1123 (i : Fin 32) :
    (entry1123 i).IA = shift ∧ (entry1123 i).ID = S (274 + i.val + 1) ∧
      (entry1123 i).IC = S 83 ∧ (entry1123 i).Inext = T 82 (274 + i.val + 1) ∧
      (entry1123 i).Icur = T 82 (274 + i.val) ∧
      (entry1123 i).output = T 83 (274 + i.val) ∧
      (entry1123 i).charge = charge 82 (274 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1128_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1123 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (274 + i.val)) shift
      (S (274 + i.val + 1)) (S 83) (T 82 (274 + i.val + 1))
      (T 82 (274 + i.val)) (T 83 (274 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1123.entries OriginalRow227TriangleForward1123.checked
    ⟨i.val, by rw [size1123]; exact i.isLt⟩
  change (entry1123 i).check = true at h
  rcases fields1123 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1124 : OriginalRow227TriangleForward1124.entries.size = 32 := rfl

def entry1124 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1124.entries[i.val]'(by rw [size1124]; exact i.isLt)

theorem fields1124 (i : Fin 32) :
    (entry1124 i).IA = shift ∧ (entry1124 i).ID = S (306 + i.val + 1) ∧
      (entry1124 i).IC = S 83 ∧ (entry1124 i).Inext = T 82 (306 + i.val + 1) ∧
      (entry1124 i).Icur = T 82 (306 + i.val) ∧
      (entry1124 i).output = T 83 (306 + i.val) ∧
      (entry1124 i).charge = charge 82 (306 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1129_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1124 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (306 + i.val)) shift
      (S (306 + i.val + 1)) (S 83) (T 82 (306 + i.val + 1))
      (T 82 (306 + i.val)) (T 83 (306 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1124.entries OriginalRow227TriangleForward1124.checked
    ⟨i.val, by rw [size1124]; exact i.isLt⟩
  change (entry1124 i).check = true at h
  rcases fields1124 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1125 : OriginalRow227TriangleForward1125.entries.size = 32 := rfl

def entry1125 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1125.entries[i.val]'(by rw [size1125]; exact i.isLt)

theorem fields1125 (i : Fin 32) :
    (entry1125 i).IA = shift ∧ (entry1125 i).ID = S (338 + i.val + 1) ∧
      (entry1125 i).IC = S 83 ∧ (entry1125 i).Inext = T 82 (338 + i.val + 1) ∧
      (entry1125 i).Icur = T 82 (338 + i.val) ∧
      (entry1125 i).output = T 83 (338 + i.val) ∧
      (entry1125 i).charge = charge 82 (338 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1130_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1125 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (338 + i.val)) shift
      (S (338 + i.val + 1)) (S 83) (T 82 (338 + i.val + 1))
      (T 82 (338 + i.val)) (T 83 (338 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1125.entries OriginalRow227TriangleForward1125.checked
    ⟨i.val, by rw [size1125]; exact i.isLt⟩
  change (entry1125 i).check = true at h
  rcases fields1125 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1126 : OriginalRow227TriangleForward1126.entries.size = 32 := rfl

def entry1126 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1126.entries[i.val]'(by rw [size1126]; exact i.isLt)

theorem fields1126 (i : Fin 32) :
    (entry1126 i).IA = shift ∧ (entry1126 i).ID = S (370 + i.val + 1) ∧
      (entry1126 i).IC = S 83 ∧ (entry1126 i).Inext = T 82 (370 + i.val + 1) ∧
      (entry1126 i).Icur = T 82 (370 + i.val) ∧
      (entry1126 i).output = T 83 (370 + i.val) ∧
      (entry1126 i).charge = charge 82 (370 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1131_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1126 (i : Fin 32) :
    forwardStepOK (-768) (charge 82 (370 + i.val)) shift
      (S (370 + i.val + 1)) (S 83) (T 82 (370 + i.val + 1))
      (T 82 (370 + i.val)) (T 83 (370 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1126.entries OriginalRow227TriangleForward1126.checked
    ⟨i.val, by rw [size1126]; exact i.isLt⟩
  change (entry1126 i).check = true at h
  rcases fields1126 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1127 : OriginalRow227TriangleForward1127.entries.size = 17 := rfl

def entry1127 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1127.entries[i.val]'(by rw [size1127]; exact i.isLt)

theorem fields1127 (i : Fin 17) :
    (entry1127 i).IA = shift ∧ (entry1127 i).ID = S (402 + i.val + 1) ∧
      (entry1127 i).IC = S 83 ∧ (entry1127 i).Inext = T 82 (402 + i.val + 1) ∧
      (entry1127 i).Icur = T 82 (402 + i.val) ∧
      (entry1127 i).output = T 83 (402 + i.val) ∧
      (entry1127 i).charge = charge 82 (402 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root83).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow082.block1132_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1127 (i : Fin 17) :
    forwardStepOK (-768) (charge 82 (402 + i.val)) shift
      (S (402 + i.val + 1)) (S 83) (T 82 (402 + i.val + 1))
      (T 82 (402 + i.val)) (T 83 (402 + i.val))
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1127.entries OriginalRow227TriangleForward1127.checked
    ⟨i.val, by rw [size1127]; exact i.isLt⟩
  change (entry1127 i).check = true at h
  rcases fields1127 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 82 ≤ d) (hhi : d < 419) :
    forwardStepOK (-768) (charge 82 d) shift (S (d + 1)) (S 83)
      (T 82 (d + 1)) (T 82 d) (T 83 d)
      (OriginalRow227Roots.root_pos 83 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 82 (by decide)) = true := by
  by_cases h242 : d < 242
  ·
    by_cases h146 : d < 146
    ·
      by_cases h114 : d < 114
      ·
        have hi : d - 82 < 32 := by omega
        have heq : 82 + (d - 82) = d := by omega
        simpa only [heq] using step1117 ⟨d - 82, hi⟩
      ·
        have hi : d - 114 < 32 := by omega
        have heq : 114 + (d - 114) = d := by omega
        simpa only [heq] using step1118 ⟨d - 114, hi⟩
    ·
      by_cases h178 : d < 178
      ·
        have hi : d - 146 < 32 := by omega
        have heq : 146 + (d - 146) = d := by omega
        simpa only [heq] using step1119 ⟨d - 146, hi⟩
      ·
        by_cases h210 : d < 210
        ·
          have hi : d - 178 < 32 := by omega
          have heq : 178 + (d - 178) = d := by omega
          simpa only [heq] using step1120 ⟨d - 178, hi⟩
        ·
          have hi : d - 210 < 32 := by omega
          have heq : 210 + (d - 210) = d := by omega
          simpa only [heq] using step1121 ⟨d - 210, hi⟩
  ·
    by_cases h338 : d < 338
    ·
      by_cases h274 : d < 274
      ·
        have hi : d - 242 < 32 := by omega
        have heq : 242 + (d - 242) = d := by omega
        simpa only [heq] using step1122 ⟨d - 242, hi⟩
      ·
        by_cases h306 : d < 306
        ·
          have hi : d - 274 < 32 := by omega
          have heq : 274 + (d - 274) = d := by omega
          simpa only [heq] using step1123 ⟨d - 274, hi⟩
        ·
          have hi : d - 306 < 32 := by omega
          have heq : 306 + (d - 306) = d := by omega
          simpa only [heq] using step1124 ⟨d - 306, hi⟩
    ·
      by_cases h370 : d < 370
      ·
        have hi : d - 338 < 32 := by omega
        have heq : 338 + (d - 338) = d := by omega
        simpa only [heq] using step1125 ⟨d - 338, hi⟩
      ·
        by_cases h402 : d < 402
        ·
          have hi : d - 370 < 32 := by omega
          have heq : 370 + (d - 370) = d := by omega
          simpa only [heq] using step1126 ⟨d - 370, hi⟩
        ·
          have hi : d - 402 < 17 := by omega
          have heq : 402 + (d - 402) = d := by omega
          simpa only [heq] using step1127 ⟨d - 402, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1117,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1117,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1118,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1118,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1119,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1119,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1120,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1120,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1121,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1121,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1122,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1122,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1123,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1123,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1124,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1124,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1125,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1125,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1126,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1126,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.fields1127,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.step1127,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow083
