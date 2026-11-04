import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings13
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root417 : S 417 = OriginalRow227TriangleRoots13.root417 := rfl

theorem root417_checked : sqrtCheck 417 (S 417) = true := by
  rw [S_eq_root417]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨0, by decide⟩

theorem root417_pos : 0 < (S 417).lo.toRat := by
  rw [S_eq_root417]
  exact OriginalRow227TriangleRoots13.root417_pos

theorem product417_pos : 0 < (roundedMul (-768) shift (S 417)).lo.toRat := by
  rw [S_eq_root417]
  exact OriginalRow227TriangleRoots13.product417_pos

theorem S_eq_root418 : S 418 = OriginalRow227TriangleRoots13.root418 := rfl

theorem root418_checked : sqrtCheck 418 (S 418) = true := by
  rw [S_eq_root418]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨1, by decide⟩

theorem root418_pos : 0 < (S 418).lo.toRat := by
  rw [S_eq_root418]
  exact OriginalRow227TriangleRoots13.root418_pos

theorem product418_pos : 0 < (roundedMul (-768) shift (S 418)).lo.toRat := by
  rw [S_eq_root418]
  exact OriginalRow227TriangleRoots13.product418_pos

theorem S_eq_root419 : S 419 = OriginalRow227TriangleRoots13.root419 := rfl

theorem root419_checked : sqrtCheck 419 (S 419) = true := by
  rw [S_eq_root419]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨2, by decide⟩

theorem root419_pos : 0 < (S 419).lo.toRat := by
  rw [S_eq_root419]
  exact OriginalRow227TriangleRoots13.root419_pos

theorem product419_pos : 0 < (roundedMul (-768) shift (S 419)).lo.toRat := by
  rw [S_eq_root419]
  exact OriginalRow227TriangleRoots13.product419_pos

theorem S_eq_root420 : S 420 = OriginalRow227TriangleRoots13.root420 := rfl

theorem root420_checked : sqrtCheck 420 (S 420) = true := by
  rw [S_eq_root420]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨3, by decide⟩

theorem root420_pos : 0 < (S 420).lo.toRat := by
  rw [S_eq_root420]
  exact OriginalRow227TriangleRoots13.root420_pos

theorem product420_pos : 0 < (roundedMul (-768) shift (S 420)).lo.toRat := by
  rw [S_eq_root420]
  exact OriginalRow227TriangleRoots13.product420_pos

theorem S_eq_root421 : S 421 = OriginalRow227TriangleRoots13.root421 := rfl

theorem root421_checked : sqrtCheck 421 (S 421) = true := by
  rw [S_eq_root421]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨4, by decide⟩

theorem root421_pos : 0 < (S 421).lo.toRat := by
  rw [S_eq_root421]
  exact OriginalRow227TriangleRoots13.root421_pos

theorem product421_pos : 0 < (roundedMul (-768) shift (S 421)).lo.toRat := by
  rw [S_eq_root421]
  exact OriginalRow227TriangleRoots13.product421_pos

theorem S_eq_root422 : S 422 = OriginalRow227TriangleRoots13.root422 := rfl

theorem root422_checked : sqrtCheck 422 (S 422) = true := by
  rw [S_eq_root422]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨5, by decide⟩

theorem root422_pos : 0 < (S 422).lo.toRat := by
  rw [S_eq_root422]
  exact OriginalRow227TriangleRoots13.root422_pos

theorem product422_pos : 0 < (roundedMul (-768) shift (S 422)).lo.toRat := by
  rw [S_eq_root422]
  exact OriginalRow227TriangleRoots13.product422_pos

theorem S_eq_root423 : S 423 = OriginalRow227TriangleRoots13.root423 := rfl

theorem root423_checked : sqrtCheck 423 (S 423) = true := by
  rw [S_eq_root423]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨6, by decide⟩

theorem root423_pos : 0 < (S 423).lo.toRat := by
  rw [S_eq_root423]
  exact OriginalRow227TriangleRoots13.root423_pos

theorem product423_pos : 0 < (roundedMul (-768) shift (S 423)).lo.toRat := by
  rw [S_eq_root423]
  exact OriginalRow227TriangleRoots13.product423_pos

