import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings00
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root1 : S 1 = OriginalRow227TriangleRoots00.root1 := rfl

theorem root1_checked : sqrtCheck 1 (S 1) = true := by
  rw [S_eq_root1]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨0, by decide⟩

theorem root1_pos : 0 < (S 1).lo.toRat := by
  rw [S_eq_root1]
  exact OriginalRow227TriangleRoots00.root1_pos

theorem product1_pos : 0 < (roundedMul (-768) shift (S 1)).lo.toRat := by
  rw [S_eq_root1]
  exact OriginalRow227TriangleRoots00.product1_pos

theorem S_eq_root2 : S 2 = OriginalRow227TriangleRoots00.root2 := rfl

theorem root2_checked : sqrtCheck 2 (S 2) = true := by
  rw [S_eq_root2]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨1, by decide⟩

theorem root2_pos : 0 < (S 2).lo.toRat := by
  rw [S_eq_root2]
  exact OriginalRow227TriangleRoots00.root2_pos

theorem product2_pos : 0 < (roundedMul (-768) shift (S 2)).lo.toRat := by
  rw [S_eq_root2]
  exact OriginalRow227TriangleRoots00.product2_pos

theorem S_eq_root3 : S 3 = OriginalRow227TriangleRoots00.root3 := rfl

theorem root3_checked : sqrtCheck 3 (S 3) = true := by
  rw [S_eq_root3]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨2, by decide⟩

theorem root3_pos : 0 < (S 3).lo.toRat := by
  rw [S_eq_root3]
  exact OriginalRow227TriangleRoots00.root3_pos

theorem product3_pos : 0 < (roundedMul (-768) shift (S 3)).lo.toRat := by
  rw [S_eq_root3]
  exact OriginalRow227TriangleRoots00.product3_pos

theorem S_eq_root4 : S 4 = OriginalRow227TriangleRoots00.root4 := rfl

theorem root4_checked : sqrtCheck 4 (S 4) = true := by
  rw [S_eq_root4]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨3, by decide⟩

theorem root4_pos : 0 < (S 4).lo.toRat := by
  rw [S_eq_root4]
  exact OriginalRow227TriangleRoots00.root4_pos

theorem product4_pos : 0 < (roundedMul (-768) shift (S 4)).lo.toRat := by
  rw [S_eq_root4]
  exact OriginalRow227TriangleRoots00.product4_pos

theorem S_eq_root5 : S 5 = OriginalRow227TriangleRoots00.root5 := rfl

theorem root5_checked : sqrtCheck 5 (S 5) = true := by
  rw [S_eq_root5]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨4, by decide⟩

theorem root5_pos : 0 < (S 5).lo.toRat := by
  rw [S_eq_root5]
  exact OriginalRow227TriangleRoots00.root5_pos

theorem product5_pos : 0 < (roundedMul (-768) shift (S 5)).lo.toRat := by
  rw [S_eq_root5]
  exact OriginalRow227TriangleRoots00.product5_pos

theorem S_eq_root6 : S 6 = OriginalRow227TriangleRoots00.root6 := rfl

theorem root6_checked : sqrtCheck 6 (S 6) = true := by
  rw [S_eq_root6]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨5, by decide⟩

theorem root6_pos : 0 < (S 6).lo.toRat := by
  rw [S_eq_root6]
  exact OriginalRow227TriangleRoots00.root6_pos

theorem product6_pos : 0 < (roundedMul (-768) shift (S 6)).lo.toRat := by
  rw [S_eq_root6]
  exact OriginalRow227TriangleRoots00.product6_pos

theorem S_eq_root7 : S 7 = OriginalRow227TriangleRoots00.root7 := rfl

theorem root7_checked : sqrtCheck 7 (S 7) = true := by
  rw [S_eq_root7]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨6, by decide⟩

theorem root7_pos : 0 < (S 7).lo.toRat := by
  rw [S_eq_root7]
  exact OriginalRow227TriangleRoots00.root7_pos

theorem product7_pos : 0 < (roundedMul (-768) shift (S 7)).lo.toRat := by
  rw [S_eq_root7]
  exact OriginalRow227TriangleRoots00.product7_pos

