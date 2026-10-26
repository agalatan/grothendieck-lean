import GrotheCapsKernel.CapPoly
import Grothe.LowerAnalytic.CapPiece

/-!
# Soundness of the symbolic polynomials (`GrotheCapsKernel/CapPoly.lean`)

`KQ.val x = p + q√2`, `KC.val`, `CP.eval P z = Σ c z^a z̄^b`; the operations are sound
(`eval_mul`, `eval_conj`, …), the basis and `L` are the fibre functions (`eval_bCP`, `eval_lCP`),
hence `uF = Re(eval uCP)`, `GF = Re(eval gCP)`, `|L|² = Re(eval l2CP)`, `uᵢuⱼ = Re(eval uuCP)`, and
`Re(eval P z) = Σ |z|^m (cc cos(n arg z) + cs sin(n arg z))` over `CP.polar P` (`re_eval_polar`).
-/

open MeasureTheory Finset GrotheKernel
open scoped ComplexConjugate

namespace GrotheKernel

noncomputable section

/-- `p + q√2`. -/
def KQ.val (x : KQ) : ℝ := (x.p : ℝ) + (x.q : ℝ) * √2
/-- The complex value. -/
def KC.val (x : KC) : ℂ := ⟨x.re.val, x.im.val⟩

@[simp] lemma KQ.val_add (x y : KQ) : (x.add y).val = x.val + y.val := by
  simp [KQ.val, KQ.add]; ring
