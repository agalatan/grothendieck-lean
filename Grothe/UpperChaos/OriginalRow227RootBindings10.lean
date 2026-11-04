import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings10
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root321 : S 321 = OriginalRow227TriangleRoots10.root321 := rfl

theorem root321_checked : sqrtCheck 321 (S 321) = true := by
  rw [S_eq_root321]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨0, by decide⟩

theorem root321_pos : 0 < (S 321).lo.toRat := by
  rw [S_eq_root321]
  exact OriginalRow227TriangleRoots10.root321_pos

theorem product321_pos : 0 < (roundedMul (-768) shift (S 321)).lo.toRat := by
  rw [S_eq_root321]
  exact OriginalRow227TriangleRoots10.product321_pos

theorem S_eq_root322 : S 322 = OriginalRow227TriangleRoots10.root322 := rfl

theorem root322_checked : sqrtCheck 322 (S 322) = true := by
  rw [S_eq_root322]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨1, by decide⟩

theorem root322_pos : 0 < (S 322).lo.toRat := by
  rw [S_eq_root322]
  exact OriginalRow227TriangleRoots10.root322_pos

theorem product322_pos : 0 < (roundedMul (-768) shift (S 322)).lo.toRat := by
  rw [S_eq_root322]
  exact OriginalRow227TriangleRoots10.product322_pos

theorem S_eq_root323 : S 323 = OriginalRow227TriangleRoots10.root323 := rfl

theorem root323_checked : sqrtCheck 323 (S 323) = true := by
  rw [S_eq_root323]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨2, by decide⟩

theorem root323_pos : 0 < (S 323).lo.toRat := by
  rw [S_eq_root323]
  exact OriginalRow227TriangleRoots10.root323_pos

theorem product323_pos : 0 < (roundedMul (-768) shift (S 323)).lo.toRat := by
  rw [S_eq_root323]
  exact OriginalRow227TriangleRoots10.product323_pos

theorem S_eq_root324 : S 324 = OriginalRow227TriangleRoots10.root324 := rfl

theorem root324_checked : sqrtCheck 324 (S 324) = true := by
  rw [S_eq_root324]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨3, by decide⟩

theorem root324_pos : 0 < (S 324).lo.toRat := by
  rw [S_eq_root324]
  exact OriginalRow227TriangleRoots10.root324_pos

theorem product324_pos : 0 < (roundedMul (-768) shift (S 324)).lo.toRat := by
  rw [S_eq_root324]
  exact OriginalRow227TriangleRoots10.product324_pos

theorem S_eq_root325 : S 325 = OriginalRow227TriangleRoots10.root325 := rfl

theorem root325_checked : sqrtCheck 325 (S 325) = true := by
  rw [S_eq_root325]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨4, by decide⟩

theorem root325_pos : 0 < (S 325).lo.toRat := by
  rw [S_eq_root325]
  exact OriginalRow227TriangleRoots10.root325_pos

theorem product325_pos : 0 < (roundedMul (-768) shift (S 325)).lo.toRat := by
  rw [S_eq_root325]
  exact OriginalRow227TriangleRoots10.product325_pos

theorem S_eq_root326 : S 326 = OriginalRow227TriangleRoots10.root326 := rfl

theorem root326_checked : sqrtCheck 326 (S 326) = true := by
  rw [S_eq_root326]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨5, by decide⟩

theorem root326_pos : 0 < (S 326).lo.toRat := by
  rw [S_eq_root326]
  exact OriginalRow227TriangleRoots10.root326_pos

theorem product326_pos : 0 < (roundedMul (-768) shift (S 326)).lo.toRat := by
  rw [S_eq_root326]
  exact OriginalRow227TriangleRoots10.product326_pos

theorem S_eq_root327 : S 327 = OriginalRow227TriangleRoots10.root327 := rfl

theorem root327_checked : sqrtCheck 327 (S 327) = true := by
  rw [S_eq_root327]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨6, by decide⟩

theorem root327_pos : 0 < (S 327).lo.toRat := by
  rw [S_eq_root327]
  exact OriginalRow227TriangleRoots10.root327_pos

