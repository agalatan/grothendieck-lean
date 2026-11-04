import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings04
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root129 : S 129 = OriginalRow227TriangleRoots04.root129 := rfl

theorem root129_checked : sqrtCheck 129 (S 129) = true := by
  rw [S_eq_root129]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨0, by decide⟩

theorem root129_pos : 0 < (S 129).lo.toRat := by
  rw [S_eq_root129]
  exact OriginalRow227TriangleRoots04.root129_pos

theorem product129_pos : 0 < (roundedMul (-768) shift (S 129)).lo.toRat := by
  rw [S_eq_root129]
  exact OriginalRow227TriangleRoots04.product129_pos

theorem S_eq_root130 : S 130 = OriginalRow227TriangleRoots04.root130 := rfl

theorem root130_checked : sqrtCheck 130 (S 130) = true := by
  rw [S_eq_root130]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨1, by decide⟩

theorem root130_pos : 0 < (S 130).lo.toRat := by
  rw [S_eq_root130]
  exact OriginalRow227TriangleRoots04.root130_pos

theorem product130_pos : 0 < (roundedMul (-768) shift (S 130)).lo.toRat := by
  rw [S_eq_root130]
  exact OriginalRow227TriangleRoots04.product130_pos

theorem S_eq_root131 : S 131 = OriginalRow227TriangleRoots04.root131 := rfl

theorem root131_checked : sqrtCheck 131 (S 131) = true := by
  rw [S_eq_root131]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨2, by decide⟩

theorem root131_pos : 0 < (S 131).lo.toRat := by
  rw [S_eq_root131]
  exact OriginalRow227TriangleRoots04.root131_pos

theorem product131_pos : 0 < (roundedMul (-768) shift (S 131)).lo.toRat := by
  rw [S_eq_root131]
  exact OriginalRow227TriangleRoots04.product131_pos

theorem S_eq_root132 : S 132 = OriginalRow227TriangleRoots04.root132 := rfl

theorem root132_checked : sqrtCheck 132 (S 132) = true := by
  rw [S_eq_root132]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨3, by decide⟩

theorem root132_pos : 0 < (S 132).lo.toRat := by
  rw [S_eq_root132]
  exact OriginalRow227TriangleRoots04.root132_pos

theorem product132_pos : 0 < (roundedMul (-768) shift (S 132)).lo.toRat := by
  rw [S_eq_root132]
  exact OriginalRow227TriangleRoots04.product132_pos

theorem S_eq_root133 : S 133 = OriginalRow227TriangleRoots04.root133 := rfl

theorem root133_checked : sqrtCheck 133 (S 133) = true := by
  rw [S_eq_root133]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨4, by decide⟩

theorem root133_pos : 0 < (S 133).lo.toRat := by
  rw [S_eq_root133]
  exact OriginalRow227TriangleRoots04.root133_pos

theorem product133_pos : 0 < (roundedMul (-768) shift (S 133)).lo.toRat := by
  rw [S_eq_root133]
  exact OriginalRow227TriangleRoots04.product133_pos

theorem S_eq_root134 : S 134 = OriginalRow227TriangleRoots04.root134 := rfl

theorem root134_checked : sqrtCheck 134 (S 134) = true := by
  rw [S_eq_root134]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨5, by decide⟩

theorem root134_pos : 0 < (S 134).lo.toRat := by
  rw [S_eq_root134]
  exact OriginalRow227TriangleRoots04.root134_pos

theorem product134_pos : 0 < (roundedMul (-768) shift (S 134)).lo.toRat := by
  rw [S_eq_root134]
  exact OriginalRow227TriangleRoots04.product134_pos

theorem S_eq_root135 : S 135 = OriginalRow227TriangleRoots04.root135 := rfl

theorem root135_checked : sqrtCheck 135 (S 135) = true := by
  rw [S_eq_root135]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨6, by decide⟩

theorem root135_pos : 0 < (S 135).lo.toRat := by
  rw [S_eq_root135]
  exact OriginalRow227TriangleRoots04.root135_pos