theorem S_eq_root424 : S 424 = OriginalRow227TriangleRoots13.root424 := rfl

theorem root424_checked : sqrtCheck 424 (S 424) = true := by
  rw [S_eq_root424]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨7, by decide⟩

theorem root424_pos : 0 < (S 424).lo.toRat := by
  rw [S_eq_root424]
  exact OriginalRow227TriangleRoots13.root424_pos

theorem product424_pos : 0 < (roundedMul (-768) shift (S 424)).lo.toRat := by
  rw [S_eq_root424]
  exact OriginalRow227TriangleRoots13.product424_pos

theorem S_eq_root425 : S 425 = OriginalRow227TriangleRoots13.root425 := rfl

theorem root425_checked : sqrtCheck 425 (S 425) = true := by
  rw [S_eq_root425]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨8, by decide⟩

theorem root425_pos : 0 < (S 425).lo.toRat := by
  rw [S_eq_root425]
  exact OriginalRow227TriangleRoots13.root425_pos

theorem product425_pos : 0 < (roundedMul (-768) shift (S 425)).lo.toRat := by
  rw [S_eq_root425]
  exact OriginalRow227TriangleRoots13.product425_pos

theorem S_eq_root426 : S 426 = OriginalRow227TriangleRoots13.root426 := rfl

theorem root426_checked : sqrtCheck 426 (S 426) = true := by
  rw [S_eq_root426]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨9, by decide⟩

theorem root426_pos : 0 < (S 426).lo.toRat := by
  rw [S_eq_root426]
  exact OriginalRow227TriangleRoots13.root426_pos

theorem product426_pos : 0 < (roundedMul (-768) shift (S 426)).lo.toRat := by
  rw [S_eq_root426]
  exact OriginalRow227TriangleRoots13.product426_pos

theorem S_eq_root427 : S 427 = OriginalRow227TriangleRoots13.root427 := rfl

theorem root427_checked : sqrtCheck 427 (S 427) = true := by
  rw [S_eq_root427]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨10, by decide⟩

theorem root427_pos : 0 < (S 427).lo.toRat := by
  rw [S_eq_root427]
  exact OriginalRow227TriangleRoots13.root427_pos

theorem product427_pos : 0 < (roundedMul (-768) shift (S 427)).lo.toRat := by
  rw [S_eq_root427]
  exact OriginalRow227TriangleRoots13.product427_pos

theorem S_eq_root428 : S 428 = OriginalRow227TriangleRoots13.root428 := rfl

theorem root428_checked : sqrtCheck 428 (S 428) = true := by
  rw [S_eq_root428]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨11, by decide⟩

theorem root428_pos : 0 < (S 428).lo.toRat := by
  rw [S_eq_root428]
  exact OriginalRow227TriangleRoots13.root428_pos

theorem product428_pos : 0 < (roundedMul (-768) shift (S 428)).lo.toRat := by
  rw [S_eq_root428]
  exact OriginalRow227TriangleRoots13.product428_pos

theorem S_eq_root429 : S 429 = OriginalRow227TriangleRoots13.root429 := rfl

theorem root429_checked : sqrtCheck 429 (S 429) = true := by
  rw [S_eq_root429]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨12, by decide⟩

theorem root429_pos : 0 < (S 429).lo.toRat := by
  rw [S_eq_root429]
  exact OriginalRow227TriangleRoots13.root429_pos

theorem product429_pos : 0 < (roundedMul (-768) shift (S 429)).lo.toRat := by
  rw [S_eq_root429]
  exact OriginalRow227TriangleRoots13.product429_pos

theorem S_eq_root430 : S 430 = OriginalRow227TriangleRoots13.root430 := rfl

theorem root430_checked : sqrtCheck 430 (S 430) = true := by
  rw [S_eq_root430]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨13, by decide⟩

theorem root430_pos : 0 < (S 430).lo.toRat := by
  rw [S_eq_root430]
  exact OriginalRow227TriangleRoots13.root430_pos

