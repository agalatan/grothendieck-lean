import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings14
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root449 : S 449 = OriginalRow227TriangleRoots14.root449 := rfl

theorem root449_checked : sqrtCheck 449 (S 449) = true := by
  rw [S_eq_root449]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨0, by decide⟩

theorem root449_pos : 0 < (S 449).lo.toRat := by
  rw [S_eq_root449]
  exact OriginalRow227TriangleRoots14.root449_pos

theorem product449_pos : 0 < (roundedMul (-768) shift (S 449)).lo.toRat := by
  rw [S_eq_root449]
  exact OriginalRow227TriangleRoots14.product449_pos

theorem S_eq_root450 : S 450 = OriginalRow227TriangleRoots14.root450 := rfl

theorem root450_checked : sqrtCheck 450 (S 450) = true := by
  rw [S_eq_root450]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨1, by decide⟩

theorem root450_pos : 0 < (S 450).lo.toRat := by
  rw [S_eq_root450]
  exact OriginalRow227TriangleRoots14.root450_pos

theorem product450_pos : 0 < (roundedMul (-768) shift (S 450)).lo.toRat := by
  rw [S_eq_root450]
  exact OriginalRow227TriangleRoots14.product450_pos

theorem S_eq_root451 : S 451 = OriginalRow227TriangleRoots14.root451 := rfl

theorem root451_checked : sqrtCheck 451 (S 451) = true := by
  rw [S_eq_root451]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨2, by decide⟩

theorem root451_pos : 0 < (S 451).lo.toRat := by
  rw [S_eq_root451]
  exact OriginalRow227TriangleRoots14.root451_pos

theorem product451_pos : 0 < (roundedMul (-768) shift (S 451)).lo.toRat := by
  rw [S_eq_root451]
  exact OriginalRow227TriangleRoots14.product451_pos

theorem S_eq_root452 : S 452 = OriginalRow227TriangleRoots14.root452 := rfl

theorem root452_checked : sqrtCheck 452 (S 452) = true := by
  rw [S_eq_root452]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨3, by decide⟩

theorem root452_pos : 0 < (S 452).lo.toRat := by
  rw [S_eq_root452]
  exact OriginalRow227TriangleRoots14.root452_pos

theorem product452_pos : 0 < (roundedMul (-768) shift (S 452)).lo.toRat := by
  rw [S_eq_root452]
  exact OriginalRow227TriangleRoots14.product452_pos

theorem S_eq_root453 : S 453 = OriginalRow227TriangleRoots14.root453 := rfl

theorem root453_checked : sqrtCheck 453 (S 453) = true := by
  rw [S_eq_root453]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨4, by decide⟩

theorem root453_pos : 0 < (S 453).lo.toRat := by
  rw [S_eq_root453]
  exact OriginalRow227TriangleRoots14.root453_pos

theorem product453_pos : 0 < (roundedMul (-768) shift (S 453)).lo.toRat := by
  rw [S_eq_root453]
  exact OriginalRow227TriangleRoots14.product453_pos

theorem S_eq_root454 : S 454 = OriginalRow227TriangleRoots14.root454 := rfl

theorem root454_checked : sqrtCheck 454 (S 454) = true := by
  rw [S_eq_root454]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨5, by decide⟩

theorem root454_pos : 0 < (S 454).lo.toRat := by
  rw [S_eq_root454]
  exact OriginalRow227TriangleRoots14.root454_pos

theorem product454_pos : 0 < (roundedMul (-768) shift (S 454)).lo.toRat := by
  rw [S_eq_root454]
  exact OriginalRow227TriangleRoots14.product454_pos

theorem S_eq_root455 : S 455 = OriginalRow227TriangleRoots14.root455 := rfl

theorem root455_checked : sqrtCheck 455 (S 455) = true := by
  rw [S_eq_root455]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨6, by decide⟩

theorem root455_pos : 0 < (S 455).lo.toRat := by
  rw [S_eq_root455]
  exact OriginalRow227TriangleRoots14.root455_pos

theorem product455_pos : 0 < (roundedMul (-768) shift (S 455)).lo.toRat := by
  rw [S_eq_root455]
  exact OriginalRow227TriangleRoots14.product455_pos

