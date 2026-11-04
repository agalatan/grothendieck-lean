import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings07
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root225 : S 225 = OriginalRow227TriangleRoots07.root225 := rfl

theorem root225_checked : sqrtCheck 225 (S 225) = true := by
  rw [S_eq_root225]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨0, by decide⟩

theorem root225_pos : 0 < (S 225).lo.toRat := by
  rw [S_eq_root225]
  exact OriginalRow227TriangleRoots07.root225_pos

theorem product225_pos : 0 < (roundedMul (-768) shift (S 225)).lo.toRat := by
  rw [S_eq_root225]
  exact OriginalRow227TriangleRoots07.product225_pos

theorem S_eq_root226 : S 226 = OriginalRow227TriangleRoots07.root226 := rfl

theorem root226_checked : sqrtCheck 226 (S 226) = true := by
  rw [S_eq_root226]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨1, by decide⟩

theorem root226_pos : 0 < (S 226).lo.toRat := by
  rw [S_eq_root226]
  exact OriginalRow227TriangleRoots07.root226_pos

theorem product226_pos : 0 < (roundedMul (-768) shift (S 226)).lo.toRat := by
  rw [S_eq_root226]
  exact OriginalRow227TriangleRoots07.product226_pos

theorem S_eq_root227 : S 227 = OriginalRow227TriangleRoots07.root227 := rfl

theorem root227_checked : sqrtCheck 227 (S 227) = true := by
  rw [S_eq_root227]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨2, by decide⟩

theorem root227_pos : 0 < (S 227).lo.toRat := by
  rw [S_eq_root227]
  exact OriginalRow227TriangleRoots07.root227_pos

theorem product227_pos : 0 < (roundedMul (-768) shift (S 227)).lo.toRat := by
  rw [S_eq_root227]
  exact OriginalRow227TriangleRoots07.product227_pos

theorem S_eq_root228 : S 228 = OriginalRow227TriangleRoots07.root228 := rfl

theorem root228_checked : sqrtCheck 228 (S 228) = true := by
  rw [S_eq_root228]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨3, by decide⟩

theorem root228_pos : 0 < (S 228).lo.toRat := by
  rw [S_eq_root228]
  exact OriginalRow227TriangleRoots07.root228_pos

theorem product228_pos : 0 < (roundedMul (-768) shift (S 228)).lo.toRat := by
  rw [S_eq_root228]
  exact OriginalRow227TriangleRoots07.product228_pos

theorem S_eq_root229 : S 229 = OriginalRow227TriangleRoots07.root229 := rfl

theorem root229_checked : sqrtCheck 229 (S 229) = true := by
  rw [S_eq_root229]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨4, by decide⟩

theorem root229_pos : 0 < (S 229).lo.toRat := by
  rw [S_eq_root229]
  exact OriginalRow227TriangleRoots07.root229_pos

theorem product229_pos : 0 < (roundedMul (-768) shift (S 229)).lo.toRat := by
  rw [S_eq_root229]
  exact OriginalRow227TriangleRoots07.product229_pos

theorem S_eq_root230 : S 230 = OriginalRow227TriangleRoots07.root230 := rfl

theorem root230_checked : sqrtCheck 230 (S 230) = true := by
  rw [S_eq_root230]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨5, by decide⟩

theorem root230_pos : 0 < (S 230).lo.toRat := by
  rw [S_eq_root230]
  exact OriginalRow227TriangleRoots07.root230_pos

theorem product230_pos : 0 < (roundedMul (-768) shift (S 230)).lo.toRat := by
  rw [S_eq_root230]
  exact OriginalRow227TriangleRoots07.product230_pos

theorem S_eq_root231 : S 231 = OriginalRow227TriangleRoots07.root231 := rfl

theorem root231_checked : sqrtCheck 231 (S 231) = true := by
  rw [S_eq_root231]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨6, by decide⟩

theorem root231_pos : 0 < (S 231).lo.toRat := by
  rw [S_eq_root231]
  exact OriginalRow227TriangleRoots07.root231_pos

