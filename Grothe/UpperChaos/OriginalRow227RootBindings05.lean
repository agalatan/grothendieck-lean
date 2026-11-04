import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings05
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root161 : S 161 = OriginalRow227TriangleRoots05.root161 := rfl

theorem root161_checked : sqrtCheck 161 (S 161) = true := by
  rw [S_eq_root161]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨0, by decide⟩

theorem root161_pos : 0 < (S 161).lo.toRat := by
  rw [S_eq_root161]
  exact OriginalRow227TriangleRoots05.root161_pos

theorem product161_pos : 0 < (roundedMul (-768) shift (S 161)).lo.toRat := by
  rw [S_eq_root161]
  exact OriginalRow227TriangleRoots05.product161_pos

theorem S_eq_root162 : S 162 = OriginalRow227TriangleRoots05.root162 := rfl

theorem root162_checked : sqrtCheck 162 (S 162) = true := by
  rw [S_eq_root162]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨1, by decide⟩

theorem root162_pos : 0 < (S 162).lo.toRat := by
  rw [S_eq_root162]
  exact OriginalRow227TriangleRoots05.root162_pos

theorem product162_pos : 0 < (roundedMul (-768) shift (S 162)).lo.toRat := by
  rw [S_eq_root162]
  exact OriginalRow227TriangleRoots05.product162_pos

theorem S_eq_root163 : S 163 = OriginalRow227TriangleRoots05.root163 := rfl

theorem root163_checked : sqrtCheck 163 (S 163) = true := by
  rw [S_eq_root163]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨2, by decide⟩

theorem root163_pos : 0 < (S 163).lo.toRat := by
  rw [S_eq_root163]
  exact OriginalRow227TriangleRoots05.root163_pos

theorem product163_pos : 0 < (roundedMul (-768) shift (S 163)).lo.toRat := by
  rw [S_eq_root163]
  exact OriginalRow227TriangleRoots05.product163_pos

theorem S_eq_root164 : S 164 = OriginalRow227TriangleRoots05.root164 := rfl

theorem root164_checked : sqrtCheck 164 (S 164) = true := by
  rw [S_eq_root164]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨3, by decide⟩

theorem root164_pos : 0 < (S 164).lo.toRat := by
  rw [S_eq_root164]
  exact OriginalRow227TriangleRoots05.root164_pos

theorem product164_pos : 0 < (roundedMul (-768) shift (S 164)).lo.toRat := by
  rw [S_eq_root164]
  exact OriginalRow227TriangleRoots05.product164_pos

theorem S_eq_root165 : S 165 = OriginalRow227TriangleRoots05.root165 := rfl

theorem root165_checked : sqrtCheck 165 (S 165) = true := by
  rw [S_eq_root165]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨4, by decide⟩

theorem root165_pos : 0 < (S 165).lo.toRat := by
  rw [S_eq_root165]
  exact OriginalRow227TriangleRoots05.root165_pos

theorem product165_pos : 0 < (roundedMul (-768) shift (S 165)).lo.toRat := by
  rw [S_eq_root165]
  exact OriginalRow227TriangleRoots05.product165_pos

theorem S_eq_root166 : S 166 = OriginalRow227TriangleRoots05.root166 := rfl

theorem root166_checked : sqrtCheck 166 (S 166) = true := by
  rw [S_eq_root166]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨5, by decide⟩

theorem root166_pos : 0 < (S 166).lo.toRat := by
  rw [S_eq_root166]
  exact OriginalRow227TriangleRoots05.root166_pos

theorem product166_pos : 0 < (roundedMul (-768) shift (S 166)).lo.toRat := by
  rw [S_eq_root166]
  exact OriginalRow227TriangleRoots05.product166_pos

theorem S_eq_root167 : S 167 = OriginalRow227TriangleRoots05.root167 := rfl

theorem root167_checked : sqrtCheck 167 (S 167) = true := by
  rw [S_eq_root167]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨6, by decide⟩

theorem root167_pos : 0 < (S 167).lo.toRat := by
  rw [S_eq_root167]
  exact OriginalRow227TriangleRoots05.root167_pos