theorem product135_pos : 0 < (roundedMul (-768) shift (S 135)).lo.toRat := by
  rw [S_eq_root135]
  exact OriginalRow227TriangleRoots04.product135_pos

theorem S_eq_root136 : S 136 = OriginalRow227TriangleRoots04.root136 := rfl

theorem root136_checked : sqrtCheck 136 (S 136) = true := by
  rw [S_eq_root136]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨7, by decide⟩

theorem root136_pos : 0 < (S 136).lo.toRat := by
  rw [S_eq_root136]
  exact OriginalRow227TriangleRoots04.root136_pos

theorem product136_pos : 0 < (roundedMul (-768) shift (S 136)).lo.toRat := by
  rw [S_eq_root136]
  exact OriginalRow227TriangleRoots04.product136_pos

theorem S_eq_root137 : S 137 = OriginalRow227TriangleRoots04.root137 := rfl

theorem root137_checked : sqrtCheck 137 (S 137) = true := by
  rw [S_eq_root137]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨8, by decide⟩

theorem root137_pos : 0 < (S 137).lo.toRat := by
  rw [S_eq_root137]
  exact OriginalRow227TriangleRoots04.root137_pos

theorem product137_pos : 0 < (roundedMul (-768) shift (S 137)).lo.toRat := by
  rw [S_eq_root137]
  exact OriginalRow227TriangleRoots04.product137_pos

theorem S_eq_root138 : S 138 = OriginalRow227TriangleRoots04.root138 := rfl

theorem root138_checked : sqrtCheck 138 (S 138) = true := by
  rw [S_eq_root138]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨9, by decide⟩

theorem root138_pos : 0 < (S 138).lo.toRat := by
  rw [S_eq_root138]
  exact OriginalRow227TriangleRoots04.root138_pos

theorem product138_pos : 0 < (roundedMul (-768) shift (S 138)).lo.toRat := by
  rw [S_eq_root138]
  exact OriginalRow227TriangleRoots04.product138_pos

theorem S_eq_root139 : S 139 = OriginalRow227TriangleRoots04.root139 := rfl

theorem root139_checked : sqrtCheck 139 (S 139) = true := by
  rw [S_eq_root139]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨10, by decide⟩

theorem root139_pos : 0 < (S 139).lo.toRat := by
  rw [S_eq_root139]
  exact OriginalRow227TriangleRoots04.root139_pos

theorem product139_pos : 0 < (roundedMul (-768) shift (S 139)).lo.toRat := by
  rw [S_eq_root139]
  exact OriginalRow227TriangleRoots04.product139_pos

theorem S_eq_root140 : S 140 = OriginalRow227TriangleRoots04.root140 := rfl

theorem root140_checked : sqrtCheck 140 (S 140) = true := by
  rw [S_eq_root140]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨11, by decide⟩

theorem root140_pos : 0 < (S 140).lo.toRat := by
  rw [S_eq_root140]
  exact OriginalRow227TriangleRoots04.root140_pos

theorem product140_pos : 0 < (roundedMul (-768) shift (S 140)).lo.toRat := by
  rw [S_eq_root140]
  exact OriginalRow227TriangleRoots04.product140_pos

theorem S_eq_root141 : S 141 = OriginalRow227TriangleRoots04.root141 := rfl

theorem root141_checked : sqrtCheck 141 (S 141) = true := by
  rw [S_eq_root141]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨12, by decide⟩

theorem root141_pos : 0 < (S 141).lo.toRat := by
  rw [S_eq_root141]
  exact OriginalRow227TriangleRoots04.root141_pos

theorem product141_pos : 0 < (roundedMul (-768) shift (S 141)).lo.toRat := by
  rw [S_eq_root141]
  exact OriginalRow227TriangleRoots04.product141_pos

theorem S_eq_root142 : S 142 = OriginalRow227TriangleRoots04.root142 := rfl

theorem root142_checked : sqrtCheck 142 (S 142) = true := by
  rw [S_eq_root142]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨13, by decide⟩

theorem root142_pos : 0 < (S 142).lo.toRat := by
  rw [S_eq_root142]
  exact OriginalRow227TriangleRoots04.root142_pos

