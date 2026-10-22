import Grothe.LowerAnalytic.CapSym
import Grothe.LowerAnalytic.CapPolar

/-!
# Cell prices on a uniform polar grid and the cell decomposition of the integrated majorant

The grid: radial step `h`, `Nr` rings `[ih, (i+1)h)`, `Nθ` angular cells
`(θⱼ, θⱼ₊₁]`, `θⱼ = −π + 2πj/Nθ`, and the tail `|z| ≥ Nr h`.  Prices `pa i j`, `pb i j` on the
cells, the bound `rl i ≥ |L|` on the ring `i`; on the tail `A = B = 1` and `Rb = |L|`.

* `ridx`, `jidx`: the cell of `z`; `cellInd_eq`: the cell indicator is `[ridx z = i ∧ jidx z = j]`;
  `partition`: the cell indicators and the tail indicator sum to one;
* `integral_cell_poly`: `∫ 1_cell Re P dγ = Σ_t (cc Rad·AngC + cs Rad·AngS)` over the polar terms of
  `P`, with the normalised one-dimensional integrals `radI`, `angC`, `angS`;
* `integral_tail_poly`: the same on the tail (only the `n = 0` terms survive).
-/

open MeasureTheory Real Set Finset GrotheKernel
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### The normalised one-dimensional integrals -/

/-- `Rad(a, b, m) = ∫_a^b 2 r^{m+1} e^{−r²} dr`. -/
def radI (a b : ℝ) (m : ℕ) : ℝ := ∫ r in a..b, 2 * r ^ (m + 1) * exp (-r ^ 2)
/-- `∫_R^∞ 2 r^{m+1} e^{−r²} dr`. -/
def tailI (R : ℝ) (m : ℕ) : ℝ := ∫ r in Ioi R, 2 * r ^ (m + 1) * exp (-r ^ 2)
/-- `(1/2π) ∫_a^b cos(nθ) dθ`. -/
def angC (a b : ℝ) (n : ℤ) : ℝ := (1 / (2 * π)) * ∫ θ in a..b, cos (n * θ)
/-- `(1/2π) ∫_a^b sin(nθ) dθ`. -/
def angS (a b : ℝ) (n : ℤ) : ℝ := (1 / (2 * π)) * ∫ θ in a..b, sin (n * θ)

/-- The polar-term functional of a cell. -/
def cellTerms (ts : List CP.PT) (ra rb θa θb : ℝ) : ℝ :=
  (ts.map fun t => t.cc.val * radI ra rb t.m * angC θa θb t.n + t.cs.val * radI ra rb t.m * angS θa θb t.n).sum

/-- The polar-term functional of the tail. -/
def tailTerms (ts : List CP.PT) (R : ℝ) : ℝ :=
  (ts.map fun t => if t.n = 0 then t.cc.val * tailI R t.m else 0).sum

/-! ### Integrability of polar terms -/

lemma measurable_ptVal (t : CP.PT) : Measurable (ptVal t) := by
  unfold ptVal
  have := Complex.measurable_arg
  fun_prop

lemma abs_ptVal_le (t : CP.PT) (z : ℂ) :
    |ptVal t z| ≤ (|t.cc.val| + |t.cs.val|) * (1 + Complex.normSq z) ^ t.m := by
  unfold ptVal
  rw [abs_mul, abs_pow, abs_norm]
  have h1 : ‖z‖ ≤ 1 + Complex.normSq z := norm_le_one_add_normSq z
  have h2 : ‖z‖ ^ t.m ≤ (1 + Complex.normSq z) ^ t.m := pow_le_pow_left₀ (norm_nonneg _) h1 _
  have h3 : |t.cc.val * cos (t.n * Complex.arg z) + t.cs.val * sin (t.n * Complex.arg z)|
      ≤ |t.cc.val| + |t.cs.val| := by
    refine (abs_add_le _ _).trans (add_le_add ?_ ?_)
    · rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) (abs_cos_le_one _)
    · rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) (abs_sin_le_one _)
  calc ‖z‖ ^ t.m * |t.cc.val * cos (t.n * Complex.arg z) + t.cs.val * sin (t.n * Complex.arg z)|
      ≤ (1 + Complex.normSq z) ^ t.m * (|t.cc.val| + |t.cs.val|) :=
        mul_le_mul h2 h3 (abs_nonneg _) (pow_nonneg (by linarith [Complex.normSq_nonneg z]) _)
    _ = _ := by ring

