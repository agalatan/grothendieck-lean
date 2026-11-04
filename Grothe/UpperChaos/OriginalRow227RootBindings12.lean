import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings12
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root385 : S 385 = OriginalRow227TriangleRoots12.root385 := rfl

theorem root385_checked : sqrtCheck 385 (S 385) = true := by
  rw [S_eq_root385]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨0, by decide⟩

theorem root385_pos : 0 < (S 385).lo.toRat := by
  rw [S_eq_root385]
  exact OriginalRow227TriangleRoots12.root385_pos

theorem product385_pos : 0 < (roundedMul (-768) shift (S 385)).lo.toRat := by
  rw [S_eq_root385]
  exact OriginalRow227TriangleRoots12.product385_pos

theorem S_eq_root386 : S 386 = OriginalRow227TriangleRoots12.root386 := rfl

theorem root386_checked : sqrtCheck 386 (S 386) = true := by
  rw [S_eq_root386]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨1, by decide⟩

theorem root386_pos : 0 < (S 386).lo.toRat := by
  rw [S_eq_root386]
  exact OriginalRow227TriangleRoots12.root386_pos

theorem product386_pos : 0 < (roundedMul (-768) shift (S 386)).lo.toRat := by
  rw [S_eq_root386]
  exact OriginalRow227TriangleRoots12.product386_pos

theorem S_eq_root387 : S 387 = OriginalRow227TriangleRoots12.root387 := rfl

theorem root387_checked : sqrtCheck 387 (S 387) = true := by
  rw [S_eq_root387]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨2, by decide⟩

theorem root387_pos : 0 < (S 387).lo.toRat := by
  rw [S_eq_root387]
  exact OriginalRow227TriangleRoots12.root387_pos

theorem product387_pos : 0 < (roundedMul (-768) shift (S 387)).lo.toRat := by
  rw [S_eq_root387]
  exact OriginalRow227TriangleRoots12.product387_pos

theorem S_eq_root388 : S 388 = OriginalRow227TriangleRoots12.root388 := rfl

theorem root388_checked : sqrtCheck 388 (S 388) = true := by
  rw [S_eq_root388]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨3, by decide⟩

theorem root388_pos : 0 < (S 388).lo.toRat := by
  rw [S_eq_root388]
  exact OriginalRow227TriangleRoots12.root388_pos

theorem product388_pos : 0 < (roundedMul (-768) shift (S 388)).lo.toRat := by
  rw [S_eq_root388]
  exact OriginalRow227TriangleRoots12.product388_pos

theorem S_eq_root389 : S 389 = OriginalRow227TriangleRoots12.root389 := rfl

theorem root389_checked : sqrtCheck 389 (S 389) = true := by
  rw [S_eq_root389]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨4, by decide⟩

theorem root389_pos : 0 < (S 389).lo.toRat := by
  rw [S_eq_root389]
  exact OriginalRow227TriangleRoots12.root389_pos

theorem product389_pos : 0 < (roundedMul (-768) shift (S 389)).lo.toRat := by
  rw [S_eq_root389]
  exact OriginalRow227TriangleRoots12.product389_pos

theorem S_eq_root390 : S 390 = OriginalRow227TriangleRoots12.root390 := rfl

theorem root390_checked : sqrtCheck 390 (S 390) = true := by
  rw [S_eq_root390]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨5, by decide⟩

theorem root390_pos : 0 < (S 390).lo.toRat := by
  rw [S_eq_root390]
  exact OriginalRow227TriangleRoots12.root390_pos

theorem product390_pos : 0 < (roundedMul (-768) shift (S 390)).lo.toRat := by
  rw [S_eq_root390]
  exact OriginalRow227TriangleRoots12.product390_pos

theorem S_eq_root391 : S 391 = OriginalRow227TriangleRoots12.root391 := rfl

theorem root391_checked : sqrtCheck 391 (S 391) = true := by
  rw [S_eq_root391]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨6, by decide⟩

theorem root391_pos : 0 < (S 391).lo.toRat := by
  rw [S_eq_root391]
  exact OriginalRow227TriangleRoots12.root391_pos