theorem product142_pos : 0 < (roundedMul (-768) shift (S 142)).lo.toRat := by
  rw [S_eq_root142]
  exact OriginalRow227TriangleRoots04.product142_pos

theorem S_eq_root143 : S 143 = OriginalRow227TriangleRoots04.root143 := rfl

theorem root143_checked : sqrtCheck 143 (S 143) = true := by
  rw [S_eq_root143]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨14, by decide⟩

theorem root143_pos : 0 < (S 143).lo.toRat := by
  rw [S_eq_root143]
  exact OriginalRow227TriangleRoots04.root143_pos

theorem product143_pos : 0 < (roundedMul (-768) shift (S 143)).lo.toRat := by
  rw [S_eq_root143]
  exact OriginalRow227TriangleRoots04.product143_pos

theorem S_eq_root144 : S 144 = OriginalRow227TriangleRoots04.root144 := rfl

theorem root144_checked : sqrtCheck 144 (S 144) = true := by
  rw [S_eq_root144]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨15, by decide⟩

theorem root144_pos : 0 < (S 144).lo.toRat := by
  rw [S_eq_root144]
  exact OriginalRow227TriangleRoots04.root144_pos

theorem product144_pos : 0 < (roundedMul (-768) shift (S 144)).lo.toRat := by
  rw [S_eq_root144]
  exact OriginalRow227TriangleRoots04.product144_pos

theorem S_eq_root145 : S 145 = OriginalRow227TriangleRoots04.root145 := rfl

theorem root145_checked : sqrtCheck 145 (S 145) = true := by
  rw [S_eq_root145]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨16, by decide⟩

theorem root145_pos : 0 < (S 145).lo.toRat := by
  rw [S_eq_root145]
  exact OriginalRow227TriangleRoots04.root145_pos

theorem product145_pos : 0 < (roundedMul (-768) shift (S 145)).lo.toRat := by
  rw [S_eq_root145]
  exact OriginalRow227TriangleRoots04.product145_pos

theorem S_eq_root146 : S 146 = OriginalRow227TriangleRoots04.root146 := rfl

theorem root146_checked : sqrtCheck 146 (S 146) = true := by
  rw [S_eq_root146]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨17, by decide⟩

theorem root146_pos : 0 < (S 146).lo.toRat := by
  rw [S_eq_root146]
  exact OriginalRow227TriangleRoots04.root146_pos

theorem product146_pos : 0 < (roundedMul (-768) shift (S 146)).lo.toRat := by
  rw [S_eq_root146]
  exact OriginalRow227TriangleRoots04.product146_pos

theorem S_eq_root147 : S 147 = OriginalRow227TriangleRoots04.root147 := rfl

theorem root147_checked : sqrtCheck 147 (S 147) = true := by
  rw [S_eq_root147]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨18, by decide⟩

theorem root147_pos : 0 < (S 147).lo.toRat := by
  rw [S_eq_root147]
  exact OriginalRow227TriangleRoots04.root147_pos

theorem product147_pos : 0 < (roundedMul (-768) shift (S 147)).lo.toRat := by
  rw [S_eq_root147]
  exact OriginalRow227TriangleRoots04.product147_pos

theorem S_eq_root148 : S 148 = OriginalRow227TriangleRoots04.root148 := rfl

theorem root148_checked : sqrtCheck 148 (S 148) = true := by
  rw [S_eq_root148]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨19, by decide⟩

theorem root148_pos : 0 < (S 148).lo.toRat := by
  rw [S_eq_root148]
  exact OriginalRow227TriangleRoots04.root148_pos

theorem product148_pos : 0 < (roundedMul (-768) shift (S 148)).lo.toRat := by
  rw [S_eq_root148]
  exact OriginalRow227TriangleRoots04.product148_pos

theorem S_eq_root149 : S 149 = OriginalRow227TriangleRoots04.root149 := rfl

theorem root149_checked : sqrtCheck 149 (S 149) = true := by
  rw [S_eq_root149]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨20, by decide⟩

theorem root149_pos : 0 < (S 149).lo.toRat := by
  rw [S_eq_root149]
  exact OriginalRow227TriangleRoots04.root149_pos

