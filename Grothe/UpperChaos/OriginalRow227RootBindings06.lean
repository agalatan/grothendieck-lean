import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings06
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root193 : S 193 = OriginalRow227TriangleRoots06.root193 := rfl

theorem root193_checked : sqrtCheck 193 (S 193) = true := by
  rw [S_eq_root193]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨0, by decide⟩

theorem root193_pos : 0 < (S 193).lo.toRat := by
  rw [S_eq_root193]
  exact OriginalRow227TriangleRoots06.root193_pos

theorem product193_pos : 0 < (roundedMul (-768) shift (S 193)).lo.toRat := by
  rw [S_eq_root193]
  exact OriginalRow227TriangleRoots06.product193_pos

theorem S_eq_root194 : S 194 = OriginalRow227TriangleRoots06.root194 := rfl

theorem root194_checked : sqrtCheck 194 (S 194) = true := by
  rw [S_eq_root194]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨1, by decide⟩

theorem root194_pos : 0 < (S 194).lo.toRat := by
  rw [S_eq_root194]
  exact OriginalRow227TriangleRoots06.root194_pos

theorem product194_pos : 0 < (roundedMul (-768) shift (S 194)).lo.toRat := by
  rw [S_eq_root194]
  exact OriginalRow227TriangleRoots06.product194_pos

theorem S_eq_root195 : S 195 = OriginalRow227TriangleRoots06.root195 := rfl

theorem root195_checked : sqrtCheck 195 (S 195) = true := by
  rw [S_eq_root195]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨2, by decide⟩

theorem root195_pos : 0 < (S 195).lo.toRat := by
  rw [S_eq_root195]
  exact OriginalRow227TriangleRoots06.root195_pos

theorem product195_pos : 0 < (roundedMul (-768) shift (S 195)).lo.toRat := by
  rw [S_eq_root195]
  exact OriginalRow227TriangleRoots06.product195_pos

theorem S_eq_root196 : S 196 = OriginalRow227TriangleRoots06.root196 := rfl

theorem root196_checked : sqrtCheck 196 (S 196) = true := by
  rw [S_eq_root196]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨3, by decide⟩

theorem root196_pos : 0 < (S 196).lo.toRat := by
  rw [S_eq_root196]
  exact OriginalRow227TriangleRoots06.root196_pos

theorem product196_pos : 0 < (roundedMul (-768) shift (S 196)).lo.toRat := by
  rw [S_eq_root196]
  exact OriginalRow227TriangleRoots06.product196_pos

theorem S_eq_root197 : S 197 = OriginalRow227TriangleRoots06.root197 := rfl

theorem root197_checked : sqrtCheck 197 (S 197) = true := by
  rw [S_eq_root197]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨4, by decide⟩

theorem root197_pos : 0 < (S 197).lo.toRat := by
  rw [S_eq_root197]
  exact OriginalRow227TriangleRoots06.root197_pos

theorem product197_pos : 0 < (roundedMul (-768) shift (S 197)).lo.toRat := by
  rw [S_eq_root197]
  exact OriginalRow227TriangleRoots06.product197_pos

theorem S_eq_root198 : S 198 = OriginalRow227TriangleRoots06.root198 := rfl

theorem root198_checked : sqrtCheck 198 (S 198) = true := by
  rw [S_eq_root198]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨5, by decide⟩

theorem root198_pos : 0 < (S 198).lo.toRat := by
  rw [S_eq_root198]
  exact OriginalRow227TriangleRoots06.root198_pos

theorem product198_pos : 0 < (roundedMul (-768) shift (S 198)).lo.toRat := by
  rw [S_eq_root198]
  exact OriginalRow227TriangleRoots06.product198_pos

theorem S_eq_root199 : S 199 = OriginalRow227TriangleRoots06.root199 := rfl

theorem root199_checked : sqrtCheck 199 (S 199) = true := by
  rw [S_eq_root199]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨6, by decide⟩

theorem root199_pos : 0 < (S 199).lo.toRat := by
  rw [S_eq_root199]
  exact OriginalRow227TriangleRoots06.root199_pos