theorem S_eq_root456 : S 456 = OriginalRow227TriangleRoots14.root456 := rfl

theorem root456_checked : sqrtCheck 456 (S 456) = true := by
  rw [S_eq_root456]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨7, by decide⟩

theorem root456_pos : 0 < (S 456).lo.toRat := by
  rw [S_eq_root456]
  exact OriginalRow227TriangleRoots14.root456_pos

theorem product456_pos : 0 < (roundedMul (-768) shift (S 456)).lo.toRat := by
  rw [S_eq_root456]
  exact OriginalRow227TriangleRoots14.product456_pos

theorem S_eq_root457 : S 457 = OriginalRow227TriangleRoots14.root457 := rfl

theorem root457_checked : sqrtCheck 457 (S 457) = true := by
  rw [S_eq_root457]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨8, by decide⟩

theorem root457_pos : 0 < (S 457).lo.toRat := by
  rw [S_eq_root457]
  exact OriginalRow227TriangleRoots14.root457_pos

theorem product457_pos : 0 < (roundedMul (-768) shift (S 457)).lo.toRat := by
  rw [S_eq_root457]
  exact OriginalRow227TriangleRoots14.product457_pos

theorem S_eq_root458 : S 458 = OriginalRow227TriangleRoots14.root458 := rfl

theorem root458_checked : sqrtCheck 458 (S 458) = true := by
  rw [S_eq_root458]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨9, by decide⟩

theorem root458_pos : 0 < (S 458).lo.toRat := by
  rw [S_eq_root458]
  exact OriginalRow227TriangleRoots14.root458_pos

theorem product458_pos : 0 < (roundedMul (-768) shift (S 458)).lo.toRat := by
  rw [S_eq_root458]
  exact OriginalRow227TriangleRoots14.product458_pos

theorem S_eq_root459 : S 459 = OriginalRow227TriangleRoots14.root459 := rfl

theorem root459_checked : sqrtCheck 459 (S 459) = true := by
  rw [S_eq_root459]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨10, by decide⟩

theorem root459_pos : 0 < (S 459).lo.toRat := by
  rw [S_eq_root459]
  exact OriginalRow227TriangleRoots14.root459_pos

theorem product459_pos : 0 < (roundedMul (-768) shift (S 459)).lo.toRat := by
  rw [S_eq_root459]
  exact OriginalRow227TriangleRoots14.product459_pos

theorem S_eq_root460 : S 460 = OriginalRow227TriangleRoots14.root460 := rfl

theorem root460_checked : sqrtCheck 460 (S 460) = true := by
  rw [S_eq_root460]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨11, by decide⟩

theorem root460_pos : 0 < (S 460).lo.toRat := by
  rw [S_eq_root460]
  exact OriginalRow227TriangleRoots14.root460_pos

theorem product460_pos : 0 < (roundedMul (-768) shift (S 460)).lo.toRat := by
  rw [S_eq_root460]
  exact OriginalRow227TriangleRoots14.product460_pos

theorem S_eq_root461 : S 461 = OriginalRow227TriangleRoots14.root461 := rfl

theorem root461_checked : sqrtCheck 461 (S 461) = true := by
  rw [S_eq_root461]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨12, by decide⟩

theorem root461_pos : 0 < (S 461).lo.toRat := by
  rw [S_eq_root461]
  exact OriginalRow227TriangleRoots14.root461_pos

theorem product461_pos : 0 < (roundedMul (-768) shift (S 461)).lo.toRat := by
  rw [S_eq_root461]
  exact OriginalRow227TriangleRoots14.product461_pos

theorem S_eq_root462 : S 462 = OriginalRow227TriangleRoots14.root462 := rfl

theorem root462_checked : sqrtCheck 462 (S 462) = true := by
  rw [S_eq_root462]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨13, by decide⟩

theorem root462_pos : 0 < (S 462).lo.toRat := by
  rw [S_eq_root462]
  exact OriginalRow227TriangleRoots14.root462_pos

