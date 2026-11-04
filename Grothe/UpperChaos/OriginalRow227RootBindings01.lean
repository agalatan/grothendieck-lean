import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings01
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root33 : S 33 = OriginalRow227TriangleRoots01.root33 := rfl

theorem root33_checked : sqrtCheck 33 (S 33) = true := by
  rw [S_eq_root33]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨0, by decide⟩

theorem root33_pos : 0 < (S 33).lo.toRat := by
  rw [S_eq_root33]
  exact OriginalRow227TriangleRoots01.root33_pos

theorem product33_pos : 0 < (roundedMul (-768) shift (S 33)).lo.toRat := by
  rw [S_eq_root33]
  exact OriginalRow227TriangleRoots01.product33_pos

theorem S_eq_root34 : S 34 = OriginalRow227TriangleRoots01.root34 := rfl

theorem root34_checked : sqrtCheck 34 (S 34) = true := by
  rw [S_eq_root34]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨1, by decide⟩

theorem root34_pos : 0 < (S 34).lo.toRat := by
  rw [S_eq_root34]
  exact OriginalRow227TriangleRoots01.root34_pos

theorem product34_pos : 0 < (roundedMul (-768) shift (S 34)).lo.toRat := by
  rw [S_eq_root34]
  exact OriginalRow227TriangleRoots01.product34_pos

theorem S_eq_root35 : S 35 = OriginalRow227TriangleRoots01.root35 := rfl

theorem root35_checked : sqrtCheck 35 (S 35) = true := by
  rw [S_eq_root35]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨2, by decide⟩

theorem root35_pos : 0 < (S 35).lo.toRat := by
  rw [S_eq_root35]
  exact OriginalRow227TriangleRoots01.root35_pos

theorem product35_pos : 0 < (roundedMul (-768) shift (S 35)).lo.toRat := by
  rw [S_eq_root35]
  exact OriginalRow227TriangleRoots01.product35_pos

theorem S_eq_root36 : S 36 = OriginalRow227TriangleRoots01.root36 := rfl

theorem root36_checked : sqrtCheck 36 (S 36) = true := by
  rw [S_eq_root36]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨3, by decide⟩

theorem root36_pos : 0 < (S 36).lo.toRat := by
  rw [S_eq_root36]
  exact OriginalRow227TriangleRoots01.root36_pos

theorem product36_pos : 0 < (roundedMul (-768) shift (S 36)).lo.toRat := by
  rw [S_eq_root36]
  exact OriginalRow227TriangleRoots01.product36_pos

theorem S_eq_root37 : S 37 = OriginalRow227TriangleRoots01.root37 := rfl

theorem root37_checked : sqrtCheck 37 (S 37) = true := by
  rw [S_eq_root37]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨4, by decide⟩

theorem root37_pos : 0 < (S 37).lo.toRat := by
  rw [S_eq_root37]
  exact OriginalRow227TriangleRoots01.root37_pos

theorem product37_pos : 0 < (roundedMul (-768) shift (S 37)).lo.toRat := by
  rw [S_eq_root37]
  exact OriginalRow227TriangleRoots01.product37_pos

theorem S_eq_root38 : S 38 = OriginalRow227TriangleRoots01.root38 := rfl

theorem root38_checked : sqrtCheck 38 (S 38) = true := by
  rw [S_eq_root38]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨5, by decide⟩

theorem root38_pos : 0 < (S 38).lo.toRat := by
  rw [S_eq_root38]
  exact OriginalRow227TriangleRoots01.root38_pos

theorem product38_pos : 0 < (roundedMul (-768) shift (S 38)).lo.toRat := by
  rw [S_eq_root38]
  exact OriginalRow227TriangleRoots01.product38_pos

theorem S_eq_root39 : S 39 = OriginalRow227TriangleRoots01.root39 := rfl

theorem root39_checked : sqrtCheck 39 (S 39) = true := by
  rw [S_eq_root39]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨6, by decide⟩

theorem root39_pos : 0 < (S 39).lo.toRat := by
  rw [S_eq_root39]
  exact OriginalRow227TriangleRoots01.root39_pos

