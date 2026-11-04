import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings03
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root97 : S 97 = OriginalRow227TriangleRoots03.root97 := rfl

theorem root97_checked : sqrtCheck 97 (S 97) = true := by
  rw [S_eq_root97]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨0, by decide⟩

theorem root97_pos : 0 < (S 97).lo.toRat := by
  rw [S_eq_root97]
  exact OriginalRow227TriangleRoots03.root97_pos

theorem product97_pos : 0 < (roundedMul (-768) shift (S 97)).lo.toRat := by
  rw [S_eq_root97]
  exact OriginalRow227TriangleRoots03.product97_pos

theorem S_eq_root98 : S 98 = OriginalRow227TriangleRoots03.root98 := rfl

theorem root98_checked : sqrtCheck 98 (S 98) = true := by
  rw [S_eq_root98]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨1, by decide⟩

theorem root98_pos : 0 < (S 98).lo.toRat := by
  rw [S_eq_root98]
  exact OriginalRow227TriangleRoots03.root98_pos

theorem product98_pos : 0 < (roundedMul (-768) shift (S 98)).lo.toRat := by
  rw [S_eq_root98]
  exact OriginalRow227TriangleRoots03.product98_pos

theorem S_eq_root99 : S 99 = OriginalRow227TriangleRoots03.root99 := rfl

theorem root99_checked : sqrtCheck 99 (S 99) = true := by
  rw [S_eq_root99]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨2, by decide⟩

theorem root99_pos : 0 < (S 99).lo.toRat := by
  rw [S_eq_root99]
  exact OriginalRow227TriangleRoots03.root99_pos

theorem product99_pos : 0 < (roundedMul (-768) shift (S 99)).lo.toRat := by
  rw [S_eq_root99]
  exact OriginalRow227TriangleRoots03.product99_pos

theorem S_eq_root100 : S 100 = OriginalRow227TriangleRoots03.root100 := rfl

theorem root100_checked : sqrtCheck 100 (S 100) = true := by
  rw [S_eq_root100]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨3, by decide⟩

theorem root100_pos : 0 < (S 100).lo.toRat := by
  rw [S_eq_root100]
  exact OriginalRow227TriangleRoots03.root100_pos

theorem product100_pos : 0 < (roundedMul (-768) shift (S 100)).lo.toRat := by
  rw [S_eq_root100]
  exact OriginalRow227TriangleRoots03.product100_pos

theorem S_eq_root101 : S 101 = OriginalRow227TriangleRoots03.root101 := rfl

theorem root101_checked : sqrtCheck 101 (S 101) = true := by
  rw [S_eq_root101]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨4, by decide⟩

theorem root101_pos : 0 < (S 101).lo.toRat := by
  rw [S_eq_root101]
  exact OriginalRow227TriangleRoots03.root101_pos

theorem product101_pos : 0 < (roundedMul (-768) shift (S 101)).lo.toRat := by
  rw [S_eq_root101]
  exact OriginalRow227TriangleRoots03.product101_pos

theorem S_eq_root102 : S 102 = OriginalRow227TriangleRoots03.root102 := rfl

theorem root102_checked : sqrtCheck 102 (S 102) = true := by
  rw [S_eq_root102]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨5, by decide⟩

theorem root102_pos : 0 < (S 102).lo.toRat := by
  rw [S_eq_root102]
  exact OriginalRow227TriangleRoots03.root102_pos

theorem product102_pos : 0 < (roundedMul (-768) shift (S 102)).lo.toRat := by
  rw [S_eq_root102]
  exact OriginalRow227TriangleRoots03.product102_pos

theorem S_eq_root103 : S 103 = OriginalRow227TriangleRoots03.root103 := rfl

theorem root103_checked : sqrtCheck 103 (S 103) = true := by
  rw [S_eq_root103]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨6, by decide⟩

theorem root103_pos : 0 < (S 103).lo.toRat := by
  rw [S_eq_root103]
  exact OriginalRow227TriangleRoots03.root103_pos

theorem product103_pos : 0 < (roundedMul (-768) shift (S 103)).lo.toRat := by
  rw [S_eq_root103]
  exact OriginalRow227TriangleRoots03.product103_pos

