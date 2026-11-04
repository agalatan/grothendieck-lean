import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings11
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root353 : S 353 = OriginalRow227TriangleRoots11.root353 := rfl

theorem root353_checked : sqrtCheck 353 (S 353) = true := by
  rw [S_eq_root353]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨0, by decide⟩

theorem root353_pos : 0 < (S 353).lo.toRat := by
  rw [S_eq_root353]
  exact OriginalRow227TriangleRoots11.root353_pos

theorem product353_pos : 0 < (roundedMul (-768) shift (S 353)).lo.toRat := by
  rw [S_eq_root353]
  exact OriginalRow227TriangleRoots11.product353_pos

theorem S_eq_root354 : S 354 = OriginalRow227TriangleRoots11.root354 := rfl

theorem root354_checked : sqrtCheck 354 (S 354) = true := by
  rw [S_eq_root354]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨1, by decide⟩

theorem root354_pos : 0 < (S 354).lo.toRat := by
  rw [S_eq_root354]
  exact OriginalRow227TriangleRoots11.root354_pos

theorem product354_pos : 0 < (roundedMul (-768) shift (S 354)).lo.toRat := by
  rw [S_eq_root354]
  exact OriginalRow227TriangleRoots11.product354_pos

theorem S_eq_root355 : S 355 = OriginalRow227TriangleRoots11.root355 := rfl

theorem root355_checked : sqrtCheck 355 (S 355) = true := by
  rw [S_eq_root355]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨2, by decide⟩

theorem root355_pos : 0 < (S 355).lo.toRat := by
  rw [S_eq_root355]
  exact OriginalRow227TriangleRoots11.root355_pos

theorem product355_pos : 0 < (roundedMul (-768) shift (S 355)).lo.toRat := by
  rw [S_eq_root355]
  exact OriginalRow227TriangleRoots11.product355_pos

theorem S_eq_root356 : S 356 = OriginalRow227TriangleRoots11.root356 := rfl

theorem root356_checked : sqrtCheck 356 (S 356) = true := by
  rw [S_eq_root356]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨3, by decide⟩

theorem root356_pos : 0 < (S 356).lo.toRat := by
  rw [S_eq_root356]
  exact OriginalRow227TriangleRoots11.root356_pos

theorem product356_pos : 0 < (roundedMul (-768) shift (S 356)).lo.toRat := by
  rw [S_eq_root356]
  exact OriginalRow227TriangleRoots11.product356_pos

theorem S_eq_root357 : S 357 = OriginalRow227TriangleRoots11.root357 := rfl

theorem root357_checked : sqrtCheck 357 (S 357) = true := by
  rw [S_eq_root357]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨4, by decide⟩

theorem root357_pos : 0 < (S 357).lo.toRat := by
  rw [S_eq_root357]
  exact OriginalRow227TriangleRoots11.root357_pos

theorem product357_pos : 0 < (roundedMul (-768) shift (S 357)).lo.toRat := by
  rw [S_eq_root357]
  exact OriginalRow227TriangleRoots11.product357_pos

theorem S_eq_root358 : S 358 = OriginalRow227TriangleRoots11.root358 := rfl

theorem root358_checked : sqrtCheck 358 (S 358) = true := by
  rw [S_eq_root358]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨5, by decide⟩

theorem root358_pos : 0 < (S 358).lo.toRat := by
  rw [S_eq_root358]
  exact OriginalRow227TriangleRoots11.root358_pos

theorem product358_pos : 0 < (roundedMul (-768) shift (S 358)).lo.toRat := by
  rw [S_eq_root358]
  exact OriginalRow227TriangleRoots11.product358_pos

theorem S_eq_root359 : S 359 = OriginalRow227TriangleRoots11.root359 := rfl

theorem root359_checked : sqrtCheck 359 (S 359) = true := by
  rw [S_eq_root359]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨6, by decide⟩

theorem root359_pos : 0 < (S 359).lo.toRat := by
  rw [S_eq_root359]
  exact OriginalRow227TriangleRoots11.root359_pos