theorem S_eq_root8 : S 8 = OriginalRow227TriangleRoots00.root8 := rfl

theorem root8_checked : sqrtCheck 8 (S 8) = true := by
  rw [S_eq_root8]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨7, by decide⟩

theorem root8_pos : 0 < (S 8).lo.toRat := by
  rw [S_eq_root8]
  exact OriginalRow227TriangleRoots00.root8_pos

theorem product8_pos : 0 < (roundedMul (-768) shift (S 8)).lo.toRat := by
  rw [S_eq_root8]
  exact OriginalRow227TriangleRoots00.product8_pos

theorem S_eq_root9 : S 9 = OriginalRow227TriangleRoots00.root9 := rfl

theorem root9_checked : sqrtCheck 9 (S 9) = true := by
  rw [S_eq_root9]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨8, by decide⟩

theorem root9_pos : 0 < (S 9).lo.toRat := by
  rw [S_eq_root9]
  exact OriginalRow227TriangleRoots00.root9_pos

theorem product9_pos : 0 < (roundedMul (-768) shift (S 9)).lo.toRat := by
  rw [S_eq_root9]
  exact OriginalRow227TriangleRoots00.product9_pos

theorem S_eq_root10 : S 10 = OriginalRow227TriangleRoots00.root10 := rfl

theorem root10_checked : sqrtCheck 10 (S 10) = true := by
  rw [S_eq_root10]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨9, by decide⟩

theorem root10_pos : 0 < (S 10).lo.toRat := by
  rw [S_eq_root10]
  exact OriginalRow227TriangleRoots00.root10_pos

theorem product10_pos : 0 < (roundedMul (-768) shift (S 10)).lo.toRat := by
  rw [S_eq_root10]
  exact OriginalRow227TriangleRoots00.product10_pos

theorem S_eq_root11 : S 11 = OriginalRow227TriangleRoots00.root11 := rfl

theorem root11_checked : sqrtCheck 11 (S 11) = true := by
  rw [S_eq_root11]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨10, by decide⟩

theorem root11_pos : 0 < (S 11).lo.toRat := by
  rw [S_eq_root11]
  exact OriginalRow227TriangleRoots00.root11_pos

theorem product11_pos : 0 < (roundedMul (-768) shift (S 11)).lo.toRat := by
  rw [S_eq_root11]
  exact OriginalRow227TriangleRoots00.product11_pos

theorem S_eq_root12 : S 12 = OriginalRow227TriangleRoots00.root12 := rfl

theorem root12_checked : sqrtCheck 12 (S 12) = true := by
  rw [S_eq_root12]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨11, by decide⟩

theorem root12_pos : 0 < (S 12).lo.toRat := by
  rw [S_eq_root12]
  exact OriginalRow227TriangleRoots00.root12_pos

theorem product12_pos : 0 < (roundedMul (-768) shift (S 12)).lo.toRat := by
  rw [S_eq_root12]
  exact OriginalRow227TriangleRoots00.product12_pos

theorem S_eq_root13 : S 13 = OriginalRow227TriangleRoots00.root13 := rfl

theorem root13_checked : sqrtCheck 13 (S 13) = true := by
  rw [S_eq_root13]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨12, by decide⟩

theorem root13_pos : 0 < (S 13).lo.toRat := by
  rw [S_eq_root13]
  exact OriginalRow227TriangleRoots00.root13_pos

theorem product13_pos : 0 < (roundedMul (-768) shift (S 13)).lo.toRat := by
  rw [S_eq_root13]
  exact OriginalRow227TriangleRoots00.product13_pos

theorem S_eq_root14 : S 14 = OriginalRow227TriangleRoots00.root14 := rfl

theorem root14_checked : sqrtCheck 14 (S 14) = true := by
  rw [S_eq_root14]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨13, by decide⟩

theorem root14_pos : 0 < (S 14).lo.toRat := by
  rw [S_eq_root14]
  exact OriginalRow227TriangleRoots00.root14_pos

