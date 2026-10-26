import Grothe.UpperChaos.SchurKernel
import Grothe.UpperChaos.SchurTest
import Grothe.UpperChaos.LstarL

/-!
# The Schur bound on `ℝ⁴`: two copies of the single-copy kernel

The continued correlation acts on `X = (x, ξ) ∈ ℝ² × ℝ²` (real and imaginary parts). Its kernel is a product
of two single-copy kernels, `L(X, Y) = c · L₁(x, y) · L₁(ξ, η)`, so

* `M(Y, Y') = ∫ conj L(X, Y) L(X, Y') = ‖c‖² M₁(y, y') M₁(η, η')` (`integral_M4`), and
  `‖M(Y, Y')‖ = ‖c‖² P₁(y, y') P₁(η, η')` (`norm_M4`);
* the Schur test on `ℝ⁴` holds with the weight `w₁(y) w₁(η)` and the constant `λ₁²` (`schur4`).

Step 3 of the `hardy` plan (`data/upper-preprocess/inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md`).
-/

open MeasureTheory Complex
open scoped Real ComplexConjugate ENNReal

namespace Grothe.UpperChaos.SchurBound

open SchurKernel Sym2R

/-- Points of `ℝ⁴ = ℝ² × ℝ²`. -/
abbrev V := (ℝ × ℝ) × (ℝ × ℝ)

variable (B C : Sym2C)

/-- The four-dimensional kernel `c · L₁(x, y) · L₁(ξ, η)`. -/
noncomputable def L4 (c : ℂ) (X Y : V) : ℂ := c * (L1 B C X.1 Y.1 * L1 B C X.2 Y.2)

