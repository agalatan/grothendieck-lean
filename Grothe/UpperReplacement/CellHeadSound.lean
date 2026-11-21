import Grothe.UpperReplacement.CellEvaluator
import Grothe.UpperReplacement.CellHeadCompute
import Grothe.UpperReplacement.GradeRegrouping

set_option warningAsError true

/-!
# Soundness of cached cell-head operations

Agent-ID: codex-a7c4.

Cache lookups are identified with the scalar arithmetic before they are used in a coefficient
bound. The final grade regrouping and closed head check are separate obligations.
-/

namespace Grothe.UpperReplacement.RadialCompute

theorem hermiteCoefficients_get (p q : ℕ) {k : ℕ} (hk : k < p + 1) :
    (hermiteCoefficients p q)[k]?.getD 0 = hermiteCoefficient p q k := by
  simp only [hermiteCoefficients, Array.getElem?_ofFn, dite_eq_left hk, Option.getD_some]

theorem hermiteWithCoefficients_eq (p q : ℕ) (v : Array (ℚ × ℚ)) :
    hermiteWithCoefficients p q (hermiteCoefficients p q) v = hermiteFromCache p q v := by
  unfold hermiteWithCoefficients hermiteFromCache
  dsimp only
  apply Prod.ext
  · dsimp only
    apply congrArg List.sum
    apply List.map_congr_left
    intro k hk
    rw [hermiteCoefficients_get p q (List.mem_range.mp hk)]
  · dsimp only
    apply congrArg List.sum
    apply List.map_congr_left
    intro k hk
    rw [hermiteCoefficients_get p q (List.mem_range.mp hk)]

theorem radialRow_eq_map (P p q : ℕ) (grid : Array (Array (ℚ × ℚ))) :
    radialRow P p q grid = grid.map (normalizedFromCache P p q) := by
  simp only [radialRow, hermiteWithCoefficients_eq]
  rfl

end Grothe.UpperReplacement.RadialCompute

namespace Grothe.UpperReplacement.CellHeadCompute

open GrotheKernel GrotheKernel.HardyArc Upper UpperChaos.HardyArcSound CellArithmetic

open Finset MeasureTheory UpperChaos
open scoped ComplexConjugate InnerProductSpace

theorem getC_ofFn {n i : ℕ} (f : Fin n → CI) (hi : i < n) :
    getC (Array.ofFn f) i = f ⟨i, hi⟩ := by
  simp only [getC, Array.getElem?_ofFn, dite_eq_left hi, Option.getD_some]

theorem getI_ofFn {n i : ℕ} (f : Fin n → Ival) (hi : i < n) :
    getI (Array.ofFn f) i = f ⟨i, hi⟩ := by
  simp only [getI, Array.getElem?_ofFn, dite_eq_left hi, Option.getD_some]

theorem mem_sumI {f : ℕ → ℝ} {F : ℕ → Ival} (n : ℕ)
    (hf : ∀ k < n, mem (f k) (F k)) :
    mem (∑ k ∈ Finset.range n, f k) (sumI n F) := by
  induction n with
  | zero => simpa [sumI] using mem_zero
  | succ n ih =>
    simp only [sumI, List.range_succ, List.foldl_append, List.foldl_cons,
      List.foldl_nil, Finset.sum_range_succ]
    exact mem_add (ih fun k hk ↦ hf k (by omega)) (hf n (by omega))

theorem shift_eq (m : ℤ) : shift m = modeShift m := rfl

theorem mem_entry (table : Array (ℤ × ℤ)) (scale N k i j : ℕ) :
    memC (cellEntry table scale N k i j) (entry table scale N k i j) :=
  mem_cellC _ _ _

/-- The only trigonometric inputs used by the executable contraction. -/
def rootTable (A : ℕ) : Array CI :=
  Array.ofFn fun k : Fin A ↦ CellNumerics.rootC A k.val

theorem rootAt_rootTable {A : ℕ} (hA : 0 < A) (m : ℤ) :
    rootAt A (rootTable A) m = CellNumerics.rootC A m := by
  unfold rootAt rootTable
  have hm : (m % (A : ℤ)).toNat < A := by
    simpa only [Int.natMod] using Int.natMod_lt (m := m) (Nat.ne_of_gt hA)
  rw [getC_ofFn _ hm]
  simp only [CellNumerics.rootC,
    Int.toNat_of_nonneg (Int.emod_nonneg m (by omega : (A : ℤ) ≠ 0)), Int.emod_emod]