theorem product231_pos : 0 < (roundedMul (-768) shift (S 231)).lo.toRat := by
  rw [S_eq_root231]
  exact OriginalRow227TriangleRoots07.product231_pos

theorem S_eq_root232 : S 232 = OriginalRow227TriangleRoots07.root232 := rfl

theorem root232_checked : sqrtCheck 232 (S 232) = true := by
  rw [S_eq_root232]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨7, by decide⟩

theorem root232_pos : 0 < (S 232).lo.toRat := by
  rw [S_eq_root232]
  exact OriginalRow227TriangleRoots07.root232_pos

theorem product232_pos : 0 < (roundedMul (-768) shift (S 232)).lo.toRat := by
  rw [S_eq_root232]
  exact OriginalRow227TriangleRoots07.product232_pos

theorem S_eq_root233 : S 233 = OriginalRow227TriangleRoots07.root233 := rfl

theorem root233_checked : sqrtCheck 233 (S 233) = true := by
  rw [S_eq_root233]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨8, by decide⟩

theorem root233_pos : 0 < (S 233).lo.toRat := by
  rw [S_eq_root233]
  exact OriginalRow227TriangleRoots07.root233_pos

theorem product233_pos : 0 < (roundedMul (-768) shift (S 233)).lo.toRat := by
  rw [S_eq_root233]
  exact OriginalRow227TriangleRoots07.product233_pos

theorem S_eq_root234 : S 234 = OriginalRow227TriangleRoots07.root234 := rfl

theorem root234_checked : sqrtCheck 234 (S 234) = true := by
  rw [S_eq_root234]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨9, by decide⟩

theorem root234_pos : 0 < (S 234).lo.toRat := by
  rw [S_eq_root234]
  exact OriginalRow227TriangleRoots07.root234_pos

theorem product234_pos : 0 < (roundedMul (-768) shift (S 234)).lo.toRat := by
  rw [S_eq_root234]
  exact OriginalRow227TriangleRoots07.product234_pos

theorem S_eq_root235 : S 235 = OriginalRow227TriangleRoots07.root235 := rfl

theorem root235_checked : sqrtCheck 235 (S 235) = true := by
  rw [S_eq_root235]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨10, by decide⟩

theorem root235_pos : 0 < (S 235).lo.toRat := by
  rw [S_eq_root235]
  exact OriginalRow227TriangleRoots07.root235_pos

theorem product235_pos : 0 < (roundedMul (-768) shift (S 235)).lo.toRat := by
  rw [S_eq_root235]
  exact OriginalRow227TriangleRoots07.product235_pos

theorem S_eq_root236 : S 236 = OriginalRow227TriangleRoots07.root236 := rfl

theorem root236_checked : sqrtCheck 236 (S 236) = true := by
  rw [S_eq_root236]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨11, by decide⟩

theorem root236_pos : 0 < (S 236).lo.toRat := by
  rw [S_eq_root236]
  exact OriginalRow227TriangleRoots07.root236_pos

theorem product236_pos : 0 < (roundedMul (-768) shift (S 236)).lo.toRat := by
  rw [S_eq_root236]
  exact OriginalRow227TriangleRoots07.product236_pos

theorem S_eq_root237 : S 237 = OriginalRow227TriangleRoots07.root237 := rfl

theorem root237_checked : sqrtCheck 237 (S 237) = true := by
  rw [S_eq_root237]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨12, by decide⟩

theorem root237_pos : 0 < (S 237).lo.toRat := by
  rw [S_eq_root237]
  exact OriginalRow227TriangleRoots07.root237_pos

theorem product237_pos : 0 < (roundedMul (-768) shift (S 237)).lo.toRat := by
  rw [S_eq_root237]
  exact OriginalRow227TriangleRoots07.product237_pos

theorem S_eq_root238 : S 238 = OriginalRow227TriangleRoots07.root238 := rfl

theorem root238_checked : sqrtCheck 238 (S 238) = true := by
  rw [S_eq_root238]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨13, by decide⟩

theorem root238_pos : 0 < (S 238).lo.toRat := by
  rw [S_eq_root238]
  exact OriginalRow227TriangleRoots07.root238_pos

