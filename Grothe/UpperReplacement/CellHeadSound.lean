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

def IsDyadicPair (P : ℕ) (v : ℚ × ℚ) : Prop :=
  ∃ a b : ℤ, v = ((a : ℚ) / 2 ^ P, (b : ℚ) / 2 ^ P)

private theorem isDyadicPair_zero (P : ℕ) : IsDyadicPair P (0, 0) :=
  ⟨0, 0, by simp⟩

private theorem isDyadicPair_rd (P : ℕ) (l u : ℚ) :
    IsDyadicPair P (rdDown l P, rdUp u P) :=
  ⟨Rat.floor (l * 2 ^ P), -Rat.floor (-(u * 2 ^ P)), rfl⟩

private theorem isDyadicPair_expNeg (P n : ℕ) (x : ℚ) :
    IsDyadicPair P (expNegEnclosure P n x) :=
  isDyadicPair_rd P _ _

private theorem isDyadicPair_radial (P n : ℕ) (a b : ℚ) (k : ℕ) :
    IsDyadicPair P (radialEnclosure P n a b k) :=
  isDyadicPair_rd P _ _

private theorem isDyadicPair_momentCache (P : ℕ) (a b : ℚ) (ea eb v₀ v₁ : ℚ × ℚ)
    (h₀ : IsDyadicPair P v₀) (h₁ : IsDyadicPair P v₁) :
    ∀ (sz idx : ℕ), IsDyadicPair P ((momentCache P a b ea eb v₀ v₁ sz)[idx]?.getD (0, 0))
  | 0, _ => isDyadicPair_zero P
  | sz + 1, idx => by
    rw [momentCache.eq_def, Array.getElem?_push]
    split_ifs with he
    · simp only [Option.getD_some]
      match sz with
      | 0 => exact h₀
      | 1 => exact h₁
      | k + 2 => exact isDyadicPair_rd P _ _
    · exact isDyadicPair_momentCache P a b ea eb v₀ v₁ h₀ h₁ sz idx

theorem isDyadicPair_fastMomentCache (P n : ℕ) (a b : ℚ) (size idx : ℕ) :
    IsDyadicPair P ((fastMomentCache P n a b size)[idx]?.getD (0, 0)) :=
  isDyadicPair_momentCache P a b _ _ _ _ (isDyadicPair_radial P n a b 0)
    (isDyadicPair_radial P n a b 1) size idx

private theorem rat_floor_div_pow (P : ℕ) (z : ℤ) :
    Rat.floor (((z : ℚ) / 2 ^ P) * 2 ^ P) = z := by
  have h2 : (2 : ℚ) ^ P ≠ 0 := by positivity
  rw [div_mul_cancel₀ _ h2]
  change ⌊(z : ℚ)⌋ = z
  exact Int.floor_intCast z

private theorem rat_neg_floor_neg_div_pow (P : ℕ) (z : ℤ) :
    -Rat.floor (-(((z : ℚ) / 2 ^ P) * 2 ^ P)) = z := by
  have h2 : (2 : ℚ) ^ P ≠ 0 := by positivity
  rw [div_mul_cancel₀ _ h2]
  change -⌊(-(z : ℚ))⌋ = z
  rw [← Int.cast_neg, Int.floor_intCast, neg_neg]

