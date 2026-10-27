import Grothe.HJM.OriginPanelAlgebra
import Grothe.HJM.OriginPhaseDerivative
import Grothe.HJM.OriginPhaseQuotient

/-!
# Explicit polynomial growth inputs for the origin energy tail

Agent-ID: codex-aa04. This uses the accepted exact numerator binding, Horner's rule and rational
coefficient sums. No root location or numerical integral is assumed.
-/

open Polynomial Grothe.Lower Grothe.Upper Grothe.HJM.OriginPanel

namespace Grothe.HJM.OriginGrowth

noncomputable section

def listNorm (p : List ℚ) : ℚ := (p.map abs).sum

theorem listNorm_nonneg (p : List ℚ) : 0 ≤ listNorm p := by
  apply List.sum_nonneg
  intro x hx
  obtain ⟨a, _ha, rfl⟩ := List.mem_map.mp hx
  exact abs_nonneg a

/-- Coarse Horner bound on the nonnegative axis, with an exponent equal to
the list length. This deliberately avoids a separate empty-tail case. -/
theorem evalQ_norm_le_length (p : List ℚ) (s : ℝ) (hs : 0 ≤ s) :
    |evalQ p s| ≤ (listNorm p : ℝ) * (1 + s) ^ p.length := by
  induction p with
  | nil => simp [evalQ_nil, listNorm]
  | cons a p ih =>
    have hp : (1 : ℝ) ≤ (1 + s) ^ (p.length + 1) := by
      exact one_le_pow₀ (by linarith)
    have hq : 0 ≤ (listNorm p : ℝ) := by exact_mod_cast listNorm_nonneg p
    have hfirst : |(a : ℝ)| ≤ |(a : ℝ)| * (1 + s) ^ (p.length + 1) :=
      le_mul_of_one_le_right (abs_nonneg _) hp
    have hsecond : s * (listNorm p : ℝ) * (1 + s) ^ p.length ≤
        (listNorm p : ℝ) * (1 + s) ^ (p.length + 1) := by
      calc
        _ = (listNorm p : ℝ) * (s * (1 + s) ^ p.length) := by ring
        _ ≤ (listNorm p : ℝ) * ((1 + s) * (1 + s) ^ p.length) :=
          mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right (by linarith) (by positivity)) hq
        _ = _ := by rw [pow_succ]; ring
    calc
      |evalQ (a :: p) s| ≤ |(a : ℝ)| + s * |evalQ p s| := by
        simpa only [evalQ_cons, abs_mul, abs_of_nonneg hs] using
          abs_add_le (a : ℝ) (s * evalQ p s)
      _ ≤ |(a : ℝ)| + s * ((listNorm p : ℝ) * (1 + s) ^ p.length) :=
        add_le_add le_rfl (mul_le_mul_of_nonneg_left ih hs)
      _ ≤ |(a : ℝ)| * (1 + s) ^ (p.length + 1) +
          (listNorm p : ℝ) * (1 + s) ^ (p.length + 1) := by
        have h := add_le_add hfirst hsecond
        nlinarith
      _ = (listNorm (a :: p) : ℝ) * (1 + s) ^ (a :: p).length := by
        simp only [listNorm, List.map_cons, List.sum_cons, Rat.cast_add,
          Rat.cast_abs, List.length_cons]
        ring

def derivativeAux : List ℚ → ℕ → List ℚ
  | [], _ => []
  | a :: p, n => ((n : ℚ) * a) :: derivativeAux p (n + 1)

def derivativeQ : List ℚ → List ℚ
  | [] => []
  | _ :: p => derivativeAux p 1

theorem ofListQ_derivativeAux (p : List ℚ) (n : ℕ) :
    ofListQ (derivativeAux p n) = C (n : ℝ) * ofListQ p + X * (ofListQ p).derivative := by
  induction p generalizing n with
  | nil => simp [derivativeAux, ofListQ]
  | cons a p ih =>
    simp only [derivativeAux, ofListQ, ih, derivative_add, derivative_C, derivative_mul,
      derivative_X, zero_add, one_mul,
      Rat.cast_mul, Rat.cast_natCast]
    push_cast
    simp [map_add, map_mul]; ring

theorem ofListQ_derivativeQ (p : List ℚ) :
    ofListQ (derivativeQ p) = (ofListQ p).derivative := by
  cases p with
  | nil => simp [derivativeQ, ofListQ]
  | cons a p =>
    simp [derivativeQ, ofListQ, ofListQ_derivativeAux, derivative_add, derivative_mul]

def derivativeC (p : CList) : CList := ⟨derivativeQ p.re, derivativeQ p.im⟩

theorem hasDerivAt_evalQ (p : List ℚ) (s : ℝ) :
    HasDerivAt (evalQ p) (evalQ (derivativeQ p) s) s := by
  have he : evalQ p = (ofListQ p).eval := funext (evalQ_eq_ofListQ p)
  rw [he, evalQ_eq_ofListQ, ofListQ_derivativeQ]
  exact (ofListQ p).hasDerivAt s