theorem product238_pos : 0 < (roundedMul (-768) shift (S 238)).lo.toRat := by
  rw [S_eq_root238]
  exact OriginalRow227TriangleRoots07.product238_pos

theorem S_eq_root239 : S 239 = OriginalRow227TriangleRoots07.root239 := rfl

theorem root239_checked : sqrtCheck 239 (S 239) = true := by
  rw [S_eq_root239]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨14, by decide⟩

theorem root239_pos : 0 < (S 239).lo.toRat := by
  rw [S_eq_root239]
  exact OriginalRow227TriangleRoots07.root239_pos

theorem product239_pos : 0 < (roundedMul (-768) shift (S 239)).lo.toRat := by
  rw [S_eq_root239]
  exact OriginalRow227TriangleRoots07.product239_pos

theorem S_eq_root240 : S 240 = OriginalRow227TriangleRoots07.root240 := rfl

theorem root240_checked : sqrtCheck 240 (S 240) = true := by
  rw [S_eq_root240]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨15, by decide⟩

theorem root240_pos : 0 < (S 240).lo.toRat := by
  rw [S_eq_root240]
  exact OriginalRow227TriangleRoots07.root240_pos

theorem product240_pos : 0 < (roundedMul (-768) shift (S 240)).lo.toRat := by
  rw [S_eq_root240]
  exact OriginalRow227TriangleRoots07.product240_pos

theorem S_eq_root241 : S 241 = OriginalRow227TriangleRoots07.root241 := rfl

theorem root241_checked : sqrtCheck 241 (S 241) = true := by
  rw [S_eq_root241]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨16, by decide⟩

theorem root241_pos : 0 < (S 241).lo.toRat := by
  rw [S_eq_root241]
  exact OriginalRow227TriangleRoots07.root241_pos

theorem product241_pos : 0 < (roundedMul (-768) shift (S 241)).lo.toRat := by
  rw [S_eq_root241]
  exact OriginalRow227TriangleRoots07.product241_pos

theorem S_eq_root242 : S 242 = OriginalRow227TriangleRoots07.root242 := rfl

theorem root242_checked : sqrtCheck 242 (S 242) = true := by
  rw [S_eq_root242]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨17, by decide⟩

theorem root242_pos : 0 < (S 242).lo.toRat := by
  rw [S_eq_root242]
  exact OriginalRow227TriangleRoots07.root242_pos

theorem product242_pos : 0 < (roundedMul (-768) shift (S 242)).lo.toRat := by
  rw [S_eq_root242]
  exact OriginalRow227TriangleRoots07.product242_pos

theorem S_eq_root243 : S 243 = OriginalRow227TriangleRoots07.root243 := rfl

theorem root243_checked : sqrtCheck 243 (S 243) = true := by
  rw [S_eq_root243]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨18, by decide⟩

theorem root243_pos : 0 < (S 243).lo.toRat := by
  rw [S_eq_root243]
  exact OriginalRow227TriangleRoots07.root243_pos

theorem product243_pos : 0 < (roundedMul (-768) shift (S 243)).lo.toRat := by
  rw [S_eq_root243]
  exact OriginalRow227TriangleRoots07.product243_pos

theorem S_eq_root244 : S 244 = OriginalRow227TriangleRoots07.root244 := rfl

theorem root244_checked : sqrtCheck 244 (S 244) = true := by
  rw [S_eq_root244]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨19, by decide⟩

theorem root244_pos : 0 < (S 244).lo.toRat := by
  rw [S_eq_root244]
  exact OriginalRow227TriangleRoots07.root244_pos

theorem product244_pos : 0 < (roundedMul (-768) shift (S 244)).lo.toRat := by
  rw [S_eq_root244]
  exact OriginalRow227TriangleRoots07.product244_pos

theorem S_eq_root245 : S 245 = OriginalRow227TriangleRoots07.root245 := rfl

theorem root245_checked : sqrtCheck 245 (S 245) = true := by
  rw [S_eq_root245]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨20, by decide⟩

theorem root245_pos : 0 < (S 245).lo.toRat := by
  rw [S_eq_root245]
  exact OriginalRow227TriangleRoots07.root245_pos