theorem product391_pos : 0 < (roundedMul (-768) shift (S 391)).lo.toRat := by
  rw [S_eq_root391]
  exact OriginalRow227TriangleRoots12.product391_pos

theorem S_eq_root392 : S 392 = OriginalRow227TriangleRoots12.root392 := rfl

theorem root392_checked : sqrtCheck 392 (S 392) = true := by
  rw [S_eq_root392]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨7, by decide⟩

theorem root392_pos : 0 < (S 392).lo.toRat := by
  rw [S_eq_root392]
  exact OriginalRow227TriangleRoots12.root392_pos

theorem product392_pos : 0 < (roundedMul (-768) shift (S 392)).lo.toRat := by
  rw [S_eq_root392]
  exact OriginalRow227TriangleRoots12.product392_pos

theorem S_eq_root393 : S 393 = OriginalRow227TriangleRoots12.root393 := rfl

theorem root393_checked : sqrtCheck 393 (S 393) = true := by
  rw [S_eq_root393]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨8, by decide⟩

theorem root393_pos : 0 < (S 393).lo.toRat := by
  rw [S_eq_root393]
  exact OriginalRow227TriangleRoots12.root393_pos

theorem product393_pos : 0 < (roundedMul (-768) shift (S 393)).lo.toRat := by
  rw [S_eq_root393]
  exact OriginalRow227TriangleRoots12.product393_pos

theorem S_eq_root394 : S 394 = OriginalRow227TriangleRoots12.root394 := rfl

theorem root394_checked : sqrtCheck 394 (S 394) = true := by
  rw [S_eq_root394]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨9, by decide⟩

theorem root394_pos : 0 < (S 394).lo.toRat := by
  rw [S_eq_root394]
  exact OriginalRow227TriangleRoots12.root394_pos

theorem product394_pos : 0 < (roundedMul (-768) shift (S 394)).lo.toRat := by
  rw [S_eq_root394]
  exact OriginalRow227TriangleRoots12.product394_pos

theorem S_eq_root395 : S 395 = OriginalRow227TriangleRoots12.root395 := rfl

theorem root395_checked : sqrtCheck 395 (S 395) = true := by
  rw [S_eq_root395]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨10, by decide⟩

theorem root395_pos : 0 < (S 395).lo.toRat := by
  rw [S_eq_root395]
  exact OriginalRow227TriangleRoots12.root395_pos

theorem product395_pos : 0 < (roundedMul (-768) shift (S 395)).lo.toRat := by
  rw [S_eq_root395]
  exact OriginalRow227TriangleRoots12.product395_pos

theorem S_eq_root396 : S 396 = OriginalRow227TriangleRoots12.root396 := rfl

theorem root396_checked : sqrtCheck 396 (S 396) = true := by
  rw [S_eq_root396]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨11, by decide⟩

theorem root396_pos : 0 < (S 396).lo.toRat := by
  rw [S_eq_root396]
  exact OriginalRow227TriangleRoots12.root396_pos

theorem product396_pos : 0 < (roundedMul (-768) shift (S 396)).lo.toRat := by
  rw [S_eq_root396]
  exact OriginalRow227TriangleRoots12.product396_pos

theorem S_eq_root397 : S 397 = OriginalRow227TriangleRoots12.root397 := rfl

theorem root397_checked : sqrtCheck 397 (S 397) = true := by
  rw [S_eq_root397]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨12, by decide⟩

theorem root397_pos : 0 < (S 397).lo.toRat := by
  rw [S_eq_root397]
  exact OriginalRow227TriangleRoots12.root397_pos

theorem product397_pos : 0 < (roundedMul (-768) shift (S 397)).lo.toRat := by
  rw [S_eq_root397]
  exact OriginalRow227TriangleRoots12.product397_pos

theorem S_eq_root398 : S 398 = OriginalRow227TriangleRoots12.root398 := rfl

theorem root398_checked : sqrtCheck 398 (S 398) = true := by
  rw [S_eq_root398]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨13, by decide⟩

theorem root398_pos : 0 < (S 398).lo.toRat := by
  rw [S_eq_root398]
  exact OriginalRow227TriangleRoots12.root398_pos