theorem product149_pos : 0 < (roundedMul (-768) shift (S 149)).lo.toRat := by
  rw [S_eq_root149]
  exact OriginalRow227TriangleRoots04.product149_pos

theorem S_eq_root150 : S 150 = OriginalRow227TriangleRoots04.root150 := rfl

theorem root150_checked : sqrtCheck 150 (S 150) = true := by
  rw [S_eq_root150]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨21, by decide⟩

theorem root150_pos : 0 < (S 150).lo.toRat := by
  rw [S_eq_root150]
  exact OriginalRow227TriangleRoots04.root150_pos

theorem product150_pos : 0 < (roundedMul (-768) shift (S 150)).lo.toRat := by
  rw [S_eq_root150]
  exact OriginalRow227TriangleRoots04.product150_pos

theorem S_eq_root151 : S 151 = OriginalRow227TriangleRoots04.root151 := rfl

theorem root151_checked : sqrtCheck 151 (S 151) = true := by
  rw [S_eq_root151]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨22, by decide⟩

theorem root151_pos : 0 < (S 151).lo.toRat := by
  rw [S_eq_root151]
  exact OriginalRow227TriangleRoots04.root151_pos

theorem product151_pos : 0 < (roundedMul (-768) shift (S 151)).lo.toRat := by
  rw [S_eq_root151]
  exact OriginalRow227TriangleRoots04.product151_pos

theorem S_eq_root152 : S 152 = OriginalRow227TriangleRoots04.root152 := rfl

theorem root152_checked : sqrtCheck 152 (S 152) = true := by
  rw [S_eq_root152]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨23, by decide⟩

theorem root152_pos : 0 < (S 152).lo.toRat := by
  rw [S_eq_root152]
  exact OriginalRow227TriangleRoots04.root152_pos

theorem product152_pos : 0 < (roundedMul (-768) shift (S 152)).lo.toRat := by
  rw [S_eq_root152]
  exact OriginalRow227TriangleRoots04.product152_pos

theorem S_eq_root153 : S 153 = OriginalRow227TriangleRoots04.root153 := rfl

theorem root153_checked : sqrtCheck 153 (S 153) = true := by
  rw [S_eq_root153]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨24, by decide⟩

theorem root153_pos : 0 < (S 153).lo.toRat := by
  rw [S_eq_root153]
  exact OriginalRow227TriangleRoots04.root153_pos

theorem product153_pos : 0 < (roundedMul (-768) shift (S 153)).lo.toRat := by
  rw [S_eq_root153]
  exact OriginalRow227TriangleRoots04.product153_pos

theorem S_eq_root154 : S 154 = OriginalRow227TriangleRoots04.root154 := rfl

theorem root154_checked : sqrtCheck 154 (S 154) = true := by
  rw [S_eq_root154]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨25, by decide⟩

theorem root154_pos : 0 < (S 154).lo.toRat := by
  rw [S_eq_root154]
  exact OriginalRow227TriangleRoots04.root154_pos

theorem product154_pos : 0 < (roundedMul (-768) shift (S 154)).lo.toRat := by
  rw [S_eq_root154]
  exact OriginalRow227TriangleRoots04.product154_pos

theorem S_eq_root155 : S 155 = OriginalRow227TriangleRoots04.root155 := rfl

theorem root155_checked : sqrtCheck 155 (S 155) = true := by
  rw [S_eq_root155]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨26, by decide⟩

theorem root155_pos : 0 < (S 155).lo.toRat := by
  rw [S_eq_root155]
  exact OriginalRow227TriangleRoots04.root155_pos

theorem product155_pos : 0 < (roundedMul (-768) shift (S 155)).lo.toRat := by
  rw [S_eq_root155]
  exact OriginalRow227TriangleRoots04.product155_pos

theorem S_eq_root156 : S 156 = OriginalRow227TriangleRoots04.root156 := rfl

theorem root156_checked : sqrtCheck 156 (S 156) = true := by
  rw [S_eq_root156]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨27, by decide⟩

theorem root156_pos : 0 < (S 156).lo.toRat := by
  rw [S_eq_root156]
  exact OriginalRow227TriangleRoots04.root156_pos

