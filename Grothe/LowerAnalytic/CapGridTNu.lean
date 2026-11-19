import Grothe.LowerAnalytic.CapGridT
import Grothe.LowerAnalytic.CapPieceNu
import Grothe.LowerAnalytic.CapCheckNuSound

/-!
# Grid weights with an identity tail and the exact cell decomposition

The analogue of `CapGridT.lean` for the checker with a tail (`GridDataNu`,
`GrotheCapsKernel/CapCheckNu.lean`).  On the cell `(i, j)` of a grid that passes `gridOKNu` the seven
weights are `majWt d₂ d₃ ν g` (`cellWtR`); outside the grid they are the weights of the prices
`d₂ = d₃ = 1` without correction (`tailWtR`: `1/(1 + ν)`, `1`, `0`, `0`, `1/(1 − ν)`, `0`, `0`).
`gridWtsNu` are then admissible weights (`WtsNu`): the pointwise majorant is
`psiT_le_majPoly_of_cellOKNu` on the cells (with the ring bound `rlb((i+1)h) ≥ |L|`) and
`psiT_le_majPoly` with `majCell_one` on the tail.

**The decomposition** (`TintNu_grid`): every entry of `TintNu` is the finite sum over the cells of
`TzWNu (cell weights) (cellTNu i j)` plus the tail term `TzWNu (tail weights) tailTNu`, minus `ν` in
the entry `(0, 0)`; `TzWNu` is the entry formula with a tail (`W₁ + W₄|L|² + W₆|L|⁴`,
`(W₂ + W₅|L|²) uⱼ`, `W₀ Gᵢⱼ − W₃ uᵢuⱼ`) applied to the cell functional of the polynomials.
-/

open MeasureTheory Real Set Finset GrotheKernel
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### The grid weights -/

/-- The seven weights of the cell `(i, j)` of a grid with a tail. -/
def cellWtR (gd : GridDataNu) (i j : ℕ) : ℕ → ℝ :=
  majWt (gd.d2 i j : ℝ) (gd.d3 i j : ℝ) (gd.nu : ℝ) (gd.gg i j : ℝ)

/-- The weights outside the grid: the prices `d₂ = d₃ = 1`, no correction. -/
def tailWtR (gd : GridDataNu) : ℕ → ℝ := majWt 1 1 (gd.nu : ℝ) 0

/-- A grid function with real cell values: the cell value on the rings, `d` outside the grid. -/
def gridFunR (gd : GridDataNu) (F : ℕ → ℕ → ℝ) (d : ℝ) (z : ℂ) : ℝ :=
  if ridx gd.h z < gd.Nr then F (ridx gd.h z) (jidx gd.N z) else d

lemma measurable_gridFunR (gd : GridDataNu) (F : ℕ → ℕ → ℝ) (d : ℝ) :
    Measurable (gridFunR gd F d) := by
  unfold gridFunR
  refine Measurable.ite ?_ ?_ measurable_const
  · exact measurableSet_lt (measurable_ridx _) measurable_const
  · exact (measurable_of_countable (fun p : ℕ × ℕ => F p.1 p.2)).comp
      ((measurable_ridx _).prodMk (measurable_jidx _))

/-- The weights at the point `z`. -/
def wtAt (gd : GridDataNu) (z : ℂ) (w : ℕ) : ℝ :=
  gridFunR gd (fun i j => cellWtR gd i j w) (tailWtR gd w) z

/-- The weight function `w` of a grid (`0` for `w ≥ 7`). -/
def gridWt (gd : GridDataNu) (w : ℕ) (z : ℂ) : ℝ := if w < 7 then wtAt gd z w else 0

lemma measurable_gridWt (gd : GridDataNu) (w : ℕ) : Measurable (gridWt gd w) := by
  unfold gridWt
  by_cases hw : w < 7
  · simp only [hw, ↓reduceIte]
    exact measurable_gridFunR gd _ _
  · simp only [hw, ↓reduceIte]
    exact measurable_const

/-- On the grid the weights at `z` are those of its cell. -/
lemma wtAt_cell (gd : GridDataNu) {z : ℂ} (h : ridx gd.h z < gd.Nr) :
    wtAt gd z = cellWtR gd (ridx gd.h z) (jidx gd.N z) := by
  funext w; unfold wtAt gridFunR; simp only [h, ↓reduceIte]

/-- Outside the grid the weights at `z` are the tail weights. -/
lemma wtAt_tail (gd : GridDataNu) {z : ℂ} (h : ¬ ridx gd.h z < gd.Nr) : wtAt gd z = tailWtR gd := by
  funext w; unfold wtAt gridFunR; simp only [h, ↓reduceIte]