theorem product430_pos : 0 < (roundedMul (-768) shift (S 430)).lo.toRat := by
  rw [S_eq_root430]
  exact OriginalRow227TriangleRoots13.product430_pos

theorem S_eq_root431 : S 431 = OriginalRow227TriangleRoots13.root431 := rfl

theorem root431_checked : sqrtCheck 431 (S 431) = true := by
  rw [S_eq_root431]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨14, by decide⟩

theorem root431_pos : 0 < (S 431).lo.toRat := by
  rw [S_eq_root431]
  exact OriginalRow227TriangleRoots13.root431_pos

theorem product431_pos : 0 < (roundedMul (-768) shift (S 431)).lo.toRat := by
  rw [S_eq_root431]
  exact OriginalRow227TriangleRoots13.product431_pos

theorem S_eq_root432 : S 432 = OriginalRow227TriangleRoots13.root432 := rfl

theorem root432_checked : sqrtCheck 432 (S 432) = true := by
  rw [S_eq_root432]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨15, by decide⟩

theorem root432_pos : 0 < (S 432).lo.toRat := by
  rw [S_eq_root432]
  exact OriginalRow227TriangleRoots13.root432_pos

theorem product432_pos : 0 < (roundedMul (-768) shift (S 432)).lo.toRat := by
  rw [S_eq_root432]
  exact OriginalRow227TriangleRoots13.product432_pos

theorem S_eq_root433 : S 433 = OriginalRow227TriangleRoots13.root433 := rfl

theorem root433_checked : sqrtCheck 433 (S 433) = true := by
  rw [S_eq_root433]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨16, by decide⟩

theorem root433_pos : 0 < (S 433).lo.toRat := by
  rw [S_eq_root433]
  exact OriginalRow227TriangleRoots13.root433_pos

theorem product433_pos : 0 < (roundedMul (-768) shift (S 433)).lo.toRat := by
  rw [S_eq_root433]
  exact OriginalRow227TriangleRoots13.product433_pos

theorem S_eq_root434 : S 434 = OriginalRow227TriangleRoots13.root434 := rfl

theorem root434_checked : sqrtCheck 434 (S 434) = true := by
  rw [S_eq_root434]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨17, by decide⟩

theorem root434_pos : 0 < (S 434).lo.toRat := by
  rw [S_eq_root434]
  exact OriginalRow227TriangleRoots13.root434_pos

theorem product434_pos : 0 < (roundedMul (-768) shift (S 434)).lo.toRat := by
  rw [S_eq_root434]
  exact OriginalRow227TriangleRoots13.product434_pos

theorem S_eq_root435 : S 435 = OriginalRow227TriangleRoots13.root435 := rfl

theorem root435_checked : sqrtCheck 435 (S 435) = true := by
  rw [S_eq_root435]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨18, by decide⟩

theorem root435_pos : 0 < (S 435).lo.toRat := by
  rw [S_eq_root435]
  exact OriginalRow227TriangleRoots13.root435_pos

theorem product435_pos : 0 < (roundedMul (-768) shift (S 435)).lo.toRat := by
  rw [S_eq_root435]
  exact OriginalRow227TriangleRoots13.product435_pos

theorem S_eq_root436 : S 436 = OriginalRow227TriangleRoots13.root436 := rfl

theorem root436_checked : sqrtCheck 436 (S 436) = true := by
  rw [S_eq_root436]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨19, by decide⟩

theorem root436_pos : 0 < (S 436).lo.toRat := by
  rw [S_eq_root436]
  exact OriginalRow227TriangleRoots13.root436_pos

theorem product436_pos : 0 < (roundedMul (-768) shift (S 436)).lo.toRat := by
  rw [S_eq_root436]
  exact OriginalRow227TriangleRoots13.product436_pos

theorem S_eq_root437 : S 437 = OriginalRow227TriangleRoots13.root437 := rfl

theorem root437_checked : sqrtCheck 437 (S 437) = true := by
  rw [S_eq_root437]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨20, by decide⟩

theorem root437_pos : 0 < (S 437).lo.toRat := by
  rw [S_eq_root437]
  exact OriginalRow227TriangleRoots13.root437_pos