theorem product327_pos : 0 < (roundedMul (-768) shift (S 327)).lo.toRat := by
  rw [S_eq_root327]
  exact OriginalRow227TriangleRoots10.product327_pos

theorem S_eq_root328 : S 328 = OriginalRow227TriangleRoots10.root328 := rfl

theorem root328_checked : sqrtCheck 328 (S 328) = true := by
  rw [S_eq_root328]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨7, by decide⟩

theorem root328_pos : 0 < (S 328).lo.toRat := by
  rw [S_eq_root328]
  exact OriginalRow227TriangleRoots10.root328_pos

theorem product328_pos : 0 < (roundedMul (-768) shift (S 328)).lo.toRat := by
  rw [S_eq_root328]
  exact OriginalRow227TriangleRoots10.product328_pos

theorem S_eq_root329 : S 329 = OriginalRow227TriangleRoots10.root329 := rfl

theorem root329_checked : sqrtCheck 329 (S 329) = true := by
  rw [S_eq_root329]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨8, by decide⟩

theorem root329_pos : 0 < (S 329).lo.toRat := by
  rw [S_eq_root329]
  exact OriginalRow227TriangleRoots10.root329_pos

theorem product329_pos : 0 < (roundedMul (-768) shift (S 329)).lo.toRat := by
  rw [S_eq_root329]
  exact OriginalRow227TriangleRoots10.product329_pos

theorem S_eq_root330 : S 330 = OriginalRow227TriangleRoots10.root330 := rfl

theorem root330_checked : sqrtCheck 330 (S 330) = true := by
  rw [S_eq_root330]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨9, by decide⟩

theorem root330_pos : 0 < (S 330).lo.toRat := by
  rw [S_eq_root330]
  exact OriginalRow227TriangleRoots10.root330_pos

theorem product330_pos : 0 < (roundedMul (-768) shift (S 330)).lo.toRat := by
  rw [S_eq_root330]
  exact OriginalRow227TriangleRoots10.product330_pos

theorem S_eq_root331 : S 331 = OriginalRow227TriangleRoots10.root331 := rfl

theorem root331_checked : sqrtCheck 331 (S 331) = true := by
  rw [S_eq_root331]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨10, by decide⟩

theorem root331_pos : 0 < (S 331).lo.toRat := by
  rw [S_eq_root331]
  exact OriginalRow227TriangleRoots10.root331_pos

theorem product331_pos : 0 < (roundedMul (-768) shift (S 331)).lo.toRat := by
  rw [S_eq_root331]
  exact OriginalRow227TriangleRoots10.product331_pos

theorem S_eq_root332 : S 332 = OriginalRow227TriangleRoots10.root332 := rfl

theorem root332_checked : sqrtCheck 332 (S 332) = true := by
  rw [S_eq_root332]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨11, by decide⟩

theorem root332_pos : 0 < (S 332).lo.toRat := by
  rw [S_eq_root332]
  exact OriginalRow227TriangleRoots10.root332_pos

theorem product332_pos : 0 < (roundedMul (-768) shift (S 332)).lo.toRat := by
  rw [S_eq_root332]
  exact OriginalRow227TriangleRoots10.product332_pos

theorem S_eq_root333 : S 333 = OriginalRow227TriangleRoots10.root333 := rfl

theorem root333_checked : sqrtCheck 333 (S 333) = true := by
  rw [S_eq_root333]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨12, by decide⟩

theorem root333_pos : 0 < (S 333).lo.toRat := by
  rw [S_eq_root333]
  exact OriginalRow227TriangleRoots10.root333_pos

theorem product333_pos : 0 < (roundedMul (-768) shift (S 333)).lo.toRat := by
  rw [S_eq_root333]
  exact OriginalRow227TriangleRoots10.product333_pos

theorem S_eq_root334 : S 334 = OriginalRow227TriangleRoots10.root334 := rfl

theorem root334_checked : sqrtCheck 334 (S 334) = true := by
  rw [S_eq_root334]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨13, by decide⟩

theorem root334_pos : 0 < (S 334).lo.toRat := by
  rw [S_eq_root334]
  exact OriginalRow227TriangleRoots10.root334_pos