private theorem toIntCell_get (P : ℕ) {cell : Array (ℚ × ℚ)}
    (hcell : ∀ idx : ℕ, IsDyadicPair P (cell[idx]?.getD (0, 0))) (idx : ℕ) :
    let m := (toIntCell P cell)[idx]?.getD (0, 0)
    cell[idx]?.getD (0, 0) = ((m.1 : ℚ) / 2 ^ P, (m.2 : ℚ) / 2 ^ P) := by
  by_cases hlt : idx < cell.size
  · have hm : (toIntCell P cell)[idx]?.getD (0, 0) =
        (Rat.floor (cell[idx].1 * 2 ^ P), -Rat.floor (-(cell[idx].2 * 2 ^ P))) := by
      simp [toIntCell, Array.getElem?_eq_getElem hlt]
    obtain ⟨a, b, hab⟩ := hcell idx
    simp only [Array.getElem?_eq_getElem hlt, Option.getD_some] at hab ⊢
    rw [hm, hab]
    simp only [rat_floor_div_pow, rat_neg_floor_neg_div_pow]
  · have hlt' : ¬idx < (toIntCell P cell).size := by simpa [toIntCell] using hlt
    simp [Array.getElem?_eq_none (Nat.le_of_not_lt hlt),
      Array.getElem?_eq_none (Nat.le_of_not_lt hlt')]

private theorem hermiteCoeffsInt_get (p q : ℕ) {k : ℕ} (hk : k < p + 1) :
    (hermiteCoeffsInt p q)[k]?.getD 0 = hermiteCoeffInt p q k := by
  simp only [hermiteCoeffsInt, Array.getElem?_ofFn, dite_eq_left hk, Option.getD_some]

private theorem hermiteCoeffInt_cast (p q k : ℕ) :
    (hermiteCoeffInt p q k : ℚ) = hermiteCoefficient p q k := by
  simp [hermiteCoeffInt, hermiteCoefficient]

private lemma map_range_succ_sum (f : ℕ → ℚ) (r : ℕ) :
    ((List.range (r + 1)).map f).sum = f 0 + ((List.range r).map fun j ↦ f (j + 1)).sum := by
  rw [List.range_succ_eq_map, List.map_cons, List.sum_cons, List.map_map]
  rfl

private theorem hermiteIntLoop_eq (P p q : ℕ) {cell : Array (ℚ × ℚ)}
    (hcell : ∀ idx : ℕ, IsDyadicPair P (cell[idx]?.getD (0, 0))) :
    ∀ (r k : ℕ), k + r ≤ p + 1 → ∀ (accLo accHi : ℤ),
      let out := hermiteIntLoop p q (hermiteCoeffsInt p q) (toIntCell P cell) r k accLo accHi
      ((out.1 : ℚ) / 2 ^ P, (out.2 : ℚ) / 2 ^ P) =
        ((accLo : ℚ) / 2 ^ P +
          ((List.range r).map fun j ↦
            let c := hermiteCoefficient p q (k + j)
            let t := cell[p - (k + j) + (q - (k + j))]?.getD (0, 0)
            c * if 0 ≤ c then t.1 else t.2).sum,
         (accHi : ℚ) / 2 ^ P +
          ((List.range r).map fun j ↦
            let c := hermiteCoefficient p q (k + j)
            let t := cell[p - (k + j) + (q - (k + j))]?.getD (0, 0)
            c * if 0 ≤ c then t.2 else t.1).sum)
  | 0, _, _, accLo, accHi => by simp [hermiteIntLoop]
  | r + 1, k, hkr, accLo, accHi => by
    have hk : k < p + 1 := by omega
    have ih := hermiteIntLoop_eq P p q hcell r (k + 1) (by omega)
    simp only [hermiteIntLoop, hermiteCoeffsInt_get p q hk]
    rw [ih]
    have hcell_k := toIntCell_get P hcell (p - k + (q - k))
    set m := (toIntCell P cell)[p - k + (q - k)]?.getD (0, 0)
    set ci := hermiteCoeffInt p q k
    have hc_eq : hermiteCoefficient p q k = (ci : ℚ) := (hermiteCoeffInt_cast p q k).symm
    have hc_sign : (0 ≤ (ci : ℚ)) ↔ 0 ≤ ci := by exact_mod_cast Iff.rfl
    have hstepLo :
        (ci : ℚ) * (if 0 ≤ (ci : ℚ) then (m.1 : ℚ) / 2 ^ P else (m.2 : ℚ) / 2 ^ P) =
          (((if 0 ≤ ci then ci * m.1 else ci * m.2 : ℤ) : ℚ) / 2 ^ P) := by
      by_cases hs : 0 ≤ ci
      · have hsQ : (0 : ℚ) ≤ ci := hc_sign.mpr hs
        simp only [hs, hsQ, ↓reduceIte, Int.cast_mul, mul_div_assoc]
      · have hsQ : ¬(0 : ℚ) ≤ ci := fun h ↦ hs (hc_sign.mp h)
        simp only [hs, hsQ, ↓reduceIte, Int.cast_mul, mul_div_assoc]
    have hstepHi :
        (ci : ℚ) * (if 0 ≤ (ci : ℚ) then (m.2 : ℚ) / 2 ^ P else (m.1 : ℚ) / 2 ^ P) =
          (((if 0 ≤ ci then ci * m.2 else ci * m.1 : ℤ) : ℚ) / 2 ^ P) := by
      by_cases hs : 0 ≤ ci
      · have hsQ : (0 : ℚ) ≤ ci := hc_sign.mpr hs
        simp only [hs, hsQ, ↓reduceIte, Int.cast_mul, mul_div_assoc]
      · have hsQ : ¬(0 : ℚ) ≤ ci := fun h ↦ hs (hc_sign.mp h)
        simp only [hs, hsQ, ↓reduceIte, Int.cast_mul, mul_div_assoc]
    rw [map_range_succ_sum _ r, map_range_succ_sum _ r]
    simp only [Nat.add_zero]
    have htailLo : ((List.range r).map fun j ↦
        let c := hermiteCoefficient p q (k + (j + 1))
        let t := cell[p - (k + (j + 1)) + (q - (k + (j + 1)))]?.getD (0, 0)
        c * if 0 ≤ c then t.1 else t.2) =
      ((List.range r).map fun j ↦
        let c := hermiteCoefficient p q (k + 1 + j)
        let t := cell[p - (k + 1 + j) + (q - (k + 1 + j))]?.getD (0, 0)
        c * if 0 ≤ c then t.1 else t.2) := by
      refine List.map_congr_left fun j _ ↦ ?_
      have hkj : k + (j + 1) = k + 1 + j := by omega
      rw [hkj]
    have htailHi : ((List.range r).map fun j ↦
        let c := hermiteCoefficient p q (k + (j + 1))
        let t := cell[p - (k + (j + 1)) + (q - (k + (j + 1)))]?.getD (0, 0)
        c * if 0 ≤ c then t.2 else t.1) =
      ((List.range r).map fun j ↦
        let c := hermiteCoefficient p q (k + 1 + j)
        let t := cell[p - (k + 1 + j) + (q - (k + 1 + j))]?.getD (0, 0)
        c * if 0 ≤ c then t.2 else t.1) := by
      refine List.map_congr_left fun j _ ↦ ?_
      have hkj : k + (j + 1) = k + 1 + j := by omega
      rw [hkj]
    rw [htailLo, htailHi, hcell_k, hc_eq]
    dsimp only
    rw [hstepLo, hstepHi]
    apply Prod.ext <;> (dsimp only; push_cast; ring)

theorem radialRowInt_eq (P p q : ℕ) {grid : Array (Array (ℚ × ℚ))}
    (hgrid : ∀ cell ∈ grid.toList, ∀ idx : ℕ, IsDyadicPair P (cell[idx]?.getD (0, 0))) :
    radialRowInt P p q (toIntGrid P grid) = radialRow P p q grid := by
  rw [radialRow_eq_map]
  unfold radialRowInt toIntGrid
  rw [Array.map_map]
  apply Array.ext
  · simp
  · intro i hi1 hi2
    have hi : i < grid.size := by simpa using hi2
    simp only [Array.getElem_map, Function.comp_apply]
    have hcell : ∀ idx : ℕ, IsDyadicPair P (grid[i][idx]?.getD (0, 0)) :=
      hgrid grid[i] (Array.getElem_mem_toList hi)
    have hloop := hermiteIntLoop_eq P p q hcell (p + 1) 0 (by omega) 0 0
    simp only [Int.cast_zero, zero_div, zero_add] at hloop
    have hfc : hermiteFromCache p q grid[i] =
        (let out := hermiteIntLoop p q (hermiteCoeffsInt p q) (toIntCell P grid[i]) (p + 1) 0 0 0
         ((out.1 : ℚ) / 2 ^ P, (out.2 : ℚ) / 2 ^ P)) := hloop.symm
    unfold normalizedFromCache
    rw [hfc]
    dsimp only
    unfold rationalBoundsFloat
    rw [rat_floor_div_pow, rat_neg_floor_neg_div_pow]

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

theorem momentsShared_eq (P n N size : ℕ) (R : ℚ) :
    momentsShared P n N size R = moments P n N size R := rfl

theorem isDyadic_moments (P n N size : ℕ) (R : ℚ) :
    ∀ cell ∈ (moments P n N size R).toList,
      ∀ idx : ℕ, RadialCompute.IsDyadicPair P (cell[idx]?.getD (0, 0)) := by
  intro cell hcell idx
  simp only [moments, Array.toList_ofFn, List.mem_ofFn] at hcell
  obtain ⟨_, rfl⟩ := hcell
  exact RadialCompute.isDyadicPair_fastMomentCache P n _ _ size idx

theorem leftRadialsInt_eq (P count : ℕ) (m : ℤ) {grid : Array (Array (ℚ × ℚ))}
    (hgrid : ∀ cell ∈ grid.toList,
      ∀ idx : ℕ, RadialCompute.IsDyadicPair P (cell[idx]?.getD (0, 0))) :
    leftRadialsInt P count m (RadialCompute.toIntGrid P grid) = leftRadials P count m grid := by
  simp only [leftRadialsInt, leftRadials, RadialCompute.radialRowInt_eq P _ _ hgrid]

theorem rightRadialsInt_eq (P count : ℕ) (m : ℤ) {grid : Array (Array (ℚ × ℚ))}
    (hgrid : ∀ cell ∈ grid.toList,
      ∀ idx : ℕ, RadialCompute.IsDyadicPair P (cell[idx]?.getD (0, 0))) :
    rightRadialsInt P count m (RadialCompute.toIntGrid P grid) = rightRadials P count m grid := by
  simp only [rightRadialsInt, rightRadials, RadialCompute.radialRowInt_eq P _ _ hgrid]

private lemma rect_mul_bounds {a₁ a₂ b₁ b₂ X Y : ℝ}
    (ha₁ : a₁ ≤ X) (ha₂ : X ≤ a₂) (hb₁ : b₁ ≤ Y) (hb₂ : Y ≤ b₂) :
    min (min (a₁ * b₁) (a₁ * b₂)) (min (a₂ * b₁) (a₂ * b₂)) ≤ X * Y ∧
      X * Y ≤ max (max (a₁ * b₁) (a₁ * b₂)) (max (a₂ * b₁) (a₂ * b₂)) := by
  have hL : ∀ c : ℝ, min (c * b₁) (c * b₂) ≤ c * Y ∧ c * Y ≤ max (c * b₁) (c * b₂) := fun c ↦ by
    rcases le_total 0 c with hc | hc
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left hb₁ hc),
        (mul_le_mul_of_nonneg_left hb₂ hc).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left hb₂ hc),
        (mul_le_mul_of_nonpos_left hb₁ hc).trans (le_max_left _ _)⟩
  rcases le_total 0 Y with hY | hY
  · exact ⟨(min_le_left _ _).trans ((hL a₁).1.trans (mul_le_mul_of_nonneg_right ha₁ hY)),
      (mul_le_mul_of_nonneg_right ha₂ hY).trans ((hL a₂).2.trans (le_max_right _ _))⟩
  · exact ⟨(min_le_right _ _).trans ((hL a₂).1.trans (mul_le_mul_of_nonpos_right ha₂ hY)),
      (mul_le_mul_of_nonpos_right ha₁ hY).trans ((hL a₁).2.trans (le_max_left _ _))⟩