theorem product437_pos : 0 < (roundedMul (-768) shift (S 437)).lo.toRat := by
  rw [S_eq_root437]
  exact OriginalRow227TriangleRoots13.product437_pos

theorem S_eq_root438 : S 438 = OriginalRow227TriangleRoots13.root438 := rfl

theorem root438_checked : sqrtCheck 438 (S 438) = true := by
  rw [S_eq_root438]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨21, by decide⟩

theorem root438_pos : 0 < (S 438).lo.toRat := by
  rw [S_eq_root438]
  exact OriginalRow227TriangleRoots13.root438_pos

theorem product438_pos : 0 < (roundedMul (-768) shift (S 438)).lo.toRat := by
  rw [S_eq_root438]
  exact OriginalRow227TriangleRoots13.product438_pos

theorem S_eq_root439 : S 439 = OriginalRow227TriangleRoots13.root439 := rfl

theorem root439_checked : sqrtCheck 439 (S 439) = true := by
  rw [S_eq_root439]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨22, by decide⟩

theorem root439_pos : 0 < (S 439).lo.toRat := by
  rw [S_eq_root439]
  exact OriginalRow227TriangleRoots13.root439_pos

theorem product439_pos : 0 < (roundedMul (-768) shift (S 439)).lo.toRat := by
  rw [S_eq_root439]
  exact OriginalRow227TriangleRoots13.product439_pos

theorem S_eq_root440 : S 440 = OriginalRow227TriangleRoots13.root440 := rfl

theorem root440_checked : sqrtCheck 440 (S 440) = true := by
  rw [S_eq_root440]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨23, by decide⟩

theorem root440_pos : 0 < (S 440).lo.toRat := by
  rw [S_eq_root440]
  exact OriginalRow227TriangleRoots13.root440_pos

theorem product440_pos : 0 < (roundedMul (-768) shift (S 440)).lo.toRat := by
  rw [S_eq_root440]
  exact OriginalRow227TriangleRoots13.product440_pos

theorem S_eq_root441 : S 441 = OriginalRow227TriangleRoots13.root441 := rfl

theorem root441_checked : sqrtCheck 441 (S 441) = true := by
  rw [S_eq_root441]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨24, by decide⟩

theorem root441_pos : 0 < (S 441).lo.toRat := by
  rw [S_eq_root441]
  exact OriginalRow227TriangleRoots13.root441_pos

theorem product441_pos : 0 < (roundedMul (-768) shift (S 441)).lo.toRat := by
  rw [S_eq_root441]
  exact OriginalRow227TriangleRoots13.product441_pos

theorem S_eq_root442 : S 442 = OriginalRow227TriangleRoots13.root442 := rfl

theorem root442_checked : sqrtCheck 442 (S 442) = true := by
  rw [S_eq_root442]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨25, by decide⟩

theorem root442_pos : 0 < (S 442).lo.toRat := by
  rw [S_eq_root442]
  exact OriginalRow227TriangleRoots13.root442_pos

theorem product442_pos : 0 < (roundedMul (-768) shift (S 442)).lo.toRat := by
  rw [S_eq_root442]
  exact OriginalRow227TriangleRoots13.product442_pos

theorem S_eq_root443 : S 443 = OriginalRow227TriangleRoots13.root443 := rfl

theorem root443_checked : sqrtCheck 443 (S 443) = true := by
  rw [S_eq_root443]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨26, by decide⟩

theorem root443_pos : 0 < (S 443).lo.toRat := by
  rw [S_eq_root443]
  exact OriginalRow227TriangleRoots13.root443_pos

theorem product443_pos : 0 < (roundedMul (-768) shift (S 443)).lo.toRat := by
  rw [S_eq_root443]
  exact OriginalRow227TriangleRoots13.product443_pos

theorem S_eq_root444 : S 444 = OriginalRow227TriangleRoots13.root444 := rfl

theorem root444_checked : sqrtCheck 444 (S 444) = true := by
  rw [S_eq_root444]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨27, by decide⟩

theorem root444_pos : 0 < (S 444).lo.toRat := by
  rw [S_eq_root444]
  exact OriginalRow227TriangleRoots13.root444_pos