theorem product334_pos : 0 < (roundedMul (-768) shift (S 334)).lo.toRat := by
  rw [S_eq_root334]
  exact OriginalRow227TriangleRoots10.product334_pos

theorem S_eq_root335 : S 335 = OriginalRow227TriangleRoots10.root335 := rfl

theorem root335_checked : sqrtCheck 335 (S 335) = true := by
  rw [S_eq_root335]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨14, by decide⟩

theorem root335_pos : 0 < (S 335).lo.toRat := by
  rw [S_eq_root335]
  exact OriginalRow227TriangleRoots10.root335_pos

theorem product335_pos : 0 < (roundedMul (-768) shift (S 335)).lo.toRat := by
  rw [S_eq_root335]
  exact OriginalRow227TriangleRoots10.product335_pos

theorem S_eq_root336 : S 336 = OriginalRow227TriangleRoots10.root336 := rfl

theorem root336_checked : sqrtCheck 336 (S 336) = true := by
  rw [S_eq_root336]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨15, by decide⟩

theorem root336_pos : 0 < (S 336).lo.toRat := by
  rw [S_eq_root336]
  exact OriginalRow227TriangleRoots10.root336_pos

theorem product336_pos : 0 < (roundedMul (-768) shift (S 336)).lo.toRat := by
  rw [S_eq_root336]
  exact OriginalRow227TriangleRoots10.product336_pos

theorem S_eq_root337 : S 337 = OriginalRow227TriangleRoots10.root337 := rfl

theorem root337_checked : sqrtCheck 337 (S 337) = true := by
  rw [S_eq_root337]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨16, by decide⟩

theorem root337_pos : 0 < (S 337).lo.toRat := by
  rw [S_eq_root337]
  exact OriginalRow227TriangleRoots10.root337_pos

theorem product337_pos : 0 < (roundedMul (-768) shift (S 337)).lo.toRat := by
  rw [S_eq_root337]
  exact OriginalRow227TriangleRoots10.product337_pos

theorem S_eq_root338 : S 338 = OriginalRow227TriangleRoots10.root338 := rfl

theorem root338_checked : sqrtCheck 338 (S 338) = true := by
  rw [S_eq_root338]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨17, by decide⟩

theorem root338_pos : 0 < (S 338).lo.toRat := by
  rw [S_eq_root338]
  exact OriginalRow227TriangleRoots10.root338_pos

theorem product338_pos : 0 < (roundedMul (-768) shift (S 338)).lo.toRat := by
  rw [S_eq_root338]
  exact OriginalRow227TriangleRoots10.product338_pos

theorem S_eq_root339 : S 339 = OriginalRow227TriangleRoots10.root339 := rfl

theorem root339_checked : sqrtCheck 339 (S 339) = true := by
  rw [S_eq_root339]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨18, by decide⟩

theorem root339_pos : 0 < (S 339).lo.toRat := by
  rw [S_eq_root339]
  exact OriginalRow227TriangleRoots10.root339_pos

theorem product339_pos : 0 < (roundedMul (-768) shift (S 339)).lo.toRat := by
  rw [S_eq_root339]
  exact OriginalRow227TriangleRoots10.product339_pos

theorem S_eq_root340 : S 340 = OriginalRow227TriangleRoots10.root340 := rfl

theorem root340_checked : sqrtCheck 340 (S 340) = true := by
  rw [S_eq_root340]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨19, by decide⟩

theorem root340_pos : 0 < (S 340).lo.toRat := by
  rw [S_eq_root340]
  exact OriginalRow227TriangleRoots10.root340_pos

theorem product340_pos : 0 < (roundedMul (-768) shift (S 340)).lo.toRat := by
  rw [S_eq_root340]
  exact OriginalRow227TriangleRoots10.product340_pos

theorem S_eq_root341 : S 341 = OriginalRow227TriangleRoots10.root341 := rfl

theorem root341_checked : sqrtCheck 341 (S 341) = true := by
  rw [S_eq_root341]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨20, by decide⟩

theorem root341_pos : 0 < (S 341).lo.toRat := by
  rw [S_eq_root341]
  exact OriginalRow227TriangleRoots10.root341_pos

