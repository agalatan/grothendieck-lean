import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings15
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root481 : S 481 = OriginalRow227TriangleRoots15.root481 := rfl

theorem root481_checked : sqrtCheck 481 (S 481) = true := by
  rw [S_eq_root481]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨0, by decide⟩

theorem root481_pos : 0 < (S 481).lo.toRat := by
  rw [S_eq_root481]
  exact OriginalRow227TriangleRoots15.root481_pos

theorem product481_pos : 0 < (roundedMul (-768) shift (S 481)).lo.toRat := by
  rw [S_eq_root481]
  exact OriginalRow227TriangleRoots15.product481_pos

theorem S_eq_root482 : S 482 = OriginalRow227TriangleRoots15.root482 := rfl

theorem root482_checked : sqrtCheck 482 (S 482) = true := by
  rw [S_eq_root482]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨1, by decide⟩

theorem root482_pos : 0 < (S 482).lo.toRat := by
  rw [S_eq_root482]
  exact OriginalRow227TriangleRoots15.root482_pos

theorem product482_pos : 0 < (roundedMul (-768) shift (S 482)).lo.toRat := by
  rw [S_eq_root482]
  exact OriginalRow227TriangleRoots15.product482_pos

theorem S_eq_root483 : S 483 = OriginalRow227TriangleRoots15.root483 := rfl

theorem root483_checked : sqrtCheck 483 (S 483) = true := by
  rw [S_eq_root483]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨2, by decide⟩

theorem root483_pos : 0 < (S 483).lo.toRat := by
  rw [S_eq_root483]
  exact OriginalRow227TriangleRoots15.root483_pos

theorem product483_pos : 0 < (roundedMul (-768) shift (S 483)).lo.toRat := by
  rw [S_eq_root483]
  exact OriginalRow227TriangleRoots15.product483_pos

theorem S_eq_root484 : S 484 = OriginalRow227TriangleRoots15.root484 := rfl

theorem root484_checked : sqrtCheck 484 (S 484) = true := by
  rw [S_eq_root484]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨3, by decide⟩

theorem root484_pos : 0 < (S 484).lo.toRat := by
  rw [S_eq_root484]
  exact OriginalRow227TriangleRoots15.root484_pos

theorem product484_pos : 0 < (roundedMul (-768) shift (S 484)).lo.toRat := by
  rw [S_eq_root484]
  exact OriginalRow227TriangleRoots15.product484_pos

theorem S_eq_root485 : S 485 = OriginalRow227TriangleRoots15.root485 := rfl

theorem root485_checked : sqrtCheck 485 (S 485) = true := by
  rw [S_eq_root485]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨4, by decide⟩

theorem root485_pos : 0 < (S 485).lo.toRat := by
  rw [S_eq_root485]
  exact OriginalRow227TriangleRoots15.root485_pos

theorem product485_pos : 0 < (roundedMul (-768) shift (S 485)).lo.toRat := by
  rw [S_eq_root485]
  exact OriginalRow227TriangleRoots15.product485_pos

theorem S_eq_root486 : S 486 = OriginalRow227TriangleRoots15.root486 := rfl

theorem root486_checked : sqrtCheck 486 (S 486) = true := by
  rw [S_eq_root486]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨5, by decide⟩

theorem root486_pos : 0 < (S 486).lo.toRat := by
  rw [S_eq_root486]
  exact OriginalRow227TriangleRoots15.root486_pos

theorem product486_pos : 0 < (roundedMul (-768) shift (S 486)).lo.toRat := by
  rw [S_eq_root486]
  exact OriginalRow227TriangleRoots15.product486_pos

theorem S_eq_root487 : S 487 = OriginalRow227TriangleRoots15.root487 := rfl

theorem root487_checked : sqrtCheck 487 (S 487) = true := by
  rw [S_eq_root487]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨6, by decide⟩

theorem root487_pos : 0 < (S 487).lo.toRat := by
  rw [S_eq_root487]
  exact OriginalRow227TriangleRoots15.root487_pos

theorem product487_pos : 0 < (roundedMul (-768) shift (S 487)).lo.toRat := by
  rw [S_eq_root487]
  exact OriginalRow227TriangleRoots15.product487_pos

theorem S_eq_root488 : S 488 = OriginalRow227TriangleRoots15.root488 := rfl

theorem root488_checked : sqrtCheck 488 (S 488) = true := by
  rw [S_eq_root488]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨7, by decide⟩