lemma integrable_ind_mul_ptVal {f : ℂ → ℝ} (hf : Measurable f) (hf1 : ∀ z, |f z| ≤ 1)
    (t : CP.PT) : Integrable (fun z => f z * ptVal t z) gaussC := by
  refine (integrable_one_add_normSq_pow t.m |>.const_mul (|t.cc.val| + |t.cs.val|)).mono'
    (hf.mul (measurable_ptVal t)).aestronglyMeasurable (Filter.Eventually.of_forall fun z => ?_)
  rw [Real.norm_eq_abs, abs_mul]
  calc |f z| * |ptVal t z| ≤ 1 * ((|t.cc.val| + |t.cs.val|) * (1 + Complex.normSq z) ^ t.m) :=
        mul_le_mul (hf1 z) (abs_ptVal_le t z) (abs_nonneg _) zero_le_one
    _ = _ := one_mul _

lemma abs_cellInd_le (ra rb θa θb : ℝ) (z : ℂ) : |cellInd ra rb θa θb z| ≤ 1 := by
  unfold cellInd; split_ifs <;> simp

lemma abs_tailInd_le (R : ℝ) (z : ℂ) : |tailInd R z| ≤ 1 := by
  unfold tailInd; split_ifs <;> simp

lemma integrable_ind_mul_sum {f : ℂ → ℝ} (hf : Measurable f) (hf1 : ∀ z, |f z| ≤ 1)
    (ts : List CP.PT) : Integrable (fun z => f z * (ts.map fun t => ptVal t z).sum) gaussC := by
  induction ts with
  | nil => simp
  | cons t ts ih =>
    simp only [List.map_cons, List.sum_cons, mul_add]
    exact (integrable_ind_mul_ptVal hf hf1 t).add ih

/-- Linearity over the polar terms. -/
lemma integral_ind_mul_sum {f : ℂ → ℝ} (hf : Measurable f) (hf1 : ∀ z, |f z| ≤ 1)
    (ts : List CP.PT) :
    ∫ z, f z * (ts.map fun t => ptVal t z).sum ∂gaussC
      = (ts.map fun t => ∫ z, f z * ptVal t z ∂gaussC).sum := by
  induction ts with
  | nil => simp
  | cons t ts ih =>
    simp only [List.map_cons, List.sum_cons, mul_add]
    rw [integral_add (integrable_ind_mul_ptVal hf hf1 t) (integrable_ind_mul_sum hf hf1 ts), ih]

lemma radI_eq (a b : ℝ) (m : ℕ) : radI a b m = 2 * ∫ r in a..b, r ^ (m + 1) * exp (-r ^ 2) := by
  simp only [radI, mul_assoc]; rw [intervalIntegral.integral_const_mul]

lemma tailI_eq (R : ℝ) (m : ℕ) : tailI R m = 2 * ∫ r in Ioi R, r ^ (m + 1) * exp (-r ^ 2) := by
  simp only [tailI, mul_assoc]; rw [integral_const_mul]

/-- **The cell integral of a polynomial.** -/
theorem integral_cell_poly (P : CP) {ra rb θa θb : ℝ} (hra : 0 ≤ ra) (hab : ra ≤ rb)
    (hθa : -π ≤ θa) (hθ : θa ≤ θb) (hθb : θb ≤ π) :
    ∫ z, cellInd ra rb θa θb z * (P.eval z).re ∂gaussC = cellTerms (CP.polar P) ra rb θa θb := by
  simp_rw [re_eval_polar]
  rw [integral_ind_mul_sum (measurable_cellInd _ _ _ _) (abs_cellInd_le _ _ _ _), cellTerms]
  congr 1
  refine List.map_congr_left fun t _ => ?_
  have hc := integral_cell (fun θ => cos (t.n * θ)) (by fun_prop) t.m hra hab hθa hθ hθb
  have hs := integral_cell (fun θ => sin (t.n * θ)) (by fun_prop) t.m hra hab hθa hθ hθb
  have e : ∀ z, cellInd ra rb θa θb z * ptVal t z
      = t.cc.val * (cellInd ra rb θa θb z * (‖z‖ ^ t.m * cos (t.n * Complex.arg z)))
        + t.cs.val * (cellInd ra rb θa θb z * (‖z‖ ^ t.m * sin (t.n * Complex.arg z))) := by
    intro z; unfold ptVal; ring
  have i1 : Integrable (fun z => cellInd ra rb θa θb z * (‖z‖ ^ t.m * cos (t.n * Complex.arg z)))
      gaussC := by
    have := integrable_ind_mul_ptVal (measurable_cellInd ra rb θa θb) (abs_cellInd_le _ _ _ _)
      ⟨t.m, t.n, KQ.ofRat 1, KQ.zero⟩
    simpa [ptVal] using this
  have i2 : Integrable (fun z => cellInd ra rb θa θb z * (‖z‖ ^ t.m * sin (t.n * Complex.arg z)))
      gaussC := by
    have := integrable_ind_mul_ptVal (measurable_cellInd ra rb θa θb) (abs_cellInd_le _ _ _ _)
      ⟨t.m, t.n, KQ.zero, KQ.ofRat 1⟩
    simpa [ptVal] using this
  simp_rw [e]
  rw [integral_add (i1.const_mul _) (i2.const_mul _), integral_const_mul, integral_const_mul, hc, hs]
  simp only [radI_eq, angC, angS]
  have hp : π ≠ 0 := pi_ne_zero
  field_simp