/-- A bound of all weights of a grid. -/
def gridWtBound (gd : GridDataNu) : ℝ :=
  ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, ∑ w ∈ range 7, |cellWtR gd i j w|
    + ∑ w ∈ range 7, |tailWtR gd w|

lemma abs_gridWt_le (gd : GridDataNu) (hN : 0 < gd.N) (w : ℕ) (z : ℂ) :
    |gridWt gd w z| ≤ gridWtBound gd := by
  have h0 : 0 ≤ ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, ∑ w ∈ range 7, |cellWtR gd i j w| :=
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ =>
      abs_nonneg _
  have h1 : 0 ≤ ∑ w ∈ range 7, |tailWtR gd w| := Finset.sum_nonneg fun _ _ => abs_nonneg _
  unfold gridWt gridWtBound wtAt gridFunR
  split_ifs with hw hr
  · have hj := jidx_lt gd.N hN z
    have e1 : |cellWtR gd (ridx gd.h z) (jidx gd.N z) w|
        ≤ ∑ w ∈ range 7, |cellWtR gd (ridx gd.h z) (jidx gd.N z) w| :=
      Finset.single_le_sum (f := fun w => |cellWtR gd (ridx gd.h z) (jidx gd.N z) w|)
        (fun _ _ => abs_nonneg _) (mem_range.2 hw)
    have e2 : ∑ w ∈ range 7, |cellWtR gd (ridx gd.h z) (jidx gd.N z) w|
        ≤ ∑ j ∈ range gd.N, ∑ w ∈ range 7, |cellWtR gd (ridx gd.h z) j w| :=
      Finset.single_le_sum (f := fun j => ∑ w ∈ range 7, |cellWtR gd (ridx gd.h z) j w|)
        (fun _ _ => Finset.sum_nonneg fun _ _ => abs_nonneg _) (mem_range.2 hj)
    have e3 : ∑ j ∈ range gd.N, ∑ w ∈ range 7, |cellWtR gd (ridx gd.h z) j w|
        ≤ ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, ∑ w ∈ range 7, |cellWtR gd i j w| :=
      Finset.single_le_sum (f := fun i => ∑ j ∈ range gd.N, ∑ w ∈ range 7, |cellWtR gd i j w|)
        (fun _ _ => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => abs_nonneg _)
        (mem_range.2 hr)
    linarith
  · have e1 : |tailWtR gd w| ≤ ∑ w ∈ range 7, |tailWtR gd w| :=
      Finset.single_le_sum (f := fun w => |tailWtR gd w|) (fun _ _ => abs_nonneg _)
        (mem_range.2 hw)
    linarith
  · rw [abs_zero]; linarith

/-- The cell polynomial of the grid weights is the one of the weights at `z`. -/
lemma majPoly_gridWt (gd : GridDataNu) (z : ℂ) (L p : ℂ) :
    majPoly (fun w => gridWt gd w z) L p = majPoly (wtAt gd z) L p := by
  unfold majPoly gridWt
  simp only [Nat.reduceLT, ↓reduceIte]

/-- The tail weights for `0 ≤ ν < 1`. -/
lemma tailWtR_eq (gd : GridDataNu) (h0 : (0 : ℝ) ≤ gd.nu) (h1 : (gd.nu : ℝ) < 1) :
    tailWtR gd 0 = 1 / (1 + gd.nu) ∧ tailWtR gd 1 = 1 ∧ tailWtR gd 2 = 0 ∧ tailWtR gd 3 = 0 ∧
      tailWtR gd 4 = 1 / (1 - gd.nu) ∧ tailWtR gd 5 = 0 ∧ tailWtR gd 6 = 0 := by
  have ha : (1 : ℝ) + gd.nu ≠ 0 := by linarith
  have hb : (1 : ℝ) - gd.nu ≠ 0 := by linarith
  have hc : (2 : ℝ) * (1 * 1 - (gd.nu : ℝ) ^ 2) ≠ 0 := by
    have : (1 : ℝ) * 1 - (gd.nu : ℝ) ^ 2 = (1 - gd.nu) * (1 + gd.nu) := by ring
    rw [this]; positivity
  unfold tailWtR
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simp only [majWt]; rw [div_eq_div_iff hc ha]; ring
  · simp only [majWt]; norm_num
  · simp only [majWt]; norm_num
  · simp only [majWt]
  · simp only [majWt]
    rw [zero_mul, zero_mul, zero_div, sub_zero, div_eq_div_iff hc hb]; ring
  · simp only [majWt]; norm_num
  · simp only [majWt]; norm_num

