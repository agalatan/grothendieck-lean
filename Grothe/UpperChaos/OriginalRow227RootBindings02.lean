import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings02
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root65 : S 65 = OriginalRow227TriangleRoots02.root65 := rfl

theorem root65_checked : sqrtCheck 65 (S 65) = true := by
  rw [S_eq_root65]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨0, by decide⟩

theorem root65_pos : 0 < (S 65).lo.toRat := by
  rw [S_eq_root65]
  exact OriginalRow227TriangleRoots02.root65_pos

theorem product65_pos : 0 < (roundedMul (-768) shift (S 65)).lo.toRat := by
  rw [S_eq_root65]
  exact OriginalRow227TriangleRoots02.product65_pos

theorem S_eq_root66 : S 66 = OriginalRow227TriangleRoots02.root66 := rfl

theorem root66_checked : sqrtCheck 66 (S 66) = true := by
  rw [S_eq_root66]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨1, by decide⟩

theorem root66_pos : 0 < (S 66).lo.toRat := by
  rw [S_eq_root66]
  exact OriginalRow227TriangleRoots02.root66_pos

theorem product66_pos : 0 < (roundedMul (-768) shift (S 66)).lo.toRat := by
  rw [S_eq_root66]
  exact OriginalRow227TriangleRoots02.product66_pos

theorem S_eq_root67 : S 67 = OriginalRow227TriangleRoots02.root67 := rfl

theorem root67_checked : sqrtCheck 67 (S 67) = true := by
  rw [S_eq_root67]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨2, by decide⟩

theorem root67_pos : 0 < (S 67).lo.toRat := by
  rw [S_eq_root67]
  exact OriginalRow227TriangleRoots02.root67_pos

theorem product67_pos : 0 < (roundedMul (-768) shift (S 67)).lo.toRat := by
  rw [S_eq_root67]
  exact OriginalRow227TriangleRoots02.product67_pos

theorem S_eq_root68 : S 68 = OriginalRow227TriangleRoots02.root68 := rfl

theorem root68_checked : sqrtCheck 68 (S 68) = true := by
  rw [S_eq_root68]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨3, by decide⟩

theorem root68_pos : 0 < (S 68).lo.toRat := by
  rw [S_eq_root68]
  exact OriginalRow227TriangleRoots02.root68_pos

theorem product68_pos : 0 < (roundedMul (-768) shift (S 68)).lo.toRat := by
  rw [S_eq_root68]
  exact OriginalRow227TriangleRoots02.product68_pos

theorem S_eq_root69 : S 69 = OriginalRow227TriangleRoots02.root69 := rfl

theorem root69_checked : sqrtCheck 69 (S 69) = true := by
  rw [S_eq_root69]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨4, by decide⟩

theorem root69_pos : 0 < (S 69).lo.toRat := by
  rw [S_eq_root69]
  exact OriginalRow227TriangleRoots02.root69_pos

theorem product69_pos : 0 < (roundedMul (-768) shift (S 69)).lo.toRat := by
  rw [S_eq_root69]
  exact OriginalRow227TriangleRoots02.product69_pos

theorem S_eq_root70 : S 70 = OriginalRow227TriangleRoots02.root70 := rfl

theorem root70_checked : sqrtCheck 70 (S 70) = true := by
  rw [S_eq_root70]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨5, by decide⟩

theorem root70_pos : 0 < (S 70).lo.toRat := by
  rw [S_eq_root70]
  exact OriginalRow227TriangleRoots02.root70_pos

theorem product70_pos : 0 < (roundedMul (-768) shift (S 70)).lo.toRat := by
  rw [S_eq_root70]
  exact OriginalRow227TriangleRoots02.product70_pos

theorem S_eq_root71 : S 71 = OriginalRow227TriangleRoots02.root71 := rfl

theorem root71_checked : sqrtCheck 71 (S 71) = true := by
  rw [S_eq_root71]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨6, by decide⟩

theorem root71_pos : 0 < (S 71).lo.toRat := by
  rw [S_eq_root71]
  exact OriginalRow227TriangleRoots02.root71_pos