theorem product167_pos : 0 < (roundedMul (-768) shift (S 167)).lo.toRat := by
  rw [S_eq_root167]
  exact OriginalRow227TriangleRoots05.product167_pos

theorem S_eq_root168 : S 168 = OriginalRow227TriangleRoots05.root168 := rfl

theorem root168_checked : sqrtCheck 168 (S 168) = true := by
  rw [S_eq_root168]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨7, by decide⟩

theorem root168_pos : 0 < (S 168).lo.toRat := by
  rw [S_eq_root168]
  exact OriginalRow227TriangleRoots05.root168_pos

theorem product168_pos : 0 < (roundedMul (-768) shift (S 168)).lo.toRat := by
  rw [S_eq_root168]
  exact OriginalRow227TriangleRoots05.product168_pos

theorem S_eq_root169 : S 169 = OriginalRow227TriangleRoots05.root169 := rfl

theorem root169_checked : sqrtCheck 169 (S 169) = true := by
  rw [S_eq_root169]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨8, by decide⟩

theorem root169_pos : 0 < (S 169).lo.toRat := by
  rw [S_eq_root169]
  exact OriginalRow227TriangleRoots05.root169_pos

theorem product169_pos : 0 < (roundedMul (-768) shift (S 169)).lo.toRat := by
  rw [S_eq_root169]
  exact OriginalRow227TriangleRoots05.product169_pos

theorem S_eq_root170 : S 170 = OriginalRow227TriangleRoots05.root170 := rfl

theorem root170_checked : sqrtCheck 170 (S 170) = true := by
  rw [S_eq_root170]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨9, by decide⟩

theorem root170_pos : 0 < (S 170).lo.toRat := by
  rw [S_eq_root170]
  exact OriginalRow227TriangleRoots05.root170_pos

theorem product170_pos : 0 < (roundedMul (-768) shift (S 170)).lo.toRat := by
  rw [S_eq_root170]
  exact OriginalRow227TriangleRoots05.product170_pos

theorem S_eq_root171 : S 171 = OriginalRow227TriangleRoots05.root171 := rfl

theorem root171_checked : sqrtCheck 171 (S 171) = true := by
  rw [S_eq_root171]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨10, by decide⟩

theorem root171_pos : 0 < (S 171).lo.toRat := by
  rw [S_eq_root171]
  exact OriginalRow227TriangleRoots05.root171_pos

theorem product171_pos : 0 < (roundedMul (-768) shift (S 171)).lo.toRat := by
  rw [S_eq_root171]
  exact OriginalRow227TriangleRoots05.product171_pos

theorem S_eq_root172 : S 172 = OriginalRow227TriangleRoots05.root172 := rfl

theorem root172_checked : sqrtCheck 172 (S 172) = true := by
  rw [S_eq_root172]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨11, by decide⟩

theorem root172_pos : 0 < (S 172).lo.toRat := by
  rw [S_eq_root172]
  exact OriginalRow227TriangleRoots05.root172_pos

theorem product172_pos : 0 < (roundedMul (-768) shift (S 172)).lo.toRat := by
  rw [S_eq_root172]
  exact OriginalRow227TriangleRoots05.product172_pos

theorem S_eq_root173 : S 173 = OriginalRow227TriangleRoots05.root173 := rfl

theorem root173_checked : sqrtCheck 173 (S 173) = true := by
  rw [S_eq_root173]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨12, by decide⟩

theorem root173_pos : 0 < (S 173).lo.toRat := by
  rw [S_eq_root173]
  exact OriginalRow227TriangleRoots05.root173_pos

theorem product173_pos : 0 < (roundedMul (-768) shift (S 173)).lo.toRat := by
  rw [S_eq_root173]
  exact OriginalRow227TriangleRoots05.product173_pos

theorem S_eq_root174 : S 174 = OriginalRow227TriangleRoots05.root174 := rfl

theorem root174_checked : sqrtCheck 174 (S 174) = true := by
  rw [S_eq_root174]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨13, by decide⟩

theorem root174_pos : 0 < (S 174).lo.toRat := by
  rw [S_eq_root174]
  exact OriginalRow227TriangleRoots05.root174_pos