section ok

variable {gd : GridDataNu} {ell beta : ℚ} (hok : gridOKNu gd ell beta = true)
include hok

lemma gridOKNu_h : (0 : ℝ) < gd.h := by
  simp only [gridOKNu, Bool.and_eq_true, decide_eq_true_eq] at hok
  exact_mod_cast hok.1.1.1.1.1
lemma gridOKNu_N : 0 < gd.N := by
  simp only [gridOKNu, Bool.and_eq_true, decide_eq_true_eq] at hok; exact hok.1.1.1.1.2
lemma gridOKNu_Nr : 0 < gd.Nr := by
  simp only [gridOKNu, Bool.and_eq_true, decide_eq_true_eq] at hok; exact hok.1.1.1.2
lemma gridOKNu_nu0Q : (0 : ℚ) ≤ gd.nu := by
  simp only [gridOKNu, Bool.and_eq_true, decide_eq_true_eq] at hok; exact hok.1.1.2
lemma gridOKNu_nu0 : (0 : ℝ) ≤ gd.nu := by exact_mod_cast gridOKNu_nu0Q hok
lemma gridOKNu_nu1 : (gd.nu : ℝ) < 1 := by
  simp only [gridOKNu, Bool.and_eq_true, decide_eq_true_eq] at hok; exact_mod_cast hok.1.2
lemma gridOKNu_cell {i j : ℕ} (hi : i < gd.Nr) (hj : j < gd.N) :
    cellOKNu gd ell beta i j = true := by
  simp only [gridOKNu, Bool.and_eq_true, List.all_eq_true, List.mem_range] at hok
  exact hok.2 i hi j hj

/-- **The pointwise majorant of a checked grid.** -/
lemma psiT_le_majPoly_wtAt (z p : ℂ) :
    psiT (gd.nu : ℝ) (Lf ell beta z + p) (Lf ell beta z - p)
      ≤ majPoly (wtAt gd z) (Lf ell beta z) p := by
  have hν := gridOKNu_nu0 hok
  by_cases h : ridx gd.h z < gd.Nr
  · rw [wtAt_cell gd h]
    have hc := gridOKNu_cell hok h (jidx_lt _ (gridOKNu_N hok) z)
    have hz : ‖z‖ ≤ ((((ridx gd.h z : ℚ) + 1) * gd.h : ℚ) : ℝ) := by
      have h1 := Nat.lt_floor_add_one (‖z‖ / gd.h)
      have hh := gridOKNu_h hok
      rw [div_lt_iff₀ hh] at h1
      push_cast
      exact h1.le
    have hL := norm_Lf_le_rlb ell beta hz
    have hrl : ((rlb ell beta ((ridx gd.h z + 1) * gd.h) : ℚ) : ℝ) ≤ (gd.rl (ridx gd.h z) : ℝ) := by
      have h2 := hc
      simp only [cellOKNu, Bool.and_eq_true, decide_eq_true_eq] at h2
      exact_mod_cast h2.1.2
    exact psiT_le_majPoly_of_cellOKNu gd ell beta _ _ (gridOKNu_nu0Q hok) hc (hL.trans hrl) p
  · rw [wtAt_tail gd h]
    have h1 := gridOKNu_nu1 hok
    exact psiT_le_majPoly hν (majCell_one (by nlinarith) ‖Lf ell beta z‖) le_rfl p

/-- **The weights of a checked grid.** -/
def gridWtsNu : WtsNu ell beta gd.nu where
  W := gridWt gd
  c := gridWtBound gd
  mW := measurable_gridWt gd
  bW := abs_gridWt_le gd (gridOKNu_N hok)
  maj z p := by
    rw [majPoly_gridWt]
    exact psiT_le_majPoly_wtAt hok z p

end ok

/-! ### The cell decomposition -/

/-- The entry formula with a tail applied to a linear functional `ct` of the polynomials. -/
def TzWNu (ell beta : ℚ) (W : ℕ → ℝ) (ct : CP → ℝ) (I J : ℕ) : ℝ :=
  if I = 0 then
    (if J = 0 then W 1 * ct oneCP + W 4 * ct (l2CP ell beta) + W 6 * ct (l4CP ell beta)
    else W 2 * ct (uCP ell beta (J - 1)) + W 5 * ct (l2uCP ell beta (J - 1)))
  else if J = 0 then W 2 * ct (uCP ell beta (I - 1)) + W 5 * ct (l2uCP ell beta (I - 1))
  else W 0 * ct (gCP (I - 1) (J - 1)) - W 3 * ct (uuCP ell beta (I - 1) (J - 1))