theorem integral_M4 (c : ℂ) (Y Y' : V) :
    ∫ X : V, conj (L4 B C c X Y) * L4 B C c X Y' =
      ((‖c‖ ^ 2 : ℝ) : ℂ) * ((∫ x : ℝ × ℝ, conj (L1 B C x Y.1) * L1 B C x Y'.1) *
        ∫ ξ : ℝ × ℝ, conj (L1 B C ξ Y.2) * L1 B C ξ Y'.2) := by
  have e : ∀ X : V, conj (L4 B C c X Y) * L4 B C c X Y' =
      ((‖c‖ ^ 2 : ℝ) : ℂ) * ((conj (L1 B C X.1 Y.1) * L1 B C X.1 Y'.1) *
        (conj (L1 B C X.2 Y.2) * L1 B C X.2 Y'.2)) := by
    intro X
    simp only [L4, map_mul]
    rw [show ((‖c‖ ^ 2 : ℝ) : ℂ) = conj c * c by
      rw [mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]]
    ring
  simp_rw [e]
  rw [integral_const_mul, Measure.volume_eq_prod,
    integral_prod_mul (fun x => conj (L1 B C x Y.1) * L1 B C x Y'.1)
      (fun ξ => conj (L1 B C ξ Y.2) * L1 B C ξ Y'.2)]

theorem norm_M4 (hZ : (Z B).PD) (c : ℂ) (Y Y' : V) :
    ‖∫ X : V, conj (L4 B C c X Y) * L4 B C c X Y'‖ = ‖c‖ ^ 2 * (P1 B C Y.1 Y'.1 * P1 B C Y.2 Y'.2) := by
  rw [integral_M4, norm_mul, norm_mul, norm_M1 B C hZ, norm_M1 B C hZ, Complex.norm_of_nonneg (by positivity)]
  rfl

/-! ### The Schur test on `ℝ⁴` -/

lemma P1_symm (y y' : ℝ × ℝ) : P1 B C y y' = P1 B C y' y := by
  simp only [P1]
  congr 2
  simp only [bil]; ring

lemma P1_nonneg (y y' : ℝ × ℝ) : 0 ≤ P1 B C y y' := by
  simp only [P1]; positivity

lemma continuous_P1 : Continuous fun p : (ℝ × ℝ) × (ℝ × ℝ) => P1 B C p.1 p.2 := by
  simp only [P1, q, bil]; fun_prop

lemma continuous_w1 : Continuous (w1 B C) := by
  unfold w1; simp only [q, bil]; fun_prop

lemma integrable_P1_w1 (hZ : (Z B).PD) (hT : (T B C).PD) (y : ℝ × ℝ) :
    Integrable fun y' : ℝ × ℝ => P1 B C y y' * w1 B C y' := by
  have hW : (W B C).PD := PD_two_add hT (E_PSD B C hZ)
  simp_rw [P1_w1_eq]
  exact (Gauss2.integrable_gR hW.1 hW.2 _ _).const_mul _

/-- The per-copy estimate as a lower integral. -/
lemma lintegral_P1_w1 (hZ : (Z B).PD) (hT : (T B C).PD) (y : ℝ × ℝ) :
    ∫⁻ y' : ℝ × ℝ, ENNReal.ofReal (P1 B C y y' * w1 B C y') ≤ ENNReal.ofReal (lam1 B C * w1 B C y) := by
  rw [← ofReal_integral_eq_lintegral_ofReal (integrable_P1_w1 B C hZ hT y)
    (Filter.Eventually.of_forall fun y' => mul_nonneg (P1_nonneg B C y y') (by unfold w1; positivity))]
  exact ENNReal.ofReal_le_ofReal (schur_copy B C hZ hT y)

/-- The product kernel and weight on `ℝ⁴`, as `ℝ≥0∞`-valued functions. -/
noncomputable def P4 (Y Y' : V) : ℝ≥0∞ := ENNReal.ofReal (P1 B C Y.1 Y'.1 * P1 B C Y.2 Y'.2)
noncomputable def w4 (Y : V) : ℝ≥0∞ := ENNReal.ofReal (w1 B C Y.1 * w1 B C Y.2)

lemma measurable_P4 : Measurable (Function.uncurry (P4 B C)) := by
  have hc : Continuous fun p : V × V => P1 B C p.1.1 p.2.1 * P1 B C p.1.2 p.2.2 := by
    simp only [P1, q, bil]; fun_prop
  have e : Function.uncurry (P4 B C) = fun p : V × V => ENNReal.ofReal (P1 B C p.1.1 p.2.1 * P1 B C p.1.2 p.2.2) :=
    funext fun p => rfl
  rw [e]
  exact hc.measurable.ennreal_ofReal

lemma measurable_w4 : Measurable (w4 B C) := by
  have hc : Continuous fun Y : V => w1 B C Y.1 * w1 B C Y.2 := by
    simp only [w1, q, bil]; fun_prop
  exact hc.measurable.ennreal_ofReal

lemma measurable_P1w1 (y : ℝ × ℝ) : Measurable fun y' : ℝ × ℝ => ENNReal.ofReal (P1 B C y y' * w1 B C y') := by
  have hc : Continuous fun y' : ℝ × ℝ => P1 B C y y' * w1 B C y' := by
    simp only [P1, w1, q, bil]; fun_prop
  exact hc.measurable.ennreal_ofReal

lemma schur4_row (hZ : (Z B).PD) (hT : (T B C).PD) (Y : V) :
    ∫⁻ Y' : V, P4 B C Y Y' * w4 B C Y' ≤ ENNReal.ofReal (lam1 B C ^ 2) * w4 B C Y := by
  have hw1 : ∀ y, 0 < w1 B C y := fun y => by unfold w1; positivity
  have e : ∀ Y' : V, P4 B C Y Y' * w4 B C Y' =
      ENNReal.ofReal (P1 B C Y.1 Y'.1 * w1 B C Y'.1) * ENNReal.ofReal (P1 B C Y.2 Y'.2 * w1 B C Y'.2) := by
    intro Y'
    simp only [P4, w4]
    rw [← ENNReal.ofReal_mul (mul_nonneg (P1_nonneg _ _ _ _) (P1_nonneg _ _ _ _)),
      ← ENNReal.ofReal_mul (mul_nonneg (P1_nonneg _ _ _ _) (hw1 _).le)]
    congr 1; ring
  simp_rw [e]
  rw [Measure.volume_eq_prod, lintegral_prod_mul (measurable_P1w1 B C Y.1).aemeasurable
    (measurable_P1w1 B C Y.2).aemeasurable]
  calc (∫⁻ y', ENNReal.ofReal (P1 B C Y.1 y' * w1 B C y')) * ∫⁻ η', ENNReal.ofReal (P1 B C Y.2 η' * w1 B C η')
      ≤ ENNReal.ofReal (lam1 B C * w1 B C Y.1) * ENNReal.ofReal (lam1 B C * w1 B C Y.2) := by
        gcongr <;> exact lintegral_P1_w1 B C hZ hT _
    _ = ENNReal.ofReal (lam1 B C ^ 2) * w4 B C Y := by
        have hl : 0 ≤ lam1 B C := by unfold lam1; positivity
        simp only [w4]
        rw [← ENNReal.ofReal_mul (mul_nonneg hl (hw1 _).le), ← ENNReal.ofReal_mul (sq_nonneg _)]
        congr 1; ring

/-- **The Schur test on `ℝ⁴`**: `∫∫ a(Y) a(Y') P(Y, Y') ≤ λ₁² ∫ a²`. -/
theorem schur4 (hZ : (Z B).PD) (hT : (T B C).PD) (a : V → ℝ≥0∞) (ham : Measurable a) :
    ∫⁻ Y : V, ∫⁻ Y' : V, a Y * a Y' * P4 B C Y Y' ≤
      ENNReal.ofReal (lam1 B C ^ 2) * ∫⁻ Y : V, a Y ^ 2 := by
  have hw1 : ∀ y, 0 < w1 B C y := fun y => by unfold w1; positivity
  have hsym : ∀ Y Y' : V, P4 B C Y Y' = P4 B C Y' Y := by
    intro Y Y'; simp only [P4, P1_symm B C Y.1, P1_symm B C Y.2]
  have hw0 : ∀ Y : V, w4 B C Y ≠ 0 := by
    intro Y; simp only [w4, ne_eq, ENNReal.ofReal_eq_zero, not_le]; exact mul_pos (hw1 _) (hw1 _)
  have hwt : ∀ Y : V, w4 B C Y ≠ ∞ := by intro Y; simp [w4]
  exact SchurTest.lintegral_le (P4 B C) (measurable_P4 B C) hsym (w4 B C) (measurable_w4 B C) hw0 hwt _
    (schur4_row B C hZ hT) a ham

end Grothe.UpperChaos.SchurBound