theorem hasDerivAt_evalC (p : CList) (s : ℝ) :
    HasDerivAt (evalC p) (evalC (derivativeC p) s) s := by
  have hr := (hasDerivAt_evalQ p.re s).ofReal_comp
  have hi := (hasDerivAt_evalQ p.im s).ofReal_comp
  change HasDerivAt (fun t : ℝ => (evalQ p.re t : ℂ) +
    Complex.I * (evalQ p.im t : ℂ)) _ s
  simpa only [evalC, derivativeC, zero_mul, zero_add, Pi.add_def] using
    hr.add ((hasDerivAt_const s Complex.I).fun_mul hi)

theorem deriv_evalC (p : CList) (s : ℝ) :
    deriv (evalC p) s = evalC (derivativeC p) s := (hasDerivAt_evalC p s).deriv

theorem deriv_deriv_evalC (p : CList) (s : ℝ) :
    deriv (deriv (evalC p)) s = evalC (derivativeC (derivativeC p)) s := by
  have he : deriv (evalC p) = evalC (derivativeC p) := funext (deriv_evalC p)
  rw [he, deriv_evalC]

/-- The derivative lists really are those of the original complex polynomial. -/
theorem left_polynomial_derivatives (s : ℝ) :
    Origin.leftNumeratorPolynomial.derivative.eval (s : ℂ) =
        evalC (derivativeC ⟨OriginData.leftReal, OriginData.leftImag⟩) s ∧
    Origin.leftNumeratorPolynomial.derivative.derivative.eval (s : ℂ) =
        evalC (derivativeC (derivativeC ⟨OriginData.leftReal, OriginData.leftImag⟩)) s := by
  have he : evalC ⟨OriginData.leftReal, OriginData.leftImag⟩ =
      (fun t : ℝ => Origin.leftNumeratorPolynomial.eval (t : ℂ)) := by
    funext t
    rw [evalC_left, Origin.eval_leftNumeratorPolynomial]
  have hd : deriv (evalC ⟨OriginData.leftReal, OriginData.leftImag⟩) =
      (fun t : ℝ => Origin.leftNumeratorPolynomial.derivative.eval (t : ℂ)) := by
    funext t
    rw [he]
    exact (Origin.hasDerivAt_realAxisPolynomial _ t).deriv
  constructor
  · simpa only [hd] using deriv_evalC ⟨OriginData.leftReal, OriginData.leftImag⟩ s
  · have hdd : deriv (deriv (evalC ⟨OriginData.leftReal, OriginData.leftImag⟩)) s =
        Origin.leftNumeratorPolynomial.derivative.derivative.eval (s : ℂ) := by
      rw [hd]
      exact (Origin.hasDerivAt_realAxisPolynomial _ s).deriv
    rw [deriv_deriv_evalC] at hdd
    exact hdd.symm

theorem right_polynomial_derivatives (s : ℝ) :
    Origin.rightNumeratorPolynomial.derivative.eval (s : ℂ) =
        evalC (derivativeC ⟨OriginData.rightReal, OriginData.rightImag⟩) s ∧
    Origin.rightNumeratorPolynomial.derivative.derivative.eval (s : ℂ) =
        evalC (derivativeC (derivativeC ⟨OriginData.rightReal, OriginData.rightImag⟩)) s := by
  have he : evalC ⟨OriginData.rightReal, OriginData.rightImag⟩ =
      (fun t : ℝ => Origin.rightNumeratorPolynomial.eval (t : ℂ)) := by
    funext t
    rw [evalC_right, Origin.eval_rightNumeratorPolynomial]
  have hd : deriv (evalC ⟨OriginData.rightReal, OriginData.rightImag⟩) =
      (fun t : ℝ => Origin.rightNumeratorPolynomial.derivative.eval (t : ℂ)) := by
    funext t
    rw [he]
    exact (Origin.hasDerivAt_realAxisPolynomial _ t).deriv
  constructor
  · simpa only [hd] using deriv_evalC ⟨OriginData.rightReal, OriginData.rightImag⟩ s
  · have hdd : deriv (deriv (evalC ⟨OriginData.rightReal, OriginData.rightImag⟩)) s =
        Origin.rightNumeratorPolynomial.derivative.derivative.eval (s : ℂ) := by
      rw [hd]
      exact (Origin.hasDerivAt_realAxisPolynomial _ s).deriv
    rw [deriv_deriv_evalC] at hdd
    exact hdd.symm

def complexListNorm (p : CList) : ℚ := listNorm p.re + listNorm p.im