lemma TzWNu_mul (ell beta : ℚ) (W : ℕ → ℝ) (ct : CP → ℝ) (f : ℝ) (I J : ℕ) :
    f * TzWNu ell beta W ct I J = TzWNu ell beta W (fun P => f * ct P) I J := by
  unfold TzWNu; split_ifs <;> ring

lemma integral_TzWNu (ell beta : ℚ) (W : ℕ → ℝ) {f : ℂ → ℝ} (hf : Measurable f)
    (hf1 : ∀ z, |f z| ≤ 1) (I J : ℕ) :
    ∫ z, TzWNu ell beta W (fun P => f z * (P.eval z).re) I J ∂gaussC
      = TzWNu ell beta W (fun P => ∫ z, f z * (P.eval z).re ∂gaussC) I J := by
  have hi : ∀ P : CP, Integrable (fun z => f z * (P.eval z).re) gaussC := fun P => by
    simp_rw [re_eval_polar]; exact integrable_ind_mul_sum hf hf1 _
  unfold TzWNu
  split_ifs
  · have i1 := (hi oneCP).const_mul (W 1)
    have i4 := (hi (l2CP ell beta)).const_mul (W 4)
    have i6 := (hi (l4CP ell beta)).const_mul (W 6)
    have i14 : Integrable (fun z => W 1 * (f z * (oneCP.eval z).re)
        + W 4 * (f z * ((l2CP ell beta).eval z).re)) gaussC := i1.add i4
    rw [integral_add i14 i6, integral_add i1 i4, integral_const_mul, integral_const_mul,
      integral_const_mul]
  · rw [integral_add ((hi _).const_mul _) ((hi _).const_mul _), integral_const_mul,
      integral_const_mul]
  · rw [integral_add ((hi _).const_mul _) ((hi _).const_mul _), integral_const_mul,
      integral_const_mul]
  · rw [integral_sub ((hi _).const_mul _) ((hi _).const_mul _), integral_const_mul,
      integral_const_mul]

/-! #### The new polynomials `|L|⁴` and `|L|²uⱼ` -/

lemma eval_l2CP (ell beta : ℚ) (z : ℂ) :
    (l2CP ell beta).eval z = ((‖Lf ell beta z‖ ^ 2 : ℝ) : ℂ) := by
  unfold l2CP
  rw [CP.eval_mul, CP.eval_conj, eval_lCP, Complex.mul_conj, Complex.normSq_eq_norm_sq]

lemma normL_pow4_eq (ell beta : ℚ) (z : ℂ) :
    ‖Lf ell beta z‖ ^ 4 = ((l4CP ell beta).eval z).re := by
  unfold l4CP
  rw [CP.eval_mul, eval_l2CP, ← Complex.ofReal_mul, Complex.ofReal_re]
  ring

lemma normL_sq_uF_eq (ell beta : ℚ) (j : ℕ) (z : ℂ) :
    ‖Lf ell beta z‖ ^ 2 * uF ell beta j z = ((l2uCP ell beta j).eval z).re := by
  unfold l2uCP
  rw [CP.eval_mul, eval_l2CP, Complex.re_ofReal_mul, ← uF_eq]

section dec

variable {gd : GridDataNu} {ell beta : ℚ} (hok : gridOKNu gd ell beta = true)
include hok

/-- `TzNu` in terms of the weights at `z`. -/
lemma TzNu_eq_TzWNu (z : ℂ) (I J : ℕ) :
    TzNu ell beta gd.nu (gridWtsNu hok) z I J
      = TzWNu ell beta (wtAt gd z) (fun P => (P.eval z).re) I J := by
  have e0 : (oneCP.eval z).re = 1 := by rw [eval_oneCP]; rfl
  have e2 := normL_sq_eq ell beta z
  have e4 := normL_pow4_eq ell beta z
  unfold TzNu TzWNu
  simp only [gridWtsNu, gridWt, Nat.reduceLT, ↓reduceIte]
  split_ifs <;>
    simp only [← uF_eq, ← GF_eq, ← uu_eq, e0, ← e2, ← e4, ← normL_sq_uF_eq] <;> ring

lemma cellInd_mul_TzNu {i j : ℕ} (hi : i < gd.Nr) (_hj : j < gd.N) (z : ℂ) (I J : ℕ) :
    cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j) (thN gd.N (j + 1)) z
        * TzNu ell beta gd.nu (gridWtsNu hok) z I J
      = TzWNu ell beta (cellWtR gd i j) (fun P => cellInd (i * gd.h) ((i + 1) * gd.h)
          (thN gd.N j) (thN gd.N (j + 1)) z * (P.eval z).re) I J := by
  rw [← TzWNu_mul, cellInd_eq (gridOKNu_h hok) (gridOKNu_N hok), TzNu_eq_TzWNu hok]
  split_ifs with hc
  · rw [wtAt_cell gd (by rw [hc.1]; exact hi), hc.1, hc.2]
  · simp