theorem product462_pos : 0 < (roundedMul (-768) shift (S 462)).lo.toRat := by
  rw [S_eq_root462]
  exact OriginalRow227TriangleRoots14.product462_pos

theorem S_eq_root463 : S 463 = OriginalRow227TriangleRoots14.root463 := rfl

theorem root463_checked : sqrtCheck 463 (S 463) = true := by
  rw [S_eq_root463]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨14, by decide⟩

theorem root463_pos : 0 < (S 463).lo.toRat := by
  rw [S_eq_root463]
  exact OriginalRow227TriangleRoots14.root463_pos

theorem product463_pos : 0 < (roundedMul (-768) shift (S 463)).lo.toRat := by
  rw [S_eq_root463]
  exact OriginalRow227TriangleRoots14.product463_pos

theorem S_eq_root464 : S 464 = OriginalRow227TriangleRoots14.root464 := rfl

theorem root464_checked : sqrtCheck 464 (S 464) = true := by
  rw [S_eq_root464]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨15, by decide⟩

theorem root464_pos : 0 < (S 464).lo.toRat := by
  rw [S_eq_root464]
  exact OriginalRow227TriangleRoots14.root464_pos

theorem product464_pos : 0 < (roundedMul (-768) shift (S 464)).lo.toRat := by
  rw [S_eq_root464]
  exact OriginalRow227TriangleRoots14.product464_pos

theorem S_eq_root465 : S 465 = OriginalRow227TriangleRoots14.root465 := rfl

theorem root465_checked : sqrtCheck 465 (S 465) = true := by
  rw [S_eq_root465]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨16, by decide⟩

theorem root465_pos : 0 < (S 465).lo.toRat := by
  rw [S_eq_root465]
  exact OriginalRow227TriangleRoots14.root465_pos

theorem product465_pos : 0 < (roundedMul (-768) shift (S 465)).lo.toRat := by
  rw [S_eq_root465]
  exact OriginalRow227TriangleRoots14.product465_pos

theorem S_eq_root466 : S 466 = OriginalRow227TriangleRoots14.root466 := rfl

theorem root466_checked : sqrtCheck 466 (S 466) = true := by
  rw [S_eq_root466]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨17, by decide⟩

theorem root466_pos : 0 < (S 466).lo.toRat := by
  rw [S_eq_root466]
  exact OriginalRow227TriangleRoots14.root466_pos

theorem product466_pos : 0 < (roundedMul (-768) shift (S 466)).lo.toRat := by
  rw [S_eq_root466]
  exact OriginalRow227TriangleRoots14.product466_pos

theorem S_eq_root467 : S 467 = OriginalRow227TriangleRoots14.root467 := rfl

theorem root467_checked : sqrtCheck 467 (S 467) = true := by
  rw [S_eq_root467]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨18, by decide⟩

theorem root467_pos : 0 < (S 467).lo.toRat := by
  rw [S_eq_root467]
  exact OriginalRow227TriangleRoots14.root467_pos

theorem product467_pos : 0 < (roundedMul (-768) shift (S 467)).lo.toRat := by
  rw [S_eq_root467]
  exact OriginalRow227TriangleRoots14.product467_pos

theorem S_eq_root468 : S 468 = OriginalRow227TriangleRoots14.root468 := rfl

theorem root468_checked : sqrtCheck 468 (S 468) = true := by
  rw [S_eq_root468]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨19, by decide⟩

theorem root468_pos : 0 < (S 468).lo.toRat := by
  rw [S_eq_root468]
  exact OriginalRow227TriangleRoots14.root468_pos

theorem product468_pos : 0 < (roundedMul (-768) shift (S 468)).lo.toRat := by
  rw [S_eq_root468]
  exact OriginalRow227TriangleRoots14.product468_pos

theorem S_eq_root469 : S 469 = OriginalRow227TriangleRoots14.root469 := rfl

theorem root469_checked : sqrtCheck 469 (S 469) = true := by
  rw [S_eq_root469]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨20, by decide⟩

theorem root469_pos : 0 < (S 469).lo.toRat := by
  rw [S_eq_root469]
  exact OriginalRow227TriangleRoots14.root469_pos

