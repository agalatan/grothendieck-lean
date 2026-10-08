import Mathlib

/-!
# Final rational arithmetic

This file contains the exact rational arithmetic of the certificate: the source's original
assembly (Section 6.5 of arXiv:2609.25462v1 / `audit_best7_final_arithmetic.py`), the
note's unchanged-weight bound `K < 1.404898427462`, and the reweighted bound
`K < 1.404898426735`.  All inputs that come from interval arithmetic (Arb) are explicit
rational numbers here; the theorems are pure `norm_num` facts about them.
-/

namespace Grothe

noncomputable section

/-- Source weights `w₁,…,w₆` (source (5.8)); the third row and its weight are both negated
in the source code relative to the paper, which is an exact equivalence by oddness. -/
def wOld : Fin 6 → ℝ :=
  ![0.983543086263686583, 0.0124174018143118538, 0.0030311909556774751,
    0.000593632758261406976, 0.0000169358532612748746, 0.000397752354801503847]

/-- The note's adjusted weights. -/
def wNew : Fin 6 → ℝ :=
  ![0.983543458398378100, 0.012416654023174663, 0.003031585753026536,
    0.000593628184609741, 0.000016934659448514, 0.000397738981362458]

/-- Cauchy radii for the first four scalar kernels (source Section 6.4). -/
def R : Fin 4 → ℝ := ![1.2, 1.11, 1.11, 1.11]

/-- The source's Cauchy-estimate tail `10 R⁻²⁴¹ / (1 - R⁻²)` (source (6.25)). -/
def cauchyTail (r : ℝ) : ℝ := 10 / r ^ 241 / (1 - 1 / r ^ 2)

/-- Certified contribution of the retained fifth-kernel blocks to modes `≥ 120`, including
the old weight `wOld 4` (source (6.19), checked upstream through mode 5000). -/
def finite5 : ℝ := 2.699176355797438e-12

/-- The note's rational bound for the unweighted sixth tail (equation (7)). -/
def sixthT : ℝ := 258088051054978 / 10 ^ 18

/-- The note's reserve for the omitted fifth blocks (equation (3)). -/
def fifthReserve : ℝ := 1 / 273360

/-- The source's reserve for the omitted fifth blocks, `1/(4·67)`. -/
def fifthReserveOld : ℝ := 1 / 268

/-- The source's reserve for the unweighted sixth tail, `523/2000000 = 2.615·10⁻⁴`. -/
def sixthTOld : ℝ := 523 / 2000000

/-- Per-kernel tail bounds used by the note (indices `0..3`: Cauchy; `4`: fifth; `5`: sixth). -/
def tBound : Fin 6 → ℝ :=
  ![cauchyTail (R 0), cauchyTail (R 1), cauchyTail (R 2), cauchyTail (R 3),
    finite5 / wOld 4 + fifthReserve, sixthT]

/-- Per-kernel tail bounds used by the source. -/
def tBoundOld : Fin 6 → ℝ :=
  ![cauchyTail (R 0), cauchyTail (R 1), cauchyTail (R 2), cauchyTail (R 3),
    finite5 / wOld 4 + fifthReserveOld, sixthTOld]

/-! ### Masses -/

theorem mass_old : ∑ i, wOld i = 1.0000000000000000975976 := by
  simp [wOld, Fin.sum_univ_succ]; norm_num

theorem mass_new : ∑ i, wNew i = 1.000000000000000012 := by
  simp [wNew, Fin.sum_univ_succ]; norm_num

theorem wNew_pos (i : Fin 6) : 0 < wNew i := by
  fin_cases i <;> simp [wNew] <;> norm_num

theorem wOld_pos (i : Fin 6) : 0 < wOld i := by
  fin_cases i <;> simp [wOld] <;> norm_num

/-! ### Tails with the source's weights -/

/-- Weighted Cauchy tails of the first four kernels with the old weights (source (6.26)). -/
theorem low_tail_old :
    ∑ i : Fin 4, wOld (Fin.castLE (by norm_num) i) * cauchyTail (R i) < 1.0172e-11 := by
  simp [wOld, R, cauchyTail, Fin.sum_univ_succ]
  norm_num

/-- The source's assembled tail bound and final constant (source (6.28)–(6.36)):
with reserve `1/268` for the fifth blocks and `2.615·10⁻⁴` for the sixth tail. -/
theorem source_final :
    let tail := 1.0172e-11 + finite5 + wOld 4 * fifthReserveOld + wOld 5 * sixthTOld
    1.0000000000000000975976 / (0.71179640805640433452 - 1.074829404498064e-6 - tail)
      < 1.404898554745441 := by
  intro tail
  simp only [tail, wOld, finite5, fifthReserveOld, sixthTOld]
  simp
  norm_num

/-- **The note's unchanged-weight consequence**: replacing only the two reserves gives
`K < 1.404898427462`. -/
theorem unchanged_weights_final :
    let tail := 1.0172e-11 + finite5 + wOld 4 * fifthReserve + wOld 5 * sixthT
    1.0000000000000000975976 / (0.71179640805640433452 - 1.074829404498064e-6 - tail)
      < 1.404898427462 := by
  intro tail
  simp only [tail, wOld, finite5, fifthReserve, sixthT]
  simp
  norm_num

/-! ### Tails with the new weights -/

/-- Total omitted-coefficient bound with the new weights (note: `< 1.027264992·10⁻⁷`). -/
theorem tails_new :
    ∑ i : Fin 4, wNew (Fin.castLE (by norm_num) i) * cauchyTail (R i)
      + wNew 4 * (finite5 / wOld 4 + fifthReserve) + wNew 5 * sixthT < 1.027264992e-7 := by
  simp [wNew, wOld, R, cauchyTail, finite5, fifthReserve, sixthT, Fin.sum_univ_succ]
  norm_num

/-- Weighted total of the per-kernel tail bounds, new weights. -/
theorem tails_new' : ∑ i, wNew i * tBound i < 1.027264992e-7 := by
  simp [wNew, wOld, R, cauchyTail, finite5, fifthReserve, sixthT, tBound, Fin.sum_univ_succ]
  norm_num

/-- Weighted total of the per-kernel tail bounds, old weights and old reserves
(source: `fixed tail < 1.0402241257703973e-07` plus the fifth tail). -/
theorem tails_old' : ∑ i, wOld i * tBoundOld i < 1.67218594072e-7 := by
  simp [wOld, R, cauchyTail, finite5, fifthReserveOld, sixthTOld, tBoundOld, Fin.sum_univ_succ]
  norm_num

/-- The source's final constant from its own inputs. -/
theorem source_final' :
    (1.0000000000000000975976 : ℝ) / (0.71179640805640433452 - 1.074829404498064e-6 - 1.67218594072e-7)
      < 1.404898554745441 := by norm_num

/-- Positivity of the repaired linear coefficient. -/
theorem denominator_pos_new :
    0 < (0.7117964083067696 : ℝ) - 1.0747148914e-6 - 1.027264992e-7 := by norm_num

/-- **The note's final bound**: `M / (q₀ - S) < 1.404898426735`. -/
theorem refined_final :
    (1.000000000000000012 : ℝ) / (0.7117964083067696 - 1.0747148914e-6 - 1.027264992e-7)
      < 1.404898426735 := by norm_num

end

end Grothe