theorem sincAt_rootTable {A : ℕ} (hA : 0 < A) (m : ℤ) :
    sincAt A (rootTable (2 * A)) CellNumerics.piInvI m = CellNumerics.sincI A m := by
  simp only [sincAt, CellNumerics.sincI, rootAt_rootTable (by omega : 0 < 2 * A)]

theorem rootC_residue {A residue : ℕ} (hA : 0 < A) {m : ℤ}
    (hm : (m % (A : ℤ)).toNat = residue) (k : ℕ) :
    CellNumerics.rootC A (-((residue : ℤ) * k)) = CellNumerics.rootC A (-(m * k)) := by
  have hmod : (residue : ℤ) = m % (A : ℤ) := by
    rw [← hm, Int.toNat_of_nonneg (Int.emod_nonneg m (by omega : (A : ℤ) ≠ 0))]
  have he : (-((residue : ℤ) * k)) % (A : ℤ) = (-(m * k)) % (A : ℤ) := by
    simp only [hmod, Int.neg_emod, Int.dvd_iff_emod_eq_zero, Int.mul_emod, Int.emod_emod]
  simp only [CellNumerics.rootC, he]

noncomputable def unscaledAngular (table : Array (ℤ × ℤ)) (scale N A : ℕ)
    (m : ℤ) (i j : ℕ) : ℂ :=
  ((1 / (A : ℝ) : ℝ) : ℂ) * ∑ k ∈ range A,
    Complex.exp (((-(m : ℝ) * (2 * Real.pi * k / A) : ℝ) : ℂ) * Complex.I) *
      cellEntry table scale N k i j

theorem angularCellCoefficient_eq_sinc {A : ℕ} (hA : 0 < A)
    (table : Array (ℤ × ℤ)) (scale N : ℕ) (m : ℤ) (i j : ℕ) :
    angularCellCoefficient A (fun k ↦ cellEntry table scale N k i j) m =
      (Real.sinc ((m : ℝ) * (Real.pi / A)) : ℂ) *
        unscaledAngular table scale N A m i j := by
  rw [angularCellCoefficient_eq_dft hA, unscaledAngular]
  push_cast
  ring

theorem mem_angularMatrix {A N residue : ℕ} (hA : 0 < A) (scale : ℕ)
    (table : Array (ℤ × ℤ)) {m : ℤ} (hm : (m % (A : ℤ)).toNat = residue)
    {i j : ℕ} (hi : i < N) (hj : j < N) :
    memC (unscaledAngular table scale N A m i j)
      (getC (angularMatrix A N scale residue (rootTable A) table) (i * N + j)) := by
  have hN : 0 < N := by omega
  have hij : i * N + j < N * N := by
    have hmul := Nat.mul_le_mul_right N (show i + 1 ≤ N by omega)
    nlinarith
  unfold angularMatrix
  rw [getC_ofFn _ hij]
  have hdiv : (i * N + j) / N = i := by
    rw [Nat.add_comm, Nat.add_mul_div_right _ _ hN, Nat.div_eq_of_lt hj, Nat.zero_add]
  have hmod : (i * N + j) % N = j := by
    simp [Nat.add_mod, Nat.mod_eq_of_lt hj]
  simp only [hdiv, hmod]
  apply memC_mul
  · apply memC_ofR
    simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_natCast] using
      mem_ofRatI (1 / (A : ℚ))
  · apply mem_fourierC _ (fun k _ ↦ mem_entry table scale N k i j)
    intro k hk
    rw [getC_ofFn _ hk, rootAt_rootTable hA, rootC_residue hA hm]
    convert CellNumerics.mem_rootC hA (-(m * k)) using 1
    congr 2
    push_cast
    ring

theorem radialRow_get (P n N size p q : ℕ) (R : ℚ) {i : ℕ}
    (hi : i < N) (hsize : p + q < size) :
    getI (RadialCompute.radialRow P p q (moments P n N size R)) i =
      CellNumerics.radialI P n p q (R * i / N) (R * (i + 1) / N) := by
  rw [RadialCompute.radialRow_eq_map]
  unfold moments
  rw [Array.map_ofFn, getI_ofFn _ hi]
  exact RadialCompute.normalizedFromCache_eq P n p q _ _ hsize