theorem product71_pos : 0 < (roundedMul (-768) shift (S 71)).lo.toRat := by
  rw [S_eq_root71]
  exact OriginalRow227TriangleRoots02.product71_pos

theorem S_eq_root72 : S 72 = OriginalRow227TriangleRoots02.root72 := rfl

theorem root72_checked : sqrtCheck 72 (S 72) = true := by
  rw [S_eq_root72]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨7, by decide⟩

theorem root72_pos : 0 < (S 72).lo.toRat := by
  rw [S_eq_root72]
  exact OriginalRow227TriangleRoots02.root72_pos

theorem product72_pos : 0 < (roundedMul (-768) shift (S 72)).lo.toRat := by
  rw [S_eq_root72]
  exact OriginalRow227TriangleRoots02.product72_pos

theorem S_eq_root73 : S 73 = OriginalRow227TriangleRoots02.root73 := rfl

theorem root73_checked : sqrtCheck 73 (S 73) = true := by
  rw [S_eq_root73]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨8, by decide⟩

theorem root73_pos : 0 < (S 73).lo.toRat := by
  rw [S_eq_root73]
  exact OriginalRow227TriangleRoots02.root73_pos

theorem product73_pos : 0 < (roundedMul (-768) shift (S 73)).lo.toRat := by
  rw [S_eq_root73]
  exact OriginalRow227TriangleRoots02.product73_pos

theorem S_eq_root74 : S 74 = OriginalRow227TriangleRoots02.root74 := rfl

theorem root74_checked : sqrtCheck 74 (S 74) = true := by
  rw [S_eq_root74]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨9, by decide⟩

theorem root74_pos : 0 < (S 74).lo.toRat := by
  rw [S_eq_root74]
  exact OriginalRow227TriangleRoots02.root74_pos

theorem product74_pos : 0 < (roundedMul (-768) shift (S 74)).lo.toRat := by
  rw [S_eq_root74]
  exact OriginalRow227TriangleRoots02.product74_pos

theorem S_eq_root75 : S 75 = OriginalRow227TriangleRoots02.root75 := rfl

theorem root75_checked : sqrtCheck 75 (S 75) = true := by
  rw [S_eq_root75]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨10, by decide⟩

theorem root75_pos : 0 < (S 75).lo.toRat := by
  rw [S_eq_root75]
  exact OriginalRow227TriangleRoots02.root75_pos

theorem product75_pos : 0 < (roundedMul (-768) shift (S 75)).lo.toRat := by
  rw [S_eq_root75]
  exact OriginalRow227TriangleRoots02.product75_pos

theorem S_eq_root76 : S 76 = OriginalRow227TriangleRoots02.root76 := rfl

theorem root76_checked : sqrtCheck 76 (S 76) = true := by
  rw [S_eq_root76]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨11, by decide⟩

theorem root76_pos : 0 < (S 76).lo.toRat := by
  rw [S_eq_root76]
  exact OriginalRow227TriangleRoots02.root76_pos

theorem product76_pos : 0 < (roundedMul (-768) shift (S 76)).lo.toRat := by
  rw [S_eq_root76]
  exact OriginalRow227TriangleRoots02.product76_pos

theorem S_eq_root77 : S 77 = OriginalRow227TriangleRoots02.root77 := rfl

theorem root77_checked : sqrtCheck 77 (S 77) = true := by
  rw [S_eq_root77]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨12, by decide⟩

theorem root77_pos : 0 < (S 77).lo.toRat := by
  rw [S_eq_root77]
  exact OriginalRow227TriangleRoots02.root77_pos

theorem product77_pos : 0 < (roundedMul (-768) shift (S 77)).lo.toRat := by
  rw [S_eq_root77]
  exact OriginalRow227TriangleRoots02.product77_pos

theorem S_eq_root78 : S 78 = OriginalRow227TriangleRoots02.root78 := rfl

theorem root78_checked : sqrtCheck 78 (S 78) = true := by
  rw [S_eq_root78]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨13, by decide⟩

theorem root78_pos : 0 < (S 78).lo.toRat := by
  rw [S_eq_root78]
  exact OriginalRow227TriangleRoots02.root78_pos