theorem product444_pos : 0 < (roundedMul (-768) shift (S 444)).lo.toRat := by
  rw [S_eq_root444]
  exact OriginalRow227TriangleRoots13.product444_pos

theorem S_eq_root445 : S 445 = OriginalRow227TriangleRoots13.root445 := rfl

theorem root445_checked : sqrtCheck 445 (S 445) = true := by
  rw [S_eq_root445]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨28, by decide⟩

theorem root445_pos : 0 < (S 445).lo.toRat := by
  rw [S_eq_root445]
  exact OriginalRow227TriangleRoots13.root445_pos

theorem product445_pos : 0 < (roundedMul (-768) shift (S 445)).lo.toRat := by
  rw [S_eq_root445]
  exact OriginalRow227TriangleRoots13.product445_pos

theorem S_eq_root446 : S 446 = OriginalRow227TriangleRoots13.root446 := rfl

theorem root446_checked : sqrtCheck 446 (S 446) = true := by
  rw [S_eq_root446]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨29, by decide⟩

theorem root446_pos : 0 < (S 446).lo.toRat := by
  rw [S_eq_root446]
  exact OriginalRow227TriangleRoots13.root446_pos

theorem product446_pos : 0 < (roundedMul (-768) shift (S 446)).lo.toRat := by
  rw [S_eq_root446]
  exact OriginalRow227TriangleRoots13.product446_pos

theorem S_eq_root447 : S 447 = OriginalRow227TriangleRoots13.root447 := rfl

theorem root447_checked : sqrtCheck 447 (S 447) = true := by
  rw [S_eq_root447]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨30, by decide⟩

theorem root447_pos : 0 < (S 447).lo.toRat := by
  rw [S_eq_root447]
  exact OriginalRow227TriangleRoots13.root447_pos

theorem product447_pos : 0 < (roundedMul (-768) shift (S 447)).lo.toRat := by
  rw [S_eq_root447]
  exact OriginalRow227TriangleRoots13.product447_pos

theorem S_eq_root448 : S 448 = OriginalRow227TriangleRoots13.root448 := rfl

theorem root448_checked : sqrtCheck 448 (S 448) = true := by
  rw [S_eq_root448]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots13.entries OriginalRow227TriangleRoots13.checked ⟨31, by decide⟩

theorem root448_pos : 0 < (S 448).lo.toRat := by
  rw [S_eq_root448]
  exact OriginalRow227TriangleRoots13.root448_pos

theorem product448_pos : 0 < (roundedMul (-768) shift (S 448)).lo.toRat := by
  rw [S_eq_root448]
  exact OriginalRow227TriangleRoots13.product448_pos

end Grothe.UpperChaos.OriginalRow227RootBindings13

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root417) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root417_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root417_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product417_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root418) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root418_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root418_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product418_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root419) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root419_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root419_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product419_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root420) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root420_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root420_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product420_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root421) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root421_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root421_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product421_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root422) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root422_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root422_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product422_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root423) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root423_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root423_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product423_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root424) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root424_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root424_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product424_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root425) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root425_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root425_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product425_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root426) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root426_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root426_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product426_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root427) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root427_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root427_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product427_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root428) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root428_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root428_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product428_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root429) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root429_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root429_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product429_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root430) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root430_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root430_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product430_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root431) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root431_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root431_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product431_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root432) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root432_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root432_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product432_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root433) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root433_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root433_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product433_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root434) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root434_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root434_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product434_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root435) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root435_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root435_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product435_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root436) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root436_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root436_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product436_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root437) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root437_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root437_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product437_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root438) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root438_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root438_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product438_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root439) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root439_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root439_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product439_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root440) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root440_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root440_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product440_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root441) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root441_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root441_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product441_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root442) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root442_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root442_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product442_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root443) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root443_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root443_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product443_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root444) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root444_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root444_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product444_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root445) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root445_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root445_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product445_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root446) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root446_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root446_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product446_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root447) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root447_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root447_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product447_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.S_eq_root448) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root448_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.root448_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings13.product448_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