theorem mem_radialRow (P : ℕ) (hP : 1 ≤ P) {n N size : ℕ} (hn : 0 < n)
    (R : ℚ) (p q : ℕ) (hsize : p + q < size) {i : ℕ} (hi : i < N)
    (ha : 0 ≤ R * i / N) (hab : R * i / N ≤ R * (i + 1) / N)
    (hb : R * (i + 1) / N ≤ 8)
    (hw : 2 * ((R * i / N + R * (i + 1) / N) / 2) *
      ((R * (i + 1) / N - R * i / N) / 2) +
        ((R * (i + 1) / N - R * i / N) / 2) ^ 2 ≤ 1) :
    mem (normalizedRadialMoment p q ((R : ℝ) * i / N) ((R : ℝ) * (i + 1) / N))
      (getI (RadialCompute.radialRow P p q (moments P n N size R)) i) := by
  rw [radialRow_get P n N size p q R hi hsize]
  have h := CellNumerics.mem_radialI P hP hn ha hab hb hw p q
  simpa only [normalizedRadialMoment, Rat.cast_div, Rat.cast_mul, Rat.cast_add,
    Rat.cast_natCast, Rat.cast_one] using h

def RadialCellValid (N : ℕ) (R : ℚ) (i : ℕ) : Prop :=
  let a := R * i / N
  let b := R * (i + 1) / N
  0 ≤ a ∧ a ≤ b ∧ b ≤ 8 ∧ 2 * ((a + b) / 2) * ((b - a) / 2) + ((b - a) / 2) ^ 2 ≤ 1

def GridValid (N : ℕ) (R : ℚ) : Prop := ∀ i : Fin N, RadialCellValid N R i.val

instance (N : ℕ) (R : ℚ) (i : ℕ) : Decidable (RadialCellValid N R i) := by
  unfold RadialCellValid
  infer_instance

theorem grid_128_six : GridValid 128 6 := by
  unfold GridValid
  decide +kernel