theorem product398_pos : 0 < (roundedMul (-768) shift (S 398)).lo.toRat := by
  rw [S_eq_root398]
  exact OriginalRow227TriangleRoots12.product398_pos

theorem S_eq_root399 : S 399 = OriginalRow227TriangleRoots12.root399 := rfl

theorem root399_checked : sqrtCheck 399 (S 399) = true := by
  rw [S_eq_root399]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨14, by decide⟩

theorem root399_pos : 0 < (S 399).lo.toRat := by
  rw [S_eq_root399]
  exact OriginalRow227TriangleRoots12.root399_pos

theorem product399_pos : 0 < (roundedMul (-768) shift (S 399)).lo.toRat := by
  rw [S_eq_root399]
  exact OriginalRow227TriangleRoots12.product399_pos

theorem S_eq_root400 : S 400 = OriginalRow227TriangleRoots12.root400 := rfl

theorem root400_checked : sqrtCheck 400 (S 400) = true := by
  rw [S_eq_root400]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨15, by decide⟩

theorem root400_pos : 0 < (S 400).lo.toRat := by
  rw [S_eq_root400]
  exact OriginalRow227TriangleRoots12.root400_pos

theorem product400_pos : 0 < (roundedMul (-768) shift (S 400)).lo.toRat := by
  rw [S_eq_root400]
  exact OriginalRow227TriangleRoots12.product400_pos

theorem S_eq_root401 : S 401 = OriginalRow227TriangleRoots12.root401 := rfl

theorem root401_checked : sqrtCheck 401 (S 401) = true := by
  rw [S_eq_root401]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨16, by decide⟩

theorem root401_pos : 0 < (S 401).lo.toRat := by
  rw [S_eq_root401]
  exact OriginalRow227TriangleRoots12.root401_pos

theorem product401_pos : 0 < (roundedMul (-768) shift (S 401)).lo.toRat := by
  rw [S_eq_root401]
  exact OriginalRow227TriangleRoots12.product401_pos

theorem S_eq_root402 : S 402 = OriginalRow227TriangleRoots12.root402 := rfl

theorem root402_checked : sqrtCheck 402 (S 402) = true := by
  rw [S_eq_root402]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨17, by decide⟩

theorem root402_pos : 0 < (S 402).lo.toRat := by
  rw [S_eq_root402]
  exact OriginalRow227TriangleRoots12.root402_pos

theorem product402_pos : 0 < (roundedMul (-768) shift (S 402)).lo.toRat := by
  rw [S_eq_root402]
  exact OriginalRow227TriangleRoots12.product402_pos

theorem S_eq_root403 : S 403 = OriginalRow227TriangleRoots12.root403 := rfl

theorem root403_checked : sqrtCheck 403 (S 403) = true := by
  rw [S_eq_root403]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨18, by decide⟩

theorem root403_pos : 0 < (S 403).lo.toRat := by
  rw [S_eq_root403]
  exact OriginalRow227TriangleRoots12.root403_pos

theorem product403_pos : 0 < (roundedMul (-768) shift (S 403)).lo.toRat := by
  rw [S_eq_root403]
  exact OriginalRow227TriangleRoots12.product403_pos

theorem S_eq_root404 : S 404 = OriginalRow227TriangleRoots12.root404 := rfl

theorem root404_checked : sqrtCheck 404 (S 404) = true := by
  rw [S_eq_root404]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨19, by decide⟩

theorem root404_pos : 0 < (S 404).lo.toRat := by
  rw [S_eq_root404]
  exact OriginalRow227TriangleRoots12.root404_pos

theorem product404_pos : 0 < (roundedMul (-768) shift (S 404)).lo.toRat := by
  rw [S_eq_root404]
  exact OriginalRow227TriangleRoots12.product404_pos

theorem S_eq_root405 : S 405 = OriginalRow227TriangleRoots12.root405 := rfl

theorem root405_checked : sqrtCheck 405 (S 405) = true := by
  rw [S_eq_root405]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨20, by decide⟩

theorem root405_pos : 0 < (S 405).lo.toRat := by
  rw [S_eq_root405]
  exact OriginalRow227TriangleRoots12.root405_pos

