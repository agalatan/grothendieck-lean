import Grothe.UpperChaos.PhiHorner
import Grothe.UpperChaos.RectangleListPolynomialIntegral
import Grothe.UpperChaos.PointwiseGeometricEnclosure
import LeanCert.Core.IntervalRat.Basic

/-!
# Executable coefficient residuals for rectangle models

The representation is outer-x, inner-y ragged rational coefficient lists.
All arithmetic is exact. A rounded or truncated output is accepted only after
the coefficient L1 norm of its exact residual is checked. Thus discarded and
rounded terms contribute to a proved error on the entire normalized square.

Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.RectangleCoefficientArithmetic

open GrotheKernel LeanCert.Core

abbrev Coefficients := List (List ℚ)

def add1 (p q : List ℚ) : List ℚ := zipAddG (· + ·) p q
def scale1 (c : ℚ) (p : List ℚ) : List ℚ := p.map (c * ·)

def mul1 : List ℚ → List ℚ → List ℚ
  | [], _ => []
  | a :: p, q => add1 (scale1 a q) (0 :: mul1 p q)

def add2 (p q : Coefficients) : Coefficients := zipAddG add1 p q
def scale2 (c : ℚ) (p : Coefficients) : Coefficients := p.map (scale1 c)

def mul2 : Coefficients → Coefficients → Coefficients
  | [], _ => []
  | a :: p, q => add2 (q.map (mul1 a)) ([] :: mul2 p q)

def sub2 (p q : Coefficients) : Coefficients := add2 p (scale2 (-1) q)

noncomputable def eval1 (p : List ℚ) (y : ℝ) : ℝ :=
  evalG (fun c : ℚ => (c : ℝ)) p y

noncomputable def eval2 (p : Coefficients) (x y : ℝ) : ℝ :=
  evalG (fun row => eval1 row y) p x

private theorem range_map_getD {α : Type} (p : List α) (d : α) :
    (List.range p.length).map (fun i => p.getD i d) = p := by
  apply List.ext_getElem
  · simp
  · intro i hi hp
    simp [List.getD, hp]

private theorem evalG_getD_sum {α : Type} (ev : α → ℝ) (p : List α) (d : α) (x : ℝ) :
    evalG ev p x = ∑ i ∈ Finset.range p.length, ev (p.getD i d) * x ^ i := by
  have h := evalG_range_map ev (fun i => p.getD i d) p.length x
  rw [range_map_getD] at h
  exact h