private theorem mulRaw_sound {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) :
    ((mulRaw a b).1 : ℝ) ≤ (x * D) * (y * D) ∧
      (x * D) * (y * D) ≤ ((mulRaw a b).2 : ℝ) := by
  obtain ⟨hx1, hx2⟩ := hx
  obtain ⟨hy1, hy2⟩ := hy
  by_cases hb0 : 0 ≤ b.lo
  · have hb0R : (0 : ℝ) ≤ b.lo := by exact_mod_cast hb0
    have hY : 0 ≤ y * D := hb0R.trans hy1
    by_cases ha0 : 0 ≤ a.lo
    · have ha0R : (0 : ℝ) ≤ a.lo := by exact_mod_cast ha0
      simp only [mulRaw, hb0, ha0, ↓reduceIte]
      push_cast
      exact ⟨mul_le_mul hx1 hy1 hb0R (ha0R.trans hx1),
        mul_le_mul hx2 hy2 hY (ha0R.trans (hx1.trans hx2))⟩
    · by_cases ha1 : a.hi ≤ 0
      · have ha1R : (a.hi : ℝ) ≤ 0 := by exact_mod_cast ha1
        have ha0R : (a.lo : ℝ) ≤ 0 := (hx1.trans hx2).trans ha1R
        simp only [mulRaw, hb0, ha0, ha1, ↓reduceIte]
        push_cast
        exact ⟨(mul_le_mul_of_nonpos_left hy2 ha0R).trans (mul_le_mul_of_nonneg_right hx1 hY),
          (mul_le_mul_of_nonneg_right hx2 hY).trans (mul_le_mul_of_nonpos_left hy1 ha1R)⟩
      · have ha0R : (a.lo : ℝ) ≤ 0 := by exact_mod_cast le_of_not_ge ha0
        have ha1R : (0 : ℝ) ≤ a.hi := by exact_mod_cast le_of_not_ge ha1
        simp only [mulRaw, hb0, ha0, ha1, ↓reduceIte]
        push_cast
        exact ⟨(mul_le_mul_of_nonpos_left hy2 ha0R).trans (mul_le_mul_of_nonneg_right hx1 hY),
          (mul_le_mul_of_nonneg_right hx2 hY).trans (mul_le_mul_of_nonneg_left hy2 ha1R)⟩
  · by_cases hb1 : b.hi ≤ 0
    · have hb1R : (b.hi : ℝ) ≤ 0 := by exact_mod_cast hb1
      have hY : y * D ≤ 0 := hy2.trans hb1R
      by_cases ha0 : 0 ≤ a.lo
      · have ha0R : (0 : ℝ) ≤ a.lo := by exact_mod_cast ha0
        have ha1R : (0 : ℝ) ≤ a.hi := ha0R.trans (hx1.trans hx2)
        simp only [mulRaw, hb0, hb1, ha0, ↓reduceIte]
        push_cast
        exact ⟨(mul_le_mul_of_nonneg_left hy1 ha1R).trans (mul_le_mul_of_nonpos_right hx2 hY),
          (mul_le_mul_of_nonpos_right hx1 hY).trans (mul_le_mul_of_nonneg_left hy2 ha0R)⟩
      · by_cases ha1 : a.hi ≤ 0
        · have ha1R : (a.hi : ℝ) ≤ 0 := by exact_mod_cast ha1
          have ha0R : (a.lo : ℝ) ≤ 0 := (hx1.trans hx2).trans ha1R
          simp only [mulRaw, hb0, hb1, ha0, ha1, ↓reduceIte]
          push_cast
          exact ⟨(mul_le_mul_of_nonpos_left hy2 ha1R).trans (mul_le_mul_of_nonpos_right hx2 hY),
            (mul_le_mul_of_nonpos_right hx1 hY).trans (mul_le_mul_of_nonpos_left hy1 ha0R)⟩
        · have ha0R : (a.lo : ℝ) ≤ 0 := by exact_mod_cast le_of_not_ge ha0
          have ha1R : (0 : ℝ) ≤ a.hi := by exact_mod_cast le_of_not_ge ha1
          simp only [mulRaw, hb0, hb1, ha0, ha1, ↓reduceIte]
          push_cast
          exact ⟨(mul_le_mul_of_nonneg_left hy1 ha1R).trans (mul_le_mul_of_nonpos_right hx2 hY),
            (mul_le_mul_of_nonpos_right hx1 hY).trans (mul_le_mul_of_nonpos_left hy1 ha0R)⟩
    · simp only [mulRaw, hb0, hb1, ↓reduceIte]
      push_cast
      exact rect_mul_bounds hx1 hx2 hy1 hy2