theorem product359_pos : 0 < (roundedMul (-768) shift (S 359)).lo.toRat := by
  rw [S_eq_root359]
  exact OriginalRow227TriangleRoots11.product359_pos

theorem S_eq_root360 : S 360 = OriginalRow227TriangleRoots11.root360 := rfl

theorem root360_checked : sqrtCheck 360 (S 360) = true := by
  rw [S_eq_root360]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨7, by decide⟩

theorem root360_pos : 0 < (S 360).lo.toRat := by
  rw [S_eq_root360]
  exact OriginalRow227TriangleRoots11.root360_pos

theorem product360_pos : 0 < (roundedMul (-768) shift (S 360)).lo.toRat := by
  rw [S_eq_root360]
  exact OriginalRow227TriangleRoots11.product360_pos

theorem S_eq_root361 : S 361 = OriginalRow227TriangleRoots11.root361 := rfl

theorem root361_checked : sqrtCheck 361 (S 361) = true := by
  rw [S_eq_root361]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨8, by decide⟩

theorem root361_pos : 0 < (S 361).lo.toRat := by
  rw [S_eq_root361]
  exact OriginalRow227TriangleRoots11.root361_pos

theorem product361_pos : 0 < (roundedMul (-768) shift (S 361)).lo.toRat := by
  rw [S_eq_root361]
  exact OriginalRow227TriangleRoots11.product361_pos

theorem S_eq_root362 : S 362 = OriginalRow227TriangleRoots11.root362 := rfl

theorem root362_checked : sqrtCheck 362 (S 362) = true := by
  rw [S_eq_root362]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨9, by decide⟩

theorem root362_pos : 0 < (S 362).lo.toRat := by
  rw [S_eq_root362]
  exact OriginalRow227TriangleRoots11.root362_pos

theorem product362_pos : 0 < (roundedMul (-768) shift (S 362)).lo.toRat := by
  rw [S_eq_root362]
  exact OriginalRow227TriangleRoots11.product362_pos

theorem S_eq_root363 : S 363 = OriginalRow227TriangleRoots11.root363 := rfl

theorem root363_checked : sqrtCheck 363 (S 363) = true := by
  rw [S_eq_root363]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨10, by decide⟩

theorem root363_pos : 0 < (S 363).lo.toRat := by
  rw [S_eq_root363]
  exact OriginalRow227TriangleRoots11.root363_pos

theorem product363_pos : 0 < (roundedMul (-768) shift (S 363)).lo.toRat := by
  rw [S_eq_root363]
  exact OriginalRow227TriangleRoots11.product363_pos

theorem S_eq_root364 : S 364 = OriginalRow227TriangleRoots11.root364 := rfl

theorem root364_checked : sqrtCheck 364 (S 364) = true := by
  rw [S_eq_root364]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨11, by decide⟩

theorem root364_pos : 0 < (S 364).lo.toRat := by
  rw [S_eq_root364]
  exact OriginalRow227TriangleRoots11.root364_pos

theorem product364_pos : 0 < (roundedMul (-768) shift (S 364)).lo.toRat := by
  rw [S_eq_root364]
  exact OriginalRow227TriangleRoots11.product364_pos

theorem S_eq_root365 : S 365 = OriginalRow227TriangleRoots11.root365 := rfl

theorem root365_checked : sqrtCheck 365 (S 365) = true := by
  rw [S_eq_root365]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨12, by decide⟩

theorem root365_pos : 0 < (S 365).lo.toRat := by
  rw [S_eq_root365]
  exact OriginalRow227TriangleRoots11.root365_pos

theorem product365_pos : 0 < (roundedMul (-768) shift (S 365)).lo.toRat := by
  rw [S_eq_root365]
  exact OriginalRow227TriangleRoots11.product365_pos

theorem S_eq_root366 : S 366 = OriginalRow227TriangleRoots11.root366 := rfl

theorem root366_checked : sqrtCheck 366 (S 366) = true := by
  rw [S_eq_root366]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨13, by decide⟩

theorem root366_pos : 0 < (S 366).lo.toRat := by
  rw [S_eq_root366]
  exact OriginalRow227TriangleRoots11.root366_pos

