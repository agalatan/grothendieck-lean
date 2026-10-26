import Grothe.LowerAnalytic.CapGrid
import GrotheCapsKernel.CapCheck

/-!
# Grid prices and the exact cell decomposition of the integrated majorant

`GridData`: a uniform grid (`Nr` rings of width `h`, `N` angular cells) with rational cell
prices `pa, pb`, reciprocal bounds `na, nb` and correction coefficients `gg`; on the tail
`A = B = nA = nB = 1`, `g = 0`.  `gridOK` checks the cell conditions (`1 ≤ na·pa`, `1 ≤ nb·pb`,
`0 ≤ gg`, `gg·D(pa, pb, rlb((i+1)h)) ≤ 8` with `rlb(r) = r(|ℓ − 2β| + |β|r²) ≥ |L|` on `|z| ≤ r`,
bounds by `c`); `gridPrices` are then admissible `Prices`.

**The decomposition** (`Tint_grid`): every entry of `T = ∫ Tz dγ` is the finite sum over the cells
of `TzW (cell weights) (cellT i j)` plus the tail term `TzW wTail tailT`, where `TzW` is the
entry formula (`ν|L|² + ξ`, `τ uⱼ`, `ν Gᵢⱼ − γ uᵢuⱼ`) applied to the cell functional of the
polynomials (`cellTerms`, `tailTerms`).
-/

open MeasureTheory Real Set Finset GrotheKernel
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

lemma absQ_eq (q : ℚ) : absQ q = |q| := by
  unfold absQ; split_ifs with h
  · rw [abs_of_neg h]
  · rw [abs_of_nonneg (not_lt.1 h)]

lemma majDq_cast (A B R : ℚ) : (majDq A B R : ℝ) = majD A B R := by
  simp [majDq, majD, absQ_eq]

lemma majD_mono {A B R R' : ℝ} (hA : 0 < A) (hB : 0 < B) (hR : 0 ≤ R) (h : R ≤ R') :
    majD A B R ≤ majD A B R' := by
  unfold majD
  have : 0 ≤ |A - B| := abs_nonneg _
  have hR' : 0 ≤ R' := hR.trans h
  have h2 : R ^ 2 ≤ R' ^ 2 := pow_le_pow_left₀ hR h 2
  have h3 : R * |A - B| ≤ R' * |A - B| := mul_le_mul_of_nonneg_right h this
  have hS : 0 < A + B := by linarith
  exact mul_le_mul_of_nonneg_left (by linarith) hS.le

lemma norm_Lf_le_rlb (ell beta : ℚ) {z : ℂ} {r : ℚ} (hz : ‖z‖ ≤ r) :
    ‖Lf ell beta z‖ ≤ rlb ell beta r := by
  rw [Lf, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  have hn := norm_nonneg z
  have e : (ell : ℝ) + beta * (Complex.normSq z - 2) = (ell - 2 * beta) + beta * ‖z‖ ^ 2 := by
    rw [Complex.normSq_eq_norm_sq]; ring
  rw [e]
  have h1 : |((ell : ℝ) - 2 * beta) + beta * ‖z‖ ^ 2| ≤ |(ell : ℝ) - 2 * beta| + |(beta : ℝ)| * (r : ℝ) ^ 2 := by
    refine (abs_add_le _ _).trans (add_le_add le_rfl ?_)
    rw [abs_mul, abs_pow, abs_norm]
    exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hn hz 2) (abs_nonneg _)
  have : (rlb ell beta r : ℝ) = (r : ℝ) * (|(ell : ℝ) - 2 * beta| + |(beta : ℝ)| * (r : ℝ) ^ 2) := by
    simp [rlb, absQ_eq]
  rw [this]
  exact mul_le_mul hz h1 (abs_nonneg _) (hn.trans hz)

/-- A grid function: the cell value on the rings, `d` on the tail. -/
def gridFun (gd : GridData) (F : ℕ → ℕ → ℚ) (d : ℝ) (z : ℂ) : ℝ :=
  if ridx gd.h z < gd.Nr then (F (ridx gd.h z) (jidx gd.N z) : ℝ) else d

