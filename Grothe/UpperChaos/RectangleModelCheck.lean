import Grothe.UpperChaos.RectangleCoefficientArithmetic

/-!
# Finite checks for rounded rectangle models

The generator chooses polynomial coefficients and remainder endpoints. These
checks recompute the exact residual and verify outward containment; no rounding
rule in the generator is trusted. All statements concern the whole square.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.RectangleModelCheck

open LeanCert.Core RectangleCoefficientArithmetic PointwiseGeometricEnclosure

structure Model where
  coefficients : Coefficients
  remainder : IntervalRat

def Contains (m : Model) (x y f : ℝ) : Prop :=
  f - eval2 m.coefficients x y ∈ m.remainder

def intervalSubset (I J : IntervalRat) : Bool :=
  decide (J.lo ≤ I.lo ∧ I.hi ≤ J.hi)

theorem mem_of_intervalSubset {I J : IntervalRat}
    (h : intervalSubset I J = true) {z : ℝ} (hz : z ∈ I) : z ∈ J := by
  have hq : J.lo ≤ I.lo ∧ I.hi ≤ J.hi := by
    simpa only [intervalSubset, decide_eq_true_eq] using h
  have hlo : (J.lo : ℝ) ≤ I.lo := by exact_mod_cast hq.1
  have hhi : (I.hi : ℝ) ≤ J.hi := by exact_mod_cast hq.2
  exact ⟨hlo.trans hz.1, hz.2.trans hhi⟩

def range (m : Model) : IntervalRat :=
  IntervalRat.add (polynomialRange m.coefficients) m.remainder

theorem mem_range {m : Model} {x y f : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (h : Contains m x y f) : f ∈ range m := by
  have hs := IntervalRat.mem_add (eval2_mem_polynomialRange m.coefficients hx hy) h
  simpa only [range, add_sub_cancel] using hs

/-- Check a rounded polynomial/remainder against an already valid model. -/
def roundOK (p : Coefficients) (R : IntervalRat) (out : Model) (budget : ℚ) : Bool :=
  residualOK p out.coefficients |budget| &&
    intervalSubset (IntervalRat.add R (errorInterval |budget| (abs_nonneg _))) out.remainder

theorem round_sound (p : Coefficients) (R : IntervalRat) (out : Model) (budget : ℚ)
    (hc : roundOK p R out budget = true) {x y f : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (h : f - eval2 p x y ∈ R) :
    Contains out x y f := by
  simp only [roundOK, Bool.and_eq_true] at hc
  have he : eval2 p x y - eval2 out.coefficients x y ∈
      errorInterval |budget| (abs_nonneg _) := by
    have hr := abs_residual_le_of_check p out.coefficients |budget| hc.1 hx hy
    simpa only [errorInterval, IntervalRat.mem_def, Rat.cast_neg] using abs_le.mp hr
  have hs := IntervalRat.mem_add h he
  have hid : f - eval2 out.coefficients x y =
      (f - eval2 p x y) + (eval2 p x y - eval2 out.coefficients x y) := by ring
  unfold Contains
  rw [hid]
  exact mem_of_intervalSubset hc.2 hs

def addOK (a b out : Model) (budget : ℚ) : Bool :=
  roundOK (add2 a.coefficients b.coefficients)
    (IntervalRat.add a.remainder b.remainder) out budget

theorem add_sound (a b out : Model) (budget : ℚ)
    (hc : addOK a b out budget = true) {x y f g : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hf : Contains a x y f) (hg : Contains b x y g) :
    Contains out x y (f + g) := by
  apply round_sound _ _ out budget hc hx hy
  rw [eval2_add]
  have h := IntervalRat.mem_add hf hg
  have hid : f + g - (eval2 a.coefficients x y + eval2 b.coefficients x y) =
      (f - eval2 a.coefficients x y) + (g - eval2 b.coefficients x y) := by ring
  rw [hid]
  exact h

def scaleOK (c : ℚ) (a out : Model) (budget : ℚ) : Bool :=
  roundOK (scale2 c a.coefficients)
    (IntervalRat.mul (IntervalRat.singleton c) a.remainder) out budget

theorem scale_sound (c : ℚ) (a out : Model) (budget : ℚ)
    (hc : scaleOK c a out budget = true) {x y f : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hf : Contains a x y f) :
    Contains out x y ((c : ℝ) * f) := by
  apply round_sound _ _ out budget hc hx hy
  rw [eval2_scale, ← mul_sub]
  exact IntervalRat.mem_mul (IntervalRat.mem_singleton c) hf

def mulOK (a b out : Model) (budget : ℚ) : Bool :=
  residualOK (mul2 a.coefficients b.coefficients) out.coefficients |budget| &&
    intervalSubset
      (productRemainder a.coefficients b.coefficients a.remainder b.remainder
        |budget| (abs_nonneg _)) out.remainder

theorem mul_sound (a b out : Model) (budget : ℚ)
    (hc : mulOK a b out budget = true) {x y f g : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hf : Contains a x y f) (hg : Contains b x y g) :
    Contains out x y (f * g) := by
  simp only [mulOK, Bool.and_eq_true] at hc
  exact mem_of_intervalSubset hc.2
    (product_model_sound a.coefficients b.coefficients out.coefficients
      a.remainder b.remainder |budget| (abs_nonneg _) hc.1 hx hy hf hg)

def constant (c : ℚ) : Model := ⟨[[c]], IntervalRat.singleton 0⟩

theorem contains_constant (c : ℚ) (x y : ℝ) : Contains (constant c) x y c := by
  simp [Contains, constant, eval2, eval1, IntervalRat.mem_def, IntervalRat.singleton]

/-- A constant-valued leaf can have an actual irrational value, provided its
input interval has already been proved. -/
def intervalInputOK (I : IntervalRat) (c : ℚ) (out : Model) (budget : ℚ) : Bool :=
  roundOK [[c]] (IntervalRat.sub I (IntervalRat.singleton c)) out budget

theorem intervalInput_sound (I : IntervalRat) (c : ℚ) (out : Model) (budget : ℚ)
    (hc : intervalInputOK I c out budget = true) {x y f : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hf : f ∈ I) : Contains out x y f := by
  apply round_sound _ _ out budget hc hx hy
  have h := IntervalRat.mem_sub hf (IntervalRat.mem_singleton c)
  simpa [eval2, eval1] using h

end Grothe.UpperChaos.RectangleModelCheck