theorem S_eq_root104 : S 104 = OriginalRow227TriangleRoots03.root104 := rfl

theorem root104_checked : sqrtCheck 104 (S 104) = true := by
  rw [S_eq_root104]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨7, by decide⟩

theorem root104_pos : 0 < (S 104).lo.toRat := by
  rw [S_eq_root104]
  exact OriginalRow227TriangleRoots03.root104_pos

theorem product104_pos : 0 < (roundedMul (-768) shift (S 104)).lo.toRat := by
  rw [S_eq_root104]
  exact OriginalRow227TriangleRoots03.product104_pos

theorem S_eq_root105 : S 105 = OriginalRow227TriangleRoots03.root105 := rfl

theorem root105_checked : sqrtCheck 105 (S 105) = true := by
  rw [S_eq_root105]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨8, by decide⟩

theorem root105_pos : 0 < (S 105).lo.toRat := by
  rw [S_eq_root105]
  exact OriginalRow227TriangleRoots03.root105_pos

theorem product105_pos : 0 < (roundedMul (-768) shift (S 105)).lo.toRat := by
  rw [S_eq_root105]
  exact OriginalRow227TriangleRoots03.product105_pos

theorem S_eq_root106 : S 106 = OriginalRow227TriangleRoots03.root106 := rfl

theorem root106_checked : sqrtCheck 106 (S 106) = true := by
  rw [S_eq_root106]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨9, by decide⟩

theorem root106_pos : 0 < (S 106).lo.toRat := by
  rw [S_eq_root106]
  exact OriginalRow227TriangleRoots03.root106_pos

theorem product106_pos : 0 < (roundedMul (-768) shift (S 106)).lo.toRat := by
  rw [S_eq_root106]
  exact OriginalRow227TriangleRoots03.product106_pos

theorem S_eq_root107 : S 107 = OriginalRow227TriangleRoots03.root107 := rfl

theorem root107_checked : sqrtCheck 107 (S 107) = true := by
  rw [S_eq_root107]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨10, by decide⟩

theorem root107_pos : 0 < (S 107).lo.toRat := by
  rw [S_eq_root107]
  exact OriginalRow227TriangleRoots03.root107_pos

theorem product107_pos : 0 < (roundedMul (-768) shift (S 107)).lo.toRat := by
  rw [S_eq_root107]
  exact OriginalRow227TriangleRoots03.product107_pos

theorem S_eq_root108 : S 108 = OriginalRow227TriangleRoots03.root108 := rfl

theorem root108_checked : sqrtCheck 108 (S 108) = true := by
  rw [S_eq_root108]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨11, by decide⟩

theorem root108_pos : 0 < (S 108).lo.toRat := by
  rw [S_eq_root108]
  exact OriginalRow227TriangleRoots03.root108_pos

theorem product108_pos : 0 < (roundedMul (-768) shift (S 108)).lo.toRat := by
  rw [S_eq_root108]
  exact OriginalRow227TriangleRoots03.product108_pos

theorem S_eq_root109 : S 109 = OriginalRow227TriangleRoots03.root109 := rfl

theorem root109_checked : sqrtCheck 109 (S 109) = true := by
  rw [S_eq_root109]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨12, by decide⟩

theorem root109_pos : 0 < (S 109).lo.toRat := by
  rw [S_eq_root109]
  exact OriginalRow227TriangleRoots03.root109_pos

theorem product109_pos : 0 < (roundedMul (-768) shift (S 109)).lo.toRat := by
  rw [S_eq_root109]
  exact OriginalRow227TriangleRoots03.product109_pos

theorem S_eq_root110 : S 110 = OriginalRow227TriangleRoots03.root110 := rfl

theorem root110_checked : sqrtCheck 110 (S 110) = true := by
  rw [S_eq_root110]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨13, by decide⟩

theorem root110_pos : 0 < (S 110).lo.toRat := by
  rw [S_eq_root110]
  exact OriginalRow227TriangleRoots03.root110_pos