@[simp] lemma KQ.val_neg (x : KQ) : x.neg.val = -x.val := by simp [KQ.val, KQ.neg]; ring
@[simp] lemma KQ.val_mul (x y : KQ) : (x.mul y).val = x.val * y.val := by
  simp only [KQ.val, KQ.mul]; push_cast
  have : (√2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  linear_combination (-(↑x.q * ↑y.q)) * this
@[simp] lemma KQ.val_zero : KQ.zero.val = 0 := by simp [KQ.val, KQ.zero]
@[simp] lemma KQ.val_ofRat (x : ℚ) : (KQ.ofRat x).val = x := by simp [KQ.val, KQ.ofRat]

@[simp] lemma KC.val_add (x y : KC) : (x.add y).val = x.val + y.val := by
  apply Complex.ext <;> simp [KC.val, KC.add]
@[simp] lemma KC.val_neg (x : KC) : x.neg.val = -x.val := by
  apply Complex.ext <;> simp [KC.val, KC.neg]
@[simp] lemma KC.val_mul (x y : KC) : (x.mul y).val = x.val * y.val := by
  apply Complex.ext
  · simp [KC.val, KC.mul, Complex.mul_re]; ring
  · simp [KC.val, KC.mul, Complex.mul_im]
@[simp] lemma KC.val_conj (x : KC) : x.conj.val = conj x.val := by
  apply Complex.ext <;> simp [KC.val, KC.conj]
@[simp] lemma KC.val_ofRat (x : ℚ) : (KC.ofRat x).val = (x : ℂ) := by
  apply Complex.ext <;> simp [KC.val, KC.ofRat]
@[simp] lemma KC.val_I : KC.I.val = Complex.I := by
  apply Complex.ext <;> simp [KC.val, KC.I]
@[simp] lemma KC.re_val (x : KC) : x.val.re = x.re.val := rfl
@[simp] lemma KC.im_val (x : KC) : x.val.im = x.im.val := rfl

/-- `Σ c z^a z̄^b`. -/
def CP.eval (P : CP) (z : ℂ) : ℂ := (P.map fun t => t.2.2.val * z ^ t.1 * conj z ^ t.2.1).sum

@[simp] lemma CP.eval_nil (z : ℂ) : CP.eval [] z = 0 := rfl
@[simp] lemma CP.eval_cons (t : ℕ × ℕ × KC) (P : CP) (z : ℂ) :
    CP.eval (t :: P) z = t.2.2.val * z ^ t.1 * conj z ^ t.2.1 + CP.eval P z := by
  simp [CP.eval]

lemma CP.eval_add (P Q : CP) (z : ℂ) : (CP.add P Q).eval z = P.eval z + Q.eval z := by
  simp [CP.add, CP.eval]

lemma CP.eval_neg (P : CP) (z : ℂ) : (CP.neg P).eval z = -P.eval z := by
  induction P with
  | nil => simp [CP.neg]
  | cons t P ih => simp only [CP.neg, List.map_cons, CP.eval_cons] at ih ⊢; rw [ih]; simp; ring

lemma CP.eval_smul (c : KC) (P : CP) (z : ℂ) : (CP.smul c P).eval z = c.val * P.eval z := by
  induction P with
  | nil => simp [CP.smul]
  | cons t P ih => simp only [CP.smul, List.map_cons, CP.eval_cons] at ih ⊢; rw [ih]; simp; ring

lemma CP.eval_conj (P : CP) (z : ℂ) : (CP.conj P).eval z = conj (P.eval z) := by
  induction P with
  | nil => simp [CP.conj]
  | cons t P ih =>
    simp only [CP.conj, List.map_cons, CP.eval_cons] at ih ⊢
    rw [ih]; simp; ring

lemma CP.eval_map_mul (s : ℕ × ℕ × KC) (Q : CP) (z : ℂ) :
    CP.eval (Q.map fun t => (s.1 + t.1, s.2.1 + t.2.1, s.2.2.mul t.2.2)) z
      = s.2.2.val * z ^ s.1 * conj z ^ s.2.1 * Q.eval z := by
  induction Q with
  | nil => simp
  | cons t Q ih =>
    simp only [List.map_cons, CP.eval_cons] at ih ⊢
    rw [ih, KC.val_mul]; ring

lemma CP.eval_mul (P Q : CP) (z : ℂ) : (CP.mul P Q).eval z = P.eval z * Q.eval z := by
  induction P with
  | nil => simp [CP.mul]
  | cons s P ih =>
    simp only [CP.mul, List.flatMap_cons] at ih ⊢
    rw [show ∀ A B : CP, CP.eval (A ++ B) z = CP.eval A z + CP.eval B z from
      fun A B => by simp [CP.eval], ih, CP.eval_map_mul, CP.eval_cons]
    ring

lemma CP.eval_reMul (P Q : CP) (z : ℂ) :
    ((CP.reMul P Q).eval z).re = (P.eval z).re * (Q.eval z).re := by
  rw [CP.reMul, CP.eval_smul, CP.eval_add, CP.eval_mul, CP.eval_mul, CP.eval_conj]
  simp [Complex.mul_re, Complex.mul_im]; ring

end

end GrotheKernel

namespace Grothe.LowerAnalytic

noncomputable section

lemma kInvSqrt2_val : kInvSqrt2.val = 1 / √2 := by
  have h : (√2 : ℝ) ≠ 0 := by positivity
  have h2 : (√2 : ℝ) * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  simp only [KQ.val, kInvSqrt2]; push_cast
  field_simp; linarith

lemma eval_bCP (j : ℕ) (z : ℂ) : (bCP j).eval z = Bfun j z := by
  have hs : ((1 / √2 : ℝ) : ℂ) = 1 / ((√2 : ℝ) : ℂ) := by push_cast; ring
  have h2 : ((√2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast (by positivity : (√2 : ℝ) ≠ 0)
  have hsq : ((√2 : ℝ) : ℂ) * ((√2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num)]; norm_num
  have hn : ((Complex.normSq z : ℝ) : ℂ) = z * conj z := by rw [Complex.mul_conj]
  rcases j with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | j <;>
    simp only [bCP, Bfun, CP.eval_cons, CP.eval_nil, fB1, fB2, fB4] <;>
    simp only [KC.val, KQ.val, kInvSqrt2, KQ.zero, KQ.ofRat, KQ.neg, KC.ofRat, KC.I, KC.neg] <;>
    apply Complex.ext <;>
    simp [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im, Complex.normSq_apply,
      pow_succ] <;> field_simp <;> ring_nf


lemma eval_lCP (ell beta : ℚ) (z : ℂ) : (lCP ell beta).eval z = Lf ell beta z := by
  have hn : ((Complex.normSq z : ℝ) : ℂ) = z * conj z := by rw [Complex.mul_conj]
  simp only [lCP, CP.eval_cons, CP.eval_nil, KC.val_ofRat, Lf]
  push_cast
  rw [hn]; ring

lemma uF_eq (ell beta : ℚ) (j : ℕ) (z : ℂ) : uF ell beta j z = ((uCP ell beta j).eval z).re := by
  rw [uCP, CP.eval_mul, CP.eval_conj, eval_bCP, eval_lCP]; rfl

lemma GF_eq (i j : ℕ) (z : ℂ) : GF i j z = ((gCP i j).eval z).re := by
  rw [gCP, CP.eval_mul, CP.eval_conj, eval_bCP, eval_bCP]; rfl

lemma normL_sq_eq (ell beta : ℚ) (z : ℂ) : ‖Lf ell beta z‖ ^ 2 = ((l2CP ell beta).eval z).re := by
  rw [l2CP, CP.eval_mul, CP.eval_conj, eval_lCP, Complex.mul_conj, ← Complex.normSq_eq_norm_sq]
  simp

lemma uu_eq (ell beta : ℚ) (i j : ℕ) (z : ℂ) :
    uF ell beta i z * uF ell beta j z = ((uuCP ell beta i j).eval z).re := by
  rw [uuCP, CP.eval_reMul, ← uF_eq, ← uF_eq]

/-- `z^a z̄^b = |z|^{a+b} e^{i(a−b) arg z}`. -/
lemma pow_mul_conj_pow (z : ℂ) (a b : ℕ) :
    z ^ a * conj z ^ b = ((‖z‖ ^ (a + b) : ℝ) : ℂ)
      * Complex.exp (((((a : ℤ) - b : ℤ) : ℝ) * Complex.arg z : ℝ) * Complex.I) := by
  have hz : z = (‖z‖ : ℂ) * Complex.exp (Complex.arg z * Complex.I) :=
    (Complex.norm_mul_exp_arg_mul_I z).symm
  have h1 : z ^ a = (‖z‖ : ℂ) ^ a * Complex.exp (a * (Complex.arg z * Complex.I)) := by
    conv_lhs => rw [hz]
    rw [mul_pow, ← Complex.exp_nat_mul]
  have h2 : conj z ^ b = (‖z‖ : ℂ) ^ b * Complex.exp (b * -(Complex.arg z * Complex.I)) := by
    have hc : conj z = (‖z‖ : ℂ) * Complex.exp (-(Complex.arg z * Complex.I)) := by
      conv_lhs => rw [hz]
      rw [map_mul, Complex.conj_ofReal, ← Complex.exp_conj, map_mul, Complex.conj_ofReal,
        Complex.conj_I]
      ring_nf
    rw [hc, mul_pow, ← Complex.exp_nat_mul]
  rw [h1, h2]
  have e : (‖z‖ : ℂ) ^ a * Complex.exp (a * (Complex.arg z * Complex.I))
      * ((‖z‖ : ℂ) ^ b * Complex.exp (b * -(Complex.arg z * Complex.I)))
      = ((‖z‖ : ℂ) ^ a * (‖z‖ : ℂ) ^ b)
        * Complex.exp (a * (Complex.arg z * Complex.I) + b * -(Complex.arg z * Complex.I)) := by
    rw [Complex.exp_add]; ring
  rw [e, ← pow_add]
  push_cast
  congr 2
  ring

/-- The value of a polar term. -/
def ptVal (t : CP.PT) (z : ℂ) : ℝ :=
  ‖z‖ ^ t.m * (t.cc.val * Real.cos (t.n * Complex.arg z) + t.cs.val * Real.sin (t.n * Complex.arg z))

/-- **`Re P` in polar terms.** -/
theorem re_eval_polar (P : CP) (z : ℂ) : (P.eval z).re = ((CP.polar P).map fun t => ptVal t z).sum := by
  induction P with
  | nil => simp [CP.polar]
  | cons t P ih =>
    simp only [CP.polar, List.map_cons, List.sum_cons, CP.eval_cons, Complex.add_re] at ih ⊢
    rw [ih]
    congr 1
    rw [mul_assoc, pow_mul_conj_pow, ptVal, Complex.exp_mul_I, ← Complex.ofReal_cos,
      ← Complex.ofReal_sin]
    simp only [Complex.mul_re, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
      Complex.add_re, Complex.add_im, Complex.I_re, Complex.I_im, KC.re_val, KC.im_val,
      KQ.val_neg]
    push_cast
    ring

end

end Grothe.LowerAnalytic
