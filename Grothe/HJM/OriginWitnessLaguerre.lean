import Grothe.HJM.OriginRadial
import Grothe.HJM.OriginPanelAlgebra

/-!
# Exact signed Laguerre recurrence for the origin test polynomials

Agent-ID: codex-aa04. This module contains no numerical integral enclosure.

The numerical witness computes the signed normalized radial polynomial by a
three-term recurrence. This module derives that recurrence from the accepted
Hermite radial polynomial and its Laguerre ODE, preserving the factorial and
alternating signs in the actual Gaussian coefficient formula.
-/

open Polynomial Grothe.Lower Grothe.HJM.OriginPanel

namespace Grothe.HJM.Origin

noncomputable section

/-- Differentiating the accepted radial recurrence and applying its ODE. -/
theorem radial_succ_derivative (n : ℕ) :
    (originRadialPoly (n + 1)).derivative =
      Polynomial.C ((n : ℝ) + 1) * (originRadialPoly n - (originRadialPoly n).derivative) := by
  have h := originRadialPoly_ode n
  simp only [originRadialPoly, derivative_sub, derivative_mul, derivative_X,
    derivative_natCast, sub_mul, one_mul, zero_mul, C_add,
    C_1] at ⊢
  simp only [C_eq_natCast] at h ⊢
  push_cast at h ⊢
  linear_combination -h

theorem radial_succ_derivative_recurrence (n : ℕ) :
    X * (originRadialPoly (n + 1)).derivative =
      Polynomial.C ((n : ℝ) + 1) * originRadialPoly (n + 1) +
        Polynomial.C (((n : ℝ) + 1) * ((n : ℝ) + 2)) * originRadialPoly n := by
  rw [radial_succ_derivative]
  simp only [originRadialPoly, C_mul, C_add, C_1, C_ofNat, C_eq_natCast]
  push_cast
  ring

theorem radial_three_term (n : ℕ) :
    originRadialPoly (n + 2) =
      (X - Polynomial.C (2 * (n : ℝ) + 4)) * originRadialPoly (n + 1) -
        Polynomial.C (((n : ℝ) + 1) * ((n : ℝ) + 2)) * originRadialPoly n := by
  have h := radial_succ_derivative_recurrence n
  rw [show n + 2 = (n + 1) + 1 by omega, originRadialPoly]
  simp only [C_mul, C_add, C_ofNat, C_1, C_eq_natCast] at h ⊢
  push_cast at h ⊢
  linear_combination -h

/-- Unnormalized signed Laguerre value `(-1)^n L_n^1`, retaining the
factorial already used by the charge-one Hermite polynomial. -/
def signedLaguerreValue (n : ℕ) (s : ℝ) : ℝ :=
  (originRadialPoly n).eval s / (n.factorial : ℝ)

lemma signedLaguerreValue_zero (s : ℝ) : signedLaguerreValue 0 s = 1 := by
  simp [signedLaguerreValue, originRadialPoly]

lemma signedLaguerreValue_one (s : ℝ) : signedLaguerreValue 1 s = s - 2 := by
  simp [signedLaguerreValue, originRadialPoly]