theorem product156_pos : 0 < (roundedMul (-768) shift (S 156)).lo.toRat := by
  rw [S_eq_root156]
  exact OriginalRow227TriangleRoots04.product156_pos

theorem S_eq_root157 : S 157 = OriginalRow227TriangleRoots04.root157 := rfl

theorem root157_checked : sqrtCheck 157 (S 157) = true := by
  rw [S_eq_root157]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨28, by decide⟩

theorem root157_pos : 0 < (S 157).lo.toRat := by
  rw [S_eq_root157]
  exact OriginalRow227TriangleRoots04.root157_pos

theorem product157_pos : 0 < (roundedMul (-768) shift (S 157)).lo.toRat := by
  rw [S_eq_root157]
  exact OriginalRow227TriangleRoots04.product157_pos

theorem S_eq_root158 : S 158 = OriginalRow227TriangleRoots04.root158 := rfl

theorem root158_checked : sqrtCheck 158 (S 158) = true := by
  rw [S_eq_root158]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨29, by decide⟩

theorem root158_pos : 0 < (S 158).lo.toRat := by
  rw [S_eq_root158]
  exact OriginalRow227TriangleRoots04.root158_pos

theorem product158_pos : 0 < (roundedMul (-768) shift (S 158)).lo.toRat := by
  rw [S_eq_root158]
  exact OriginalRow227TriangleRoots04.product158_pos

theorem S_eq_root159 : S 159 = OriginalRow227TriangleRoots04.root159 := rfl

theorem root159_checked : sqrtCheck 159 (S 159) = true := by
  rw [S_eq_root159]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨30, by decide⟩

theorem root159_pos : 0 < (S 159).lo.toRat := by
  rw [S_eq_root159]
  exact OriginalRow227TriangleRoots04.root159_pos

theorem product159_pos : 0 < (roundedMul (-768) shift (S 159)).lo.toRat := by
  rw [S_eq_root159]
  exact OriginalRow227TriangleRoots04.product159_pos

theorem S_eq_root160 : S 160 = OriginalRow227TriangleRoots04.root160 := rfl

theorem root160_checked : sqrtCheck 160 (S 160) = true := by
  rw [S_eq_root160]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots04.entries OriginalRow227TriangleRoots04.checked ⟨31, by decide⟩

theorem root160_pos : 0 < (S 160).lo.toRat := by
  rw [S_eq_root160]
  exact OriginalRow227TriangleRoots04.root160_pos

theorem product160_pos : 0 < (roundedMul (-768) shift (S 160)).lo.toRat := by
  rw [S_eq_root160]
  exact OriginalRow227TriangleRoots04.product160_pos

end Grothe.UpperChaos.OriginalRow227RootBindings04

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root129) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root129_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root129_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product129_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root130) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root130_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root130_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product130_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root131) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root131_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root131_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product131_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root132) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root132_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root132_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product132_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root133) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root133_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root133_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product133_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root134) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root134_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root134_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product134_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root135) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root135_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root135_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product135_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root136) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root136_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root136_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product136_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root137) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root137_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root137_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product137_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root138) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root138_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root138_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product138_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root139) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root139_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root139_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product139_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root140) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root140_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root140_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product140_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root141) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root141_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root141_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product141_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root142) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root142_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root142_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product142_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root143) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root143_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root143_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product143_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root144) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root144_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root144_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product144_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root145) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root145_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root145_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product145_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root146) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root146_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root146_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product146_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root147) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root147_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root147_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product147_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root148) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root148_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root148_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product148_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root149) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root149_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root149_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product149_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root150) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root150_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root150_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product150_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root151) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root151_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root151_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product151_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root152) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root152_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root152_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product152_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root153) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root153_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root153_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product153_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root154) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root154_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root154_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product154_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root155) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root155_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root155_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product155_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root156) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root156_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root156_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product156_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root157) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root157_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root157_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product157_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root158) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root158_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root158_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product158_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root159) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root159_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root159_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product159_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.S_eq_root160) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root160_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.root160_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings04.product160_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