theorem product174_pos : 0 < (roundedMul (-768) shift (S 174)).lo.toRat := by
  rw [S_eq_root174]
  exact OriginalRow227TriangleRoots05.product174_pos

theorem S_eq_root175 : S 175 = OriginalRow227TriangleRoots05.root175 := rfl

theorem root175_checked : sqrtCheck 175 (S 175) = true := by
  rw [S_eq_root175]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨14, by decide⟩

theorem root175_pos : 0 < (S 175).lo.toRat := by
  rw [S_eq_root175]
  exact OriginalRow227TriangleRoots05.root175_pos

theorem product175_pos : 0 < (roundedMul (-768) shift (S 175)).lo.toRat := by
  rw [S_eq_root175]
  exact OriginalRow227TriangleRoots05.product175_pos

theorem S_eq_root176 : S 176 = OriginalRow227TriangleRoots05.root176 := rfl

theorem root176_checked : sqrtCheck 176 (S 176) = true := by
  rw [S_eq_root176]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨15, by decide⟩

theorem root176_pos : 0 < (S 176).lo.toRat := by
  rw [S_eq_root176]
  exact OriginalRow227TriangleRoots05.root176_pos

theorem product176_pos : 0 < (roundedMul (-768) shift (S 176)).lo.toRat := by
  rw [S_eq_root176]
  exact OriginalRow227TriangleRoots05.product176_pos

theorem S_eq_root177 : S 177 = OriginalRow227TriangleRoots05.root177 := rfl

theorem root177_checked : sqrtCheck 177 (S 177) = true := by
  rw [S_eq_root177]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨16, by decide⟩

theorem root177_pos : 0 < (S 177).lo.toRat := by
  rw [S_eq_root177]
  exact OriginalRow227TriangleRoots05.root177_pos

theorem product177_pos : 0 < (roundedMul (-768) shift (S 177)).lo.toRat := by
  rw [S_eq_root177]
  exact OriginalRow227TriangleRoots05.product177_pos

theorem S_eq_root178 : S 178 = OriginalRow227TriangleRoots05.root178 := rfl

theorem root178_checked : sqrtCheck 178 (S 178) = true := by
  rw [S_eq_root178]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨17, by decide⟩

theorem root178_pos : 0 < (S 178).lo.toRat := by
  rw [S_eq_root178]
  exact OriginalRow227TriangleRoots05.root178_pos

theorem product178_pos : 0 < (roundedMul (-768) shift (S 178)).lo.toRat := by
  rw [S_eq_root178]
  exact OriginalRow227TriangleRoots05.product178_pos

theorem S_eq_root179 : S 179 = OriginalRow227TriangleRoots05.root179 := rfl

theorem root179_checked : sqrtCheck 179 (S 179) = true := by
  rw [S_eq_root179]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨18, by decide⟩

theorem root179_pos : 0 < (S 179).lo.toRat := by
  rw [S_eq_root179]
  exact OriginalRow227TriangleRoots05.root179_pos

theorem product179_pos : 0 < (roundedMul (-768) shift (S 179)).lo.toRat := by
  rw [S_eq_root179]
  exact OriginalRow227TriangleRoots05.product179_pos

theorem S_eq_root180 : S 180 = OriginalRow227TriangleRoots05.root180 := rfl

theorem root180_checked : sqrtCheck 180 (S 180) = true := by
  rw [S_eq_root180]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨19, by decide⟩

theorem root180_pos : 0 < (S 180).lo.toRat := by
  rw [S_eq_root180]
  exact OriginalRow227TriangleRoots05.root180_pos

theorem product180_pos : 0 < (roundedMul (-768) shift (S 180)).lo.toRat := by
  rw [S_eq_root180]
  exact OriginalRow227TriangleRoots05.product180_pos

theorem S_eq_root181 : S 181 = OriginalRow227TriangleRoots05.root181 := rfl

theorem root181_checked : sqrtCheck 181 (S 181) = true := by
  rw [S_eq_root181]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨20, by decide⟩

theorem root181_pos : 0 < (S 181).lo.toRat := by
  rw [S_eq_root181]
  exact OriginalRow227TriangleRoots05.root181_pos