theorem product199_pos : 0 < (roundedMul (-768) shift (S 199)).lo.toRat := by
  rw [S_eq_root199]
  exact OriginalRow227TriangleRoots06.product199_pos

theorem S_eq_root200 : S 200 = OriginalRow227TriangleRoots06.root200 := rfl

theorem root200_checked : sqrtCheck 200 (S 200) = true := by
  rw [S_eq_root200]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨7, by decide⟩

theorem root200_pos : 0 < (S 200).lo.toRat := by
  rw [S_eq_root200]
  exact OriginalRow227TriangleRoots06.root200_pos

theorem product200_pos : 0 < (roundedMul (-768) shift (S 200)).lo.toRat := by
  rw [S_eq_root200]
  exact OriginalRow227TriangleRoots06.product200_pos

theorem S_eq_root201 : S 201 = OriginalRow227TriangleRoots06.root201 := rfl

theorem root201_checked : sqrtCheck 201 (S 201) = true := by
  rw [S_eq_root201]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨8, by decide⟩

theorem root201_pos : 0 < (S 201).lo.toRat := by
  rw [S_eq_root201]
  exact OriginalRow227TriangleRoots06.root201_pos

theorem product201_pos : 0 < (roundedMul (-768) shift (S 201)).lo.toRat := by
  rw [S_eq_root201]
  exact OriginalRow227TriangleRoots06.product201_pos

theorem S_eq_root202 : S 202 = OriginalRow227TriangleRoots06.root202 := rfl

theorem root202_checked : sqrtCheck 202 (S 202) = true := by
  rw [S_eq_root202]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨9, by decide⟩

theorem root202_pos : 0 < (S 202).lo.toRat := by
  rw [S_eq_root202]
  exact OriginalRow227TriangleRoots06.root202_pos

theorem product202_pos : 0 < (roundedMul (-768) shift (S 202)).lo.toRat := by
  rw [S_eq_root202]
  exact OriginalRow227TriangleRoots06.product202_pos

theorem S_eq_root203 : S 203 = OriginalRow227TriangleRoots06.root203 := rfl

theorem root203_checked : sqrtCheck 203 (S 203) = true := by
  rw [S_eq_root203]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨10, by decide⟩

theorem root203_pos : 0 < (S 203).lo.toRat := by
  rw [S_eq_root203]
  exact OriginalRow227TriangleRoots06.root203_pos

theorem product203_pos : 0 < (roundedMul (-768) shift (S 203)).lo.toRat := by
  rw [S_eq_root203]
  exact OriginalRow227TriangleRoots06.product203_pos

theorem S_eq_root204 : S 204 = OriginalRow227TriangleRoots06.root204 := rfl

theorem root204_checked : sqrtCheck 204 (S 204) = true := by
  rw [S_eq_root204]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨11, by decide⟩

theorem root204_pos : 0 < (S 204).lo.toRat := by
  rw [S_eq_root204]
  exact OriginalRow227TriangleRoots06.root204_pos

theorem product204_pos : 0 < (roundedMul (-768) shift (S 204)).lo.toRat := by
  rw [S_eq_root204]
  exact OriginalRow227TriangleRoots06.product204_pos

theorem S_eq_root205 : S 205 = OriginalRow227TriangleRoots06.root205 := rfl

theorem root205_checked : sqrtCheck 205 (S 205) = true := by
  rw [S_eq_root205]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨12, by decide⟩

theorem root205_pos : 0 < (S 205).lo.toRat := by
  rw [S_eq_root205]
  exact OriginalRow227TriangleRoots06.root205_pos

theorem product205_pos : 0 < (roundedMul (-768) shift (S 205)).lo.toRat := by
  rw [S_eq_root205]
  exact OriginalRow227TriangleRoots06.product205_pos

theorem S_eq_root206 : S 206 = OriginalRow227TriangleRoots06.root206 := rfl

theorem root206_checked : sqrtCheck 206 (S 206) = true := by
  rw [S_eq_root206]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨13, by decide⟩

theorem root206_pos : 0 < (S 206).lo.toRat := by
  rw [S_eq_root206]
  exact OriginalRow227TriangleRoots06.root206_pos