theorem product110_pos : 0 < (roundedMul (-768) shift (S 110)).lo.toRat := by
  rw [S_eq_root110]
  exact OriginalRow227TriangleRoots03.product110_pos

theorem S_eq_root111 : S 111 = OriginalRow227TriangleRoots03.root111 := rfl

theorem root111_checked : sqrtCheck 111 (S 111) = true := by
  rw [S_eq_root111]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨14, by decide⟩

theorem root111_pos : 0 < (S 111).lo.toRat := by
  rw [S_eq_root111]
  exact OriginalRow227TriangleRoots03.root111_pos

theorem product111_pos : 0 < (roundedMul (-768) shift (S 111)).lo.toRat := by
  rw [S_eq_root111]
  exact OriginalRow227TriangleRoots03.product111_pos

theorem S_eq_root112 : S 112 = OriginalRow227TriangleRoots03.root112 := rfl

theorem root112_checked : sqrtCheck 112 (S 112) = true := by
  rw [S_eq_root112]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨15, by decide⟩

theorem root112_pos : 0 < (S 112).lo.toRat := by
  rw [S_eq_root112]
  exact OriginalRow227TriangleRoots03.root112_pos

theorem product112_pos : 0 < (roundedMul (-768) shift (S 112)).lo.toRat := by
  rw [S_eq_root112]
  exact OriginalRow227TriangleRoots03.product112_pos

theorem S_eq_root113 : S 113 = OriginalRow227TriangleRoots03.root113 := rfl

theorem root113_checked : sqrtCheck 113 (S 113) = true := by
  rw [S_eq_root113]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨16, by decide⟩

theorem root113_pos : 0 < (S 113).lo.toRat := by
  rw [S_eq_root113]
  exact OriginalRow227TriangleRoots03.root113_pos

theorem product113_pos : 0 < (roundedMul (-768) shift (S 113)).lo.toRat := by
  rw [S_eq_root113]
  exact OriginalRow227TriangleRoots03.product113_pos

theorem S_eq_root114 : S 114 = OriginalRow227TriangleRoots03.root114 := rfl

theorem root114_checked : sqrtCheck 114 (S 114) = true := by
  rw [S_eq_root114]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨17, by decide⟩

theorem root114_pos : 0 < (S 114).lo.toRat := by
  rw [S_eq_root114]
  exact OriginalRow227TriangleRoots03.root114_pos

theorem product114_pos : 0 < (roundedMul (-768) shift (S 114)).lo.toRat := by
  rw [S_eq_root114]
  exact OriginalRow227TriangleRoots03.product114_pos

theorem S_eq_root115 : S 115 = OriginalRow227TriangleRoots03.root115 := rfl

theorem root115_checked : sqrtCheck 115 (S 115) = true := by
  rw [S_eq_root115]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨18, by decide⟩

theorem root115_pos : 0 < (S 115).lo.toRat := by
  rw [S_eq_root115]
  exact OriginalRow227TriangleRoots03.root115_pos

theorem product115_pos : 0 < (roundedMul (-768) shift (S 115)).lo.toRat := by
  rw [S_eq_root115]
  exact OriginalRow227TriangleRoots03.product115_pos

theorem S_eq_root116 : S 116 = OriginalRow227TriangleRoots03.root116 := rfl

theorem root116_checked : sqrtCheck 116 (S 116) = true := by
  rw [S_eq_root116]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨19, by decide⟩

theorem root116_pos : 0 < (S 116).lo.toRat := by
  rw [S_eq_root116]
  exact OriginalRow227TriangleRoots03.root116_pos

theorem product116_pos : 0 < (roundedMul (-768) shift (S 116)).lo.toRat := by
  rw [S_eq_root116]
  exact OriginalRow227TriangleRoots03.product116_pos

theorem S_eq_root117 : S 117 = OriginalRow227TriangleRoots03.root117 := rfl

theorem root117_checked : sqrtCheck 117 (S 117) = true := by
  rw [S_eq_root117]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨20, by decide⟩

theorem root117_pos : 0 < (S 117).lo.toRat := by
  rw [S_eq_root117]
  exact OriginalRow227TriangleRoots03.root117_pos