theorem product39_pos : 0 < (roundedMul (-768) shift (S 39)).lo.toRat := by
  rw [S_eq_root39]
  exact OriginalRow227TriangleRoots01.product39_pos

theorem S_eq_root40 : S 40 = OriginalRow227TriangleRoots01.root40 := rfl

theorem root40_checked : sqrtCheck 40 (S 40) = true := by
  rw [S_eq_root40]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨7, by decide⟩

theorem root40_pos : 0 < (S 40).lo.toRat := by
  rw [S_eq_root40]
  exact OriginalRow227TriangleRoots01.root40_pos

theorem product40_pos : 0 < (roundedMul (-768) shift (S 40)).lo.toRat := by
  rw [S_eq_root40]
  exact OriginalRow227TriangleRoots01.product40_pos

theorem S_eq_root41 : S 41 = OriginalRow227TriangleRoots01.root41 := rfl

theorem root41_checked : sqrtCheck 41 (S 41) = true := by
  rw [S_eq_root41]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨8, by decide⟩

theorem root41_pos : 0 < (S 41).lo.toRat := by
  rw [S_eq_root41]
  exact OriginalRow227TriangleRoots01.root41_pos

theorem product41_pos : 0 < (roundedMul (-768) shift (S 41)).lo.toRat := by
  rw [S_eq_root41]
  exact OriginalRow227TriangleRoots01.product41_pos

theorem S_eq_root42 : S 42 = OriginalRow227TriangleRoots01.root42 := rfl

theorem root42_checked : sqrtCheck 42 (S 42) = true := by
  rw [S_eq_root42]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨9, by decide⟩

theorem root42_pos : 0 < (S 42).lo.toRat := by
  rw [S_eq_root42]
  exact OriginalRow227TriangleRoots01.root42_pos

theorem product42_pos : 0 < (roundedMul (-768) shift (S 42)).lo.toRat := by
  rw [S_eq_root42]
  exact OriginalRow227TriangleRoots01.product42_pos

theorem S_eq_root43 : S 43 = OriginalRow227TriangleRoots01.root43 := rfl

theorem root43_checked : sqrtCheck 43 (S 43) = true := by
  rw [S_eq_root43]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨10, by decide⟩

theorem root43_pos : 0 < (S 43).lo.toRat := by
  rw [S_eq_root43]
  exact OriginalRow227TriangleRoots01.root43_pos

theorem product43_pos : 0 < (roundedMul (-768) shift (S 43)).lo.toRat := by
  rw [S_eq_root43]
  exact OriginalRow227TriangleRoots01.product43_pos

theorem S_eq_root44 : S 44 = OriginalRow227TriangleRoots01.root44 := rfl

theorem root44_checked : sqrtCheck 44 (S 44) = true := by
  rw [S_eq_root44]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨11, by decide⟩

theorem root44_pos : 0 < (S 44).lo.toRat := by
  rw [S_eq_root44]
  exact OriginalRow227TriangleRoots01.root44_pos

theorem product44_pos : 0 < (roundedMul (-768) shift (S 44)).lo.toRat := by
  rw [S_eq_root44]
  exact OriginalRow227TriangleRoots01.product44_pos

theorem S_eq_root45 : S 45 = OriginalRow227TriangleRoots01.root45 := rfl

theorem root45_checked : sqrtCheck 45 (S 45) = true := by
  rw [S_eq_root45]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨12, by decide⟩

theorem root45_pos : 0 < (S 45).lo.toRat := by
  rw [S_eq_root45]
  exact OriginalRow227TriangleRoots01.root45_pos

theorem product45_pos : 0 < (roundedMul (-768) shift (S 45)).lo.toRat := by
  rw [S_eq_root45]
  exact OriginalRow227TriangleRoots01.product45_pos

theorem S_eq_root46 : S 46 = OriginalRow227TriangleRoots01.root46 := rfl

theorem root46_checked : sqrtCheck 46 (S 46) = true := by
  rw [S_eq_root46]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨13, by decide⟩

theorem root46_pos : 0 < (S 46).lo.toRat := by
  rw [S_eq_root46]
  exact OriginalRow227TriangleRoots01.root46_pos