theorem product341_pos : 0 < (roundedMul (-768) shift (S 341)).lo.toRat := by
  rw [S_eq_root341]
  exact OriginalRow227TriangleRoots10.product341_pos

theorem S_eq_root342 : S 342 = OriginalRow227TriangleRoots10.root342 := rfl

theorem root342_checked : sqrtCheck 342 (S 342) = true := by
  rw [S_eq_root342]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨21, by decide⟩

theorem root342_pos : 0 < (S 342).lo.toRat := by
  rw [S_eq_root342]
  exact OriginalRow227TriangleRoots10.root342_pos

theorem product342_pos : 0 < (roundedMul (-768) shift (S 342)).lo.toRat := by
  rw [S_eq_root342]
  exact OriginalRow227TriangleRoots10.product342_pos

theorem S_eq_root343 : S 343 = OriginalRow227TriangleRoots10.root343 := rfl

theorem root343_checked : sqrtCheck 343 (S 343) = true := by
  rw [S_eq_root343]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨22, by decide⟩

theorem root343_pos : 0 < (S 343).lo.toRat := by
  rw [S_eq_root343]
  exact OriginalRow227TriangleRoots10.root343_pos

theorem product343_pos : 0 < (roundedMul (-768) shift (S 343)).lo.toRat := by
  rw [S_eq_root343]
  exact OriginalRow227TriangleRoots10.product343_pos

theorem S_eq_root344 : S 344 = OriginalRow227TriangleRoots10.root344 := rfl

theorem root344_checked : sqrtCheck 344 (S 344) = true := by
  rw [S_eq_root344]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨23, by decide⟩

theorem root344_pos : 0 < (S 344).lo.toRat := by
  rw [S_eq_root344]
  exact OriginalRow227TriangleRoots10.root344_pos

theorem product344_pos : 0 < (roundedMul (-768) shift (S 344)).lo.toRat := by
  rw [S_eq_root344]
  exact OriginalRow227TriangleRoots10.product344_pos

theorem S_eq_root345 : S 345 = OriginalRow227TriangleRoots10.root345 := rfl

theorem root345_checked : sqrtCheck 345 (S 345) = true := by
  rw [S_eq_root345]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨24, by decide⟩

theorem root345_pos : 0 < (S 345).lo.toRat := by
  rw [S_eq_root345]
  exact OriginalRow227TriangleRoots10.root345_pos

theorem product345_pos : 0 < (roundedMul (-768) shift (S 345)).lo.toRat := by
  rw [S_eq_root345]
  exact OriginalRow227TriangleRoots10.product345_pos

theorem S_eq_root346 : S 346 = OriginalRow227TriangleRoots10.root346 := rfl

theorem root346_checked : sqrtCheck 346 (S 346) = true := by
  rw [S_eq_root346]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨25, by decide⟩

theorem root346_pos : 0 < (S 346).lo.toRat := by
  rw [S_eq_root346]
  exact OriginalRow227TriangleRoots10.root346_pos

theorem product346_pos : 0 < (roundedMul (-768) shift (S 346)).lo.toRat := by
  rw [S_eq_root346]
  exact OriginalRow227TriangleRoots10.product346_pos

theorem S_eq_root347 : S 347 = OriginalRow227TriangleRoots10.root347 := rfl

theorem root347_checked : sqrtCheck 347 (S 347) = true := by
  rw [S_eq_root347]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨26, by decide⟩

theorem root347_pos : 0 < (S 347).lo.toRat := by
  rw [S_eq_root347]
  exact OriginalRow227TriangleRoots10.root347_pos

theorem product347_pos : 0 < (roundedMul (-768) shift (S 347)).lo.toRat := by
  rw [S_eq_root347]
  exact OriginalRow227TriangleRoots10.product347_pos

theorem S_eq_root348 : S 348 = OriginalRow227TriangleRoots10.root348 := rfl

theorem root348_checked : sqrtCheck 348 (S 348) = true := by
  rw [S_eq_root348]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨27, by decide⟩