theorem product117_pos : 0 < (roundedMul (-768) shift (S 117)).lo.toRat := by
  rw [S_eq_root117]
  exact OriginalRow227TriangleRoots03.product117_pos

theorem S_eq_root118 : S 118 = OriginalRow227TriangleRoots03.root118 := rfl

theorem root118_checked : sqrtCheck 118 (S 118) = true := by
  rw [S_eq_root118]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨21, by decide⟩

theorem root118_pos : 0 < (S 118).lo.toRat := by
  rw [S_eq_root118]
  exact OriginalRow227TriangleRoots03.root118_pos

theorem product118_pos : 0 < (roundedMul (-768) shift (S 118)).lo.toRat := by
  rw [S_eq_root118]
  exact OriginalRow227TriangleRoots03.product118_pos

theorem S_eq_root119 : S 119 = OriginalRow227TriangleRoots03.root119 := rfl

theorem root119_checked : sqrtCheck 119 (S 119) = true := by
  rw [S_eq_root119]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨22, by decide⟩

theorem root119_pos : 0 < (S 119).lo.toRat := by
  rw [S_eq_root119]
  exact OriginalRow227TriangleRoots03.root119_pos

theorem product119_pos : 0 < (roundedMul (-768) shift (S 119)).lo.toRat := by
  rw [S_eq_root119]
  exact OriginalRow227TriangleRoots03.product119_pos

theorem S_eq_root120 : S 120 = OriginalRow227TriangleRoots03.root120 := rfl

theorem root120_checked : sqrtCheck 120 (S 120) = true := by
  rw [S_eq_root120]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨23, by decide⟩

theorem root120_pos : 0 < (S 120).lo.toRat := by
  rw [S_eq_root120]
  exact OriginalRow227TriangleRoots03.root120_pos

theorem product120_pos : 0 < (roundedMul (-768) shift (S 120)).lo.toRat := by
  rw [S_eq_root120]
  exact OriginalRow227TriangleRoots03.product120_pos

theorem S_eq_root121 : S 121 = OriginalRow227TriangleRoots03.root121 := rfl

theorem root121_checked : sqrtCheck 121 (S 121) = true := by
  rw [S_eq_root121]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨24, by decide⟩

theorem root121_pos : 0 < (S 121).lo.toRat := by
  rw [S_eq_root121]
  exact OriginalRow227TriangleRoots03.root121_pos

theorem product121_pos : 0 < (roundedMul (-768) shift (S 121)).lo.toRat := by
  rw [S_eq_root121]
  exact OriginalRow227TriangleRoots03.product121_pos

theorem S_eq_root122 : S 122 = OriginalRow227TriangleRoots03.root122 := rfl

theorem root122_checked : sqrtCheck 122 (S 122) = true := by
  rw [S_eq_root122]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨25, by decide⟩

theorem root122_pos : 0 < (S 122).lo.toRat := by
  rw [S_eq_root122]
  exact OriginalRow227TriangleRoots03.root122_pos

theorem product122_pos : 0 < (roundedMul (-768) shift (S 122)).lo.toRat := by
  rw [S_eq_root122]
  exact OriginalRow227TriangleRoots03.product122_pos

theorem S_eq_root123 : S 123 = OriginalRow227TriangleRoots03.root123 := rfl

theorem root123_checked : sqrtCheck 123 (S 123) = true := by
  rw [S_eq_root123]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨26, by decide⟩

theorem root123_pos : 0 < (S 123).lo.toRat := by
  rw [S_eq_root123]
  exact OriginalRow227TriangleRoots03.root123_pos

theorem product123_pos : 0 < (roundedMul (-768) shift (S 123)).lo.toRat := by
  rw [S_eq_root123]
  exact OriginalRow227TriangleRoots03.product123_pos

theorem S_eq_root124 : S 124 = OriginalRow227TriangleRoots03.root124 := rfl

theorem root124_checked : sqrtCheck 124 (S 124) = true := by
  rw [S_eq_root124]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨27, by decide⟩

theorem root124_pos : 0 < (S 124).lo.toRat := by
  rw [S_eq_root124]
  exact OriginalRow227TriangleRoots03.root124_pos