theorem product14_pos : 0 < (roundedMul (-768) shift (S 14)).lo.toRat := by
  rw [S_eq_root14]
  exact OriginalRow227TriangleRoots00.product14_pos

theorem S_eq_root15 : S 15 = OriginalRow227TriangleRoots00.root15 := rfl

theorem root15_checked : sqrtCheck 15 (S 15) = true := by
  rw [S_eq_root15]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨14, by decide⟩

theorem root15_pos : 0 < (S 15).lo.toRat := by
  rw [S_eq_root15]
  exact OriginalRow227TriangleRoots00.root15_pos

theorem product15_pos : 0 < (roundedMul (-768) shift (S 15)).lo.toRat := by
  rw [S_eq_root15]
  exact OriginalRow227TriangleRoots00.product15_pos

theorem S_eq_root16 : S 16 = OriginalRow227TriangleRoots00.root16 := rfl

theorem root16_checked : sqrtCheck 16 (S 16) = true := by
  rw [S_eq_root16]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨15, by decide⟩

theorem root16_pos : 0 < (S 16).lo.toRat := by
  rw [S_eq_root16]
  exact OriginalRow227TriangleRoots00.root16_pos

theorem product16_pos : 0 < (roundedMul (-768) shift (S 16)).lo.toRat := by
  rw [S_eq_root16]
  exact OriginalRow227TriangleRoots00.product16_pos

theorem S_eq_root17 : S 17 = OriginalRow227TriangleRoots00.root17 := rfl

theorem root17_checked : sqrtCheck 17 (S 17) = true := by
  rw [S_eq_root17]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨16, by decide⟩

theorem root17_pos : 0 < (S 17).lo.toRat := by
  rw [S_eq_root17]
  exact OriginalRow227TriangleRoots00.root17_pos

theorem product17_pos : 0 < (roundedMul (-768) shift (S 17)).lo.toRat := by
  rw [S_eq_root17]
  exact OriginalRow227TriangleRoots00.product17_pos

theorem S_eq_root18 : S 18 = OriginalRow227TriangleRoots00.root18 := rfl

theorem root18_checked : sqrtCheck 18 (S 18) = true := by
  rw [S_eq_root18]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨17, by decide⟩

theorem root18_pos : 0 < (S 18).lo.toRat := by
  rw [S_eq_root18]
  exact OriginalRow227TriangleRoots00.root18_pos

theorem product18_pos : 0 < (roundedMul (-768) shift (S 18)).lo.toRat := by
  rw [S_eq_root18]
  exact OriginalRow227TriangleRoots00.product18_pos

theorem S_eq_root19 : S 19 = OriginalRow227TriangleRoots00.root19 := rfl

theorem root19_checked : sqrtCheck 19 (S 19) = true := by
  rw [S_eq_root19]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨18, by decide⟩

theorem root19_pos : 0 < (S 19).lo.toRat := by
  rw [S_eq_root19]
  exact OriginalRow227TriangleRoots00.root19_pos

theorem product19_pos : 0 < (roundedMul (-768) shift (S 19)).lo.toRat := by
  rw [S_eq_root19]
  exact OriginalRow227TriangleRoots00.product19_pos

theorem S_eq_root20 : S 20 = OriginalRow227TriangleRoots00.root20 := rfl

theorem root20_checked : sqrtCheck 20 (S 20) = true := by
  rw [S_eq_root20]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨19, by decide⟩

theorem root20_pos : 0 < (S 20).lo.toRat := by
  rw [S_eq_root20]
  exact OriginalRow227TriangleRoots00.root20_pos

theorem product20_pos : 0 < (roundedMul (-768) shift (S 20)).lo.toRat := by
  rw [S_eq_root20]
  exact OriginalRow227TriangleRoots00.product20_pos

theorem S_eq_root21 : S 21 = OriginalRow227TriangleRoots00.root21 := rfl

theorem root21_checked : sqrtCheck 21 (S 21) = true := by
  rw [S_eq_root21]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨20, by decide⟩

theorem root21_pos : 0 < (S 21).lo.toRat := by
  rw [S_eq_root21]
  exact OriginalRow227TriangleRoots00.root21_pos