theorem root488_pos : 0 < (S 488).lo.toRat := by
  rw [S_eq_root488]
  exact OriginalRow227TriangleRoots15.root488_pos

theorem product488_pos : 0 < (roundedMul (-768) shift (S 488)).lo.toRat := by
  rw [S_eq_root488]
  exact OriginalRow227TriangleRoots15.product488_pos

theorem S_eq_root489 : S 489 = OriginalRow227TriangleRoots15.root489 := rfl

theorem root489_checked : sqrtCheck 489 (S 489) = true := by
  rw [S_eq_root489]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨8, by decide⟩

theorem root489_pos : 0 < (S 489).lo.toRat := by
  rw [S_eq_root489]
  exact OriginalRow227TriangleRoots15.root489_pos

theorem product489_pos : 0 < (roundedMul (-768) shift (S 489)).lo.toRat := by
  rw [S_eq_root489]
  exact OriginalRow227TriangleRoots15.product489_pos

theorem S_eq_root490 : S 490 = OriginalRow227TriangleRoots15.root490 := rfl

theorem root490_checked : sqrtCheck 490 (S 490) = true := by
  rw [S_eq_root490]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨9, by decide⟩

theorem root490_pos : 0 < (S 490).lo.toRat := by
  rw [S_eq_root490]
  exact OriginalRow227TriangleRoots15.root490_pos

theorem product490_pos : 0 < (roundedMul (-768) shift (S 490)).lo.toRat := by
  rw [S_eq_root490]
  exact OriginalRow227TriangleRoots15.product490_pos

theorem S_eq_root491 : S 491 = OriginalRow227TriangleRoots15.root491 := rfl

theorem root491_checked : sqrtCheck 491 (S 491) = true := by
  rw [S_eq_root491]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨10, by decide⟩

theorem root491_pos : 0 < (S 491).lo.toRat := by
  rw [S_eq_root491]
  exact OriginalRow227TriangleRoots15.root491_pos

theorem product491_pos : 0 < (roundedMul (-768) shift (S 491)).lo.toRat := by
  rw [S_eq_root491]
  exact OriginalRow227TriangleRoots15.product491_pos

theorem S_eq_root492 : S 492 = OriginalRow227TriangleRoots15.root492 := rfl

theorem root492_checked : sqrtCheck 492 (S 492) = true := by
  rw [S_eq_root492]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨11, by decide⟩

theorem root492_pos : 0 < (S 492).lo.toRat := by
  rw [S_eq_root492]
  exact OriginalRow227TriangleRoots15.root492_pos

theorem product492_pos : 0 < (roundedMul (-768) shift (S 492)).lo.toRat := by
  rw [S_eq_root492]
  exact OriginalRow227TriangleRoots15.product492_pos

theorem S_eq_root493 : S 493 = OriginalRow227TriangleRoots15.root493 := rfl

theorem root493_checked : sqrtCheck 493 (S 493) = true := by
  rw [S_eq_root493]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨12, by decide⟩

theorem root493_pos : 0 < (S 493).lo.toRat := by
  rw [S_eq_root493]
  exact OriginalRow227TriangleRoots15.root493_pos

theorem product493_pos : 0 < (roundedMul (-768) shift (S 493)).lo.toRat := by
  rw [S_eq_root493]
  exact OriginalRow227TriangleRoots15.product493_pos

theorem S_eq_root494 : S 494 = OriginalRow227TriangleRoots15.root494 := rfl

theorem root494_checked : sqrtCheck 494 (S 494) = true := by
  rw [S_eq_root494]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨13, by decide⟩

theorem root494_pos : 0 < (S 494).lo.toRat := by
  rw [S_eq_root494]
  exact OriginalRow227TriangleRoots15.root494_pos

theorem product494_pos : 0 < (roundedMul (-768) shift (S 494)).lo.toRat := by
  rw [S_eq_root494]
  exact OriginalRow227TriangleRoots15.product494_pos

theorem S_eq_root495 : S 495 = OriginalRow227TriangleRoots15.root495 := rfl

theorem root495_checked : sqrtCheck 495 (S 495) = true := by
  rw [S_eq_root495]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨14, by decide⟩

theorem root495_pos : 0 < (S 495).lo.toRat := by
  rw [S_eq_root495]
  exact OriginalRow227TriangleRoots15.root495_pos

theorem product495_pos : 0 < (roundedMul (-768) shift (S 495)).lo.toRat := by
  rw [S_eq_root495]
  exact OriginalRow227TriangleRoots15.product495_pos

theorem S_eq_root496 : S 496 = OriginalRow227TriangleRoots15.root496 := rfl