theorem product78_pos : 0 < (roundedMul (-768) shift (S 78)).lo.toRat := by
  rw [S_eq_root78]
  exact OriginalRow227TriangleRoots02.product78_pos

theorem S_eq_root79 : S 79 = OriginalRow227TriangleRoots02.root79 := rfl

theorem root79_checked : sqrtCheck 79 (S 79) = true := by
  rw [S_eq_root79]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨14, by decide⟩

theorem root79_pos : 0 < (S 79).lo.toRat := by
  rw [S_eq_root79]
  exact OriginalRow227TriangleRoots02.root79_pos

theorem product79_pos : 0 < (roundedMul (-768) shift (S 79)).lo.toRat := by
  rw [S_eq_root79]
  exact OriginalRow227TriangleRoots02.product79_pos

theorem S_eq_root80 : S 80 = OriginalRow227TriangleRoots02.root80 := rfl

theorem root80_checked : sqrtCheck 80 (S 80) = true := by
  rw [S_eq_root80]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨15, by decide⟩

theorem root80_pos : 0 < (S 80).lo.toRat := by
  rw [S_eq_root80]
  exact OriginalRow227TriangleRoots02.root80_pos

theorem product80_pos : 0 < (roundedMul (-768) shift (S 80)).lo.toRat := by
  rw [S_eq_root80]
  exact OriginalRow227TriangleRoots02.product80_pos

theorem S_eq_root81 : S 81 = OriginalRow227TriangleRoots02.root81 := rfl

theorem root81_checked : sqrtCheck 81 (S 81) = true := by
  rw [S_eq_root81]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨16, by decide⟩

theorem root81_pos : 0 < (S 81).lo.toRat := by
  rw [S_eq_root81]
  exact OriginalRow227TriangleRoots02.root81_pos

theorem product81_pos : 0 < (roundedMul (-768) shift (S 81)).lo.toRat := by
  rw [S_eq_root81]
  exact OriginalRow227TriangleRoots02.product81_pos

theorem S_eq_root82 : S 82 = OriginalRow227TriangleRoots02.root82 := rfl

theorem root82_checked : sqrtCheck 82 (S 82) = true := by
  rw [S_eq_root82]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨17, by decide⟩

theorem root82_pos : 0 < (S 82).lo.toRat := by
  rw [S_eq_root82]
  exact OriginalRow227TriangleRoots02.root82_pos

theorem product82_pos : 0 < (roundedMul (-768) shift (S 82)).lo.toRat := by
  rw [S_eq_root82]
  exact OriginalRow227TriangleRoots02.product82_pos

theorem S_eq_root83 : S 83 = OriginalRow227TriangleRoots02.root83 := rfl

theorem root83_checked : sqrtCheck 83 (S 83) = true := by
  rw [S_eq_root83]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨18, by decide⟩

theorem root83_pos : 0 < (S 83).lo.toRat := by
  rw [S_eq_root83]
  exact OriginalRow227TriangleRoots02.root83_pos

theorem product83_pos : 0 < (roundedMul (-768) shift (S 83)).lo.toRat := by
  rw [S_eq_root83]
  exact OriginalRow227TriangleRoots02.product83_pos

theorem S_eq_root84 : S 84 = OriginalRow227TriangleRoots02.root84 := rfl

theorem root84_checked : sqrtCheck 84 (S 84) = true := by
  rw [S_eq_root84]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨19, by decide⟩

theorem root84_pos : 0 < (S 84).lo.toRat := by
  rw [S_eq_root84]
  exact OriginalRow227TriangleRoots02.root84_pos

theorem product84_pos : 0 < (roundedMul (-768) shift (S 84)).lo.toRat := by
  rw [S_eq_root84]
  exact OriginalRow227TriangleRoots02.product84_pos

theorem S_eq_root85 : S 85 = OriginalRow227TriangleRoots02.root85 := rfl

theorem root85_checked : sqrtCheck 85 (S 85) = true := by
  rw [S_eq_root85]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨20, by decide⟩

theorem root85_pos : 0 < (S 85).lo.toRat := by
  rw [S_eq_root85]
  exact OriginalRow227TriangleRoots02.root85_pos