theorem product366_pos : 0 < (roundedMul (-768) shift (S 366)).lo.toRat := by
  rw [S_eq_root366]
  exact OriginalRow227TriangleRoots11.product366_pos

theorem S_eq_root367 : S 367 = OriginalRow227TriangleRoots11.root367 := rfl

theorem root367_checked : sqrtCheck 367 (S 367) = true := by
  rw [S_eq_root367]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨14, by decide⟩

theorem root367_pos : 0 < (S 367).lo.toRat := by
  rw [S_eq_root367]
  exact OriginalRow227TriangleRoots11.root367_pos

theorem product367_pos : 0 < (roundedMul (-768) shift (S 367)).lo.toRat := by
  rw [S_eq_root367]
  exact OriginalRow227TriangleRoots11.product367_pos

theorem S_eq_root368 : S 368 = OriginalRow227TriangleRoots11.root368 := rfl

theorem root368_checked : sqrtCheck 368 (S 368) = true := by
  rw [S_eq_root368]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨15, by decide⟩

theorem root368_pos : 0 < (S 368).lo.toRat := by
  rw [S_eq_root368]
  exact OriginalRow227TriangleRoots11.root368_pos

theorem product368_pos : 0 < (roundedMul (-768) shift (S 368)).lo.toRat := by
  rw [S_eq_root368]
  exact OriginalRow227TriangleRoots11.product368_pos

theorem S_eq_root369 : S 369 = OriginalRow227TriangleRoots11.root369 := rfl

theorem root369_checked : sqrtCheck 369 (S 369) = true := by
  rw [S_eq_root369]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨16, by decide⟩

theorem root369_pos : 0 < (S 369).lo.toRat := by
  rw [S_eq_root369]
  exact OriginalRow227TriangleRoots11.root369_pos

theorem product369_pos : 0 < (roundedMul (-768) shift (S 369)).lo.toRat := by
  rw [S_eq_root369]
  exact OriginalRow227TriangleRoots11.product369_pos

theorem S_eq_root370 : S 370 = OriginalRow227TriangleRoots11.root370 := rfl

theorem root370_checked : sqrtCheck 370 (S 370) = true := by
  rw [S_eq_root370]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨17, by decide⟩

theorem root370_pos : 0 < (S 370).lo.toRat := by
  rw [S_eq_root370]
  exact OriginalRow227TriangleRoots11.root370_pos

theorem product370_pos : 0 < (roundedMul (-768) shift (S 370)).lo.toRat := by
  rw [S_eq_root370]
  exact OriginalRow227TriangleRoots11.product370_pos

theorem S_eq_root371 : S 371 = OriginalRow227TriangleRoots11.root371 := rfl

theorem root371_checked : sqrtCheck 371 (S 371) = true := by
  rw [S_eq_root371]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨18, by decide⟩

theorem root371_pos : 0 < (S 371).lo.toRat := by
  rw [S_eq_root371]
  exact OriginalRow227TriangleRoots11.root371_pos

theorem product371_pos : 0 < (roundedMul (-768) shift (S 371)).lo.toRat := by
  rw [S_eq_root371]
  exact OriginalRow227TriangleRoots11.product371_pos

theorem S_eq_root372 : S 372 = OriginalRow227TriangleRoots11.root372 := rfl

theorem root372_checked : sqrtCheck 372 (S 372) = true := by
  rw [S_eq_root372]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨19, by decide⟩

theorem root372_pos : 0 < (S 372).lo.toRat := by
  rw [S_eq_root372]
  exact OriginalRow227TriangleRoots11.root372_pos

theorem product372_pos : 0 < (roundedMul (-768) shift (S 372)).lo.toRat := by
  rw [S_eq_root372]
  exact OriginalRow227TriangleRoots11.product372_pos

theorem S_eq_root373 : S 373 = OriginalRow227TriangleRoots11.root373 := rfl

theorem root373_checked : sqrtCheck 373 (S 373) = true := by
  rw [S_eq_root373]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨20, by decide⟩

theorem root373_pos : 0 < (S 373).lo.toRat := by
  rw [S_eq_root373]
  exact OriginalRow227TriangleRoots11.root373_pos