theorem product21_pos : 0 < (roundedMul (-768) shift (S 21)).lo.toRat := by
  rw [S_eq_root21]
  exact OriginalRow227TriangleRoots00.product21_pos

theorem S_eq_root22 : S 22 = OriginalRow227TriangleRoots00.root22 := rfl

theorem root22_checked : sqrtCheck 22 (S 22) = true := by
  rw [S_eq_root22]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨21, by decide⟩

theorem root22_pos : 0 < (S 22).lo.toRat := by
  rw [S_eq_root22]
  exact OriginalRow227TriangleRoots00.root22_pos

theorem product22_pos : 0 < (roundedMul (-768) shift (S 22)).lo.toRat := by
  rw [S_eq_root22]
  exact OriginalRow227TriangleRoots00.product22_pos

theorem S_eq_root23 : S 23 = OriginalRow227TriangleRoots00.root23 := rfl

theorem root23_checked : sqrtCheck 23 (S 23) = true := by
  rw [S_eq_root23]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨22, by decide⟩

theorem root23_pos : 0 < (S 23).lo.toRat := by
  rw [S_eq_root23]
  exact OriginalRow227TriangleRoots00.root23_pos

theorem product23_pos : 0 < (roundedMul (-768) shift (S 23)).lo.toRat := by
  rw [S_eq_root23]
  exact OriginalRow227TriangleRoots00.product23_pos

theorem S_eq_root24 : S 24 = OriginalRow227TriangleRoots00.root24 := rfl

theorem root24_checked : sqrtCheck 24 (S 24) = true := by
  rw [S_eq_root24]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨23, by decide⟩

theorem root24_pos : 0 < (S 24).lo.toRat := by
  rw [S_eq_root24]
  exact OriginalRow227TriangleRoots00.root24_pos

theorem product24_pos : 0 < (roundedMul (-768) shift (S 24)).lo.toRat := by
  rw [S_eq_root24]
  exact OriginalRow227TriangleRoots00.product24_pos

theorem S_eq_root25 : S 25 = OriginalRow227TriangleRoots00.root25 := rfl

theorem root25_checked : sqrtCheck 25 (S 25) = true := by
  rw [S_eq_root25]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨24, by decide⟩

theorem root25_pos : 0 < (S 25).lo.toRat := by
  rw [S_eq_root25]
  exact OriginalRow227TriangleRoots00.root25_pos

theorem product25_pos : 0 < (roundedMul (-768) shift (S 25)).lo.toRat := by
  rw [S_eq_root25]
  exact OriginalRow227TriangleRoots00.product25_pos

theorem S_eq_root26 : S 26 = OriginalRow227TriangleRoots00.root26 := rfl

theorem root26_checked : sqrtCheck 26 (S 26) = true := by
  rw [S_eq_root26]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨25, by decide⟩

theorem root26_pos : 0 < (S 26).lo.toRat := by
  rw [S_eq_root26]
  exact OriginalRow227TriangleRoots00.root26_pos

theorem product26_pos : 0 < (roundedMul (-768) shift (S 26)).lo.toRat := by
  rw [S_eq_root26]
  exact OriginalRow227TriangleRoots00.product26_pos

theorem S_eq_root27 : S 27 = OriginalRow227TriangleRoots00.root27 := rfl

theorem root27_checked : sqrtCheck 27 (S 27) = true := by
  rw [S_eq_root27]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨26, by decide⟩

theorem root27_pos : 0 < (S 27).lo.toRat := by
  rw [S_eq_root27]
  exact OriginalRow227TriangleRoots00.root27_pos

theorem product27_pos : 0 < (roundedMul (-768) shift (S 27)).lo.toRat := by
  rw [S_eq_root27]
  exact OriginalRow227TriangleRoots00.product27_pos

theorem S_eq_root28 : S 28 = OriginalRow227TriangleRoots00.root28 := rfl

theorem root28_checked : sqrtCheck 28 (S 28) = true := by
  rw [S_eq_root28]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨27, by decide⟩

theorem root28_pos : 0 < (S 28).lo.toRat := by
  rw [S_eq_root28]
  exact OriginalRow227TriangleRoots00.root28_pos