theorem product206_pos : 0 < (roundedMul (-768) shift (S 206)).lo.toRat := by
  rw [S_eq_root206]
  exact OriginalRow227TriangleRoots06.product206_pos

theorem S_eq_root207 : S 207 = OriginalRow227TriangleRoots06.root207 := rfl

theorem root207_checked : sqrtCheck 207 (S 207) = true := by
  rw [S_eq_root207]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨14, by decide⟩

theorem root207_pos : 0 < (S 207).lo.toRat := by
  rw [S_eq_root207]
  exact OriginalRow227TriangleRoots06.root207_pos

theorem product207_pos : 0 < (roundedMul (-768) shift (S 207)).lo.toRat := by
  rw [S_eq_root207]
  exact OriginalRow227TriangleRoots06.product207_pos

theorem S_eq_root208 : S 208 = OriginalRow227TriangleRoots06.root208 := rfl

theorem root208_checked : sqrtCheck 208 (S 208) = true := by
  rw [S_eq_root208]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨15, by decide⟩

theorem root208_pos : 0 < (S 208).lo.toRat := by
  rw [S_eq_root208]
  exact OriginalRow227TriangleRoots06.root208_pos

theorem product208_pos : 0 < (roundedMul (-768) shift (S 208)).lo.toRat := by
  rw [S_eq_root208]
  exact OriginalRow227TriangleRoots06.product208_pos

theorem S_eq_root209 : S 209 = OriginalRow227TriangleRoots06.root209 := rfl

theorem root209_checked : sqrtCheck 209 (S 209) = true := by
  rw [S_eq_root209]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨16, by decide⟩

theorem root209_pos : 0 < (S 209).lo.toRat := by
  rw [S_eq_root209]
  exact OriginalRow227TriangleRoots06.root209_pos

theorem product209_pos : 0 < (roundedMul (-768) shift (S 209)).lo.toRat := by
  rw [S_eq_root209]
  exact OriginalRow227TriangleRoots06.product209_pos

theorem S_eq_root210 : S 210 = OriginalRow227TriangleRoots06.root210 := rfl

theorem root210_checked : sqrtCheck 210 (S 210) = true := by
  rw [S_eq_root210]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨17, by decide⟩

theorem root210_pos : 0 < (S 210).lo.toRat := by
  rw [S_eq_root210]
  exact OriginalRow227TriangleRoots06.root210_pos

theorem product210_pos : 0 < (roundedMul (-768) shift (S 210)).lo.toRat := by
  rw [S_eq_root210]
  exact OriginalRow227TriangleRoots06.product210_pos

theorem S_eq_root211 : S 211 = OriginalRow227TriangleRoots06.root211 := rfl

theorem root211_checked : sqrtCheck 211 (S 211) = true := by
  rw [S_eq_root211]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨18, by decide⟩

theorem root211_pos : 0 < (S 211).lo.toRat := by
  rw [S_eq_root211]
  exact OriginalRow227TriangleRoots06.root211_pos

theorem product211_pos : 0 < (roundedMul (-768) shift (S 211)).lo.toRat := by
  rw [S_eq_root211]
  exact OriginalRow227TriangleRoots06.product211_pos

theorem S_eq_root212 : S 212 = OriginalRow227TriangleRoots06.root212 := rfl

theorem root212_checked : sqrtCheck 212 (S 212) = true := by
  rw [S_eq_root212]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨19, by decide⟩

theorem root212_pos : 0 < (S 212).lo.toRat := by
  rw [S_eq_root212]
  exact OriginalRow227TriangleRoots06.root212_pos

theorem product212_pos : 0 < (roundedMul (-768) shift (S 212)).lo.toRat := by
  rw [S_eq_root212]
  exact OriginalRow227TriangleRoots06.product212_pos

theorem S_eq_root213 : S 213 = OriginalRow227TriangleRoots06.root213 := rfl

theorem root213_checked : sqrtCheck 213 (S 213) = true := by
  rw [S_eq_root213]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨20, by decide⟩

theorem root213_pos : 0 < (S 213).lo.toRat := by
  rw [S_eq_root213]
  exact OriginalRow227TriangleRoots06.root213_pos