lemma measurable_gridFun (gd : GridData) (F : ℕ → ℕ → ℚ) (d : ℝ) : Measurable (gridFun gd F d) := by
  unfold gridFun
  refine Measurable.ite ?_ ?_ measurable_const
  · exact measurableSet_lt (measurable_ridx _) measurable_const
  · exact (measurable_of_countable (fun p : ℕ × ℕ => (F p.1 p.2 : ℝ))).comp
      ((measurable_ridx _).prodMk (measurable_jidx _))

section ok

variable {gd : GridData} {ell beta : ℚ} (hok : gridOK gd ell beta = true)
include hok

lemma gridOK_h : (0 : ℝ) < gd.h := by
  simp only [gridOK, Bool.and_eq_true, decide_eq_true_eq] at hok; exact_mod_cast hok.1.1.1.1
lemma gridOK_N : 0 < gd.N := by
  simp only [gridOK, Bool.and_eq_true, decide_eq_true_eq] at hok; exact hok.1.1.1.2
lemma gridOK_c : (1 : ℝ) ≤ gd.c := by
  simp only [gridOK, Bool.and_eq_true, decide_eq_true_eq] at hok; exact_mod_cast hok.1.1.2
lemma gridOK_Nr : 0 < gd.Nr := by
  simp only [gridOK, Bool.and_eq_true, decide_eq_true_eq] at hok; exact hok.1.2
lemma gridOK_cell {i j : ℕ} (hi : i < gd.Nr) (hj : j < gd.N) : cellOK gd ell beta i j = true := by
  simp only [gridOK, Bool.and_eq_true, List.all_eq_true, List.mem_range] at hok
  exact hok.2 i hi j hj

lemma gridOK_cell' {i j : ℕ} (hi : i < gd.Nr) (hj : j < gd.N) :
    0 < gd.pa i j ∧ 0 < gd.pb i j ∧ 1 ≤ gd.na i j * gd.pa i j ∧ 1 ≤ gd.nb i j * gd.pb i j ∧
      0 ≤ gd.gg i j ∧ rlb ell beta ((i + 1) * gd.h) ≤ gd.rl i ∧
      gd.gg i j * majDq (gd.pa i j) (gd.pb i j) (gd.rl i) ≤ 8 ∧
      gd.pa i j ≤ gd.c ∧ gd.pb i j ≤ gd.c ∧ gd.na i j ≤ gd.c ∧ gd.nb i j ≤ gd.c ∧ gd.gg i j ≤ gd.c := by
  have h := gridOK_cell hok hi hj
  simp only [cellOK, Bool.and_eq_true, decide_eq_true_eq] at h
  tauto

/-- A property of all five cell functions, on the rings and on the tail. -/
lemma gridFun_cases (F : ℕ → ℕ → ℚ) (d : ℝ) (P : ℝ → Prop) (z : ℂ)
    (hc : ∀ i j, i < gd.Nr → j < gd.N → ridx gd.h z = i → jidx gd.N z = j → P (F i j))
    (ht : gd.Nr ≤ ridx gd.h z → P d) : P (gridFun gd F d z) := by
  unfold gridFun
  split_ifs with h
  · exact hc _ _ h (jidx_lt _ (gridOK_N hok) z) rfl rfl
  · exact ht (by omega)