theorem product124_pos : 0 < (roundedMul (-768) shift (S 124)).lo.toRat := by
  rw [S_eq_root124]
  exact OriginalRow227TriangleRoots03.product124_pos

theorem S_eq_root125 : S 125 = OriginalRow227TriangleRoots03.root125 := rfl

theorem root125_checked : sqrtCheck 125 (S 125) = true := by
  rw [S_eq_root125]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨28, by decide⟩

theorem root125_pos : 0 < (S 125).lo.toRat := by
  rw [S_eq_root125]
  exact OriginalRow227TriangleRoots03.root125_pos

theorem product125_pos : 0 < (roundedMul (-768) shift (S 125)).lo.toRat := by
  rw [S_eq_root125]
  exact OriginalRow227TriangleRoots03.product125_pos

theorem S_eq_root126 : S 126 = OriginalRow227TriangleRoots03.root126 := rfl

theorem root126_checked : sqrtCheck 126 (S 126) = true := by
  rw [S_eq_root126]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨29, by decide⟩

theorem root126_pos : 0 < (S 126).lo.toRat := by
  rw [S_eq_root126]
  exact OriginalRow227TriangleRoots03.root126_pos

theorem product126_pos : 0 < (roundedMul (-768) shift (S 126)).lo.toRat := by
  rw [S_eq_root126]
  exact OriginalRow227TriangleRoots03.product126_pos

theorem S_eq_root127 : S 127 = OriginalRow227TriangleRoots03.root127 := rfl

theorem root127_checked : sqrtCheck 127 (S 127) = true := by
  rw [S_eq_root127]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨30, by decide⟩

theorem root127_pos : 0 < (S 127).lo.toRat := by
  rw [S_eq_root127]
  exact OriginalRow227TriangleRoots03.root127_pos

theorem product127_pos : 0 < (roundedMul (-768) shift (S 127)).lo.toRat := by
  rw [S_eq_root127]
  exact OriginalRow227TriangleRoots03.product127_pos

theorem S_eq_root128 : S 128 = OriginalRow227TriangleRoots03.root128 := rfl

theorem root128_checked : sqrtCheck 128 (S 128) = true := by
  rw [S_eq_root128]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots03.entries OriginalRow227TriangleRoots03.checked ⟨31, by decide⟩

theorem root128_pos : 0 < (S 128).lo.toRat := by
  rw [S_eq_root128]
  exact OriginalRow227TriangleRoots03.root128_pos

theorem product128_pos : 0 < (roundedMul (-768) shift (S 128)).lo.toRat := by
  rw [S_eq_root128]
  exact OriginalRow227TriangleRoots03.product128_pos

end Grothe.UpperChaos.OriginalRow227RootBindings03

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root97) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root97_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root97_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product97_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root98) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root98_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root98_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product98_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root99) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root99_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root99_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product99_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root100) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root100_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root100_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product100_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root101) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root101_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root101_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product101_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root102) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root102_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root102_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product102_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root103) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root103_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root103_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product103_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root104) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root104_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root104_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product104_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root105) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root105_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root105_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product105_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root106) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root106_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root106_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product106_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root107) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root107_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root107_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product107_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root108) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root108_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root108_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product108_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root109) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root109_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root109_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product109_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root110) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root110_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root110_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product110_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root111) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root111_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root111_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product111_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root112) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root112_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root112_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product112_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root113) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root113_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root113_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product113_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root114) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root114_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root114_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product114_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root115) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root115_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root115_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product115_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root116) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root116_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root116_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product116_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root117) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root117_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root117_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product117_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root118) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root118_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root118_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product118_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root119) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root119_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root119_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product119_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root120) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root120_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root120_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product120_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root121) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root121_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root121_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product121_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root122) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root122_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root122_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product122_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root123) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root123_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root123_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product123_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root124) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root124_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root124_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product124_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root125) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root125_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root125_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product125_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root126) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root126_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root126_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product126_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root127) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root127_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root127_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product127_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.S_eq_root128) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root128_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.root128_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings03.product128_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