theorem product46_pos : 0 < (roundedMul (-768) shift (S 46)).lo.toRat := by
  rw [S_eq_root46]
  exact OriginalRow227TriangleRoots01.product46_pos

theorem S_eq_root47 : S 47 = OriginalRow227TriangleRoots01.root47 := rfl

theorem root47_checked : sqrtCheck 47 (S 47) = true := by
  rw [S_eq_root47]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨14, by decide⟩

theorem root47_pos : 0 < (S 47).lo.toRat := by
  rw [S_eq_root47]
  exact OriginalRow227TriangleRoots01.root47_pos

theorem product47_pos : 0 < (roundedMul (-768) shift (S 47)).lo.toRat := by
  rw [S_eq_root47]
  exact OriginalRow227TriangleRoots01.product47_pos

theorem S_eq_root48 : S 48 = OriginalRow227TriangleRoots01.root48 := rfl

theorem root48_checked : sqrtCheck 48 (S 48) = true := by
  rw [S_eq_root48]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨15, by decide⟩

theorem root48_pos : 0 < (S 48).lo.toRat := by
  rw [S_eq_root48]
  exact OriginalRow227TriangleRoots01.root48_pos

theorem product48_pos : 0 < (roundedMul (-768) shift (S 48)).lo.toRat := by
  rw [S_eq_root48]
  exact OriginalRow227TriangleRoots01.product48_pos

theorem S_eq_root49 : S 49 = OriginalRow227TriangleRoots01.root49 := rfl

theorem root49_checked : sqrtCheck 49 (S 49) = true := by
  rw [S_eq_root49]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨16, by decide⟩

theorem root49_pos : 0 < (S 49).lo.toRat := by
  rw [S_eq_root49]
  exact OriginalRow227TriangleRoots01.root49_pos

theorem product49_pos : 0 < (roundedMul (-768) shift (S 49)).lo.toRat := by
  rw [S_eq_root49]
  exact OriginalRow227TriangleRoots01.product49_pos

theorem S_eq_root50 : S 50 = OriginalRow227TriangleRoots01.root50 := rfl

theorem root50_checked : sqrtCheck 50 (S 50) = true := by
  rw [S_eq_root50]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨17, by decide⟩

theorem root50_pos : 0 < (S 50).lo.toRat := by
  rw [S_eq_root50]
  exact OriginalRow227TriangleRoots01.root50_pos

theorem product50_pos : 0 < (roundedMul (-768) shift (S 50)).lo.toRat := by
  rw [S_eq_root50]
  exact OriginalRow227TriangleRoots01.product50_pos

theorem S_eq_root51 : S 51 = OriginalRow227TriangleRoots01.root51 := rfl

theorem root51_checked : sqrtCheck 51 (S 51) = true := by
  rw [S_eq_root51]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨18, by decide⟩

theorem root51_pos : 0 < (S 51).lo.toRat := by
  rw [S_eq_root51]
  exact OriginalRow227TriangleRoots01.root51_pos

theorem product51_pos : 0 < (roundedMul (-768) shift (S 51)).lo.toRat := by
  rw [S_eq_root51]
  exact OriginalRow227TriangleRoots01.product51_pos

theorem S_eq_root52 : S 52 = OriginalRow227TriangleRoots01.root52 := rfl

theorem root52_checked : sqrtCheck 52 (S 52) = true := by
  rw [S_eq_root52]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨19, by decide⟩

theorem root52_pos : 0 < (S 52).lo.toRat := by
  rw [S_eq_root52]
  exact OriginalRow227TriangleRoots01.root52_pos

theorem product52_pos : 0 < (roundedMul (-768) shift (S 52)).lo.toRat := by
  rw [S_eq_root52]
  exact OriginalRow227TriangleRoots01.product52_pos

theorem S_eq_root53 : S 53 = OriginalRow227TriangleRoots01.root53 := rfl

theorem root53_checked : sqrtCheck 53 (S 53) = true := by
  rw [S_eq_root53]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨20, by decide⟩

theorem root53_pos : 0 < (S 53).lo.toRat := by
  rw [S_eq_root53]
  exact OriginalRow227TriangleRoots01.root53_pos