theorem product373_pos : 0 < (roundedMul (-768) shift (S 373)).lo.toRat := by
  rw [S_eq_root373]
  exact OriginalRow227TriangleRoots11.product373_pos

theorem S_eq_root374 : S 374 = OriginalRow227TriangleRoots11.root374 := rfl

theorem root374_checked : sqrtCheck 374 (S 374) = true := by
  rw [S_eq_root374]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨21, by decide⟩

theorem root374_pos : 0 < (S 374).lo.toRat := by
  rw [S_eq_root374]
  exact OriginalRow227TriangleRoots11.root374_pos

theorem product374_pos : 0 < (roundedMul (-768) shift (S 374)).lo.toRat := by
  rw [S_eq_root374]
  exact OriginalRow227TriangleRoots11.product374_pos

theorem S_eq_root375 : S 375 = OriginalRow227TriangleRoots11.root375 := rfl

theorem root375_checked : sqrtCheck 375 (S 375) = true := by
  rw [S_eq_root375]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨22, by decide⟩

theorem root375_pos : 0 < (S 375).lo.toRat := by
  rw [S_eq_root375]
  exact OriginalRow227TriangleRoots11.root375_pos

theorem product375_pos : 0 < (roundedMul (-768) shift (S 375)).lo.toRat := by
  rw [S_eq_root375]
  exact OriginalRow227TriangleRoots11.product375_pos

theorem S_eq_root376 : S 376 = OriginalRow227TriangleRoots11.root376 := rfl

theorem root376_checked : sqrtCheck 376 (S 376) = true := by
  rw [S_eq_root376]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨23, by decide⟩

theorem root376_pos : 0 < (S 376).lo.toRat := by
  rw [S_eq_root376]
  exact OriginalRow227TriangleRoots11.root376_pos

theorem product376_pos : 0 < (roundedMul (-768) shift (S 376)).lo.toRat := by
  rw [S_eq_root376]
  exact OriginalRow227TriangleRoots11.product376_pos

theorem S_eq_root377 : S 377 = OriginalRow227TriangleRoots11.root377 := rfl

theorem root377_checked : sqrtCheck 377 (S 377) = true := by
  rw [S_eq_root377]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨24, by decide⟩

theorem root377_pos : 0 < (S 377).lo.toRat := by
  rw [S_eq_root377]
  exact OriginalRow227TriangleRoots11.root377_pos

theorem product377_pos : 0 < (roundedMul (-768) shift (S 377)).lo.toRat := by
  rw [S_eq_root377]
  exact OriginalRow227TriangleRoots11.product377_pos

theorem S_eq_root378 : S 378 = OriginalRow227TriangleRoots11.root378 := rfl

theorem root378_checked : sqrtCheck 378 (S 378) = true := by
  rw [S_eq_root378]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨25, by decide⟩

theorem root378_pos : 0 < (S 378).lo.toRat := by
  rw [S_eq_root378]
  exact OriginalRow227TriangleRoots11.root378_pos

theorem product378_pos : 0 < (roundedMul (-768) shift (S 378)).lo.toRat := by
  rw [S_eq_root378]
  exact OriginalRow227TriangleRoots11.product378_pos

theorem S_eq_root379 : S 379 = OriginalRow227TriangleRoots11.root379 := rfl

theorem root379_checked : sqrtCheck 379 (S 379) = true := by
  rw [S_eq_root379]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨26, by decide⟩

theorem root379_pos : 0 < (S 379).lo.toRat := by
  rw [S_eq_root379]
  exact OriginalRow227TriangleRoots11.root379_pos

theorem product379_pos : 0 < (roundedMul (-768) shift (S 379)).lo.toRat := by
  rw [S_eq_root379]
  exact OriginalRow227TriangleRoots11.product379_pos

theorem S_eq_root380 : S 380 = OriginalRow227TriangleRoots11.root380 := rfl

theorem root380_checked : sqrtCheck 380 (S 380) = true := by
  rw [S_eq_root380]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨27, by decide⟩

theorem root380_pos : 0 < (S 380).lo.toRat := by
  rw [S_eq_root380]
  exact OriginalRow227TriangleRoots11.root380_pos