lemma integral_cos_int_mul (n : ℤ) :
    ∫ θ in (-π)..π, cos (n * θ) = if n = 0 then 2 * π else 0 := by
  split_ifs with hn
  · subst hn; simp; ring
  · have hn' : (n : ℝ) ≠ 0 := by exact_mod_cast hn
    rw [intervalIntegral.integral_comp_mul_left (fun x => cos x) hn', integral_cos]
    simp only [smul_eq_mul]
    rw [show (n : ℝ) * π = (n : ℝ) * π from rfl, show (n : ℝ) * -π = -((n : ℝ) * π) by ring,
      sin_neg, sin_int_mul_pi]
    simp

lemma integral_sin_int_mul (n : ℤ) : ∫ θ in (-π)..π, sin (n * θ) = 0 := by
  rcases eq_or_ne n 0 with rfl | hn
  · simp
  · have hn' : (n : ℝ) ≠ 0 := by exact_mod_cast hn
    rw [intervalIntegral.integral_comp_mul_left (fun x => sin x) hn', integral_sin]
    rw [show (n : ℝ) * -π = -((n : ℝ) * π) by ring, cos_neg]
    simp

/-- **The tail integral of a polynomial.** -/
theorem integral_tail_poly (P : CP) {R : ℝ} (hR : 0 < R) :
    ∫ z, tailInd R z * (P.eval z).re ∂gaussC = tailTerms (CP.polar P) R := by
  simp_rw [re_eval_polar]
  rw [integral_ind_mul_sum (measurable_tailInd _) (abs_tailInd_le _), tailTerms]
  congr 1
  refine List.map_congr_left fun t _ => ?_
  have hc := integral_tail (fun θ => cos (t.n * θ)) (by fun_prop) t.m hR
  have hs := integral_tail (fun θ => sin (t.n * θ)) (by fun_prop) t.m hR
  have e : ∀ z, tailInd R z * ptVal t z
      = t.cc.val * (tailInd R z * (‖z‖ ^ t.m * cos (t.n * Complex.arg z)))
        + t.cs.val * (tailInd R z * (‖z‖ ^ t.m * sin (t.n * Complex.arg z))) := by
    intro z; unfold ptVal; ring
  have i1 : Integrable (fun z => tailInd R z * (‖z‖ ^ t.m * cos (t.n * Complex.arg z))) gaussC := by
    have := integrable_ind_mul_ptVal (measurable_tailInd R) (abs_tailInd_le _)
      ⟨t.m, t.n, KQ.ofRat 1, KQ.zero⟩
    simpa [ptVal] using this
  have i2 : Integrable (fun z => tailInd R z * (‖z‖ ^ t.m * sin (t.n * Complex.arg z))) gaussC := by
    have := integrable_ind_mul_ptVal (measurable_tailInd R) (abs_tailInd_le _)
      ⟨t.m, t.n, KQ.zero, KQ.ofRat 1⟩
    simpa [ptVal] using this
  simp_rw [e]
  rw [integral_add (i1.const_mul _) (i2.const_mul _), integral_const_mul, integral_const_mul, hc, hs,
    integral_cos_int_mul, integral_sin_int_mul]
  simp only [tailI_eq]
  have hp : π ≠ 0 := pi_ne_zero
  split_ifs
  · field_simp; ring
  · simp

end

end Grothe.LowerAnalytic