theorem product213_pos : 0 < (roundedMul (-768) shift (S 213)).lo.toRat := by
  rw [S_eq_root213]
  exact OriginalRow227TriangleRoots06.product213_pos

theorem S_eq_root214 : S 214 = OriginalRow227TriangleRoots06.root214 := rfl

theorem root214_checked : sqrtCheck 214 (S 214) = true := by
  rw [S_eq_root214]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨21, by decide⟩

theorem root214_pos : 0 < (S 214).lo.toRat := by
  rw [S_eq_root214]
  exact OriginalRow227TriangleRoots06.root214_pos

theorem product214_pos : 0 < (roundedMul (-768) shift (S 214)).lo.toRat := by
  rw [S_eq_root214]
  exact OriginalRow227TriangleRoots06.product214_pos

theorem S_eq_root215 : S 215 = OriginalRow227TriangleRoots06.root215 := rfl

theorem root215_checked : sqrtCheck 215 (S 215) = true := by
  rw [S_eq_root215]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨22, by decide⟩

theorem root215_pos : 0 < (S 215).lo.toRat := by
  rw [S_eq_root215]
  exact OriginalRow227TriangleRoots06.root215_pos

theorem product215_pos : 0 < (roundedMul (-768) shift (S 215)).lo.toRat := by
  rw [S_eq_root215]
  exact OriginalRow227TriangleRoots06.product215_pos

theorem S_eq_root216 : S 216 = OriginalRow227TriangleRoots06.root216 := rfl

theorem root216_checked : sqrtCheck 216 (S 216) = true := by
  rw [S_eq_root216]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨23, by decide⟩

theorem root216_pos : 0 < (S 216).lo.toRat := by
  rw [S_eq_root216]
  exact OriginalRow227TriangleRoots06.root216_pos

theorem product216_pos : 0 < (roundedMul (-768) shift (S 216)).lo.toRat := by
  rw [S_eq_root216]
  exact OriginalRow227TriangleRoots06.product216_pos

theorem S_eq_root217 : S 217 = OriginalRow227TriangleRoots06.root217 := rfl

theorem root217_checked : sqrtCheck 217 (S 217) = true := by
  rw [S_eq_root217]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨24, by decide⟩

theorem root217_pos : 0 < (S 217).lo.toRat := by
  rw [S_eq_root217]
  exact OriginalRow227TriangleRoots06.root217_pos

theorem product217_pos : 0 < (roundedMul (-768) shift (S 217)).lo.toRat := by
  rw [S_eq_root217]
  exact OriginalRow227TriangleRoots06.product217_pos

theorem S_eq_root218 : S 218 = OriginalRow227TriangleRoots06.root218 := rfl

theorem root218_checked : sqrtCheck 218 (S 218) = true := by
  rw [S_eq_root218]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨25, by decide⟩

theorem root218_pos : 0 < (S 218).lo.toRat := by
  rw [S_eq_root218]
  exact OriginalRow227TriangleRoots06.root218_pos

theorem product218_pos : 0 < (roundedMul (-768) shift (S 218)).lo.toRat := by
  rw [S_eq_root218]
  exact OriginalRow227TriangleRoots06.product218_pos

theorem S_eq_root219 : S 219 = OriginalRow227TriangleRoots06.root219 := rfl

theorem root219_checked : sqrtCheck 219 (S 219) = true := by
  rw [S_eq_root219]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨26, by decide⟩

theorem root219_pos : 0 < (S 219).lo.toRat := by
  rw [S_eq_root219]
  exact OriginalRow227TriangleRoots06.root219_pos

theorem product219_pos : 0 < (roundedMul (-768) shift (S 219)).lo.toRat := by
  rw [S_eq_root219]
  exact OriginalRow227TriangleRoots06.product219_pos

theorem S_eq_root220 : S 220 = OriginalRow227TriangleRoots06.root220 := rfl

theorem root220_checked : sqrtCheck 220 (S 220) = true := by
  rw [S_eq_root220]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨27, by decide⟩