theorem leftRadials_mem {K N P n a b : ℕ} (hP : 1 ≤ P) (hn : 0 < n)
    {R : ℚ} (hgrid : GridValid N R) {m : ℤ} (hg : modeShift m + a + b ≤ K)
    {i : ℕ} (hi : i < N) :
    mem (normalizedRadialMoment (cellMode m a b).1.1 (cellMode m a b).1.2
      ((R : ℝ) * i / N) ((R : ℝ) * (i + 1) / N))
      (getI ((leftRadials P (K + 1 - shift m) m (moments P n N (2 * K + 2) R))[a]?.getD #[]) i) := by
  have ha : a < K + 1 - shift m := by rw [shift_eq]; omega
  simp only [leftRadials, Array.getElem?_ofFn, dite_eq_left ha, Option.getD_some]
  have hc := cellMode_charge m a b
  have hd := cellMode_grade m a b
  have hs : (a + m.toNat) + (a + (-m).toNat) < 2 * K + 2 := by
    simp only [cellMode] at hc hd
    omega
  obtain ⟨h0, hab, hb, hw⟩ := hgrid ⟨i, hi⟩
  exact mem_radialRow P hP hn R _ _ hs hi h0 hab hb hw

theorem rightRadials_mem {K N P n a b : ℕ} (hP : 1 ≤ P) (hn : 0 < n)
    {R : ℚ} (hgrid : GridValid N R) {m : ℤ} (hg : modeShift m + a + b ≤ K)
    {i : ℕ} (hi : i < N) :
    mem (normalizedRadialMoment (cellMode m a b).2.1 (cellMode m a b).2.2
      ((R : ℝ) * i / N) ((R : ℝ) * (i + 1) / N))
      (getI ((rightRadials P (K + 1 - shift m) m (moments P n N (2 * K + 2) R))[b]?.getD #[]) i) := by
  have hb : b < K + 1 - shift m := by rw [shift_eq]; omega
  simp only [rightRadials, Array.getElem?_ofFn, dite_eq_left hb, Option.getD_some]
  have hc := cellMode_charge m a b
  have hd := cellMode_grade m a b
  have hs : (b + (1 - m).toNat) + (b + (m - 1).toNat) < 2 * K + 2 := by
    simp only [cellMode] at hc hd
    omega
  obtain ⟨h0, hab, hb, hw⟩ := hgrid ⟨i, hi⟩
  exact mem_radialRow P hP hn R _ _ hs hi h0 hab hb hw

/-- The common right transform is the same finite sum for every left mode. -/
theorem mem_rightTransforms {N : ℕ} {radials : Array (Array Ival)} {angular : Array CI}
    {r : ℕ → ℝ} {v : ℕ → ℕ → ℂ} {b i : ℕ}
    (hb : b < radials.size) (hi : i < N)
    (hr : ∀ j < N, mem (r j) (getI (radials[b]?.getD #[]) j))
    (hv : ∀ i < N, ∀ j < N, memC (v i j) (getC angular (i * N + j))) :
    memC (∑ j ∈ Finset.range N, v i j * (r j : ℂ))
      (getC ((rightTransforms N radials angular)[b]?.getD #[]) i) := by
  simp only [Array.getElem?_eq_getElem hb, Option.getD_some] at hr
  simp only [rightTransforms, Array.getElem?_map,
    Array.getElem?_eq_getElem hb, Option.map_some, Option.getD_some]
  rw [getC_ofFn _ hi]
  exact mem_rightRadialC hr hv hi

/-- Pulling the common sinc factor outside both radial sums preserves the exact coefficient. -/
theorem mem_cachedCoefficient {N A scale residue : ℕ} (hA : 0 < A)
    (table : Array (ℤ × ℤ)) (R : ℝ) (m : ℤ) (a b : ℕ)
    (hm : (m % (A : ℤ)).toNat = residue)
    {left right : Array (Array Ival)} (hb : b < right.size)
    (hl : ∀ i < N, mem
      (normalizedRadialMoment (cellMode m a b).1.1 (cellMode m a b).1.2
        (R * i / N) (R * (i + 1) / N)) (getI (left[a]?.getD #[]) i))
    (hr : ∀ j < N, mem
      (normalizedRadialMoment (cellMode m a b).2.1 (cellMode m a b).2.2
        (R * j / N) (R * (j + 1) / N)) (getI (right[b]?.getD #[]) j)) :
    memC (cellCoefficient table scale N A R (cellMode m a b))
      (coefficient N a b (sincAt A (rootTable (2 * A)) CellNumerics.piInvI m) left
        (rightTransforms N right (angularMatrix A N scale residue (rootTable A) table))) := by
  have hs := CellNumerics.mem_sincI hA m
  rw [← sincAt_rootTable hA m] at hs
  have hv := fun (i : ℕ) (hi : i < N) (j : ℕ) (hj : j < N) ↦
    mem_angularMatrix (N := N) hA scale table hm (i := i) (j := j) hi hj
  have h := memC_mul (memC_ofR hs)
    (mem_leftRadialC hl (fun i hi ↦ mem_rightTransforms hb hi hr hv))
  convert h using 1
  · unfold cellCoefficient cellRowCoefficient
    simp_rw [cellMode_frequency, angularCellCoefficient_eq_sinc hA,
      Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    apply Finset.sum_congr rfl
    intro j _
    ring
  · rfl

theorem mem_modeHead {K N P j : ℕ} (hj : j ≤ K) (m : ℤ) (sinc : Ival)
    (grid : Array (Array (ℚ × ℚ))) (angularF angularG : Array CI)
    (f g : ℕ → ℕ → ℂ)
    (hf : ∀ a b, modeShift m + a + b ≤ K →
      memC (f a b) (coefficient N a b sinc (leftRadials P (K + 1 - shift m) m grid)
        (rightTransforms N (rightRadials P (K + 1 - shift m) m grid) angularF)))
    (hg : ∀ a b, modeShift m + a + b ≤ K →
      memC (g a b) (coefficient N a b sinc (leftRadials P (K + 1 - shift m) m grid)
        (rightTransforms N (rightRadials P (K + 1 - shift m) m grid) angularG))) :
    mem (modeGrade j m (fun _ a b ↦ (conj (f a b) * g a b).re))
      (getI (modeHead K N P m sinc grid angularF angularG) j) := by
  unfold modeHead
  rw [getI_ofFn _ (by omega)]
  change mem
    (if modeShift m ≤ j then
      ∑ a ∈ range (j - modeShift m + 1), (conj (f a (j - modeShift m - a)) *
        g a (j - modeShift m - a)).re else 0)
    (if modeShift m ≤ j then
      sumI (j - modeShift m + 1) fun a ↦
        overlapI
          (coefficient N a (j - modeShift m - a) sinc (leftRadials P (K + 1 - shift m) m grid)
            (rightTransforms N (rightRadials P (K + 1 - shift m) m grid) angularF))
          (coefficient N a (j - modeShift m - a) sinc (leftRadials P (K + 1 - shift m) m grid)
            (rightTransforms N (rightRadials P (K + 1 - shift m) m grid) angularG))
      else zeroI)
  by_cases hshift : modeShift m ≤ j
  · rw [ite_eq_left hshift, ite_eq_left hshift]
    apply mem_sumI
    intro a ha
    have hab : modeShift m + a + (j - modeShift m - a) ≤ K := by omega
    exact mem_overlapI (hf a _ hab) (hg a _ hab)
  · rw [ite_eq_right hshift, ite_eq_right hshift]
    exact Upper.mem_zero

theorem mem_headsSum {K j : ℕ} (hj : j ≤ K) {ι : Type*}
    (l : List ι) (heads : ι → Array Ival) (f : ι → ℝ)
    (hf : ∀ a ∈ l, mem (f a) (getI (heads a) j)) :
    mem ((l.map f).sum) (getI (headsSum K (l.map heads)) j) := by
  unfold headsSum
  rw [getI_ofFn _ (by omega)]
  have hfold : ∀ (l : List ι) (x : ℝ) (v : Ival), mem x v →
      (∀ a ∈ l, mem (f a) (getI (heads a) j)) →
      mem (x + (l.map f).sum)
        ((l.map heads).foldl (fun v h ↦ addI v (getI h j)) v) := by
    intro l
    induction l with
    | nil => intro x v hx _; simpa using hx
    | cons a l ih =>
      intro x v hx hl
      simp only [List.map_cons, List.sum_cons, List.foldl_cons]
      rw [← add_assoc]
      exact ih _ _ (mem_add hx (hl a List.mem_cons_self))
        (fun a ha ↦ hl a (List.mem_cons_of_mem _ ha))
  simpa only [zero_add] using hfold l 0 zeroI mem_zero hf

noncomputable def cellVector (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ) :
    Lp ℂ 2 mu2 := (memLp_cellResponse table scale N A R).toLp (cellResponse table scale N A R)

theorem mem_modeCoefficient {K N A P n scale residue : ℕ} (hN : 0 < N) (hA : 0 < A)
    (hP : 1 ≤ P) (hn : 0 < n) {R : ℚ} (hR : 0 < R) (hgrid : GridValid N R)
    (table : Array (ℤ × ℤ)) {m : ℤ} (hm : (m % (A : ℤ)).toNat = residue)
    (a b : ℕ) (hg : modeShift m + a + b ≤ K) :
    memC ⟪hvec2 (cellMode m a b), cellVector table scale N A R⟫_ℂ
      (coefficient N a b (sincAt A (rootTable (2 * A)) CellNumerics.piInvI m)
        (leftRadials P (K + 1 - shift m) m (moments P n N (2 * K + 2) R))
        (rightTransforms N (rightRadials P (K + 1 - shift m) m (moments P n N (2 * K + 2) R))
          (angularMatrix A N scale residue (rootTable A) table))) := by
  rw [cellVector, cellCoefficient_eq_inner table scale A hN (by exact_mod_cast hR)
    (cellMode m a b) (cellMode_charge m a b)]
  apply mem_cachedCoefficient hA table (R : ℝ) m a b hm
  · simp only [rightRadials, Array.size_ofFn, shift_eq]
    omega
  · exact fun _ hi ↦ leftRadials_mem hP hn hgrid hg hi
  · exact fun _ hi ↦ rightRadials_mem hP hn hgrid hg hi

/-- The complete native grade computation encloses the signed overlaps of the actual response. -/
theorem mem_gradeHead {K N A P n scale j : ℕ} (hN : 0 < N) (hA : 0 < A)
    (hP : 1 ≤ P) (hn : 0 < n) {R : ℚ} (hR : 0 < R) (hgrid : GridValid N R)
    (F G : Array (ℤ × ℤ)) (hj : j ≤ K) :
    mem (∑ u ∈ cellModeHead K, if u.1.2 + u.2.2 = j then
      crossCoefficient (cellVector F scale N A R) (cellVector G scale N A R) u else 0)
      (getI (gradeHead K N A P n scale R (rootTable A) (rootTable (2 * A)) CellNumerics.piInvI F G) j) := by
  rw [← sum_residues_eq_head hA hj]
  unfold gradeHead
  apply mem_headsSum hj
  intro residue _
  unfold residueHead
  apply mem_headsSum hj
  intro m hm
  have hres : (m % (A : ℤ)).toNat = residue := by
    simpa only [beq_iff_eq] using (List.mem_filter.mp hm).2
  have h := mem_modeHead hj m (sincAt A (rootTable (2 * A)) CellNumerics.piInvI m)
    (moments P n N (2 * K + 2) R)
    (angularMatrix A N scale residue (rootTable A) F)
    (angularMatrix A N scale residue (rootTable A) G)
    (fun a b ↦ ⟪hvec2 (cellMode m a b), cellVector F scale N A R⟫_ℂ)
    (fun a b ↦ ⟪hvec2 (cellMode m a b), cellVector G scale N A R⟫_ℂ)
    (fun a b hg ↦ mem_modeCoefficient hN hA hP hn hR hgrid F hres a b hg)
    (fun a b hg ↦ mem_modeCoefficient hN hA hP hn hR hgrid G hres a b hg)
  simpa only [modeGrade, crossCoefficient] using h

end Grothe.UpperReplacement.CellHeadCompute