theorem signedLaguerreValue_three_term (n : ℕ) (s : ℝ) :
    signedLaguerreValue (n + 2) s =
      (s / ((n : ℝ) + 2) - 2) * signedLaguerreValue (n + 1) s -
        signedLaguerreValue n s := by
  have h := congrArg (Polynomial.eval s) (radial_three_term n)
  have hf : (n.factorial : ℝ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
  have h1 : (n : ℝ) + 1 ≠ 0 := by positivity
  have h2 : (n : ℝ) + 2 ≠ 0 := by positivity
  simp only [eval_sub, eval_mul, eval_X, eval_C] at h
  unfold signedLaguerreValue
  rw [show (n + 2).factorial = (n + 2) * ((n + 1) * n.factorial) by
    rw [show n + 2 = (n + 1) + 1 by omega, Nat.factorial_succ, Nat.factorial_succ]]
  rw [Nat.factorial_succ]
  push_cast
  field_simp [hf, h1, h2]
  nlinarith [h]

/-- The deterministic coefficient-list recurrence used by the certificate. -/
def signedLaguerrePair : ℕ → List ℚ × List ℚ
  | 0 => ([1], [])
  | n + 1 =>
      let q := signedLaguerrePair n
      (addLq (mulQ [-(2 : ℚ), 1 / ((n : ℚ) + 1)] q.1) (negL q.2), q.1)

def signedLaguerreList (n : ℕ) : List ℚ := (signedLaguerrePair n).1

lemma signedLaguerreList_zero (s : ℝ) : evalQ (signedLaguerreList 0) s = 1 := by
  simp [signedLaguerreList, signedLaguerrePair, evalQ_cons, evalQ_nil]

lemma signedLaguerreList_one (s : ℝ) : evalQ (signedLaguerreList 1) s = s - 2 := by
  simp [signedLaguerreList, signedLaguerrePair, mulQ, addLq, scaleL, negL, evalQ_cons, evalQ_nil]
  ring

theorem signedLaguerreList_three_term (n : ℕ) (s : ℝ) :
    evalQ (signedLaguerreList (n + 2)) s =
      (s / ((n : ℝ) + 2) - 2) * evalQ (signedLaguerreList (n + 1)) s -
        evalQ (signedLaguerreList n) s := by
  change evalQ (addLq
    (mulQ [-(2 : ℚ), 1 / (((n + 1 : ℕ) : ℚ) + 1)] (signedLaguerreList (n + 1)))
    (negL (signedLaguerreList n))) s = _
  simp only [evalQ_add, evalQ_mul,
    evalQ_neg, evalQ_cons, evalQ_nil, Rat.cast_neg, Rat.cast_div,
    Rat.cast_add, Rat.cast_natCast, Rat.cast_ofNat, mul_zero, add_zero]
  push_cast
  ring

/-- The list computed by the witness checker is exactly the actual
charge-one Hermite radial polynomial, including its factorial normalization. -/
theorem signedLaguerreList_sound (n : ℕ) (s : ℝ) :
    evalQ (signedLaguerreList n) s = signedLaguerreValue n s := by
  induction n using Nat.twoStepInduction with
  | zero => rw [signedLaguerreList_zero, signedLaguerreValue_zero]
  | one => rw [signedLaguerreList_one, signedLaguerreValue_one]
  | more n ih0 ih1 =>
    rw [signedLaguerreList_three_term, signedLaguerreValue_three_term, ih0, ih1]

/-- A complex rational witness is interpreted without any floating input. -/
def witnessAlpha (xs : List (ℚ × ℚ)) (n : ℕ) : ℂ :=
  (((xs.getD n (0, 0)).1 : ℚ) : ℂ) +
    Complex.I * (((xs.getD n (0, 0)).2 : ℚ) : ℂ)

def sumQ : List (List ℚ) → List ℚ
  | [] => []
  | p :: ps => addLq p (sumQ ps)

lemma evalQ_sumQ (ps : List (List ℚ)) (s : ℝ) :
    evalQ (sumQ ps) s = (ps.map fun p => evalQ p s).sum := by
  induction ps with
  | nil => simp [sumQ, evalQ_nil]
  | cons p ps ih => simp only [sumQ, evalQ_add, List.map_cons, List.sum_cons, ih]

lemma list_sum_range_real (N : ℕ) (f : ℕ → ℝ) :
    ((List.range N).map f).sum = ∑ n ∈ Finset.range N, f n := by
  induction N with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ, ih]
    simp

/-- Polynomial used by the signed Gaussian moment certificate. Its entries
are built from the same rational vector and Laguerre recurrence as the test. -/
def witnessPolynomial (xs : List (ℚ × ℚ)) (N : ℕ) : CList :=
  ⟨sumQ ((List.range N).map fun (n : ℕ) =>
      scaleL ((2 * (n : ℚ) + 1) * (xs.getD n (0, 0)).1) (signedLaguerreList n)),
   sumQ ((List.range N).map fun (n : ℕ) =>
      scaleL ((2 * (n : ℚ) + 1) * (xs.getD n (0, 0)).2) (signedLaguerreList n))⟩

theorem witnessPolynomial_eval (xs : List (ℚ × ℚ)) (N : ℕ) (s : ℝ) :
    evalC (witnessPolynomial xs N) s =
      ∑ n ∈ Finset.range N,
        (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * witnessAlpha xs n *
          (signedLaguerreValue n s : ℂ)) := by
  simp only [witnessPolynomial, evalC, evalQ_sumQ, List.map_map,
    Function.comp_def, evalQ_scale, signedLaguerreList_sound, list_sum_range_real]
  push_cast
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro n _hn
  simp only [witnessAlpha]
  ring

end

end Grothe.HJM.Origin