theorem root348_pos : 0 < (S 348).lo.toRat := by
  rw [S_eq_root348]
  exact OriginalRow227TriangleRoots10.root348_pos

theorem product348_pos : 0 < (roundedMul (-768) shift (S 348)).lo.toRat := by
  rw [S_eq_root348]
  exact OriginalRow227TriangleRoots10.product348_pos

theorem S_eq_root349 : S 349 = OriginalRow227TriangleRoots10.root349 := rfl

theorem root349_checked : sqrtCheck 349 (S 349) = true := by
  rw [S_eq_root349]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨28, by decide⟩

theorem root349_pos : 0 < (S 349).lo.toRat := by
  rw [S_eq_root349]
  exact OriginalRow227TriangleRoots10.root349_pos

theorem product349_pos : 0 < (roundedMul (-768) shift (S 349)).lo.toRat := by
  rw [S_eq_root349]
  exact OriginalRow227TriangleRoots10.product349_pos

theorem S_eq_root350 : S 350 = OriginalRow227TriangleRoots10.root350 := rfl

theorem root350_checked : sqrtCheck 350 (S 350) = true := by
  rw [S_eq_root350]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨29, by decide⟩

theorem root350_pos : 0 < (S 350).lo.toRat := by
  rw [S_eq_root350]
  exact OriginalRow227TriangleRoots10.root350_pos

theorem product350_pos : 0 < (roundedMul (-768) shift (S 350)).lo.toRat := by
  rw [S_eq_root350]
  exact OriginalRow227TriangleRoots10.product350_pos

theorem S_eq_root351 : S 351 = OriginalRow227TriangleRoots10.root351 := rfl

theorem root351_checked : sqrtCheck 351 (S 351) = true := by
  rw [S_eq_root351]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨30, by decide⟩

theorem root351_pos : 0 < (S 351).lo.toRat := by
  rw [S_eq_root351]
  exact OriginalRow227TriangleRoots10.root351_pos

theorem product351_pos : 0 < (roundedMul (-768) shift (S 351)).lo.toRat := by
  rw [S_eq_root351]
  exact OriginalRow227TriangleRoots10.product351_pos

theorem S_eq_root352 : S 352 = OriginalRow227TriangleRoots10.root352 := rfl

theorem root352_checked : sqrtCheck 352 (S 352) = true := by
  rw [S_eq_root352]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots10.entries OriginalRow227TriangleRoots10.checked ⟨31, by decide⟩

theorem root352_pos : 0 < (S 352).lo.toRat := by
  rw [S_eq_root352]
  exact OriginalRow227TriangleRoots10.root352_pos

theorem product352_pos : 0 < (roundedMul (-768) shift (S 352)).lo.toRat := by
  rw [S_eq_root352]
  exact OriginalRow227TriangleRoots10.product352_pos

end Grothe.UpperChaos.OriginalRow227RootBindings10

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root321) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root321_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root321_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product321_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root322) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root322_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root322_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product322_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root323) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root323_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root323_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product323_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root324) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root324_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root324_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product324_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root325) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root325_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root325_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product325_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root326) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root326_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root326_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product326_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root327) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root327_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root327_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product327_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root328) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root328_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root328_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product328_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root329) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root329_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root329_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product329_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root330) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root330_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root330_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product330_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root331) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root331_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root331_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product331_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root332) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root332_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root332_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product332_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root333) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root333_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root333_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product333_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root334) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root334_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root334_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product334_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root335) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root335_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root335_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product335_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root336) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root336_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root336_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product336_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root337) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root337_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root337_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product337_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root338) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root338_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root338_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product338_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root339) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root339_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root339_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product339_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root340) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root340_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root340_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product340_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root341) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root341_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root341_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product341_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root342) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root342_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root342_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product342_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root343) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root343_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root343_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product343_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root344) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root344_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root344_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product344_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root345) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root345_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root345_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product345_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root346) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root346_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root346_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product346_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root347) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root347_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root347_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product347_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root348) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root348_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root348_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product348_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root349) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root349_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root349_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product349_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root350) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root350_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root350_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product350_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root351) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root351_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root351_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product351_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.S_eq_root352) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root352_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.root352_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings10.product352_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