theorem product245_pos : 0 < (roundedMul (-768) shift (S 245)).lo.toRat := by
  rw [S_eq_root245]
  exact OriginalRow227TriangleRoots07.product245_pos

theorem S_eq_root246 : S 246 = OriginalRow227TriangleRoots07.root246 := rfl

theorem root246_checked : sqrtCheck 246 (S 246) = true := by
  rw [S_eq_root246]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨21, by decide⟩

theorem root246_pos : 0 < (S 246).lo.toRat := by
  rw [S_eq_root246]
  exact OriginalRow227TriangleRoots07.root246_pos

theorem product246_pos : 0 < (roundedMul (-768) shift (S 246)).lo.toRat := by
  rw [S_eq_root246]
  exact OriginalRow227TriangleRoots07.product246_pos

theorem S_eq_root247 : S 247 = OriginalRow227TriangleRoots07.root247 := rfl

theorem root247_checked : sqrtCheck 247 (S 247) = true := by
  rw [S_eq_root247]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨22, by decide⟩

theorem root247_pos : 0 < (S 247).lo.toRat := by
  rw [S_eq_root247]
  exact OriginalRow227TriangleRoots07.root247_pos

theorem product247_pos : 0 < (roundedMul (-768) shift (S 247)).lo.toRat := by
  rw [S_eq_root247]
  exact OriginalRow227TriangleRoots07.product247_pos

theorem S_eq_root248 : S 248 = OriginalRow227TriangleRoots07.root248 := rfl

theorem root248_checked : sqrtCheck 248 (S 248) = true := by
  rw [S_eq_root248]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨23, by decide⟩

theorem root248_pos : 0 < (S 248).lo.toRat := by
  rw [S_eq_root248]
  exact OriginalRow227TriangleRoots07.root248_pos

theorem product248_pos : 0 < (roundedMul (-768) shift (S 248)).lo.toRat := by
  rw [S_eq_root248]
  exact OriginalRow227TriangleRoots07.product248_pos

theorem S_eq_root249 : S 249 = OriginalRow227TriangleRoots07.root249 := rfl

theorem root249_checked : sqrtCheck 249 (S 249) = true := by
  rw [S_eq_root249]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨24, by decide⟩

theorem root249_pos : 0 < (S 249).lo.toRat := by
  rw [S_eq_root249]
  exact OriginalRow227TriangleRoots07.root249_pos

theorem product249_pos : 0 < (roundedMul (-768) shift (S 249)).lo.toRat := by
  rw [S_eq_root249]
  exact OriginalRow227TriangleRoots07.product249_pos

theorem S_eq_root250 : S 250 = OriginalRow227TriangleRoots07.root250 := rfl

theorem root250_checked : sqrtCheck 250 (S 250) = true := by
  rw [S_eq_root250]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨25, by decide⟩

theorem root250_pos : 0 < (S 250).lo.toRat := by
  rw [S_eq_root250]
  exact OriginalRow227TriangleRoots07.root250_pos

theorem product250_pos : 0 < (roundedMul (-768) shift (S 250)).lo.toRat := by
  rw [S_eq_root250]
  exact OriginalRow227TriangleRoots07.product250_pos

theorem S_eq_root251 : S 251 = OriginalRow227TriangleRoots07.root251 := rfl

theorem root251_checked : sqrtCheck 251 (S 251) = true := by
  rw [S_eq_root251]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨26, by decide⟩

theorem root251_pos : 0 < (S 251).lo.toRat := by
  rw [S_eq_root251]
  exact OriginalRow227TriangleRoots07.root251_pos

theorem product251_pos : 0 < (roundedMul (-768) shift (S 251)).lo.toRat := by
  rw [S_eq_root251]
  exact OriginalRow227TriangleRoots07.product251_pos

theorem S_eq_root252 : S 252 = OriginalRow227TriangleRoots07.root252 := rfl

theorem root252_checked : sqrtCheck 252 (S 252) = true := by
  rw [S_eq_root252]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨27, by decide⟩

theorem root252_pos : 0 < (S 252).lo.toRat := by
  rw [S_eq_root252]
  exact OriginalRow227TriangleRoots07.root252_pos