theorem product85_pos : 0 < (roundedMul (-768) shift (S 85)).lo.toRat := by
  rw [S_eq_root85]
  exact OriginalRow227TriangleRoots02.product85_pos

theorem S_eq_root86 : S 86 = OriginalRow227TriangleRoots02.root86 := rfl

theorem root86_checked : sqrtCheck 86 (S 86) = true := by
  rw [S_eq_root86]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨21, by decide⟩

theorem root86_pos : 0 < (S 86).lo.toRat := by
  rw [S_eq_root86]
  exact OriginalRow227TriangleRoots02.root86_pos

theorem product86_pos : 0 < (roundedMul (-768) shift (S 86)).lo.toRat := by
  rw [S_eq_root86]
  exact OriginalRow227TriangleRoots02.product86_pos

theorem S_eq_root87 : S 87 = OriginalRow227TriangleRoots02.root87 := rfl

theorem root87_checked : sqrtCheck 87 (S 87) = true := by
  rw [S_eq_root87]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨22, by decide⟩

theorem root87_pos : 0 < (S 87).lo.toRat := by
  rw [S_eq_root87]
  exact OriginalRow227TriangleRoots02.root87_pos

theorem product87_pos : 0 < (roundedMul (-768) shift (S 87)).lo.toRat := by
  rw [S_eq_root87]
  exact OriginalRow227TriangleRoots02.product87_pos

theorem S_eq_root88 : S 88 = OriginalRow227TriangleRoots02.root88 := rfl

theorem root88_checked : sqrtCheck 88 (S 88) = true := by
  rw [S_eq_root88]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨23, by decide⟩

theorem root88_pos : 0 < (S 88).lo.toRat := by
  rw [S_eq_root88]
  exact OriginalRow227TriangleRoots02.root88_pos

theorem product88_pos : 0 < (roundedMul (-768) shift (S 88)).lo.toRat := by
  rw [S_eq_root88]
  exact OriginalRow227TriangleRoots02.product88_pos

theorem S_eq_root89 : S 89 = OriginalRow227TriangleRoots02.root89 := rfl

theorem root89_checked : sqrtCheck 89 (S 89) = true := by
  rw [S_eq_root89]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨24, by decide⟩

theorem root89_pos : 0 < (S 89).lo.toRat := by
  rw [S_eq_root89]
  exact OriginalRow227TriangleRoots02.root89_pos

theorem product89_pos : 0 < (roundedMul (-768) shift (S 89)).lo.toRat := by
  rw [S_eq_root89]
  exact OriginalRow227TriangleRoots02.product89_pos

theorem S_eq_root90 : S 90 = OriginalRow227TriangleRoots02.root90 := rfl

theorem root90_checked : sqrtCheck 90 (S 90) = true := by
  rw [S_eq_root90]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨25, by decide⟩

theorem root90_pos : 0 < (S 90).lo.toRat := by
  rw [S_eq_root90]
  exact OriginalRow227TriangleRoots02.root90_pos

theorem product90_pos : 0 < (roundedMul (-768) shift (S 90)).lo.toRat := by
  rw [S_eq_root90]
  exact OriginalRow227TriangleRoots02.product90_pos

theorem S_eq_root91 : S 91 = OriginalRow227TriangleRoots02.root91 := rfl

theorem root91_checked : sqrtCheck 91 (S 91) = true := by
  rw [S_eq_root91]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨26, by decide⟩

theorem root91_pos : 0 < (S 91).lo.toRat := by
  rw [S_eq_root91]
  exact OriginalRow227TriangleRoots02.root91_pos

theorem product91_pos : 0 < (roundedMul (-768) shift (S 91)).lo.toRat := by
  rw [S_eq_root91]
  exact OriginalRow227TriangleRoots02.product91_pos

theorem S_eq_root92 : S 92 = OriginalRow227TriangleRoots02.root92 := rfl

theorem root92_checked : sqrtCheck 92 (S 92) = true := by
  rw [S_eq_root92]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨27, by decide⟩