theorem root220_pos : 0 < (S 220).lo.toRat := by
  rw [S_eq_root220]
  exact OriginalRow227TriangleRoots06.root220_pos

theorem product220_pos : 0 < (roundedMul (-768) shift (S 220)).lo.toRat := by
  rw [S_eq_root220]
  exact OriginalRow227TriangleRoots06.product220_pos

theorem S_eq_root221 : S 221 = OriginalRow227TriangleRoots06.root221 := rfl

theorem root221_checked : sqrtCheck 221 (S 221) = true := by
  rw [S_eq_root221]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨28, by decide⟩

theorem root221_pos : 0 < (S 221).lo.toRat := by
  rw [S_eq_root221]
  exact OriginalRow227TriangleRoots06.root221_pos

theorem product221_pos : 0 < (roundedMul (-768) shift (S 221)).lo.toRat := by
  rw [S_eq_root221]
  exact OriginalRow227TriangleRoots06.product221_pos

theorem S_eq_root222 : S 222 = OriginalRow227TriangleRoots06.root222 := rfl

theorem root222_checked : sqrtCheck 222 (S 222) = true := by
  rw [S_eq_root222]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨29, by decide⟩

theorem root222_pos : 0 < (S 222).lo.toRat := by
  rw [S_eq_root222]
  exact OriginalRow227TriangleRoots06.root222_pos

theorem product222_pos : 0 < (roundedMul (-768) shift (S 222)).lo.toRat := by
  rw [S_eq_root222]
  exact OriginalRow227TriangleRoots06.product222_pos

theorem S_eq_root223 : S 223 = OriginalRow227TriangleRoots06.root223 := rfl

theorem root223_checked : sqrtCheck 223 (S 223) = true := by
  rw [S_eq_root223]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨30, by decide⟩

theorem root223_pos : 0 < (S 223).lo.toRat := by
  rw [S_eq_root223]
  exact OriginalRow227TriangleRoots06.root223_pos

theorem product223_pos : 0 < (roundedMul (-768) shift (S 223)).lo.toRat := by
  rw [S_eq_root223]
  exact OriginalRow227TriangleRoots06.product223_pos

theorem S_eq_root224 : S 224 = OriginalRow227TriangleRoots06.root224 := rfl

theorem root224_checked : sqrtCheck 224 (S 224) = true := by
  rw [S_eq_root224]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots06.entries OriginalRow227TriangleRoots06.checked ⟨31, by decide⟩

theorem root224_pos : 0 < (S 224).lo.toRat := by
  rw [S_eq_root224]
  exact OriginalRow227TriangleRoots06.root224_pos

theorem product224_pos : 0 < (roundedMul (-768) shift (S 224)).lo.toRat := by
  rw [S_eq_root224]
  exact OriginalRow227TriangleRoots06.product224_pos

end Grothe.UpperChaos.OriginalRow227RootBindings06

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root193) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root193_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root193_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product193_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root194) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root194_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root194_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product194_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root195) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root195_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root195_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product195_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root196) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root196_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root196_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product196_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root197) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root197_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root197_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product197_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root198) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root198_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root198_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product198_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root199) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root199_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root199_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product199_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root200) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root200_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root200_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product200_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root201) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root201_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root201_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product201_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root202) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root202_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root202_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product202_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root203) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root203_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root203_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product203_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root204) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root204_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root204_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product204_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root205) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root205_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root205_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product205_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root206) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root206_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root206_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product206_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root207) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root207_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root207_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product207_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root208) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root208_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root208_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product208_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root209) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root209_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root209_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product209_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root210) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root210_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root210_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product210_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root211) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root211_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root211_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product211_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root212) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root212_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root212_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product212_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root213) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root213_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root213_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product213_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root214) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root214_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root214_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product214_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root215) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root215_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root215_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product215_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root216) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root216_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root216_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product216_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root217) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root217_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root217_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product217_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root218) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root218_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root218_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product218_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root219) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root219_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root219_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product219_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root220) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root220_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root220_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product220_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root221) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root221_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root221_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product221_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root222) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root222_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root222_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product222_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root223) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root223_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root223_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product223_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.S_eq_root224) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root224_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.root224_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings06.product224_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