/-- The executable Horner arithmetic uses exactly the coefficient ordering of
the shared rectangle integral theorem. -/
theorem eval2_eq_squareListEval (p : Coefficients) (x y : ℝ) :
    eval2 p x y = RectangleListPolynomialIntegral.squareListEval p x y := by
  rw [eval2, evalG_getD_sum _ p [] x]
  unfold RectangleListPolynomialIntegral.squareListEval
  apply Finset.sum_congr rfl
  intro i hi
  rw [eval1, evalG_getD_sum _ _ 0 y, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro j hj
  ring

theorem eval1_add (p q : List ℚ) (y : ℝ) :
    eval1 (add1 p q) y = eval1 p y + eval1 q y := by
  exact evalG_zipAddG _ _ (fun a b => by simp) p q y

theorem eval1_scale (c : ℚ) (p : List ℚ) (y : ℝ) :
    eval1 (scale1 c p) y = (c : ℝ) * eval1 p y := by
  induction p with
  | nil => simp [eval1, scale1]
  | cons a p ih =>
    simp only [scale1, List.map_cons, eval1, evalG_cons] at ih ⊢
    rw [ih]
    push_cast
    ring

theorem eval1_mul (p q : List ℚ) (y : ℝ) :
    eval1 (mul1 p q) y = eval1 p y * eval1 q y := by
  induction p with
  | nil => simp [mul1, eval1]
  | cons a p ih =>
    rw [mul1, eval1_add, eval1_scale]
    simp only [eval1, evalG_cons, Rat.cast_zero] at ih ⊢
    rw [ih]
    ring

theorem eval2_add (p q : Coefficients) (x y : ℝ) :
    eval2 (add2 p q) x y = eval2 p x y + eval2 q x y := by
  exact evalG_zipAddG _ _ (fun a b => eval1_add a b y) p q x

theorem eval2_scale (c : ℚ) (p : Coefficients) (x y : ℝ) :
    eval2 (scale2 c p) x y = (c : ℝ) * eval2 p x y := by
  induction p with
  | nil => simp [eval2, scale2]
  | cons a p ih =>
    simp only [scale2, List.map_cons, eval2, evalG_cons] at ih ⊢
    rw [ih, eval1_scale]
    ring

theorem eval2_mul (p q : Coefficients) (x y : ℝ) :
    eval2 (mul2 p q) x y = eval2 p x y * eval2 q x y := by
  induction p with
  | nil => simp [mul2, eval2]
  | cons a p ih =>
    rw [mul2, eval2_add]
    have hmap : eval2 (q.map (mul1 a)) x y = eval1 a y * eval2 q x y := by
      clear ih
      induction q with
      | nil => simp [eval2]
      | cons b q iq =>
        simp only [List.map_cons, eval2, evalG_cons] at iq ⊢
        rw [eval1_mul, iq]
        ring
    rw [hmap]
    simp only [eval2, evalG_cons, eval1, evalG_nil] at ih ⊢
    rw [ih]
    ring

theorem eval2_sub (p q : Coefficients) (x y : ℝ) :
    eval2 (sub2 p q) x y = eval2 p x y - eval2 q x y := by
  rw [sub2, eval2_add, eval2_scale]
  simp only [Rat.cast_neg, Rat.cast_one, neg_one_mul, sub_eq_add_neg]

def rowNorm (p : List ℚ) : ℚ := (p.map abs).sum
def coefficientNorm (p : Coefficients) : ℚ := (p.map rowNorm).sum

theorem rowNorm_nonneg (p : List ℚ) : 0 ≤ rowNorm p := by
  induction p with
  | nil => simp [rowNorm]
  | cons a p ih => simpa [rowNorm] using add_nonneg (abs_nonneg a) ih

theorem coefficientNorm_nonneg (p : Coefficients) : 0 ≤ coefficientNorm p := by
  induction p with
  | nil => simp [coefficientNorm]
  | cons a p ih => simpa [coefficientNorm] using add_nonneg (rowNorm_nonneg a) ih

private theorem evalG_abs_one (p : List ℚ) :
    evalG (fun c : ℚ => |(c : ℝ)|) p 1 = (rowNorm p : ℝ) := by
  induction p with
  | nil => simp [rowNorm]
  | cons a p ih => simp [rowNorm, ih]

theorem abs_eval1_le (p : List ℚ) {y : ℝ} (hy : |y| ≤ 1) :
    |eval1 p y| ≤ (rowNorm p : ℝ) := by
  rw [← evalG_abs_one]
  exact abs_evalG_le _ _ (fun _ => le_rfl) (fun _ => abs_nonneg _) p hy

private theorem evalG_rowNorm_one (p : Coefficients) :
    evalG (fun row => (rowNorm row : ℝ)) p 1 = (coefficientNorm p : ℝ) := by
  induction p with
  | nil => simp [coefficientNorm]
  | cons a p ih => simp [coefficientNorm, ih]

theorem abs_eval2_le (p : Coefficients) {x y : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    |eval2 p x y| ≤ (coefficientNorm p : ℝ) := by
  rw [← evalG_rowNorm_one]
  apply abs_evalG_le _ _ (fun row => abs_eval1_le row hy) _ p hx
  intro row
  exact_mod_cast rowNorm_nonneg row

/-- The constant term is removed before forming the range radius. -/
def constantTerm (p : Coefficients) : ℚ := (p.headD []).headD 0

def centeredResidual (p : Coefficients) : Coefficients := sub2 p [[constantTerm p]]

def polynomialRange (p : Coefficients) : IntervalRat :=
  let c := constantTerm p
  let r := coefficientNorm (centeredResidual p)
  ⟨c - r, c + r, by linarith [coefficientNorm_nonneg (centeredResidual p)]⟩

theorem eval2_mem_polynomialRange (p : Coefficients) {x y : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) : eval2 p x y ∈ polynomialRange p := by
  have h := abs_eval2_le (centeredResidual p) hx hy
  rw [centeredResidual, eval2_sub] at h
  have hc : eval2 [[constantTerm p]] x y = (constantTerm p : ℝ) := by
    simp [eval2, eval1]
  rw [hc] at h
  change (((constantTerm p - coefficientNorm (centeredResidual p) : ℚ) : ℝ) ≤
      eval2 p x y) ∧ eval2 p x y ≤
      ((constantTerm p + coefficientNorm (centeredResidual p) : ℚ) : ℝ)
  push_cast
  have habs := abs_le.mp h
  dsimp only [centeredResidual]
  constructor <;> linarith

/-- Exact residual check, allowing any rounded and truncated candidate. -/
def residualOK (p candidate : Coefficients) (budget : ℚ) : Bool :=
  decide (coefficientNorm (sub2 p candidate) ≤ budget)

theorem abs_residual_le_of_check (p candidate : Coefficients) (budget : ℚ)
    (h : residualOK p candidate budget = true) {x y : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    |eval2 p x y - eval2 candidate x y| ≤ (budget : ℝ) := by
  have hc : coefficientNorm (sub2 p candidate) ≤ budget := by
    simpa only [residualOK, decide_eq_true_eq] using h
  have he := abs_eval2_le (sub2 p candidate) hx hy
  rw [eval2_sub] at he
  exact he.trans (by exact_mod_cast hc)

/-- A successful coefficient check bounds multiplication rounding and
truncation uniformly on the entire normalized square. -/
theorem abs_product_residual_le_of_check (p q candidate : Coefficients) (budget : ℚ)
    (h : residualOK (mul2 p q) candidate budget = true) {x y : ℝ}
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    |eval2 p x y * eval2 q x y - eval2 candidate x y| ≤ (budget : ℝ) := by
  simpa only [eval2_mul] using abs_residual_le_of_check (mul2 p q) candidate budget h hx hy

/-- Polynomial rounding/truncation plus all three interval FOIL terms. -/
def productRemainder (p q : Coefficients) (rp rq : IntervalRat)
    (budget : ℚ) (hbudget : 0 ≤ budget) : IntervalRat :=
  IntervalRat.add (PointwiseGeometricEnclosure.errorInterval budget hbudget)
    (IntervalRat.add (IntervalRat.mul rp (polynomialRange q))
      (IntervalRat.add (IntervalRat.mul rq (polynomialRange p)) (IntervalRat.mul rp rq)))

/-- A finite residual check and two valid input models imply a valid product
model, including all input, rounding, and truncation errors. -/
theorem product_model_sound (p q candidate : Coefficients) (rp rq : IntervalRat)
    (budget : ℚ) (hbudget : 0 ≤ budget)
    (hcheck : residualOK (mul2 p q) candidate budget = true)
    {x y f g : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hf : f - eval2 p x y ∈ rp) (hg : g - eval2 q x y ∈ rq) :
    f * g - eval2 candidate x y ∈ productRemainder p q rp rq budget hbudget := by
  have he : eval2 p x y * eval2 q x y - eval2 candidate x y ∈
      PointwiseGeometricEnclosure.errorInterval budget hbudget := by
    have h := abs_product_residual_le_of_check p q candidate budget hcheck hx hy
    simpa only [PointwiseGeometricEnclosure.errorInterval, IntervalRat.mem_def,
      Rat.cast_neg] using abs_le.mp h
  have hsum := IntervalRat.mem_add he
    (IntervalRat.mem_add (IntervalRat.mem_mul hf (eval2_mem_polynomialRange q hx hy))
      (IntervalRat.mem_add (IntervalRat.mem_mul hg (eval2_mem_polynomialRange p hx hy))
        (IntervalRat.mem_mul hf hg)))
  have hid : f * g - eval2 candidate x y =
      (eval2 p x y * eval2 q x y - eval2 candidate x y) +
        ((f - eval2 p x y) * eval2 q x y +
          ((g - eval2 q x y) * eval2 p x y +
            (f - eval2 p x y) * (g - eval2 q x y))) := by ring
  rw [hid]
  exact hsum

end Grothe.UpperChaos.RectangleCoefficientArithmetic