theorem product380_pos : 0 < (roundedMul (-768) shift (S 380)).lo.toRat := by
  rw [S_eq_root380]
  exact OriginalRow227TriangleRoots11.product380_pos

theorem S_eq_root381 : S 381 = OriginalRow227TriangleRoots11.root381 := rfl

theorem root381_checked : sqrtCheck 381 (S 381) = true := by
  rw [S_eq_root381]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨28, by decide⟩

theorem root381_pos : 0 < (S 381).lo.toRat := by
  rw [S_eq_root381]
  exact OriginalRow227TriangleRoots11.root381_pos

theorem product381_pos : 0 < (roundedMul (-768) shift (S 381)).lo.toRat := by
  rw [S_eq_root381]
  exact OriginalRow227TriangleRoots11.product381_pos

theorem S_eq_root382 : S 382 = OriginalRow227TriangleRoots11.root382 := rfl

theorem root382_checked : sqrtCheck 382 (S 382) = true := by
  rw [S_eq_root382]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨29, by decide⟩

theorem root382_pos : 0 < (S 382).lo.toRat := by
  rw [S_eq_root382]
  exact OriginalRow227TriangleRoots11.root382_pos

theorem product382_pos : 0 < (roundedMul (-768) shift (S 382)).lo.toRat := by
  rw [S_eq_root382]
  exact OriginalRow227TriangleRoots11.product382_pos

theorem S_eq_root383 : S 383 = OriginalRow227TriangleRoots11.root383 := rfl

theorem root383_checked : sqrtCheck 383 (S 383) = true := by
  rw [S_eq_root383]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨30, by decide⟩

theorem root383_pos : 0 < (S 383).lo.toRat := by
  rw [S_eq_root383]
  exact OriginalRow227TriangleRoots11.root383_pos

theorem product383_pos : 0 < (roundedMul (-768) shift (S 383)).lo.toRat := by
  rw [S_eq_root383]
  exact OriginalRow227TriangleRoots11.product383_pos

theorem S_eq_root384 : S 384 = OriginalRow227TriangleRoots11.root384 := rfl

theorem root384_checked : sqrtCheck 384 (S 384) = true := by
  rw [S_eq_root384]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots11.entries OriginalRow227TriangleRoots11.checked ⟨31, by decide⟩

theorem root384_pos : 0 < (S 384).lo.toRat := by
  rw [S_eq_root384]
  exact OriginalRow227TriangleRoots11.root384_pos

theorem product384_pos : 0 < (roundedMul (-768) shift (S 384)).lo.toRat := by
  rw [S_eq_root384]
  exact OriginalRow227TriangleRoots11.product384_pos

end Grothe.UpperChaos.OriginalRow227RootBindings11

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root353) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root353_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root353_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product353_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root354) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root354_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root354_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product354_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root355) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root355_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root355_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product355_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root356) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root356_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root356_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product356_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root357) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root357_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root357_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product357_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root358) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root358_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root358_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product358_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root359) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root359_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root359_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product359_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root360) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root360_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root360_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product360_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root361) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root361_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root361_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product361_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root362) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root362_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root362_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product362_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root363) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root363_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root363_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product363_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root364) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root364_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root364_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product364_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root365) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root365_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root365_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product365_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root366) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root366_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root366_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product366_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root367) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root367_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root367_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product367_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root368) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root368_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root368_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product368_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root369) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root369_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root369_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product369_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root370) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root370_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root370_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product370_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root371) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root371_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root371_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product371_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root372) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root372_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root372_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product372_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root373) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root373_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root373_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product373_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root374) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root374_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root374_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product374_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root375) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root375_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root375_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product375_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root376) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root376_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root376_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product376_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root377) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root377_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root377_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product377_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root378) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root378_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root378_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product378_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root379) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root379_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root379_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product379_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root380) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root380_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root380_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product380_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root381) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root381_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root381_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product381_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root382) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root382_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root382_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product382_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root383) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root383_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root383_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product383_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.S_eq_root384) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root384_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.root384_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings11.product384_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