lemma tailInd_mul_TzNu (z : ℂ) (I J : ℕ) :
    tailInd (gd.Nr * gd.h) z * TzNu ell beta gd.nu (gridWtsNu hok) z I J
      = TzWNu ell beta (tailWtR gd) (fun P => tailInd (gd.Nr * gd.h) z * (P.eval z).re) I J := by
  rw [← TzWNu_mul, tailInd_eq (gridOKNu_h hok), TzNu_eq_TzWNu hok]
  split_ifs with hc
  · rw [wtAt_tail gd (by omega)]
  · simp

/-- The cell functional of the cell `(i, j)`. -/
def cellTNu (gd : GridDataNu) (i j : ℕ) (P : CP) : ℝ :=
  cellTerms (CP.polar P) (i * gd.h) ((i + 1) * gd.h) (thN gd.N j) (thN gd.N (j + 1))

/-- The tail functional. -/
def tailTNu (gd : GridDataNu) (P : CP) : ℝ := tailTerms (CP.polar P) (gd.Nr * gd.h)

/-- **The exact cell decomposition of the integrated majorant with a tail.** -/
theorem TintNu_grid (I J : ℕ) :
    TintNu ell beta gd.nu (gridWtsNu hok) I J
      = ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, TzWNu ell beta (cellWtR gd i j) (cellTNu gd i j) I J
        + TzWNu ell beta (tailWtR gd) (tailTNu gd) I J - if I = 0 ∧ J = 0 then (gd.nu : ℝ) else 0 := by
  have hh := gridOKNu_h hok
  have hN := gridOKNu_N hok
  have hpart : ∀ z, TzNu ell beta gd.nu (gridWtsNu hok) z I J
      = ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j)
          (thN gd.N (j + 1)) z * TzNu ell beta gd.nu (gridWtsNu hok) z I J
        + tailInd (gd.Nr * gd.h) z * TzNu ell beta gd.nu (gridWtsNu hok) z I J := by
    intro z
    simp only [← Finset.sum_mul, ← add_mul, partition hh hN gd.Nr z, one_mul]
  have hint : ∀ f : ℂ → ℝ, Measurable f → (∀ z, |f z| ≤ 1) →
      Integrable (fun z => f z * TzNu ell beta gd.nu (gridWtsNu hok) z I J) gaussC :=
    fun f hf hf1 => integrable_bdd_mul' hf 1 hf1 (integrable_TzNu _ _ _ _ I J)
  have hc : ∀ i j : ℕ, Integrable (fun z => cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j)
      (thN gd.N (j + 1)) z * TzNu ell beta gd.nu (gridWtsNu hok) z I J) gaussC := fun i j =>
    hint _ (measurable_cellInd _ _ _ _) (abs_cellInd_le _ _ _ _)
  unfold TintNu
  congr 1
  rw [integral_congr_ae (Filter.Eventually.of_forall hpart),
    integral_add (integrable_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ => hc i j)
      (hint _ (measurable_tailInd _) (abs_tailInd_le _)),
    integral_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ => hc i j]
  congr 1
  · refine Finset.sum_congr rfl fun i hi => ?_
    rw [integral_finsetSum _ fun j _ => hc i j]
    refine Finset.sum_congr rfl fun j hj => ?_
    simp_rw [cellInd_mul_TzNu hok (mem_range.1 hi) (mem_range.1 hj)]
    rw [integral_TzWNu _ _ _ (measurable_cellInd _ _ _ _) (abs_cellInd_le _ _ _ _)]
    unfold cellTNu
    obtain ⟨h1, h2, h3⟩ := thN_bounds hN (mem_range.1 hj)
    congr 1; funext P
    exact integral_cell_poly P (by positivity) (by nlinarith) h1 h2 h3
  · simp_rw [tailInd_mul_TzNu hok]
    rw [integral_TzWNu _ _ _ (measurable_tailInd _) (abs_tailInd_le _)]
    unfold tailTNu
    congr 1; funext P
    have hNr : (0 : ℝ) < gd.Nr := by exact_mod_cast gridOKNu_Nr hok
    exact integral_tail_poly P (by positivity)

end dec

end

end Grothe.LowerAnalytic