theorem product28_pos : 0 < (roundedMul (-768) shift (S 28)).lo.toRat := by
  rw [S_eq_root28]
  exact OriginalRow227TriangleRoots00.product28_pos

theorem S_eq_root29 : S 29 = OriginalRow227TriangleRoots00.root29 := rfl

theorem root29_checked : sqrtCheck 29 (S 29) = true := by
  rw [S_eq_root29]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨28, by decide⟩

theorem root29_pos : 0 < (S 29).lo.toRat := by
  rw [S_eq_root29]
  exact OriginalRow227TriangleRoots00.root29_pos

theorem product29_pos : 0 < (roundedMul (-768) shift (S 29)).lo.toRat := by
  rw [S_eq_root29]
  exact OriginalRow227TriangleRoots00.product29_pos

theorem S_eq_root30 : S 30 = OriginalRow227TriangleRoots00.root30 := rfl

theorem root30_checked : sqrtCheck 30 (S 30) = true := by
  rw [S_eq_root30]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨29, by decide⟩

theorem root30_pos : 0 < (S 30).lo.toRat := by
  rw [S_eq_root30]
  exact OriginalRow227TriangleRoots00.root30_pos

theorem product30_pos : 0 < (roundedMul (-768) shift (S 30)).lo.toRat := by
  rw [S_eq_root30]
  exact OriginalRow227TriangleRoots00.product30_pos

theorem S_eq_root31 : S 31 = OriginalRow227TriangleRoots00.root31 := rfl

theorem root31_checked : sqrtCheck 31 (S 31) = true := by
  rw [S_eq_root31]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨30, by decide⟩

theorem root31_pos : 0 < (S 31).lo.toRat := by
  rw [S_eq_root31]
  exact OriginalRow227TriangleRoots00.root31_pos

theorem product31_pos : 0 < (roundedMul (-768) shift (S 31)).lo.toRat := by
  rw [S_eq_root31]
  exact OriginalRow227TriangleRoots00.product31_pos

theorem S_eq_root32 : S 32 = OriginalRow227TriangleRoots00.root32 := rfl

theorem root32_checked : sqrtCheck 32 (S 32) = true := by
  rw [S_eq_root32]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots00.entries OriginalRow227TriangleRoots00.checked ⟨31, by decide⟩

theorem root32_pos : 0 < (S 32).lo.toRat := by
  rw [S_eq_root32]
  exact OriginalRow227TriangleRoots00.root32_pos

theorem product32_pos : 0 < (roundedMul (-768) shift (S 32)).lo.toRat := by
  rw [S_eq_root32]
  exact OriginalRow227TriangleRoots00.product32_pos

end Grothe.UpperChaos.OriginalRow227RootBindings00

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root1) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root1_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root1_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product1_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root2) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root2_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root2_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product2_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root3) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root3_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root3_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product3_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root4) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root4_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root4_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product4_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root5) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root5_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root5_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product5_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root6) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root6_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root6_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product6_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root7) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root7_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root7_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product7_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root8) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root8_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root8_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product8_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root9) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root9_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root9_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product9_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root10) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root10_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root10_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product10_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root11) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root11_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root11_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product11_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root12) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root12_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root12_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product12_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root13) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root13_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root13_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product13_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root14) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root14_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root14_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product14_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root15) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root15_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root15_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product15_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root16) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root16_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root16_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product16_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root17) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root17_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root17_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product17_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root18) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root18_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root18_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product18_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root19) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root19_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root19_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product19_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root20) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root20_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root20_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product20_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root21) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root21_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root21_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product21_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root22) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root22_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root22_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product22_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root23) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root23_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root23_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product23_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root24) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root24_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root24_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product24_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root25) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root25_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root25_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product25_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root26) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root26_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root26_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product26_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root27) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root27_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root27_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product27_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root28) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root28_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root28_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product28_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root29) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root29_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root29_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product29_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root30) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root30_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root30_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product30_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root31) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root31_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root31_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product31_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.S_eq_root32) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root32_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.root32_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings00.product32_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