/-- **The grid prices.** -/
def gridPrices : Prices ell beta where
  A := gridFun gd gd.pa 1
  B := gridFun gd gd.pb 1
  nA := gridFun gd gd.na 1
  nB := gridFun gd gd.nb 1
  g := gridFun gd gd.gg 0
  c := gd.c
  mA := measurable_gridFun _ _ _
  mB := measurable_gridFun _ _ _
  mnA := measurable_gridFun _ _ _
  mnB := measurable_gridFun _ _ _
  mg := measurable_gridFun _ _ _
  posA z := gridFun_cases hok _ _ (fun x => 0 < x) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).1) (fun _ => one_pos)
  posB z := gridFun_cases hok _ _ (fun x => 0 < x) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).2.1) (fun _ => one_pos)
  hnA z := by
    unfold gridFun
    split_ifs with h
    · exact_mod_cast (gridOK_cell' hok h (jidx_lt _ (gridOK_N hok) z)).2.2.1
    · norm_num
  hnB z := by
    unfold gridFun
    split_ifs with h
    · exact_mod_cast (gridOK_cell' hok h (jidx_lt _ (gridOK_N hok) z)).2.2.2.1
    · norm_num
  hg0 z := gridFun_cases hok _ _ (fun x => 0 ≤ x) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).2.2.2.2.1) (fun _ => le_rfl)
  hg z := by
    unfold gridFun
    split_ifs with h
    · have hc := gridOK_cell' hok h (jidx_lt _ (gridOK_N hok) z)
      set i := ridx gd.h z
      set j := jidx gd.N z
      have hA : (0 : ℝ) < gd.pa i j := by exact_mod_cast hc.1
      have hB : (0 : ℝ) < gd.pb i j := by exact_mod_cast hc.2.1
      have hg0 : (0 : ℝ) ≤ gd.gg i j := by exact_mod_cast hc.2.2.2.2.1
      have hz : ‖z‖ ≤ ((((i : ℚ) + 1) * gd.h : ℚ) : ℝ) := by
        have h1 := Nat.lt_floor_add_one (‖z‖ / gd.h)
        have hh := gridOK_h hok
        rw [div_lt_iff₀ hh] at h1
        push_cast
        exact h1.le
      have hL := norm_Lf_le_rlb ell beta hz
      have hrl : ((rlb ell beta ((i + 1) * gd.h) : ℚ) : ℝ) ≤ (gd.rl i : ℝ) := by
        exact_mod_cast hc.2.2.2.2.2.1
      have hm := majD_mono hA hB (norm_nonneg _) (hL.trans hrl)
      have h8 : (gd.gg i j : ℝ) * majDq (gd.pa i j) (gd.pb i j) (gd.rl i) ≤ 8 := by
        exact_mod_cast hc.2.2.2.2.2.2.1
      rw [majDq_cast] at h8
      calc (gd.gg i j : ℝ) * majD (gd.pa i j) (gd.pb i j) ‖Lf ell beta z‖
          ≤ (gd.gg i j : ℝ) * majD (gd.pa i j) (gd.pb i j) (gd.rl i) :=
            mul_le_mul_of_nonneg_left hm hg0
        _ ≤ 8 := h8
    · simp
  bA z := gridFun_cases hok _ _ (fun x => x ≤ gd.c) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).2.2.2.2.2.2.2.1)
    (fun _ => gridOK_c hok)
  bB z := gridFun_cases hok _ _ (fun x => x ≤ gd.c) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).2.2.2.2.2.2.2.2.1)
    (fun _ => gridOK_c hok)
  bnA z := gridFun_cases hok _ _ (fun x => x ≤ gd.c) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).2.2.2.2.2.2.2.2.2.1)
    (fun _ => gridOK_c hok)
  bnB z := gridFun_cases hok _ _ (fun x => x ≤ gd.c) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).2.2.2.2.2.2.2.2.2.2.1)
    (fun _ => gridOK_c hok)
  bg z := gridFun_cases hok _ _ (fun x => x ≤ gd.c) z
    (fun i j hi hj _ _ => by exact_mod_cast (gridOK_cell' hok hi hj).2.2.2.2.2.2.2.2.2.2.2)
    (fun _ => (zero_le_one.trans (gridOK_c hok)))

end ok


/-! ### The cell decomposition -/

/-- The four weights of a cell: `ν`, `ξ = (A+B)/2 − gδ²/16`, `τ = δν + gδ/4`, `γ = g`. -/
structure Wts where
  nu : ℝ
  xi : ℝ
  tau : ℝ
  gam : ℝ

/-- The entry formula of `Tz` applied to a linear functional `ct` of the polynomials. -/
def TzW (ell beta : ℚ) (w : Wts) (ct : CP → ℝ) (I J : ℕ) : ℝ :=
  if I = 0 then (if J = 0 then w.nu * ct (l2CP ell beta) + w.xi * ct oneCP
    else w.tau * ct (uCP ell beta (J - 1)))
  else if J = 0 then w.tau * ct (uCP ell beta (I - 1))
  else w.nu * ct (gCP (I - 1) (J - 1)) - w.gam * ct (uuCP ell beta (I - 1) (J - 1))

/-- The weights of the cell `(i, j)`. -/
def cellWts (gd : GridData) (i j : ℕ) : Wts :=
  ⟨((gd.na i j + gd.nb i j) / 2 : ℚ),
   ((gd.pa i j + gd.pb i j) / 2 - gd.gg i j * (gd.pa i j ^ 2 - gd.pb i j ^ 2) ^ 2 / 16 : ℚ),
   ((gd.na i j - gd.nb i j) / 2 + gd.gg i j * (gd.pa i j ^ 2 - gd.pb i j ^ 2) / 4 : ℚ),
   (gd.gg i j : ℚ)⟩

/-- The weights of the tail. -/
def tailWts : Wts := ⟨1, 1, 0, 0⟩

lemma eval_oneCP (z : ℂ) : oneCP.eval z = 1 := by simp [oneCP]

lemma TzW_mul (ell beta : ℚ) (w : Wts) (ct : CP → ℝ) (f : ℝ) (I J : ℕ) :
    f * TzW ell beta w ct I J = TzW ell beta w (fun P => f * ct P) I J := by
  unfold TzW; split_ifs <;> ring

lemma integral_TzW (ell beta : ℚ) (w : Wts) {f : ℂ → ℝ} (hf : Measurable f) (hf1 : ∀ z, |f z| ≤ 1)
    (I J : ℕ) :
    ∫ z, TzW ell beta w (fun P => f z * (P.eval z).re) I J ∂gaussC
      = TzW ell beta w (fun P => ∫ z, f z * (P.eval z).re ∂gaussC) I J := by
  have hi : ∀ P : CP, Integrable (fun z => f z * (P.eval z).re) gaussC := fun P => by
    simp_rw [re_eval_polar]; exact integrable_ind_mul_sum hf hf1 _
  unfold TzW
  split_ifs
  · rw [integral_add ((hi _).const_mul _) ((hi _).const_mul _), integral_const_mul,
      integral_const_mul]
  · rw [integral_const_mul]
  · rw [integral_const_mul]
  · rw [integral_sub ((hi _).const_mul _) ((hi _).const_mul _), integral_const_mul,
      integral_const_mul]

section dec

variable {gd : GridData} {ell beta : ℚ} (hok : gridOK gd ell beta = true)
include hok

/-- `Tz` in terms of the weights at `z`. -/
lemma Tz_eq_TzW (z : ℂ) (I J : ℕ) :
    Tz ell beta (gridPrices hok) z I J
      = TzW ell beta (if ridx gd.h z < gd.Nr then cellWts gd (ridx gd.h z) (jidx gd.N z) else tailWts)
          (fun P => (P.eval z).re) I J := by
  have e1 := normL_sq_eq ell beta z
  have e0 : (oneCP.eval z).re = 1 := by rw [eval_oneCP]; rfl
  unfold Tz TzW
  simp only [c0F, hF, HF, nuF, dnuF, delF, gridPrices, gridFun]
  split_ifs with h1 h2 h3 h4 h5 h6 <;>
    simp only [cellWts, tailWts, ← uF_eq, ← GF_eq, ← uu_eq, e0, ← e1] <;> push_cast <;> ring

lemma cellInd_mul_Tz {i j : ℕ} (hi : i < gd.Nr) (_hj : j < gd.N) (z : ℂ) (I J : ℕ) :
    cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j) (thN gd.N (j + 1)) z
        * Tz ell beta (gridPrices hok) z I J
      = TzW ell beta (cellWts gd i j) (fun P => cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j)
          (thN gd.N (j + 1)) z * (P.eval z).re) I J := by
  rw [← TzW_mul, cellInd_eq (gridOK_h hok) (gridOK_N hok), Tz_eq_TzW hok]
  split_ifs with hc h2
  · rw [hc.1, hc.2]
  · exact absurd (hc.1 ▸ hi) h2
  · simp
  · simp