theorem product405_pos : 0 < (roundedMul (-768) shift (S 405)).lo.toRat := by
  rw [S_eq_root405]
  exact OriginalRow227TriangleRoots12.product405_pos

theorem S_eq_root406 : S 406 = OriginalRow227TriangleRoots12.root406 := rfl

theorem root406_checked : sqrtCheck 406 (S 406) = true := by
  rw [S_eq_root406]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨21, by decide⟩

theorem root406_pos : 0 < (S 406).lo.toRat := by
  rw [S_eq_root406]
  exact OriginalRow227TriangleRoots12.root406_pos

theorem product406_pos : 0 < (roundedMul (-768) shift (S 406)).lo.toRat := by
  rw [S_eq_root406]
  exact OriginalRow227TriangleRoots12.product406_pos

theorem S_eq_root407 : S 407 = OriginalRow227TriangleRoots12.root407 := rfl

theorem root407_checked : sqrtCheck 407 (S 407) = true := by
  rw [S_eq_root407]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨22, by decide⟩

theorem root407_pos : 0 < (S 407).lo.toRat := by
  rw [S_eq_root407]
  exact OriginalRow227TriangleRoots12.root407_pos

theorem product407_pos : 0 < (roundedMul (-768) shift (S 407)).lo.toRat := by
  rw [S_eq_root407]
  exact OriginalRow227TriangleRoots12.product407_pos

theorem S_eq_root408 : S 408 = OriginalRow227TriangleRoots12.root408 := rfl

theorem root408_checked : sqrtCheck 408 (S 408) = true := by
  rw [S_eq_root408]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨23, by decide⟩

theorem root408_pos : 0 < (S 408).lo.toRat := by
  rw [S_eq_root408]
  exact OriginalRow227TriangleRoots12.root408_pos

theorem product408_pos : 0 < (roundedMul (-768) shift (S 408)).lo.toRat := by
  rw [S_eq_root408]
  exact OriginalRow227TriangleRoots12.product408_pos

theorem S_eq_root409 : S 409 = OriginalRow227TriangleRoots12.root409 := rfl

theorem root409_checked : sqrtCheck 409 (S 409) = true := by
  rw [S_eq_root409]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨24, by decide⟩

theorem root409_pos : 0 < (S 409).lo.toRat := by
  rw [S_eq_root409]
  exact OriginalRow227TriangleRoots12.root409_pos

theorem product409_pos : 0 < (roundedMul (-768) shift (S 409)).lo.toRat := by
  rw [S_eq_root409]
  exact OriginalRow227TriangleRoots12.product409_pos

theorem S_eq_root410 : S 410 = OriginalRow227TriangleRoots12.root410 := rfl

theorem root410_checked : sqrtCheck 410 (S 410) = true := by
  rw [S_eq_root410]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨25, by decide⟩

theorem root410_pos : 0 < (S 410).lo.toRat := by
  rw [S_eq_root410]
  exact OriginalRow227TriangleRoots12.root410_pos

theorem product410_pos : 0 < (roundedMul (-768) shift (S 410)).lo.toRat := by
  rw [S_eq_root410]
  exact OriginalRow227TriangleRoots12.product410_pos

theorem S_eq_root411 : S 411 = OriginalRow227TriangleRoots12.root411 := rfl

theorem root411_checked : sqrtCheck 411 (S 411) = true := by
  rw [S_eq_root411]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨26, by decide⟩

theorem root411_pos : 0 < (S 411).lo.toRat := by
  rw [S_eq_root411]
  exact OriginalRow227TriangleRoots12.root411_pos

theorem product411_pos : 0 < (roundedMul (-768) shift (S 411)).lo.toRat := by
  rw [S_eq_root411]
  exact OriginalRow227TriangleRoots12.product411_pos

theorem S_eq_root412 : S 412 = OriginalRow227TriangleRoots12.root412 := rfl

theorem root412_checked : sqrtCheck 412 (S 412) = true := by
  rw [S_eq_root412]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨27, by decide⟩