theorem root496_checked : sqrtCheck 496 (S 496) = true := by
  rw [S_eq_root496]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨15, by decide⟩

theorem root496_pos : 0 < (S 496).lo.toRat := by
  rw [S_eq_root496]
  exact OriginalRow227TriangleRoots15.root496_pos

theorem product496_pos : 0 < (roundedMul (-768) shift (S 496)).lo.toRat := by
  rw [S_eq_root496]
  exact OriginalRow227TriangleRoots15.product496_pos

theorem S_eq_root497 : S 497 = OriginalRow227TriangleRoots15.root497 := rfl

theorem root497_checked : sqrtCheck 497 (S 497) = true := by
  rw [S_eq_root497]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨16, by decide⟩

theorem root497_pos : 0 < (S 497).lo.toRat := by
  rw [S_eq_root497]
  exact OriginalRow227TriangleRoots15.root497_pos

theorem product497_pos : 0 < (roundedMul (-768) shift (S 497)).lo.toRat := by
  rw [S_eq_root497]
  exact OriginalRow227TriangleRoots15.product497_pos

theorem S_eq_root498 : S 498 = OriginalRow227TriangleRoots15.root498 := rfl

theorem root498_checked : sqrtCheck 498 (S 498) = true := by
  rw [S_eq_root498]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨17, by decide⟩

theorem root498_pos : 0 < (S 498).lo.toRat := by
  rw [S_eq_root498]
  exact OriginalRow227TriangleRoots15.root498_pos

theorem product498_pos : 0 < (roundedMul (-768) shift (S 498)).lo.toRat := by
  rw [S_eq_root498]
  exact OriginalRow227TriangleRoots15.product498_pos

theorem S_eq_root499 : S 499 = OriginalRow227TriangleRoots15.root499 := rfl

theorem root499_checked : sqrtCheck 499 (S 499) = true := by
  rw [S_eq_root499]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨18, by decide⟩

theorem root499_pos : 0 < (S 499).lo.toRat := by
  rw [S_eq_root499]
  exact OriginalRow227TriangleRoots15.root499_pos

theorem product499_pos : 0 < (roundedMul (-768) shift (S 499)).lo.toRat := by
  rw [S_eq_root499]
  exact OriginalRow227TriangleRoots15.product499_pos

theorem S_eq_root500 : S 500 = OriginalRow227TriangleRoots15.root500 := rfl

theorem root500_checked : sqrtCheck 500 (S 500) = true := by
  rw [S_eq_root500]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨19, by decide⟩

theorem root500_pos : 0 < (S 500).lo.toRat := by
  rw [S_eq_root500]
  exact OriginalRow227TriangleRoots15.root500_pos

theorem product500_pos : 0 < (roundedMul (-768) shift (S 500)).lo.toRat := by
  rw [S_eq_root500]
  exact OriginalRow227TriangleRoots15.product500_pos

theorem S_eq_root501 : S 501 = OriginalRow227TriangleRoots15.root501 := rfl

theorem root501_checked : sqrtCheck 501 (S 501) = true := by
  rw [S_eq_root501]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots15.entries OriginalRow227TriangleRoots15.checked ⟨20, by decide⟩

theorem root501_pos : 0 < (S 501).lo.toRat := by
  rw [S_eq_root501]
  exact OriginalRow227TriangleRoots15.root501_pos

theorem product501_pos : 0 < (roundedMul (-768) shift (S 501)).lo.toRat := by
  rw [S_eq_root501]
  exact OriginalRow227TriangleRoots15.product501_pos

end Grothe.UpperChaos.OriginalRow227RootBindings15

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root481) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root481_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root481_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product481_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root482) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root482_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root482_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product482_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root483) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root483_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root483_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product483_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root484) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root484_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root484_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product484_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root485) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root485_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root485_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product485_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root486) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root486_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root486_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product486_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root487) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root487_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root487_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product487_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root488) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root488_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root488_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product488_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root489) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root489_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root489_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product489_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root490) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root490_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root490_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product490_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root491) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root491_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root491_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product491_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root492) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root492_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root492_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product492_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root493) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root493_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root493_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product493_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root494) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root494_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root494_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product494_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root495) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root495_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root495_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product495_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root496) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root496_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root496_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product496_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root497) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root497_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root497_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product497_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root498) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root498_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root498_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product498_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root499) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root499_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root499_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product499_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root500) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root500_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root500_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product500_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.S_eq_root501) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root501_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.root501_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings15.product501_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
