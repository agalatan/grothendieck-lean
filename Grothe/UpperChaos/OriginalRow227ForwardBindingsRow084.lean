import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow083
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow084
import Grothe.UpperChaos.OriginalRow227TriangleForward1128
import Grothe.UpperChaos.OriginalRow227TriangleForward1129
import Grothe.UpperChaos.OriginalRow227TriangleForward1130
import Grothe.UpperChaos.OriginalRow227TriangleForward1131
import Grothe.UpperChaos.OriginalRow227TriangleForward1132
import Grothe.UpperChaos.OriginalRow227TriangleForward1133
import Grothe.UpperChaos.OriginalRow227TriangleForward1134
import Grothe.UpperChaos.OriginalRow227TriangleForward1135
import Grothe.UpperChaos.OriginalRow227TriangleForward1136
import Grothe.UpperChaos.OriginalRow227TriangleForward1137
import Grothe.UpperChaos.OriginalRow227TriangleForward1138

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1128 : OriginalRow227TriangleForward1128.entries.size = 32 := rfl

def entry1128 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1128.entries[i.val]'(by rw [size1128]; exact i.isLt)

theorem fields1128 (i : Fin 32) :
    (entry1128 i).IA = shift ∧ (entry1128 i).ID = S (83 + i.val + 1) ∧
      (entry1128 i).IC = S 84 ∧ (entry1128 i).Inext = T 83 (83 + i.val + 1) ∧
      (entry1128 i).Icur = T 83 (83 + i.val) ∧
      (entry1128 i).output = T 84 (83 + i.val) ∧
      (entry1128 i).charge = charge 83 (83 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1133_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1144_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1128 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (83 + i.val)) shift
      (S (83 + i.val + 1)) (S 84) (T 83 (83 + i.val + 1))
      (T 83 (83 + i.val)) (T 84 (83 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1128.entries OriginalRow227TriangleForward1128.checked
    ⟨i.val, by rw [size1128]; exact i.isLt⟩
  change (entry1128 i).check = true at h
  rcases fields1128 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1129 : OriginalRow227TriangleForward1129.entries.size = 32 := rfl

def entry1129 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1129.entries[i.val]'(by rw [size1129]; exact i.isLt)

theorem fields1129 (i : Fin 32) :
    (entry1129 i).IA = shift ∧ (entry1129 i).ID = S (115 + i.val + 1) ∧
      (entry1129 i).IC = S 84 ∧ (entry1129 i).Inext = T 83 (115 + i.val + 1) ∧
      (entry1129 i).Icur = T 83 (115 + i.val) ∧
      (entry1129 i).output = T 84 (115 + i.val) ∧
      (entry1129 i).charge = charge 83 (115 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1134_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1145_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1129 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (115 + i.val)) shift
      (S (115 + i.val + 1)) (S 84) (T 83 (115 + i.val + 1))
      (T 83 (115 + i.val)) (T 84 (115 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1129.entries OriginalRow227TriangleForward1129.checked
    ⟨i.val, by rw [size1129]; exact i.isLt⟩
  change (entry1129 i).check = true at h
  rcases fields1129 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1130 : OriginalRow227TriangleForward1130.entries.size = 32 := rfl

def entry1130 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1130.entries[i.val]'(by rw [size1130]; exact i.isLt)

theorem fields1130 (i : Fin 32) :
    (entry1130 i).IA = shift ∧ (entry1130 i).ID = S (147 + i.val + 1) ∧
      (entry1130 i).IC = S 84 ∧ (entry1130 i).Inext = T 83 (147 + i.val + 1) ∧
      (entry1130 i).Icur = T 83 (147 + i.val) ∧
      (entry1130 i).output = T 84 (147 + i.val) ∧
      (entry1130 i).charge = charge 83 (147 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1135_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1146_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1130 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (147 + i.val)) shift
      (S (147 + i.val + 1)) (S 84) (T 83 (147 + i.val + 1))
      (T 83 (147 + i.val)) (T 84 (147 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1130.entries OriginalRow227TriangleForward1130.checked
    ⟨i.val, by rw [size1130]; exact i.isLt⟩
  change (entry1130 i).check = true at h
  rcases fields1130 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1131 : OriginalRow227TriangleForward1131.entries.size = 32 := rfl

def entry1131 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1131.entries[i.val]'(by rw [size1131]; exact i.isLt)

theorem fields1131 (i : Fin 32) :
    (entry1131 i).IA = shift ∧ (entry1131 i).ID = S (179 + i.val + 1) ∧
      (entry1131 i).IC = S 84 ∧ (entry1131 i).Inext = T 83 (179 + i.val + 1) ∧
      (entry1131 i).Icur = T 83 (179 + i.val) ∧
      (entry1131 i).output = T 84 (179 + i.val) ∧
      (entry1131 i).charge = charge 83 (179 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1136_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1147_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1131 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (179 + i.val)) shift
      (S (179 + i.val + 1)) (S 84) (T 83 (179 + i.val + 1))
      (T 83 (179 + i.val)) (T 84 (179 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1131.entries OriginalRow227TriangleForward1131.checked
    ⟨i.val, by rw [size1131]; exact i.isLt⟩
  change (entry1131 i).check = true at h
  rcases fields1131 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1132 : OriginalRow227TriangleForward1132.entries.size = 32 := rfl

def entry1132 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1132.entries[i.val]'(by rw [size1132]; exact i.isLt)

theorem fields1132 (i : Fin 32) :
    (entry1132 i).IA = shift ∧ (entry1132 i).ID = S (211 + i.val + 1) ∧
      (entry1132 i).IC = S 84 ∧ (entry1132 i).Inext = T 83 (211 + i.val + 1) ∧
      (entry1132 i).Icur = T 83 (211 + i.val) ∧
      (entry1132 i).output = T 84 (211 + i.val) ∧
      (entry1132 i).charge = charge 83 (211 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1137_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1148_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1132 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (211 + i.val)) shift
      (S (211 + i.val + 1)) (S 84) (T 83 (211 + i.val + 1))
      (T 83 (211 + i.val)) (T 84 (211 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1132.entries OriginalRow227TriangleForward1132.checked
    ⟨i.val, by rw [size1132]; exact i.isLt⟩
  change (entry1132 i).check = true at h
  rcases fields1132 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1133 : OriginalRow227TriangleForward1133.entries.size = 32 := rfl

def entry1133 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1133.entries[i.val]'(by rw [size1133]; exact i.isLt)

theorem fields1133 (i : Fin 32) :
    (entry1133 i).IA = shift ∧ (entry1133 i).ID = S (243 + i.val + 1) ∧
      (entry1133 i).IC = S 84 ∧ (entry1133 i).Inext = T 83 (243 + i.val + 1) ∧
      (entry1133 i).Icur = T 83 (243 + i.val) ∧
      (entry1133 i).output = T 84 (243 + i.val) ∧
      (entry1133 i).charge = charge 83 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1138_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1149_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1133 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 84) (T 83 (243 + i.val + 1))
      (T 83 (243 + i.val)) (T 84 (243 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1133.entries OriginalRow227TriangleForward1133.checked
    ⟨i.val, by rw [size1133]; exact i.isLt⟩
  change (entry1133 i).check = true at h
  rcases fields1133 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1134 : OriginalRow227TriangleForward1134.entries.size = 32 := rfl

def entry1134 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1134.entries[i.val]'(by rw [size1134]; exact i.isLt)

theorem fields1134 (i : Fin 32) :
    (entry1134 i).IA = shift ∧ (entry1134 i).ID = S (275 + i.val + 1) ∧
      (entry1134 i).IC = S 84 ∧ (entry1134 i).Inext = T 83 (275 + i.val + 1) ∧
      (entry1134 i).Icur = T 83 (275 + i.val) ∧
      (entry1134 i).output = T 84 (275 + i.val) ∧
      (entry1134 i).charge = charge 83 (275 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1139_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1150_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1134 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (275 + i.val)) shift
      (S (275 + i.val + 1)) (S 84) (T 83 (275 + i.val + 1))
      (T 83 (275 + i.val)) (T 84 (275 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1134.entries OriginalRow227TriangleForward1134.checked
    ⟨i.val, by rw [size1134]; exact i.isLt⟩
  change (entry1134 i).check = true at h
  rcases fields1134 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1135 : OriginalRow227TriangleForward1135.entries.size = 32 := rfl

def entry1135 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1135.entries[i.val]'(by rw [size1135]; exact i.isLt)

theorem fields1135 (i : Fin 32) :
    (entry1135 i).IA = shift ∧ (entry1135 i).ID = S (307 + i.val + 1) ∧
      (entry1135 i).IC = S 84 ∧ (entry1135 i).Inext = T 83 (307 + i.val + 1) ∧
      (entry1135 i).Icur = T 83 (307 + i.val) ∧
      (entry1135 i).output = T 84 (307 + i.val) ∧
      (entry1135 i).charge = charge 83 (307 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1140_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1151_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1135 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (307 + i.val)) shift
      (S (307 + i.val + 1)) (S 84) (T 83 (307 + i.val + 1))
      (T 83 (307 + i.val)) (T 84 (307 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1135.entries OriginalRow227TriangleForward1135.checked
    ⟨i.val, by rw [size1135]; exact i.isLt⟩
  change (entry1135 i).check = true at h
  rcases fields1135 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1136 : OriginalRow227TriangleForward1136.entries.size = 32 := rfl

def entry1136 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1136.entries[i.val]'(by rw [size1136]; exact i.isLt)

theorem fields1136 (i : Fin 32) :
    (entry1136 i).IA = shift ∧ (entry1136 i).ID = S (339 + i.val + 1) ∧
      (entry1136 i).IC = S 84 ∧ (entry1136 i).Inext = T 83 (339 + i.val + 1) ∧
      (entry1136 i).Icur = T 83 (339 + i.val) ∧
      (entry1136 i).output = T 84 (339 + i.val) ∧
      (entry1136 i).charge = charge 83 (339 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1141_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1152_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1136 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (339 + i.val)) shift
      (S (339 + i.val + 1)) (S 84) (T 83 (339 + i.val + 1))
      (T 83 (339 + i.val)) (T 84 (339 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1136.entries OriginalRow227TriangleForward1136.checked
    ⟨i.val, by rw [size1136]; exact i.isLt⟩
  change (entry1136 i).check = true at h
  rcases fields1136 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1137 : OriginalRow227TriangleForward1137.entries.size = 32 := rfl

def entry1137 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1137.entries[i.val]'(by rw [size1137]; exact i.isLt)

theorem fields1137 (i : Fin 32) :
    (entry1137 i).IA = shift ∧ (entry1137 i).ID = S (371 + i.val + 1) ∧
      (entry1137 i).IC = S 84 ∧ (entry1137 i).Inext = T 83 (371 + i.val + 1) ∧
      (entry1137 i).Icur = T 83 (371 + i.val) ∧
      (entry1137 i).output = T 84 (371 + i.val) ∧
      (entry1137 i).charge = charge 83 (371 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1142_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1153_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1137 (i : Fin 32) :
    forwardStepOK (-768) (charge 83 (371 + i.val)) shift
      (S (371 + i.val + 1)) (S 84) (T 83 (371 + i.val + 1))
      (T 83 (371 + i.val)) (T 84 (371 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1137.entries OriginalRow227TriangleForward1137.checked
    ⟨i.val, by rw [size1137]; exact i.isLt⟩
  change (entry1137 i).check = true at h
  rcases fields1137 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1138 : OriginalRow227TriangleForward1138.entries.size = 15 := rfl

def entry1138 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1138.entries[i.val]'(by rw [size1138]; exact i.isLt)

theorem fields1138 (i : Fin 15) :
    (entry1138 i).IA = shift ∧ (entry1138 i).ID = S (403 + i.val + 1) ∧
      (entry1138 i).IC = S 84 ∧ (entry1138 i).Inext = T 83 (403 + i.val + 1) ∧
      (entry1138 i).Icur = T 83 (403 + i.val) ∧
      (entry1138 i).output = T 84 (403 + i.val) ∧
      (entry1138 i).charge = charge 83 (403 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root84).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow083.block1143_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow084.block1154_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1138 (i : Fin 15) :
    forwardStepOK (-768) (charge 83 (403 + i.val)) shift
      (S (403 + i.val + 1)) (S 84) (T 83 (403 + i.val + 1))
      (T 83 (403 + i.val)) (T 84 (403 + i.val))
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1138.entries OriginalRow227TriangleForward1138.checked
    ⟨i.val, by rw [size1138]; exact i.isLt⟩
  change (entry1138 i).check = true at h
  rcases fields1138 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 83 ≤ d) (hhi : d < 418) :
    forwardStepOK (-768) (charge 83 d) shift (S (d + 1)) (S 84)
      (T 83 (d + 1)) (T 83 d) (T 84 d)
      (OriginalRow227Roots.root_pos 84 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 83 (by decide)) = true := by
  by_cases h243 : d < 243
  ·
    by_cases h147 : d < 147
    ·
      by_cases h115 : d < 115
      ·
        have hi : d - 83 < 32 := by omega
        have heq : 83 + (d - 83) = d := by omega
        simpa only [heq] using step1128 ⟨d - 83, hi⟩
      ·
        have hi : d - 115 < 32 := by omega
        have heq : 115 + (d - 115) = d := by omega
        simpa only [heq] using step1129 ⟨d - 115, hi⟩
    ·
      by_cases h179 : d < 179
      ·
        have hi : d - 147 < 32 := by omega
        have heq : 147 + (d - 147) = d := by omega
        simpa only [heq] using step1130 ⟨d - 147, hi⟩
      ·
        by_cases h211 : d < 211
        ·
          have hi : d - 179 < 32 := by omega
          have heq : 179 + (d - 179) = d := by omega
          simpa only [heq] using step1131 ⟨d - 179, hi⟩
        ·
          have hi : d - 211 < 32 := by omega
          have heq : 211 + (d - 211) = d := by omega
          simpa only [heq] using step1132 ⟨d - 211, hi⟩
  ·
    by_cases h339 : d < 339
    ·
      by_cases h275 : d < 275
      ·
        have hi : d - 243 < 32 := by omega
        have heq : 243 + (d - 243) = d := by omega
        simpa only [heq] using step1133 ⟨d - 243, hi⟩
      ·
        by_cases h307 : d < 307
        ·
          have hi : d - 275 < 32 := by omega
          have heq : 275 + (d - 275) = d := by omega
          simpa only [heq] using step1134 ⟨d - 275, hi⟩
        ·
          have hi : d - 307 < 32 := by omega
          have heq : 307 + (d - 307) = d := by omega
          simpa only [heq] using step1135 ⟨d - 307, hi⟩
    ·
      by_cases h371 : d < 371
      ·
        have hi : d - 339 < 32 := by omega
        have heq : 339 + (d - 339) = d := by omega
        simpa only [heq] using step1136 ⟨d - 339, hi⟩
      ·
        by_cases h403 : d < 403
        ·
          have hi : d - 371 < 32 := by omega
          have heq : 371 + (d - 371) = d := by omega
          simpa only [heq] using step1137 ⟨d - 371, hi⟩
        ·
          have hi : d - 403 < 15 := by omega
          have heq : 403 + (d - 403) = d := by omega
          simpa only [heq] using step1138 ⟨d - 403, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1128,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1128,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1129,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1129,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1130,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1130,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1131,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1131,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1132,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1132,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1133,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1133,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1134,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1134,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1135,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1135,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1136,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1136,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1137,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1137,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.fields1138,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.step1138,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow084