theorem product53_pos : 0 < (roundedMul (-768) shift (S 53)).lo.toRat := by
  rw [S_eq_root53]
  exact OriginalRow227TriangleRoots01.product53_pos

theorem S_eq_root54 : S 54 = OriginalRow227TriangleRoots01.root54 := rfl

theorem root54_checked : sqrtCheck 54 (S 54) = true := by
  rw [S_eq_root54]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨21, by decide⟩

theorem root54_pos : 0 < (S 54).lo.toRat := by
  rw [S_eq_root54]
  exact OriginalRow227TriangleRoots01.root54_pos

theorem product54_pos : 0 < (roundedMul (-768) shift (S 54)).lo.toRat := by
  rw [S_eq_root54]
  exact OriginalRow227TriangleRoots01.product54_pos

theorem S_eq_root55 : S 55 = OriginalRow227TriangleRoots01.root55 := rfl

theorem root55_checked : sqrtCheck 55 (S 55) = true := by
  rw [S_eq_root55]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨22, by decide⟩

theorem root55_pos : 0 < (S 55).lo.toRat := by
  rw [S_eq_root55]
  exact OriginalRow227TriangleRoots01.root55_pos

theorem product55_pos : 0 < (roundedMul (-768) shift (S 55)).lo.toRat := by
  rw [S_eq_root55]
  exact OriginalRow227TriangleRoots01.product55_pos

theorem S_eq_root56 : S 56 = OriginalRow227TriangleRoots01.root56 := rfl

theorem root56_checked : sqrtCheck 56 (S 56) = true := by
  rw [S_eq_root56]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨23, by decide⟩

theorem root56_pos : 0 < (S 56).lo.toRat := by
  rw [S_eq_root56]
  exact OriginalRow227TriangleRoots01.root56_pos

theorem product56_pos : 0 < (roundedMul (-768) shift (S 56)).lo.toRat := by
  rw [S_eq_root56]
  exact OriginalRow227TriangleRoots01.product56_pos

theorem S_eq_root57 : S 57 = OriginalRow227TriangleRoots01.root57 := rfl

theorem root57_checked : sqrtCheck 57 (S 57) = true := by
  rw [S_eq_root57]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨24, by decide⟩

theorem root57_pos : 0 < (S 57).lo.toRat := by
  rw [S_eq_root57]
  exact OriginalRow227TriangleRoots01.root57_pos

theorem product57_pos : 0 < (roundedMul (-768) shift (S 57)).lo.toRat := by
  rw [S_eq_root57]
  exact OriginalRow227TriangleRoots01.product57_pos

theorem S_eq_root58 : S 58 = OriginalRow227TriangleRoots01.root58 := rfl

theorem root58_checked : sqrtCheck 58 (S 58) = true := by
  rw [S_eq_root58]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨25, by decide⟩

theorem root58_pos : 0 < (S 58).lo.toRat := by
  rw [S_eq_root58]
  exact OriginalRow227TriangleRoots01.root58_pos

theorem product58_pos : 0 < (roundedMul (-768) shift (S 58)).lo.toRat := by
  rw [S_eq_root58]
  exact OriginalRow227TriangleRoots01.product58_pos

theorem S_eq_root59 : S 59 = OriginalRow227TriangleRoots01.root59 := rfl

theorem root59_checked : sqrtCheck 59 (S 59) = true := by
  rw [S_eq_root59]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨26, by decide⟩

theorem root59_pos : 0 < (S 59).lo.toRat := by
  rw [S_eq_root59]
  exact OriginalRow227TriangleRoots01.root59_pos

theorem product59_pos : 0 < (roundedMul (-768) shift (S 59)).lo.toRat := by
  rw [S_eq_root59]
  exact OriginalRow227TriangleRoots01.product59_pos

theorem S_eq_root60 : S 60 = OriginalRow227TriangleRoots01.root60 := rfl

theorem root60_checked : sqrtCheck 60 (S 60) = true := by
  rw [S_eq_root60]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨27, by decide⟩