theorem product469_pos : 0 < (roundedMul (-768) shift (S 469)).lo.toRat := by
  rw [S_eq_root469]
  exact OriginalRow227TriangleRoots14.product469_pos

theorem S_eq_root470 : S 470 = OriginalRow227TriangleRoots14.root470 := rfl

theorem root470_checked : sqrtCheck 470 (S 470) = true := by
  rw [S_eq_root470]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨21, by decide⟩

theorem root470_pos : 0 < (S 470).lo.toRat := by
  rw [S_eq_root470]
  exact OriginalRow227TriangleRoots14.root470_pos

theorem product470_pos : 0 < (roundedMul (-768) shift (S 470)).lo.toRat := by
  rw [S_eq_root470]
  exact OriginalRow227TriangleRoots14.product470_pos

theorem S_eq_root471 : S 471 = OriginalRow227TriangleRoots14.root471 := rfl

theorem root471_checked : sqrtCheck 471 (S 471) = true := by
  rw [S_eq_root471]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨22, by decide⟩

theorem root471_pos : 0 < (S 471).lo.toRat := by
  rw [S_eq_root471]
  exact OriginalRow227TriangleRoots14.root471_pos

theorem product471_pos : 0 < (roundedMul (-768) shift (S 471)).lo.toRat := by
  rw [S_eq_root471]
  exact OriginalRow227TriangleRoots14.product471_pos

theorem S_eq_root472 : S 472 = OriginalRow227TriangleRoots14.root472 := rfl

theorem root472_checked : sqrtCheck 472 (S 472) = true := by
  rw [S_eq_root472]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨23, by decide⟩

theorem root472_pos : 0 < (S 472).lo.toRat := by
  rw [S_eq_root472]
  exact OriginalRow227TriangleRoots14.root472_pos

theorem product472_pos : 0 < (roundedMul (-768) shift (S 472)).lo.toRat := by
  rw [S_eq_root472]
  exact OriginalRow227TriangleRoots14.product472_pos

theorem S_eq_root473 : S 473 = OriginalRow227TriangleRoots14.root473 := rfl

theorem root473_checked : sqrtCheck 473 (S 473) = true := by
  rw [S_eq_root473]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨24, by decide⟩

theorem root473_pos : 0 < (S 473).lo.toRat := by
  rw [S_eq_root473]
  exact OriginalRow227TriangleRoots14.root473_pos

theorem product473_pos : 0 < (roundedMul (-768) shift (S 473)).lo.toRat := by
  rw [S_eq_root473]
  exact OriginalRow227TriangleRoots14.product473_pos

theorem S_eq_root474 : S 474 = OriginalRow227TriangleRoots14.root474 := rfl

theorem root474_checked : sqrtCheck 474 (S 474) = true := by
  rw [S_eq_root474]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨25, by decide⟩

theorem root474_pos : 0 < (S 474).lo.toRat := by
  rw [S_eq_root474]
  exact OriginalRow227TriangleRoots14.root474_pos

theorem product474_pos : 0 < (roundedMul (-768) shift (S 474)).lo.toRat := by
  rw [S_eq_root474]
  exact OriginalRow227TriangleRoots14.product474_pos

theorem S_eq_root475 : S 475 = OriginalRow227TriangleRoots14.root475 := rfl

theorem root475_checked : sqrtCheck 475 (S 475) = true := by
  rw [S_eq_root475]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨26, by decide⟩

theorem root475_pos : 0 < (S 475).lo.toRat := by
  rw [S_eq_root475]
  exact OriginalRow227TriangleRoots14.root475_pos

theorem product475_pos : 0 < (roundedMul (-768) shift (S 475)).lo.toRat := by
  rw [S_eq_root475]
  exact OriginalRow227TriangleRoots14.product475_pos

theorem S_eq_root476 : S 476 = OriginalRow227TriangleRoots14.root476 := rfl

theorem root476_checked : sqrtCheck 476 (S 476) = true := by
  rw [S_eq_root476]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨27, by decide⟩

theorem root476_pos : 0 < (S 476).lo.toRat := by
  rw [S_eq_root476]
  exact OriginalRow227TriangleRoots14.root476_pos

