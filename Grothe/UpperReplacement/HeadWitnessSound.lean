import Grothe.UpperReplacement.HeadWitness
import Grothe.UpperReplacement.RootChecks
import Grothe.UpperReplacement.HeadPolynomial

set_option warningAsError true

/-!
# Soundness of the saved cell-head groups

Agent-ID: codex-a7c4. The saved intervals are finite witnesses, checked against the full
contraction. Their sum therefore encloses the complete signed Hermite grades of the actual
two response functions, with no sampled-coefficient premise.
-/

namespace Grothe.UpperReplacement.HeadWitness

open GrotheKernel GrotheKernel.HardyArc Upper UpperChaos CellHeadCompute Certificate Finset
open scoped InnerProductSpace ComplexConjugate

noncomputable section

theorem encloses_sound {x : ℝ} {outer inner : Ival} (h : encloses outer inner = true)
    (hx : mem x inner) : mem x outer := by
  simp only [encloses, decide_eq_true_eq] at h
  exact ⟨(Int.cast_le.mpr h.1).trans hx.1, hx.2.trans (Int.cast_le.mpr h.2)⟩

theorem arrayEncloses_sound {N j : ℕ} {outer inner : Array Ival}
    (h : arrayEncloses N outer inner = true) (hj : j < N) {x : ℝ}
    (hx : mem x (getI inner j)) : mem x (getI outer j) := by
  have hh := List.all_eq_true.mp h j (List.mem_range.mpr hj)
  exact encloses_sound hh hx

def residueSum (j residue : ℕ) : ℝ :=
  ((frequencies 125 64 residue).map fun m ↦ modeGrade j m fun m a b ↦
    crossCoefficient
      (cellVector (CellEncoding.decode leftCellRows) (2 ^ 26) 128 64 6)
      (cellVector (CellEncoding.decode rightCellRows) (2 ^ 26) 128 64 6) (cellMode m a b)).sum

theorem mem_residue (residue : ℕ) {j : ℕ} (hj : j ≤ 125) :
    mem (residueSum j residue)
      (getI (residueHead 125 128 64 1024 (2 ^ 26) residue
        RootData.roots64 RootData.roots128 RootData.piInvI (moments 1024 128 128 252 6)
        (CellEncoding.decode leftCellRows) (CellEncoding.decode rightCellRows)) j) := by
  rw [RootData.roots64_eq, RootData.roots128_eq, RootData.piInvI_eq]
  unfold residueSum residueHead
  apply mem_headsSum hj
  intro m hm
  have hres : (m % (64 : ℤ)).toNat = residue := by
    simpa only [beq_iff_eq, Nat.cast_ofNat] using (List.mem_filter.mp hm).2
  have h := mem_modeHead hj m (sincAt 64 (rootTable 128) CellNumerics.piInvI m)
    (moments 1024 128 128 252 6)
    (angularMatrix 64 128 (2 ^ 26) residue (rootTable 64) (CellEncoding.decode leftCellRows))
    (angularMatrix 64 128 (2 ^ 26) residue (rootTable 64) (CellEncoding.decode rightCellRows))
    (fun a b ↦ ⟪hvec2 (cellMode m a b),
      cellVector (CellEncoding.decode leftCellRows) (2 ^ 26) 128 64 6⟫_ℂ)
    (fun a b ↦ ⟪hvec2 (cellMode m a b),
      cellVector (CellEncoding.decode rightCellRows) (2 ^ 26) 128 64 6⟫_ℂ)
    (fun a b hg ↦ mem_modeCoefficient (by decide) (by decide) (by decide) (by decide)
      (by norm_num) grid_128_six (CellEncoding.decode leftCellRows) hres a b hg)
    (fun a b hg ↦ mem_modeCoefficient (by decide) (by decide) (by decide) (by decide)
      (by norm_num) grid_128_six (CellEncoding.decode rightCellRows) hres a b hg)
  simpa only [modeGrade, crossCoefficient] using h

theorem mem_residueFast (residue : ℕ) {j : ℕ} (hj : j ≤ 125) :
    mem (residueSum j residue)
      (getI (residueHeadFast 125 128 64 1024 residue
        RootData.roots64 RootData.roots128 RootData.piInvI
        (RadialCompute.toIntGrid 1024 (momentsShared 1024 128 128 252 6))
        (tableCells26 (CellEncoding.decode leftCellRows))
        (tableCells26 (CellEncoding.decode rightCellRows))) j) := by
  rw [RootData.roots64_eq, RootData.roots128_eq, RootData.piInvI_eq]
  exact mem_residueHeadFast (by decide) (by decide) (by decide) (by decide)
    (by norm_num) grid_128_six
    (CellEncoding.decode leftCellRows) (CellEncoding.decode rightCellRows) residue hj

theorem mem_saved_residue {start k j : ℕ} {saved : Array (Array Ival)}
    (h : groupOK start saved = true) (hk : k < 8) (hj : j ≤ 125) :
    mem (residueSum j (start + k)) (getI (saved[k]?.getD #[]) j) := by
  unfold groupOK at h
  dsimp only at h
  have hs := List.all_eq_true.mp h k (List.mem_range.mpr hk)
  exact arrayEncloses_sound hs (by omega) (mem_residueFast (start + k) hj)

theorem mem_savedGrades {groups : Array (Array (Array Ival))}
    (h : ∀ g < 8, groupOK (g * 8) (groups[g]?.getD #[]) = true)
    {j : ℕ} (hj : j ≤ 125) :
    mem (gradeEnergy
      (cellVector (CellEncoding.decode leftCellRows) (2 ^ 26) 128 64 6)
      (cellVector (CellEncoding.decode rightCellRows) (2 ^ 26) 128 64 6) j)
      (getI (savedGrades groups) j) := by
  rw [gradeEnergy_eq_head hj, ← sum_residues_eq_head (by decide : 0 < 64) hj]
  apply mem_headsSum hj
  intro residue hr
  have hr64 := List.mem_range.mp hr
  have hg : residue / 8 < 8 := by omega
  have hk : residue % 8 < 8 := Nat.mod_lt _ (by decide)
  have he : residue / 8 * 8 + residue % 8 = residue := by omega
  simpa only [he, savedResidue, residueSum] using
    mem_saved_residue (h (residue / 8) hg) hk hj

theorem savedGrades_size (groups : Array (Array (Array Ival))) : (savedGrades groups).size = 126 := by
  simp only [savedGrades, headsSum, Array.size_ofFn]

theorem savedGrades_enclose {groups : Array (Array (Array Ival))}
    (h : ∀ g < 8, groupOK (g * 8) (groups[g]?.getD #[]) = true) :
    List.Forall₂ mem
      ((List.range 126).map (gradeEnergy
        (cellVector (CellEncoding.decode leftCellRows) (2 ^ 26) 128 64 6)
        (cellVector (CellEncoding.decode rightCellRows) (2 ^ 26) 128 64 6)))
      (savedGrades groups).toList := by
  apply List.forall₂_of_length_eq_of_get
  · simp only [List.length_map, List.length_range, Array.length_toList, savedGrades_size]
  · intro j hj hj'
    have hj126 : j < 126 := by simpa only [List.length_map, List.length_range] using hj
    have hjsize : j < (savedGrades groups).size := by rw [savedGrades_size]; exact hj126
    have hm := mem_savedGrades h (by omega : j ≤ 125)
    simpa only [List.get_eq_getElem, List.getElem_map, List.getElem_range,
      Array.getElem_toList, getI, Array.getElem?_eq_getElem hjsize, Option.getD_some] using hm

end

end Grothe.UpperReplacement.HeadWitness