lemma tailInd_mul_Tz (z : ℂ) (I J : ℕ) :
    tailInd (gd.Nr * gd.h) z * Tz ell beta (gridPrices hok) z I J
      = TzW ell beta tailWts (fun P => tailInd (gd.Nr * gd.h) z * (P.eval z).re) I J := by
  rw [← TzW_mul, tailInd_eq (gridOK_h hok), Tz_eq_TzW hok]
  split_ifs with hc h2
  · omega
  · rfl
  · simp
  · omega

/-- The cell functional of the cell `(i, j)`. -/
def cellT (gd : GridData) (i j : ℕ) (P : CP) : ℝ :=
  cellTerms (CP.polar P) (i * gd.h) ((i + 1) * gd.h) (thN gd.N j) (thN gd.N (j + 1))

/-- The tail functional. -/
def tailT (gd : GridData) (P : CP) : ℝ := tailTerms (CP.polar P) (gd.Nr * gd.h)

omit hok in
lemma thN_bounds {N j : ℕ} (hN : 0 < N) (hj : j < N) :
    -π ≤ thN N j ∧ thN N j ≤ thN N (j + 1) ∧ thN N (j + 1) ≤ π := by
  have hN' : (0 : ℝ) < N := by exact_mod_cast hN
  have hj' : (j : ℝ) + 1 ≤ N := by exact_mod_cast hj
  have hp := pi_pos
  unfold thN
  push_cast
  refine ⟨?_, ?_, ?_⟩
  · have : 0 ≤ 2 * π * j / N := by positivity
    linarith
  · have : 2 * π * j / N ≤ 2 * π * (j + 1) / N := by
      apply div_le_div_of_nonneg_right _ hN'.le; nlinarith
    linarith
  · have : 2 * π * (j + 1) / N ≤ 2 * π := by
      rw [div_le_iff₀ hN']; nlinarith
    linarith

/-- **The exact cell decomposition of the integrated majorant.** -/
theorem Tint_grid (I J : ℕ) :
    Tint ell beta (gridPrices hok) I J
      = ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, TzW ell beta (cellWts gd i j) (cellT gd i j) I J
        + TzW ell beta tailWts (tailT gd) I J := by
  have hh := gridOK_h hok
  have hN := gridOK_N hok
  have hpart : ∀ z, Tz ell beta (gridPrices hok) z I J
      = ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j)
          (thN gd.N (j + 1)) z * Tz ell beta (gridPrices hok) z I J
        + tailInd (gd.Nr * gd.h) z * Tz ell beta (gridPrices hok) z I J := by
    intro z
    have hp := partition hh hN gd.Nr z
    calc Tz ell beta (gridPrices hok) z I J
        = (∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j)
            (thN gd.N (j + 1)) z + tailInd (gd.Nr * gd.h) z) * Tz ell beta (gridPrices hok) z I J := by
          rw [hp, one_mul]
      _ = _ := by
          rw [add_mul, Finset.sum_mul]
          congr 1
          exact Finset.sum_congr rfl fun i _ => Finset.sum_mul _ _ _
  have hint : ∀ f : ℂ → ℝ, Measurable f → (∀ z, |f z| ≤ 1) →
      Integrable (fun z => f z * Tz ell beta (gridPrices hok) z I J) gaussC := fun f hf hf1 =>
    integrable_bdd_mul' hf 1 hf1 (integrable_Tz _ _ _ I J)
  have hc : ∀ i j : ℕ, Integrable (fun z => cellInd (i * gd.h) ((i + 1) * gd.h) (thN gd.N j)
      (thN gd.N (j + 1)) z * Tz ell beta (gridPrices hok) z I J) gaussC := fun i j =>
    hint _ (measurable_cellInd _ _ _ _) (abs_cellInd_le _ _ _ _)
  unfold Tint
  rw [integral_congr_ae (Filter.Eventually.of_forall hpart),
    integral_add (integrable_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ => hc i j)
      (hint _ (measurable_tailInd _) (abs_tailInd_le _)),
    integral_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ => hc i j]
  congr 1
  · refine Finset.sum_congr rfl fun i hi => ?_
    rw [integral_finsetSum _ fun j _ => hc i j]
    refine Finset.sum_congr rfl fun j hj => ?_
    simp_rw [cellInd_mul_Tz hok (mem_range.1 hi) (mem_range.1 hj)]
    rw [integral_TzW _ _ _ (measurable_cellInd _ _ _ _) (abs_cellInd_le _ _ _ _)]
    unfold cellT
    obtain ⟨h1, h2, h3⟩ := thN_bounds hN (mem_range.1 hj)
    congr 1; funext P
    exact integral_cell_poly P (by positivity) (by nlinarith) h1 h2 h3
  · simp_rw [tailInd_mul_Tz hok]
    rw [integral_TzW _ _ _ (measurable_tailInd _) (abs_tailInd_le _)]
    unfold tailT
    congr 1; funext P
    have hNr : (0 : ℝ) < gd.Nr := by exact_mod_cast gridOK_Nr hok
    exact integral_tail_poly P (by positivity)

end dec

end

end Grothe.LowerAnalytic