theorem root92_pos : 0 < (S 92).lo.toRat := by
  rw [S_eq_root92]
  exact OriginalRow227TriangleRoots02.root92_pos

theorem product92_pos : 0 < (roundedMul (-768) shift (S 92)).lo.toRat := by
  rw [S_eq_root92]
  exact OriginalRow227TriangleRoots02.product92_pos

theorem S_eq_root93 : S 93 = OriginalRow227TriangleRoots02.root93 := rfl

theorem root93_checked : sqrtCheck 93 (S 93) = true := by
  rw [S_eq_root93]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨28, by decide⟩

theorem root93_pos : 0 < (S 93).lo.toRat := by
  rw [S_eq_root93]
  exact OriginalRow227TriangleRoots02.root93_pos

theorem product93_pos : 0 < (roundedMul (-768) shift (S 93)).lo.toRat := by
  rw [S_eq_root93]
  exact OriginalRow227TriangleRoots02.product93_pos

theorem S_eq_root94 : S 94 = OriginalRow227TriangleRoots02.root94 := rfl

theorem root94_checked : sqrtCheck 94 (S 94) = true := by
  rw [S_eq_root94]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨29, by decide⟩

theorem root94_pos : 0 < (S 94).lo.toRat := by
  rw [S_eq_root94]
  exact OriginalRow227TriangleRoots02.root94_pos

theorem product94_pos : 0 < (roundedMul (-768) shift (S 94)).lo.toRat := by
  rw [S_eq_root94]
  exact OriginalRow227TriangleRoots02.product94_pos

theorem S_eq_root95 : S 95 = OriginalRow227TriangleRoots02.root95 := rfl

theorem root95_checked : sqrtCheck 95 (S 95) = true := by
  rw [S_eq_root95]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨30, by decide⟩

theorem root95_pos : 0 < (S 95).lo.toRat := by
  rw [S_eq_root95]
  exact OriginalRow227TriangleRoots02.root95_pos

theorem product95_pos : 0 < (roundedMul (-768) shift (S 95)).lo.toRat := by
  rw [S_eq_root95]
  exact OriginalRow227TriangleRoots02.product95_pos

theorem S_eq_root96 : S 96 = OriginalRow227TriangleRoots02.root96 := rfl

theorem root96_checked : sqrtCheck 96 (S 96) = true := by
  rw [S_eq_root96]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots02.entries OriginalRow227TriangleRoots02.checked ⟨31, by decide⟩

theorem root96_pos : 0 < (S 96).lo.toRat := by
  rw [S_eq_root96]
  exact OriginalRow227TriangleRoots02.root96_pos

theorem product96_pos : 0 < (roundedMul (-768) shift (S 96)).lo.toRat := by
  rw [S_eq_root96]
  exact OriginalRow227TriangleRoots02.product96_pos

end Grothe.UpperChaos.OriginalRow227RootBindings02

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root65) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root65_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root65_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product65_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root66) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root66_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root66_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product66_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root67) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root67_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root67_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product67_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root68) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root68_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root68_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product68_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root69) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root69_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root69_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product69_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root70) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root70_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root70_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product70_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root71) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root71_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root71_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product71_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root72) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root72_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root72_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product72_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root73) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root73_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root73_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product73_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root74) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root74_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root74_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product74_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root75) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root75_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root75_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product75_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root76) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root76_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root76_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product76_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root77) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root77_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root77_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product77_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root78) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root78_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root78_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product78_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root79) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root79_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root79_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product79_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root80) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root80_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root80_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product80_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root81) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root81_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root81_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product81_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root82) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root82_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root82_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product82_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root83) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root83_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root83_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product83_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root84) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root84_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root84_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product84_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root85) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root85_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root85_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product85_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root86) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root86_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root86_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product86_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root87) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root87_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root87_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product87_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root88) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root88_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root88_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product88_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root89) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root89_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root89_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product89_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root90) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root90_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root90_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product90_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root91) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root91_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root91_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product91_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root92) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root92_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root92_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product92_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root93) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root93_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root93_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product93_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root94) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root94_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root94_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product94_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root95) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root95_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root95_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product95_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.S_eq_root96) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root96_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.root96_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings02.product96_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