theorem evalC_norm_le (p : CList) (d : ℕ) (hre : p.re.length ≤ d)
    (him : p.im.length ≤ d) (s : ℝ) (hs : 0 ≤ s) :
    ‖evalC p s‖ ≤ (complexListNorm p : ℝ) * (1 + s) ^ d := by
  have hb : (1 : ℝ) ≤ 1 + s := by linarith
  have hr := evalQ_norm_le_length p.re s hs
  have hi := evalQ_norm_le_length p.im s hs
  have hrepow := pow_le_pow_right₀ hb hre
  have himpow := pow_le_pow_right₀ hb him
  have hr0 : (0 : ℝ) ≤ listNorm p.re := by exact_mod_cast listNorm_nonneg p.re
  have hi0 : (0 : ℝ) ≤ listNorm p.im := by exact_mod_cast listNorm_nonneg p.im
  have hcomplex := Complex.norm_le_abs_re_add_abs_im (evalC p s)
  simp only [evalC, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.ofReal_re, Complex.ofReal_im, Complex.I_re, Complex.I_im,
    zero_mul, mul_zero, one_mul, sub_zero, add_zero, zero_add] at hcomplex
  calc
    _ ≤ |evalQ p.re s| + |evalQ p.im s| := hcomplex
    _ ≤ (listNorm p.re : ℝ) * (1 + s) ^ p.re.length +
        (listNorm p.im : ℝ) * (1 + s) ^ p.im.length := add_le_add hr hi
    _ ≤ (listNorm p.re : ℝ) * (1 + s) ^ d +
        (listNorm p.im : ℝ) * (1 + s) ^ d :=
      add_le_add (mul_le_mul_of_nonneg_left hrepow hr0) (mul_le_mul_of_nonneg_left himpow hi0)
    _ = _ := by simp only [complexListNorm, Rat.cast_add]; ring

def leftCoefficients : CList := ⟨OriginData.leftReal, OriginData.leftImag⟩
def rightCoefficients : CList := ⟨OriginData.rightReal, OriginData.rightImag⟩

set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

theorem left_first_coefficient_sum : complexListNorm (derivativeC leftCoefficients) ≤ 16 := by
  decide +kernel
theorem right_first_coefficient_sum : complexListNorm (derivativeC rightCoefficients) ≤ 16 := by
  decide +kernel
theorem left_second_coefficient_sum : complexListNorm (derivativeC (derivativeC leftCoefficients)) ≤ 27 := by
  decide +kernel
theorem right_second_coefficient_sum : complexListNorm (derivativeC (derivativeC rightCoefficients)) ≤ 27 := by
  decide +kernel

theorem left_first_derivative_bound (s : ℝ) (hs : 0 ≤ s) :
    ‖Origin.leftNumeratorPolynomial.derivative.eval (s : ℂ)‖ ≤ 16 * (1 + s) ^ 10 := by
  rw [(left_polynomial_derivatives s).1]
  have h := evalC_norm_le (derivativeC leftCoefficients) 10
    (by decide +kernel) (by decide +kernel) s hs
  have hsum : (complexListNorm (derivativeC leftCoefficients) : ℝ) ≤ 16 := by
    exact_mod_cast left_first_coefficient_sum
  exact h.trans (mul_le_mul_of_nonneg_right hsum (by positivity))

theorem right_first_derivative_bound (s : ℝ) (hs : 0 ≤ s) :
    ‖Origin.rightNumeratorPolynomial.derivative.eval (s : ℂ)‖ ≤ 16 * (1 + s) ^ 10 := by
  rw [(right_polynomial_derivatives s).1]
  have h := evalC_norm_le (derivativeC rightCoefficients) 10
    (by decide +kernel) (by decide +kernel) s hs
  have hsum : (complexListNorm (derivativeC rightCoefficients) : ℝ) ≤ 16 := by
    exact_mod_cast right_first_coefficient_sum
  exact h.trans (mul_le_mul_of_nonneg_right hsum (by positivity))

theorem left_second_derivative_bound (s : ℝ) (hs : 0 ≤ s) :
    ‖Origin.leftNumeratorPolynomial.derivative.derivative.eval (s : ℂ)‖ ≤ 27 * (1 + s) ^ 9 := by
  rw [(left_polynomial_derivatives s).2]
  have h := evalC_norm_le (derivativeC (derivativeC leftCoefficients)) 9
    (by decide +kernel) (by decide +kernel) s hs
  have hsum : (complexListNorm (derivativeC (derivativeC leftCoefficients)) : ℝ) ≤ 27 := by
    exact_mod_cast left_second_coefficient_sum
  exact h.trans (mul_le_mul_of_nonneg_right hsum (by positivity))

theorem right_second_derivative_bound (s : ℝ) (hs : 0 ≤ s) :
    ‖Origin.rightNumeratorPolynomial.derivative.derivative.eval (s : ℂ)‖ ≤ 27 * (1 + s) ^ 9 := by
  rw [(right_polynomial_derivatives s).2]
  have h := evalC_norm_le (derivativeC (derivativeC rightCoefficients)) 9
    (by decide +kernel) (by decide +kernel) s hs
  have hsum : (complexListNorm (derivativeC (derivativeC rightCoefficients)) : ℝ) ≤ 27 := by
    exact_mod_cast right_second_coefficient_sum
  exact h.trans (mul_le_mul_of_nonneg_right hsum (by positivity))

end

end Grothe.HJM.OriginGrowth