theorem product252_pos : 0 < (roundedMul (-768) shift (S 252)).lo.toRat := by
  rw [S_eq_root252]
  exact OriginalRow227TriangleRoots07.product252_pos

theorem S_eq_root253 : S 253 = OriginalRow227TriangleRoots07.root253 := rfl

theorem root253_checked : sqrtCheck 253 (S 253) = true := by
  rw [S_eq_root253]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨28, by decide⟩

theorem root253_pos : 0 < (S 253).lo.toRat := by
  rw [S_eq_root253]
  exact OriginalRow227TriangleRoots07.root253_pos

theorem product253_pos : 0 < (roundedMul (-768) shift (S 253)).lo.toRat := by
  rw [S_eq_root253]
  exact OriginalRow227TriangleRoots07.product253_pos

theorem S_eq_root254 : S 254 = OriginalRow227TriangleRoots07.root254 := rfl

theorem root254_checked : sqrtCheck 254 (S 254) = true := by
  rw [S_eq_root254]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨29, by decide⟩

theorem root254_pos : 0 < (S 254).lo.toRat := by
  rw [S_eq_root254]
  exact OriginalRow227TriangleRoots07.root254_pos

theorem product254_pos : 0 < (roundedMul (-768) shift (S 254)).lo.toRat := by
  rw [S_eq_root254]
  exact OriginalRow227TriangleRoots07.product254_pos

theorem S_eq_root255 : S 255 = OriginalRow227TriangleRoots07.root255 := rfl

theorem root255_checked : sqrtCheck 255 (S 255) = true := by
  rw [S_eq_root255]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨30, by decide⟩

theorem root255_pos : 0 < (S 255).lo.toRat := by
  rw [S_eq_root255]
  exact OriginalRow227TriangleRoots07.root255_pos

theorem product255_pos : 0 < (roundedMul (-768) shift (S 255)).lo.toRat := by
  rw [S_eq_root255]
  exact OriginalRow227TriangleRoots07.product255_pos

theorem S_eq_root256 : S 256 = OriginalRow227TriangleRoots07.root256 := rfl

theorem root256_checked : sqrtCheck 256 (S 256) = true := by
  rw [S_eq_root256]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots07.entries OriginalRow227TriangleRoots07.checked ⟨31, by decide⟩

theorem root256_pos : 0 < (S 256).lo.toRat := by
  rw [S_eq_root256]
  exact OriginalRow227TriangleRoots07.root256_pos

theorem product256_pos : 0 < (roundedMul (-768) shift (S 256)).lo.toRat := by
  rw [S_eq_root256]
  exact OriginalRow227TriangleRoots07.product256_pos

end Grothe.UpperChaos.OriginalRow227RootBindings07

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root225) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root225_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root225_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product225_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root226) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root226_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root226_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product226_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root227) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root227_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root227_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product227_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root228) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root228_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root228_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product228_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root229) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root229_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root229_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product229_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root230) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root230_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root230_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product230_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root231) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root231_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root231_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product231_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root232) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root232_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root232_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product232_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root233) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root233_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root233_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product233_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root234) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root234_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root234_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product234_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root235) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root235_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root235_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product235_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root236) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root236_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root236_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product236_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root237) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root237_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root237_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product237_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root238) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root238_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root238_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product238_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root239) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root239_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root239_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product239_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root240) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root240_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root240_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product240_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root241) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root241_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root241_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product241_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root242) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root242_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root242_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product242_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root243) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root243_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root243_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product243_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root244) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root244_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root244_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product244_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root245) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root245_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root245_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product245_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root246) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root246_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root246_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product246_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root247) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root247_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root247_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product247_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root248) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root248_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root248_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product248_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root249) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root249_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root249_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product249_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root250) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root250_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root250_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product250_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root251) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root251_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root251_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product251_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root252) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root252_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root252_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product252_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root253) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root253_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root253_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product253_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root254) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root254_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root254_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product254_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root255) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root255_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root255_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product255_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.S_eq_root256) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root256_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.root256_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings07.product256_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
