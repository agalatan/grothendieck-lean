import Grothe.LowerAnalytic.FibreSup
import Grothe.LowerAnalytic.CapLinAlg
import Grothe.LowerAnalytic.CapNodeDefs

/-!
# Real coordinates of the fibre variable (route Core)

The packed variable `Fib` is `ℝ¹²` in the coordinate order of AF §1 (`Fib.vec`):
`(e₁.re, e₂.re, e₃.re, e₁.im, e₂.im, e₃.im, z₁.re, z₂.re, z₁.im, z₂.im, d.re, d.im)`, and
`v.fn = Σⱼ vⱼ Bⱼ` with the real basis `B = (1, |z|²−1, z²/√2, i, i(|z|²−1), −iz²/√2, z,
z(|z|²−2)/√2, iz, iz(|z|²−2)/√2, z̄, iz̄)` (`Bfun`, `fn_eq_sum`).  `mMat E R` is the gate matrix
`M = diag(E, E, R, R, ε I₂)` in these coordinates: `vec (M y) = M vec y` (`vec_M`) and
`yᵀMy = quad E R y` (`quad_eq_qf`).
-/

open MeasureTheory Finset Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-- The real fibre basis `B_j`. -/
def Bfun (j : ℕ) (z : ℂ) : ℂ :=
  match j with
  | 0 => 1
  | 1 => fB1 z
  | 2 => fB2 z
  | 3 => Complex.I
  | 4 => Complex.I * fB1 z
  | 5 => -Complex.I * fB2 z
  | 6 => z
  | 7 => fB4 z
  | 8 => Complex.I * z
  | 9 => Complex.I * fB4 z
  | 10 => conj z
  | 11 => Complex.I * conj z
  | _ => 0

lemma continuous_Bfun (j : ℕ) : Continuous (Bfun j) := by
  rw [show Bfun j = fun z => Bfun j z from rfl]
  rcases j with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | j <;> simp only [Bfun] <;>
    first
    | exact continuous_const
    | exact continuous_fB1
    | exact continuous_fB2
    | exact continuous_id
    | exact continuous_fB4
    | exact Complex.continuous_conj
    | exact continuous_const.mul continuous_fB1
    | exact continuous_const.mul continuous_fB2
    | exact continuous_const.mul continuous_id
    | exact continuous_const.mul continuous_fB4
    | exact continuous_const.mul Complex.continuous_conj

lemma norm_Bfun_le (j : ℕ) (z : ℂ) : ‖Bfun j z‖ ≤ 2 * qw z := by
  have h1 : (1 : ℝ) ≤ qw z := by unfold qw; nlinarith [Complex.normSq_nonneg z]
  rcases j with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | j <;>
    simp only [Bfun, norm_mul, norm_neg, Complex.norm_I, one_mul, norm_one, Complex.norm_conj,
      norm_zero]
  all_goals first
    | linarith
    | linarith [norm_fB1_le z]
    | linarith [norm_fB2_le z]
    | linarith [norm_le_qw z]
    | linarith [norm_fB4_le z]

/-- The real coordinates of the packed variable. -/
def Fib.vec (v : Fib) (j : ℕ) : ℝ :=
  match j with
  | 0 => v.e1.re
  | 1 => v.e2.re
  | 2 => v.e3.re
  | 3 => v.e1.im
  | 4 => v.e2.im
  | 5 => v.e3.im
  | 6 => v.z1.re
  | 7 => v.z2.re
  | 8 => v.z1.im
  | 9 => v.z2.im
  | 10 => v.d.re
  | 11 => v.d.im
  | _ => 0

lemma fn_eq_sum (v : Fib) (z : ℂ) : v.fn z = ∑ j ∈ range 12, (v.vec j : ℂ) * Bfun j z := by
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, Fib.vec, Bfun, Fib.fn]
  apply Complex.ext <;>
    simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, Complex.conj_re, Complex.conj_im, Complex.I_re, Complex.I_im,
      Complex.neg_re, Complex.neg_im, Complex.one_re, Complex.one_im, Complex.zero_re,
      Complex.zero_im] <;> ring

lemma vec_add (v w : Fib) (j : ℕ) : (v.add w).vec j = v.vec j + w.vec j := by
  rcases j with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | j <;>
    simp [Fib.vec, Fib.add]

lemma vec_smul (s : ℝ) (v : Fib) (j : ℕ) : (v.smul s).vec j = s * v.vec j := by
  rcases j with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | j <;>
    simp [Fib.vec, Fib.smul]

/-! ### The gate matrix -/

lemma vec_M (E : Sym3) (R : Sym2) (y : Fib) (j : ℕ) (hj : j < 12) :
    (Fib.M E R y).vec j = ∑ i ∈ range 12, (mMat E R j i : ℝ) * y.vec i := by
  interval_cases j <;>
    simp [Finset.sum_range_succ, Fib.vec, Fib.M, mMat, Complex.mul_re, Complex.mul_im,
      Complex.add_re, Complex.add_im]

lemma quad_eq_qf (E : Sym3) (R : Sym2) (y : Fib) :
    Fib.quad E R y = ∑ i ∈ range 12, ∑ j ∈ range 12, (mMat E R i j : ℝ) * y.vec i * y.vec j := by
  simp only [Fib.quad, Sym3.form, Sym2.form, hre_eq, Complex.sq_norm, Complex.normSq_apply]
  simp [Finset.sum_range_succ, Fib.vec, mMat]
  ring

end

end Grothe.LowerAnalytic