theorem product181_pos : 0 < (roundedMul (-768) shift (S 181)).lo.toRat := by
  rw [S_eq_root181]
  exact OriginalRow227TriangleRoots05.product181_pos

theorem S_eq_root182 : S 182 = OriginalRow227TriangleRoots05.root182 := rfl

theorem root182_checked : sqrtCheck 182 (S 182) = true := by
  rw [S_eq_root182]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨21, by decide⟩

theorem root182_pos : 0 < (S 182).lo.toRat := by
  rw [S_eq_root182]
  exact OriginalRow227TriangleRoots05.root182_pos

theorem product182_pos : 0 < (roundedMul (-768) shift (S 182)).lo.toRat := by
  rw [S_eq_root182]
  exact OriginalRow227TriangleRoots05.product182_pos

theorem S_eq_root183 : S 183 = OriginalRow227TriangleRoots05.root183 := rfl

theorem root183_checked : sqrtCheck 183 (S 183) = true := by
  rw [S_eq_root183]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨22, by decide⟩

theorem root183_pos : 0 < (S 183).lo.toRat := by
  rw [S_eq_root183]
  exact OriginalRow227TriangleRoots05.root183_pos

theorem product183_pos : 0 < (roundedMul (-768) shift (S 183)).lo.toRat := by
  rw [S_eq_root183]
  exact OriginalRow227TriangleRoots05.product183_pos

theorem S_eq_root184 : S 184 = OriginalRow227TriangleRoots05.root184 := rfl

theorem root184_checked : sqrtCheck 184 (S 184) = true := by
  rw [S_eq_root184]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨23, by decide⟩

theorem root184_pos : 0 < (S 184).lo.toRat := by
  rw [S_eq_root184]
  exact OriginalRow227TriangleRoots05.root184_pos

theorem product184_pos : 0 < (roundedMul (-768) shift (S 184)).lo.toRat := by
  rw [S_eq_root184]
  exact OriginalRow227TriangleRoots05.product184_pos

theorem S_eq_root185 : S 185 = OriginalRow227TriangleRoots05.root185 := rfl

theorem root185_checked : sqrtCheck 185 (S 185) = true := by
  rw [S_eq_root185]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨24, by decide⟩

theorem root185_pos : 0 < (S 185).lo.toRat := by
  rw [S_eq_root185]
  exact OriginalRow227TriangleRoots05.root185_pos

theorem product185_pos : 0 < (roundedMul (-768) shift (S 185)).lo.toRat := by
  rw [S_eq_root185]
  exact OriginalRow227TriangleRoots05.product185_pos

theorem S_eq_root186 : S 186 = OriginalRow227TriangleRoots05.root186 := rfl

theorem root186_checked : sqrtCheck 186 (S 186) = true := by
  rw [S_eq_root186]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨25, by decide⟩

theorem root186_pos : 0 < (S 186).lo.toRat := by
  rw [S_eq_root186]
  exact OriginalRow227TriangleRoots05.root186_pos

theorem product186_pos : 0 < (roundedMul (-768) shift (S 186)).lo.toRat := by
  rw [S_eq_root186]
  exact OriginalRow227TriangleRoots05.product186_pos

theorem S_eq_root187 : S 187 = OriginalRow227TriangleRoots05.root187 := rfl

theorem root187_checked : sqrtCheck 187 (S 187) = true := by
  rw [S_eq_root187]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨26, by decide⟩

theorem root187_pos : 0 < (S 187).lo.toRat := by
  rw [S_eq_root187]
  exact OriginalRow227TriangleRoots05.root187_pos

theorem product187_pos : 0 < (roundedMul (-768) shift (S 187)).lo.toRat := by
  rw [S_eq_root187]
  exact OriginalRow227TriangleRoots05.product187_pos

theorem S_eq_root188 : S 188 = OriginalRow227TriangleRoots05.root188 := rfl

theorem root188_checked : sqrtCheck 188 (S 188) = true := by
  rw [S_eq_root188]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨27, by decide⟩