theorem root60_pos : 0 < (S 60).lo.toRat := by
  rw [S_eq_root60]
  exact OriginalRow227TriangleRoots01.root60_pos

theorem product60_pos : 0 < (roundedMul (-768) shift (S 60)).lo.toRat := by
  rw [S_eq_root60]
  exact OriginalRow227TriangleRoots01.product60_pos

theorem S_eq_root61 : S 61 = OriginalRow227TriangleRoots01.root61 := rfl

theorem root61_checked : sqrtCheck 61 (S 61) = true := by
  rw [S_eq_root61]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨28, by decide⟩

theorem root61_pos : 0 < (S 61).lo.toRat := by
  rw [S_eq_root61]
  exact OriginalRow227TriangleRoots01.root61_pos

theorem product61_pos : 0 < (roundedMul (-768) shift (S 61)).lo.toRat := by
  rw [S_eq_root61]
  exact OriginalRow227TriangleRoots01.product61_pos

theorem S_eq_root62 : S 62 = OriginalRow227TriangleRoots01.root62 := rfl

theorem root62_checked : sqrtCheck 62 (S 62) = true := by
  rw [S_eq_root62]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨29, by decide⟩

theorem root62_pos : 0 < (S 62).lo.toRat := by
  rw [S_eq_root62]
  exact OriginalRow227TriangleRoots01.root62_pos

theorem product62_pos : 0 < (roundedMul (-768) shift (S 62)).lo.toRat := by
  rw [S_eq_root62]
  exact OriginalRow227TriangleRoots01.product62_pos

theorem S_eq_root63 : S 63 = OriginalRow227TriangleRoots01.root63 := rfl

theorem root63_checked : sqrtCheck 63 (S 63) = true := by
  rw [S_eq_root63]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨30, by decide⟩

theorem root63_pos : 0 < (S 63).lo.toRat := by
  rw [S_eq_root63]
  exact OriginalRow227TriangleRoots01.root63_pos

theorem product63_pos : 0 < (roundedMul (-768) shift (S 63)).lo.toRat := by
  rw [S_eq_root63]
  exact OriginalRow227TriangleRoots01.product63_pos

theorem S_eq_root64 : S 64 = OriginalRow227TriangleRoots01.root64 := rfl

theorem root64_checked : sqrtCheck 64 (S 64) = true := by
  rw [S_eq_root64]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots01.entries OriginalRow227TriangleRoots01.checked ⟨31, by decide⟩

theorem root64_pos : 0 < (S 64).lo.toRat := by
  rw [S_eq_root64]
  exact OriginalRow227TriangleRoots01.root64_pos

theorem product64_pos : 0 < (roundedMul (-768) shift (S 64)).lo.toRat := by
  rw [S_eq_root64]
  exact OriginalRow227TriangleRoots01.product64_pos

end Grothe.UpperChaos.OriginalRow227RootBindings01

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root33) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root33_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root33_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product33_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root34) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root34_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root34_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product34_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root35) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root35_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root35_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product35_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root36) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root36_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root36_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product36_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root37) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root37_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root37_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product37_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root38) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root38_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root38_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product38_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root39) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root39_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root39_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product39_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root40) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root40_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root40_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product40_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root41) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root41_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root41_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product41_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root42) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root42_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root42_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product42_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root43) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root43_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root43_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product43_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root44) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root44_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root44_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product44_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root45) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root45_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root45_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product45_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root46) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root46_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root46_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product46_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root47) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root47_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root47_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product47_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root48) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root48_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root48_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product48_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root49) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root49_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root49_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product49_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root50) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root50_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root50_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product50_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root51) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root51_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root51_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product51_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root52) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root52_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root52_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product52_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root53) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root53_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root53_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product53_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root54) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root54_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root54_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product54_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root55) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root55_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root55_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product55_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root56) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root56_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root56_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product56_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root57) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root57_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root57_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product57_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root58) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root58_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root58_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product58_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root59) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root59_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root59_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product59_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root60) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root60_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root60_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product60_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root61) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root61_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root61_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product61_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root62) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root62_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root62_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product62_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root63) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root63_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root63_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product63_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.S_eq_root64) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root64_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.root64_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings01.product64_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