private theorem packCI_sound {z : ℂ} {reLo reHi imLo imHi : ℤ}
    (hre1 : (reLo : ℝ) ≤ z.re * D * D) (hre2 : z.re * D * D ≤ (reHi : ℝ))
    (him1 : (imLo : ℝ) ≤ z.im * D * D) (him2 : z.im * D * D ≤ (imHi : ℝ)) :
    memC z (packCI reLo reHi imLo imHi) := by
  have hD : (0 : ℝ) < D := D_pos
  have hDi : (0 : ℤ) < D := by exact_mod_cast hD
  have hdn : ∀ (lo : ℤ) (r : ℝ), (lo : ℝ) ≤ r * D * D → (shDown lo : ℝ) ≤ r * D := fun lo r h ↦ by
    have h1 : ((lo / D : ℤ) : ℝ) * D ≤ (lo : ℝ) := by exact_mod_cast Int.ediv_mul_le lo hDi.ne'
    exact le_of_mul_le_mul_right (h1.trans h) hD
  have hup : ∀ (hi : ℤ) (r : ℝ), r * D * D ≤ (hi : ℝ) → r * D ≤ (shUp hi : ℝ) := fun hi r h ↦ by
    have h1 : (((-hi) / D : ℤ) : ℝ) * D ≤ -(hi : ℝ) := by
      exact_mod_cast Int.ediv_mul_le (-hi) hDi.ne'
    change r * D ≤ ((-((-hi) / D) : ℤ) : ℝ)
    rw [Int.cast_neg]
    exact le_of_mul_le_mul_right (by linarith) hD
  exact ⟨⟨hdn reLo z.re hre1, hup reHi z.re hre2⟩, ⟨hdn imLo z.im him1, hup imHi z.im him2⟩⟩

