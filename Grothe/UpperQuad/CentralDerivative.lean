import Mathlib.Algebra.Polynomial.Taylor
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Rat.BigOperators
import Mathlib.Data.Rat.Cast.Lemmas
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Tactic.Ring
import Lean.Elab.Tactic.NormCast
import Lean.Elab.Tactic.Omega
import Lean.Elab.Tactic.Decide
import Lean.Util.CollectAxioms

/-!
# A finite derivative stencil for real root windows

For polynomials of degree at most 35, eighteen symmetric sample pairs give the
exact derivative. Their absolute weights give the uniform bound `630 * M`.
The phase polynomial identification and physical integration are separate inputs.
-/
namespace Grothe.UpperQuad.CentralDerivative
open Polynomial Finset
set_option warningAsError true

/-- Positive displacements; each is at most 1/10. -/
def offset (i : Fin 18) : ℚ := (i.val + 1 : ℚ) / 180

/-- The antisymmetric 37-point differentiation rule has zero center weight. -/
def weight (i : Fin 18) : ℚ :=
  ![3240/19, -1377/19, 4896/133, -27540/1463, 44064/4807, -19890/4807,
    286416/168245, -1377/2185, 272/1311, -918/15295, 14688/975821,
    -204/63365, 14688/25536095, -459/5500082, 204/21607465,
    -27/34571944, 108/2571288335, -1/907513530] i

theorem moments : ∀ n : Fin 36,
    (∑ i : Fin 18, weight i * (offset i ^ n.val - (-offset i) ^ n.val)) =
      if n.val = 1 then 1 else 0 := by decide +kernel

theorem twice_weight_norm : 2 * ∑ i : Fin 18, |weight i| < 630 := by decide +kernel

private theorem realMoment (m : ℕ) (hm : m < 36) :
    (∑ i : Fin 18, (weight i : ℝ) * ((offset i : ℝ)^m - (-(offset i : ℝ))^m)) =
      if m = 1 then 1 else 0 := by
  have h := congrArg (fun q : ℚ => (q : ℝ)) (moments ⟨m, hm⟩)
  by_cases hone : m = 1
  · simpa [hone, Rat.cast_sum, Rat.cast_mul, Rat.cast_sub, Rat.cast_pow, Rat.cast_neg] using h
  · simpa [hone, Rat.cast_sum, Rat.cast_mul, Rat.cast_sub, Rat.cast_pow, Rat.cast_neg] using h

/-- Polynomial derivative from the eighteen pairs of real samples. -/
theorem derivative_eq (p : ℝ[X]) (hp : p.natDegree ≤ 35) (r : ℝ) :
    p.derivative.eval r = ∑ i : Fin 18, (weight i : ℝ) *
      (p.eval (r + (offset i : ℝ)) - p.eval (r - (offset i : ℝ))) := by
  classical
  let a := fun m => (Polynomial.taylor r p).coeff m
  have hdegree : (Polynomial.taylor r p).natDegree < 36 := by
    rw [Polynomial.natDegree_taylor]; omega
  have hexpand (t : ℝ) : p.eval (r+t) = ∑ m ∈ range 36, a m * t^m := by
    calc
      _ = (Polynomial.taylor r p).eval t := by rw [Polynomial.taylor_eval, add_comm r t]
      _ = _ := Polynomial.eval_eq_sum_range' hdegree t
  symm
  calc
    _ = ∑ i : Fin 18, ∑ m ∈ range 36, a m * ((weight i : ℝ) *
          ((offset i : ℝ)^m - (-(offset i : ℝ))^m)) := by
      apply sum_congr rfl
      intro i _
      rw [sub_eq_add_neg r, hexpand, hexpand, ← sum_sub_distrib, mul_sum]
      apply sum_congr rfl
      intro m _
      ring
    _ = ∑ m ∈ range 36, a m * (∑ i : Fin 18, (weight i : ℝ) *
          ((offset i : ℝ)^m - (-(offset i : ℝ))^m)) := by
      rw [sum_comm]
      simp only [mul_sum]
    _ = ∑ m ∈ range 36, a m * (if m = 1 then 1 else 0) := by
      apply sum_congr rfl
      intro m hm
      rw [realMoment m (mem_range.mp hm)]
    _ = a 1 := by simp [mul_ite]
    _ = p.derivative.eval r := Polynomial.taylor_coeff_one r p

/-- Uniform sample enclosure transfers to the derivative at the window point. -/
theorem abs_derivative_le (p : ℝ[X]) (hp : p.natDegree ≤ 35) (r M : ℝ) (hM : 0 ≤ M)
    (hplus : ∀ i : Fin 18, |p.eval (r + (offset i : ℝ))| ≤ M)
    (hminus : ∀ i : Fin 18, |p.eval (r - (offset i : ℝ))| ≤ M) :
    |p.derivative.eval r| ≤ 630 * M := by
  rw [derivative_eq p hp r]
  have hmass : 2 * ∑ i : Fin 18, |(weight i : ℝ)| ≤ 630 := by
    exact_mod_cast twice_weight_norm.le
  calc
    _ ≤ ∑ i : Fin 18, |(weight i : ℝ) *
          (p.eval (r + (offset i : ℝ)) - p.eval (r - (offset i : ℝ)))| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ i : Fin 18, |(weight i : ℝ)| * (M+M) := by
      apply sum_le_sum
      intro i _
      rw [abs_mul]
      apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
      have htriangle := abs_add_le (p.eval (r + (offset i : ℝ)))
        (-p.eval (r - (offset i : ℝ)))
      rw [abs_neg] at htriangle
      simpa only [sub_eq_add_neg] using htriangle.trans (add_le_add (hplus i) (hminus i))
    _ = (2 * ∑ i : Fin 18, |(weight i : ℝ)|) * M := by rw [← sum_mul]; ring
    _ ≤ _ := mul_le_mul_of_nonneg_right hmass hM

open Lean Elab Command
run_cmd do
  for target in #[``moments, ``twice_weight_norm, ``derivative_eq, ``abs_derivative_le] do
    for dep in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dep do
        throwError m!"{target} uses {dep}"

end Grothe.UpperQuad.CentralDerivative