theorem root412_pos : 0 < (S 412).lo.toRat := by
  rw [S_eq_root412]
  exact OriginalRow227TriangleRoots12.root412_pos

theorem product412_pos : 0 < (roundedMul (-768) shift (S 412)).lo.toRat := by
  rw [S_eq_root412]
  exact OriginalRow227TriangleRoots12.product412_pos

theorem S_eq_root413 : S 413 = OriginalRow227TriangleRoots12.root413 := rfl

theorem root413_checked : sqrtCheck 413 (S 413) = true := by
  rw [S_eq_root413]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨28, by decide⟩

theorem root413_pos : 0 < (S 413).lo.toRat := by
  rw [S_eq_root413]
  exact OriginalRow227TriangleRoots12.root413_pos

theorem product413_pos : 0 < (roundedMul (-768) shift (S 413)).lo.toRat := by
  rw [S_eq_root413]
  exact OriginalRow227TriangleRoots12.product413_pos

theorem S_eq_root414 : S 414 = OriginalRow227TriangleRoots12.root414 := rfl

theorem root414_checked : sqrtCheck 414 (S 414) = true := by
  rw [S_eq_root414]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨29, by decide⟩

theorem root414_pos : 0 < (S 414).lo.toRat := by
  rw [S_eq_root414]
  exact OriginalRow227TriangleRoots12.root414_pos

theorem product414_pos : 0 < (roundedMul (-768) shift (S 414)).lo.toRat := by
  rw [S_eq_root414]
  exact OriginalRow227TriangleRoots12.product414_pos

theorem S_eq_root415 : S 415 = OriginalRow227TriangleRoots12.root415 := rfl

theorem root415_checked : sqrtCheck 415 (S 415) = true := by
  rw [S_eq_root415]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨30, by decide⟩

theorem root415_pos : 0 < (S 415).lo.toRat := by
  rw [S_eq_root415]
  exact OriginalRow227TriangleRoots12.root415_pos

theorem product415_pos : 0 < (roundedMul (-768) shift (S 415)).lo.toRat := by
  rw [S_eq_root415]
  exact OriginalRow227TriangleRoots12.product415_pos

theorem S_eq_root416 : S 416 = OriginalRow227TriangleRoots12.root416 := rfl

theorem root416_checked : sqrtCheck 416 (S 416) = true := by
  rw [S_eq_root416]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots12.entries OriginalRow227TriangleRoots12.checked ⟨31, by decide⟩

theorem root416_pos : 0 < (S 416).lo.toRat := by
  rw [S_eq_root416]
  exact OriginalRow227TriangleRoots12.root416_pos

theorem product416_pos : 0 < (roundedMul (-768) shift (S 416)).lo.toRat := by
  rw [S_eq_root416]
  exact OriginalRow227TriangleRoots12.product416_pos

end Grothe.UpperChaos.OriginalRow227RootBindings12

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root385) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root385_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root385_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product385_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root386) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root386_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root386_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product386_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root387) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root387_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root387_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product387_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root388) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root388_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root388_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product388_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root389) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root389_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root389_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product389_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root390) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root390_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root390_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product390_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root391) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root391_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root391_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product391_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root392) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root392_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root392_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product392_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root393) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root393_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root393_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product393_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root394) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root394_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root394_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product394_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root395) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root395_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root395_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product395_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root396) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root396_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root396_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product396_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root397) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root397_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root397_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product397_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root398) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root398_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root398_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product398_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root399) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root399_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root399_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product399_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root400) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root400_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root400_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product400_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root401) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root401_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root401_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product401_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root402) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root402_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root402_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product402_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root403) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root403_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root403_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product403_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root404) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root404_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root404_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product404_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root405) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root405_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root405_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product405_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root406) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root406_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root406_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product406_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root407) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root407_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root407_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product407_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root408) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root408_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root408_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product408_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root409) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root409_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root409_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product409_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root410) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root410_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root410_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product410_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root411) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root411_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root411_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product411_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root412) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root412_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root412_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product412_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root413) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root413_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root413_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product413_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root414) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root414_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root414_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product414_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root415) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root415_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root415_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product415_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.S_eq_root416) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root416_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.root416_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings12.product416_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