theorem root188_pos : 0 < (S 188).lo.toRat := by
  rw [S_eq_root188]
  exact OriginalRow227TriangleRoots05.root188_pos

theorem product188_pos : 0 < (roundedMul (-768) shift (S 188)).lo.toRat := by
  rw [S_eq_root188]
  exact OriginalRow227TriangleRoots05.product188_pos

theorem S_eq_root189 : S 189 = OriginalRow227TriangleRoots05.root189 := rfl

theorem root189_checked : sqrtCheck 189 (S 189) = true := by
  rw [S_eq_root189]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨28, by decide⟩

theorem root189_pos : 0 < (S 189).lo.toRat := by
  rw [S_eq_root189]
  exact OriginalRow227TriangleRoots05.root189_pos

theorem product189_pos : 0 < (roundedMul (-768) shift (S 189)).lo.toRat := by
  rw [S_eq_root189]
  exact OriginalRow227TriangleRoots05.product189_pos

theorem S_eq_root190 : S 190 = OriginalRow227TriangleRoots05.root190 := rfl

theorem root190_checked : sqrtCheck 190 (S 190) = true := by
  rw [S_eq_root190]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨29, by decide⟩

theorem root190_pos : 0 < (S 190).lo.toRat := by
  rw [S_eq_root190]
  exact OriginalRow227TriangleRoots05.root190_pos

theorem product190_pos : 0 < (roundedMul (-768) shift (S 190)).lo.toRat := by
  rw [S_eq_root190]
  exact OriginalRow227TriangleRoots05.product190_pos

theorem S_eq_root191 : S 191 = OriginalRow227TriangleRoots05.root191 := rfl

theorem root191_checked : sqrtCheck 191 (S 191) = true := by
  rw [S_eq_root191]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨30, by decide⟩

theorem root191_pos : 0 < (S 191).lo.toRat := by
  rw [S_eq_root191]
  exact OriginalRow227TriangleRoots05.root191_pos

theorem product191_pos : 0 < (roundedMul (-768) shift (S 191)).lo.toRat := by
  rw [S_eq_root191]
  exact OriginalRow227TriangleRoots05.product191_pos

theorem S_eq_root192 : S 192 = OriginalRow227TriangleRoots05.root192 := rfl

theorem root192_checked : sqrtCheck 192 (S 192) = true := by
  rw [S_eq_root192]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots05.entries OriginalRow227TriangleRoots05.checked ⟨31, by decide⟩

theorem root192_pos : 0 < (S 192).lo.toRat := by
  rw [S_eq_root192]
  exact OriginalRow227TriangleRoots05.root192_pos

theorem product192_pos : 0 < (roundedMul (-768) shift (S 192)).lo.toRat := by
  rw [S_eq_root192]
  exact OriginalRow227TriangleRoots05.product192_pos

end Grothe.UpperChaos.OriginalRow227RootBindings05

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root161) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root161_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root161_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product161_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root162) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root162_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root162_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product162_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root163) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root163_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root163_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product163_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root164) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root164_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root164_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product164_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root165) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root165_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root165_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product165_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root166) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root166_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root166_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product166_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root167) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root167_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root167_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product167_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root168) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root168_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root168_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product168_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root169) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root169_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root169_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product169_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root170) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root170_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root170_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product170_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root171) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root171_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root171_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product171_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root172) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root172_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root172_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product172_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root173) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root173_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root173_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product173_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root174) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root174_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root174_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product174_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root175) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root175_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root175_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product175_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root176) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root176_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root176_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product176_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root177) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root177_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root177_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product177_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root178) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root178_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root178_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product178_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root179) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root179_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root179_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product179_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root180) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root180_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root180_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product180_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root181) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root181_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root181_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product181_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root182) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root182_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root182_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product182_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root183) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root183_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root183_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product183_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root184) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root184_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root184_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product184_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root185) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root185_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root185_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product185_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root186) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root186_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root186_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product186_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root187) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root187_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root187_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product187_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root188) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root188_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root188_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product188_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root189) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root189_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root189_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product189_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root190) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root190_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root190_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product190_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root191) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root191_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root191_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product191_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.S_eq_root192) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root192_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.root192_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings05.product192_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