theorem product476_pos : 0 < (roundedMul (-768) shift (S 476)).lo.toRat := by
  rw [S_eq_root476]
  exact OriginalRow227TriangleRoots14.product476_pos

theorem S_eq_root477 : S 477 = OriginalRow227TriangleRoots14.root477 := rfl

theorem root477_checked : sqrtCheck 477 (S 477) = true := by
  rw [S_eq_root477]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨28, by decide⟩

theorem root477_pos : 0 < (S 477).lo.toRat := by
  rw [S_eq_root477]
  exact OriginalRow227TriangleRoots14.root477_pos

theorem product477_pos : 0 < (roundedMul (-768) shift (S 477)).lo.toRat := by
  rw [S_eq_root477]
  exact OriginalRow227TriangleRoots14.product477_pos

theorem S_eq_root478 : S 478 = OriginalRow227TriangleRoots14.root478 := rfl

theorem root478_checked : sqrtCheck 478 (S 478) = true := by
  rw [S_eq_root478]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨29, by decide⟩

theorem root478_pos : 0 < (S 478).lo.toRat := by
  rw [S_eq_root478]
  exact OriginalRow227TriangleRoots14.root478_pos

theorem product478_pos : 0 < (roundedMul (-768) shift (S 478)).lo.toRat := by
  rw [S_eq_root478]
  exact OriginalRow227TriangleRoots14.product478_pos

theorem S_eq_root479 : S 479 = OriginalRow227TriangleRoots14.root479 := rfl

theorem root479_checked : sqrtCheck 479 (S 479) = true := by
  rw [S_eq_root479]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨30, by decide⟩

theorem root479_pos : 0 < (S 479).lo.toRat := by
  rw [S_eq_root479]
  exact OriginalRow227TriangleRoots14.root479_pos

theorem product479_pos : 0 < (roundedMul (-768) shift (S 479)).lo.toRat := by
  rw [S_eq_root479]
  exact OriginalRow227TriangleRoots14.product479_pos

theorem S_eq_root480 : S 480 = OriginalRow227TriangleRoots14.root480 := rfl

theorem root480_checked : sqrtCheck 480 (S 480) = true := by
  rw [S_eq_root480]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots14.entries OriginalRow227TriangleRoots14.checked ⟨31, by decide⟩

theorem root480_pos : 0 < (S 480).lo.toRat := by
  rw [S_eq_root480]
  exact OriginalRow227TriangleRoots14.root480_pos

theorem product480_pos : 0 < (roundedMul (-768) shift (S 480)).lo.toRat := by
  rw [S_eq_root480]
  exact OriginalRow227TriangleRoots14.product480_pos

end Grothe.UpperChaos.OriginalRow227RootBindings14

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root449) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root449_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root449_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product449_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root450) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root450_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root450_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product450_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root451) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root451_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root451_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product451_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root452) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root452_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root452_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product452_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root453) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root453_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root453_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product453_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root454) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root454_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root454_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product454_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root455) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root455_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root455_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product455_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root456) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root456_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root456_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product456_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root457) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root457_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root457_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product457_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root458) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root458_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root458_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product458_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root459) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root459_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root459_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product459_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root460) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root460_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root460_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product460_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root461) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root461_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root461_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product461_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root462) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root462_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root462_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product462_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root463) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root463_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root463_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product463_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root464) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root464_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root464_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product464_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root465) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root465_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root465_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product465_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root466) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root466_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root466_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product466_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root467) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root467_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root467_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product467_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root468) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root468_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root468_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product468_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root469) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root469_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root469_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product469_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root470) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root470_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root470_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product470_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root471) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root471_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root471_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product471_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root472) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root472_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root472_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product472_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root473) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root473_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root473_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product473_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root474) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root474_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root474_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product474_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root475) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root475_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root475_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product475_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root476) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root476_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root476_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product476_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root477) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root477_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root477_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product477_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root478) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root478_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root478_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product478_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root479) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root479_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root479_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product479_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.S_eq_root480) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root480_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.root480_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings14.product480_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