private theorem mem_tableCells26 (table : Array (ℤ × ℤ)) (N k i j : ℕ) :
    memC (cellEntry table (2 ^ 26) N k i j)
      (getC (tableCells26 table) (k * (N * N) + (i * N + j))) := by
  unfold cellEntry
  have hidx : k * (N * N) + (i * N + j) = k * N * N + i * N + j := by ring
  rw [hidx]
  let idx := k * N * N + i * N + j
  change memC (clippedCell (2 ^ 26) (table[idx]?.getD (0, 0)).1 (table[idx]?.getD (0, 0)).2)
    (getC (tableCells26 table) idx)
  by_cases hlt : idx < table.size
  · have hget : table[idx]?.getD (0, 0) = table[idx] := by simp [hlt]
    have hg : getC (tableCells26 table) idx =
        (if table[idx].1 * table[idx].1 + table[idx].2 * table[idx].2 ≤
            (2 ^ 26 : ℤ) * (2 ^ 26 : ℤ) then
          ⟨⟨table[idx].1 * (2 : ℤ) ^ 102, table[idx].1 * (2 : ℤ) ^ 102⟩,
           ⟨table[idx].2 * (2 : ℤ) ^ 102, table[idx].2 * (2 : ℤ) ^ 102⟩⟩
        else zeroC) := by
      simp [getC, tableCells26, hlt]
    rw [hget, hg]
    unfold clippedCell
    have hcast26 : (((2 ^ 26 : ℕ) : ℤ)) = (2 ^ 26 : ℤ) := by norm_num
    rw [hcast26]
    by_cases hlim : table[idx].1 * table[idx].1 + table[idx].2 * table[idx].2 ≤
        (2 ^ 26 : ℤ) * (2 ^ 26 : ℤ)
    · simp only [hlim, ↓reduceIte]
      have hz : (((table[idx].1 : ℂ) + (table[idx].2 : ℂ) * Complex.I) / ((2 ^ 26 : ℕ) : ℂ)) =
          ⟨(table[idx].1 : ℝ) / ((2 ^ 26 : ℕ) : ℝ),
           (table[idx].2 : ℝ) / ((2 ^ 26 : ℕ) : ℝ)⟩ := by
        apply Complex.ext <;> simp
      rw [hz]
      exact ⟨⟨le_of_eq (by unfold GrotheKernel.D GrotheKernel.K; dsimp only; push_cast; ring),
              le_of_eq (by unfold GrotheKernel.D GrotheKernel.K; dsimp only; push_cast; ring)⟩,
             ⟨le_of_eq (by unfold GrotheKernel.D GrotheKernel.K; dsimp only; push_cast; ring),
              le_of_eq (by unfold GrotheKernel.D GrotheKernel.K; dsimp only; push_cast; ring)⟩⟩
    · simp only [hlim, ↓reduceIte]
      exact mem_zeroC
  · have h1 : table[idx]?.getD (0, 0) = (0, 0) := by
      simp [Array.getElem?_eq_none (Nat.le_of_not_lt hlt)]
    have hlt' : ¬idx < (tableCells26 table).size := by simpa [tableCells26] using hlt
    have h2 : getC (tableCells26 table) idx = zeroC := by
      simp [getC, Array.getElem?_eq_none (Nat.le_of_not_lt hlt')]
    have hc0 : clippedCell (2 ^ 26) 0 0 = 0 := by simp [clippedCell]
    rw [h1, h2]
    dsimp only
    rw [hc0]
    exact mem_zeroC

private lemma acc_add_sum_range_succ {α : Type*} [AddCommMonoid α] (f : ℕ → α) (acc : α)
    (r k : ℕ) :
    acc + ∑ l ∈ range (r + 1), f (k + l) =
      (acc + f k) + ∑ l ∈ range r, f (k + 1 + l) := by
  rw [Finset.sum_range_succ', Nat.add_zero, add_comm (∑ _ ∈ _, _) (f k), ← add_assoc]
  congr 1
  exact Finset.sum_congr rfl fun l _ ↦ congrArg f (by omega)

private theorem mem_fourierCellsLoop {A stride ij : ℕ} {phases cells : Array CI}
    {z c : ℕ → ℂ}
    (hz : ∀ k < A, memC (z k) (getC phases k))
    (hc : ∀ k < A, memC (c k) (getC cells (k * stride + ij))) :
    ∀ (r k : ℕ), k + r ≤ A → ∀ (acc : ℂ) (reLo reHi imLo imHi : ℤ),
      (reLo : ℝ) ≤ acc.re * D * D → acc.re * D * D ≤ (reHi : ℝ) →
      (imLo : ℝ) ≤ acc.im * D * D → acc.im * D * D ≤ (imHi : ℝ) →
      memC (acc + ∑ l ∈ range r, z (k + l) * c (k + l))
        (fourierCellsLoop phases cells stride ij r k reLo reHi imLo imHi)
  | 0, _, _, acc, reLo, reHi, imLo, imHi, hr1, hr2, hi1, hi2 => by
    simpa [fourierCellsLoop] using packCI_sound hr1 hr2 hi1 hi2
  | r + 1, k, hkr, acc, reLo, reHi, imLo, imHi, hr1, hr2, hi1, hi2 => by
    have hk : k < A := by omega
    have hrr := mulRaw_sound (hz k hk).1 (hc k hk).1
    have hii := mulRaw_sound (hz k hk).2 (hc k hk).2
    have hri := mulRaw_sound (hz k hk).1 (hc k hk).2
    have hir := mulRaw_sound (hz k hk).2 (hc k hk).1
    have hreEq : (acc + z k * c k).re * D * D =
        acc.re * D * D + ((z k).re * D) * ((c k).re * D) - ((z k).im * D) * ((c k).im * D) := by
      simp [Complex.add_re, Complex.mul_re]; ring
    have himEq : (acc + z k * c k).im * D * D =
        acc.im * D * D + ((z k).re * D) * ((c k).im * D) + ((z k).im * D) * ((c k).re * D) := by
      simp [Complex.add_im, Complex.mul_im]; ring
    rw [acc_add_sum_range_succ (fun n ↦ z n * c n)]
    exact mem_fourierCellsLoop hz hc r (k + 1) (by omega) (acc + z k * c k) _ _ _ _
      (by push_cast; linarith) (by push_cast; linarith)
      (by push_cast; linarith) (by push_cast; linarith)

theorem mem_angularMatrixFast {A N residue : ℕ} (hA : 0 < A)
    (table : Array (ℤ × ℤ)) {m : ℤ} (hm : (m % (A : ℤ)).toNat = residue)
    {i j : ℕ} (hi : i < N) (hj : j < N) :
    memC (unscaledAngular table (2 ^ 26) N A m i j)
      (getC (angularMatrixFast A N residue (rootTable A) (tableCells26 table)) (i * N + j)) := by
  have hij : i * N + j < N * N := by
    have hmul := Nat.mul_le_mul_right N (show i + 1 ≤ N by omega)
    nlinarith
  unfold angularMatrixFast unscaledAngular
  rw [getC_ofFn _ hij]
  apply memC_mul
  · apply memC_ofR
    simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_natCast] using mem_ofRatI (1 / (A : ℚ))
  · have hloop := mem_fourierCellsLoop (A := A) (stride := N * N) (ij := i * N + j)
      (phases := Array.ofFn fun k : Fin A ↦ rootAt A (rootTable A) (-((residue : ℤ) * k.val)))
      (cells := tableCells26 table)
      (z := fun k ↦ Complex.exp (((-(m : ℝ) * (2 * Real.pi * k / A) : ℝ) : ℂ) * Complex.I))
      (c := fun k ↦ cellEntry table (2 ^ 26) N k i j)
      (fun k hk ↦ by
        rw [getC_ofFn _ hk, rootAt_rootTable hA, rootC_residue hA hm]
        convert CellNumerics.mem_rootC hA (-(m * k)) using 1
        congr 2; push_cast; ring)
      (fun k _ ↦ mem_tableCells26 table N k i j)
      A 0 (by omega) 0 0 0 0 0 (by simp) (by simp) (by simp) (by simp)
    simpa only [zero_add, Nat.zero_add] using hloop

private theorem mem_rightDotLoop {N base : ℕ} {row : Array Ival} {angular : Array CI}
    {r : ℕ → ℝ} {v : ℕ → ℂ}
    (hr : ∀ j < N, mem (r j) (getI row j))
    (hv : ∀ j < N, memC (v j) (getC angular (base + j))) :
    ∀ (m j : ℕ), j + m ≤ N → ∀ (acc : ℂ) (reLo reHi imLo imHi : ℤ),
      (reLo : ℝ) ≤ acc.re * D * D → acc.re * D * D ≤ (reHi : ℝ) →
      (imLo : ℝ) ≤ acc.im * D * D → acc.im * D * D ≤ (imHi : ℝ) →
      memC (acc + ∑ l ∈ range m, v (j + l) * (r (j + l) : ℂ))
        (rightDotLoop row angular base m j reLo reHi imLo imHi)
  | 0, _, _, acc, reLo, reHi, imLo, imHi, hr1, hr2, hi1, hi2 => by
    simpa [rightDotLoop] using packCI_sound hr1 hr2 hi1 hi2
  | m + 1, j, hjm, acc, reLo, reHi, imLo, imHi, hr1, hr2, hi1, hi2 => by
    have hj : j < N := by omega
    have hpr := mulRaw_sound (hv j hj).1 (hr j hj)
    have hpi := mulRaw_sound (hv j hj).2 (hr j hj)
    have hreEq : (acc + v j * (r j : ℂ)).re * D * D =
        acc.re * D * D + ((v j).re * D) * (r j * D) := by
      simp [Complex.add_re, Complex.mul_re]; ring
    have himEq : (acc + v j * (r j : ℂ)).im * D * D =
        acc.im * D * D + ((v j).im * D) * (r j * D) := by
      simp [Complex.add_im, Complex.mul_im]; ring
    rw [acc_add_sum_range_succ (fun n ↦ v n * (r n : ℂ))]
    exact mem_rightDotLoop hr hv m (j + 1) (by omega) (acc + v j * (r j : ℂ)) _ _ _ _
      (by push_cast; linarith) (by push_cast; linarith)
      (by push_cast; linarith) (by push_cast; linarith)

theorem mem_rightTransformsFast {N : ℕ} {radials : Array (Array Ival)} {angular : Array CI}
    {r : ℕ → ℝ} {v : ℕ → ℕ → ℂ} {b i : ℕ}
    (hb : b < radials.size) (hi : i < N)
    (hr : ∀ j < N, mem (r j) (getI (radials[b]?.getD #[]) j))
    (hv : ∀ i < N, ∀ j < N, memC (v i j) (getC angular (i * N + j))) :
    memC (∑ j ∈ Finset.range N, v i j * (r j : ℂ))
      (getC ((rightTransformsFast N radials angular)[b]?.getD #[]) i) := by
  simp only [Array.getElem?_eq_getElem hb, Option.getD_some] at hr
  simp only [rightTransformsFast, Array.getElem?_map,
    Array.getElem?_eq_getElem hb, Option.map_some, Option.getD_some]
  rw [getC_ofFn _ hi]
  simpa only [zero_add, Nat.zero_add] using
    mem_rightDotLoop hr (fun j hj ↦ hv i hi j hj) N 0 (by omega) 0 0 0 0 0
      (by simp) (by simp) (by simp) (by simp)

private theorem mem_leftDotLoop {N : ℕ} {leftRow : Array Ival} {rightRow : Array CI}
    {l : ℕ → ℝ} {v : ℕ → ℂ}
    (hl : ∀ i < N, mem (l i) (getI leftRow i))
    (hv : ∀ i < N, memC (v i) (getC rightRow i)) :
    ∀ (m i : ℕ), i + m ≤ N → ∀ (acc : ℂ) (reLo reHi imLo imHi : ℤ),
      (reLo : ℝ) ≤ acc.re * D * D → acc.re * D * D ≤ (reHi : ℝ) →
      (imLo : ℝ) ≤ acc.im * D * D → acc.im * D * D ≤ (imHi : ℝ) →
      memC (acc + ∑ k ∈ range m, (l (i + k) : ℂ) * v (i + k))
        (leftDotLoop leftRow rightRow m i reLo reHi imLo imHi)
  | 0, _, _, acc, reLo, reHi, imLo, imHi, hr1, hr2, hi1, hi2 => by
    simpa [leftDotLoop] using packCI_sound hr1 hr2 hi1 hi2
  | m + 1, i, him, acc, reLo, reHi, imLo, imHi, hr1, hr2, hi1, hi2 => by
    have hi : i < N := by omega
    have hpr := mulRaw_sound (hl i hi) (hv i hi).1
    have hpi := mulRaw_sound (hl i hi) (hv i hi).2
    have hreEq : (acc + (l i : ℂ) * v i).re * D * D =
        acc.re * D * D + (l i * D) * ((v i).re * D) := by
      simp [Complex.add_re, Complex.mul_re]; ring
    have himEq : (acc + (l i : ℂ) * v i).im * D * D =
        acc.im * D * D + (l i * D) * ((v i).im * D) := by
      simp [Complex.add_im, Complex.mul_im]; ring
    rw [acc_add_sum_range_succ (fun n ↦ (l n : ℂ) * v n)]
    exact mem_leftDotLoop hl hv m (i + 1) (by omega) (acc + (l i : ℂ) * v i) _ _ _ _
      (by push_cast; linarith) (by push_cast; linarith)
      (by push_cast; linarith) (by push_cast; linarith)

theorem mem_cachedCoefficientFast {N A residue : ℕ} (hA : 0 < A)
    (table : Array (ℤ × ℤ)) (R : ℝ) (m : ℤ) (a b : ℕ)
    (hm : (m % (A : ℤ)).toNat = residue)
    {left right : Array (Array Ival)} (hb : b < right.size)
    (hl : ∀ i < N, mem
      (normalizedRadialMoment (cellMode m a b).1.1 (cellMode m a b).1.2
        (R * i / N) (R * (i + 1) / N)) (getI (left[a]?.getD #[]) i))
    (hr : ∀ j < N, mem
      (normalizedRadialMoment (cellMode m a b).2.1 (cellMode m a b).2.2
        (R * j / N) (R * (j + 1) / N)) (getI (right[b]?.getD #[]) j)) :
    memC (cellCoefficient table (2 ^ 26) N A R (cellMode m a b))
      (coefficientFast N a b (sincAt A (rootTable (2 * A)) CellNumerics.piInvI m) left
        (rightTransformsFast N right
          (angularMatrixFast A N residue (rootTable A) (tableCells26 table)))) := by
  have hs := CellNumerics.mem_sincI hA m
  rw [← sincAt_rootTable hA m] at hs
  have hv := fun (i : ℕ) (hi : i < N) (j : ℕ) (hj : j < N) ↦
    mem_angularMatrixFast (N := N) hA table hm (i := i) (j := j) hi hj
  have hd : memC (∑ i ∈ Finset.range N,
      (normalizedRadialMoment (cellMode m a b).1.1 (cellMode m a b).1.2
        (R * i / N) (R * (i + 1) / N) : ℂ) *
        ∑ j ∈ Finset.range N, unscaledAngular table (2 ^ 26) N A m i j *
          (normalizedRadialMoment (cellMode m a b).2.1 (cellMode m a b).2.2
            (R * j / N) (R * (j + 1) / N) : ℂ))
      (leftDotLoop (left[a]?.getD #[])
        ((rightTransformsFast N right
          (angularMatrixFast A N residue (rootTable A) (tableCells26 table)))[b]?.getD #[])
        N 0 0 0 0 0) := by
    simpa only [zero_add, Nat.zero_add] using
      mem_leftDotLoop hl (fun i hi ↦ mem_rightTransformsFast hb hi hr hv) N 0 (by omega)
        0 0 0 0 0 (by simp) (by simp) (by simp) (by simp)
  have hmul : memC ((Real.sinc ((m : ℝ) * (Real.pi / A)) : ℂ) *
      ∑ i ∈ Finset.range N,
        (normalizedRadialMoment (cellMode m a b).1.1 (cellMode m a b).1.2
          (R * i / N) (R * (i + 1) / N) : ℂ) *
          ∑ j ∈ Finset.range N, unscaledAngular table (2 ^ 26) N A m i j *
            (normalizedRadialMoment (cellMode m a b).2.1 (cellMode m a b).2.2
              (R * j / N) (R * (j + 1) / N) : ℂ))
      (coefficientFast N a b (sincAt A (rootTable (2 * A)) CellNumerics.piInvI m) left
        (rightTransformsFast N right
          (angularMatrixFast A N residue (rootTable A) (tableCells26 table)))) := by
    unfold coefficientFast
    constructor
    · simpa only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
        using Upper.mem_mul hs hd.1
    · simpa only [Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, zero_mul, add_zero]
        using Upper.mem_mul hs hd.2
  convert hmul using 1
  unfold cellCoefficient cellRowCoefficient
  simp_rw [cellMode_frequency, angularCellCoefficient_eq_sinc hA, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  ring

theorem mem_modeHeadFast {K N P j : ℕ} (hj : j ≤ K) (m : ℤ) (sinc : Ival)
    (gridInt : Array (Array (ℤ × ℤ))) (angularF angularG : Array CI)
    (f g : ℕ → ℕ → ℂ)
    (hf : ∀ a b, modeShift m + a + b ≤ K →
      memC (f a b) (coefficientFast N a b sinc (leftRadialsInt P (K + 1 - shift m) m gridInt)
        (rightTransformsFast N (rightRadialsInt P (K + 1 - shift m) m gridInt) angularF)))
    (hg : ∀ a b, modeShift m + a + b ≤ K →
      memC (g a b) (coefficientFast N a b sinc (leftRadialsInt P (K + 1 - shift m) m gridInt)
        (rightTransformsFast N (rightRadialsInt P (K + 1 - shift m) m gridInt) angularG))) :
    mem (modeGrade j m (fun _ a b ↦ (conj (f a b) * g a b).re))
      (getI (modeHeadFast K N P m sinc gridInt angularF angularG) j) := by
  unfold modeHeadFast
  rw [getI_ofFn _ (by omega)]
  change mem
    (if modeShift m ≤ j then
      ∑ a ∈ range (j - modeShift m + 1), (conj (f a (j - modeShift m - a)) *
        g a (j - modeShift m - a)).re else 0)
    (if modeShift m ≤ j then
      sumI (j - modeShift m + 1) fun a ↦
        overlapI
          (coefficientFast N a (j - modeShift m - a) sinc
            (leftRadialsInt P (K + 1 - shift m) m gridInt)
            (rightTransformsFast N (rightRadialsInt P (K + 1 - shift m) m gridInt) angularF))
          (coefficientFast N a (j - modeShift m - a) sinc
            (leftRadialsInt P (K + 1 - shift m) m gridInt)
            (rightTransformsFast N (rightRadialsInt P (K + 1 - shift m) m gridInt) angularG))
      else zeroI)
  by_cases hshift : modeShift m ≤ j
  · rw [ite_eq_left hshift, ite_eq_left hshift]
    apply mem_sumI
    intro a ha
    have hab : modeShift m + a + (j - modeShift m - a) ≤ K := by omega
    exact mem_overlapI (hf a _ hab) (hg a _ hab)
  · rw [ite_eq_right hshift, ite_eq_right hshift]
    exact Upper.mem_zero

theorem mem_residueHeadFast {K N A P n : ℕ} (hN : 0 < N) (hA : 0 < A)
    (hP : 1 ≤ P) (hn : 0 < n) {R : ℚ} (hR : 0 < R) (hgrid : GridValid N R)
    (F G : Array (ℤ × ℤ)) (residue : ℕ) {j : ℕ} (hj : j ≤ K) :
    mem (((frequencies K A residue).map fun m ↦ modeGrade j m fun m a b ↦
        crossCoefficient (cellVector F (2 ^ 26) N A R) (cellVector G (2 ^ 26) N A R)
          (cellMode m a b)).sum)
      (getI (residueHeadFast K N A P residue (rootTable A) (rootTable (2 * A))
        CellNumerics.piInvI (RadialCompute.toIntGrid P (momentsShared P n N (2 * K + 2) R))
        (tableCells26 F) (tableCells26 G)) j) := by
  rw [momentsShared_eq]
  unfold residueHeadFast
  apply mem_headsSum hj
  intro m hm
  have hres : (m % (A : ℤ)).toNat = residue := by
    simpa only [beq_iff_eq] using (List.mem_filter.mp hm).2
  have hdy := isDyadic_moments P n N (2 * K + 2) R
  have hcoeff : ∀ (T : Array (ℤ × ℤ)) (a b : ℕ), modeShift m + a + b ≤ K →
      memC ⟪hvec2 (cellMode m a b), cellVector T (2 ^ 26) N A R⟫_ℂ
        (coefficientFast N a b (sincAt A (rootTable (2 * A)) CellNumerics.piInvI m)
          (leftRadialsInt P (K + 1 - shift m) m
            (RadialCompute.toIntGrid P (moments P n N (2 * K + 2) R)))
          (rightTransformsFast N
            (rightRadialsInt P (K + 1 - shift m) m
              (RadialCompute.toIntGrid P (moments P n N (2 * K + 2) R)))
            (angularMatrixFast A N residue (rootTable A) (tableCells26 T)))) := by
    intro T a b hg
    rw [cellVector, cellCoefficient_eq_inner T (2 ^ 26) A hN (by exact_mod_cast hR)
      (cellMode m a b) (cellMode_charge m a b)]
    rw [leftRadialsInt_eq P _ m hdy, rightRadialsInt_eq P _ m hdy]
    refine mem_cachedCoefficientFast hA T (R : ℝ) m a b hres ?_
      (fun _ hi ↦ leftRadials_mem hP hn hgrid hg hi)
      (fun _ hi ↦ rightRadials_mem hP hn hgrid hg hi)
    simp only [rightRadials, Array.size_ofFn, shift_eq]
    omega
  have h := mem_modeHeadFast hj m (sincAt A (rootTable (2 * A)) CellNumerics.piInvI m)
    (RadialCompute.toIntGrid P (moments P n N (2 * K + 2) R))
    (angularMatrixFast A N residue (rootTable A) (tableCells26 F))
    (angularMatrixFast A N residue (rootTable A) (tableCells26 G))
    (fun a b ↦ ⟪hvec2 (cellMode m a b), cellVector F (2 ^ 26) N A R⟫_ℂ)
    (fun a b ↦ ⟪hvec2 (cellMode m a b), cellVector G (2 ^ 26) N A R⟫_ℂ)
    (hcoeff F) (hcoeff G)
  simpa only [modeGrade, crossCoefficient] using h

end Grothe.UpperReplacement.CellHeadCompute
