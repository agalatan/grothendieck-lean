import Grothe.UpperChaos.Q0GaussExactness
import LeanCert.Engine.Algebra.QPoly
import Mathlib.Data.List.GetD
import Mathlib.Data.Rat.BigOperators

/-!
# Gaussian quadrature certificates using LeanCert's exact polynomial kernel

Agent-ID: codex-2ca4.

All executable polynomial operations below are LeanCert `QPoly` operations.
The extra definitions only express the actual Legendre recurrence and its
Gauss-specific identities. Orthogonality is checked by the existing exact
`integralRat`, and the second-kind coefficients use a single finite sum.

The source chain uses literal coefficient rows and one checked recurrence step
at a time. No nested recurrence is unfolded by the finite checker. The order-one
pilot discharges all finite arithmetic; higher-order data and the analytic
quadrature remainder are separate obligations.

Q0GaussQPolyAudit checks the actual transitive axiom dependencies.
-/

open Polynomial Finset MeasureTheory
open LeanCert.Engine

namespace Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates

/-- Executable reference moment, outside a noncomputable section. -/
def qMoment (r : ℕ) : ℚ := (1 - (-1) ^ (r + 1)) / (r + 1)

theorem qMoment_eq_moment (r : ℕ) : qMoment r = moment r := rfl

def coeff (p : QPoly) (r : ℕ) : ℚ := p.coeffs.toList.getD r 0

noncomputable def real (p : QPoly) : ℝ[X] := p.toPoly.map (Rat.castHom ℝ)

theorem real_eval (p : QPoly) (x : ℝ) : (real p).eval x = Polynomial.aeval x p.toPoly := by
  change (p.toPoly.map (algebraMap ℚ ℝ)).eval x = _
  exact Polynomial.eval_map_algebraMap p.toPoly x

/-- Public LeanCert evaluation semantics suffice; its private list implementation
is not unfolded or duplicated. -/
theorem real_eq_sum (p : QPoly) :
    real p = ∑ r ∈ range p.coeffs.toList.length, C (coeff p r : ℝ) * X ^ r := by
  apply Polynomial.funext
  intro x
  rw [real_eval, QPoly.aeval_toPoly_eq_sum]
  simp only [Polynomial.eval_finsetSum, Polynomial.eval_mul, Polynomial.eval_C,
    Polynomial.eval_pow, Polynomial.eval_X, coeff]

@[simp] theorem coeff_real (p : QPoly) (r : ℕ) :
    (real p).coeff r = (coeff p r : ℝ) := by
  rw [real_eq_sum]
  simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_C_mul_X_pow, coeff]
  generalize p.coeffs.toList = values
  by_cases hr : r < values.length
  · simp [Finset.mem_range, hr]
  · rw [List.getD_eq_default values 0 (Nat.le_of_not_gt hr)]
    simp [Finset.mem_range, hr]

def checkEq (p q : QPoly) : Bool := decide (p.trim = q.trim)

theorem checkEq_sound (p q : QPoly) (h : checkEq p q = true) : p.toPoly = q.toPoly := by
  have heq : p.trim = q.trim := of_decide_eq_true h
  have hp := congrArg QPoly.toPoly heq
  simpa only [QPoly.toPoly_trim] using hp

theorem checkEq_real (p q : QPoly) (h : checkEq p q = true) : real p = real q :=
  congrArg (fun p : ℚ[X] => p.map (Rat.castHom ℝ)) (checkEq_sound p q h)

def scale (c : ℚ) (p : QPoly) : QPoly := (QPoly.constant c).mul p

def sub (p q : QPoly) : QPoly := p.add (scale (-1) q)

@[simp] theorem real_constant (c : ℚ) : real (QPoly.constant c) = C (c : ℝ) := by
  simp [real]

@[simp] theorem real_X : real QPoly.X = X := by simp [real]

@[simp] theorem real_add (p q : QPoly) : real (p.add q) = real p + real q := by
  simp [real, QPoly.toPoly_add]

@[simp] theorem real_mul (p q : QPoly) : real (p.mul q) = real p * real q := by
  simp [real, QPoly.toPoly_mul]

@[simp] theorem real_scale (c : ℚ) (p : QPoly) : real (scale c p) = C (c : ℝ) * real p := by
  simp only [scale, real_mul, real_constant]

@[simp] theorem real_sub (p q : QPoly) : real (sub p q) = real p - real q := by
  simp [sub, sub_eq_add_neg]

@[simp] theorem real_shiftPow (p : QPoly) (n : ℕ) :
    real (p.shiftPow n) = X ^ n * real p := by
  simp [real, QPoly.toPoly_shiftPow, Polynomial.map_pow]

@[simp] theorem real_derivative (p : QPoly) :
    real p.derivative = (real p).derivative := by
  simp [real, QPoly.toPoly_derivative, Polynomial.derivative_map]

@[simp] theorem real_mulOneSubPow (p : QPoly) (n : ℕ) :
    real (p.mulOneSubPow n) = real p * (1 - X ^ n) := by
  simp [real, QPoly.toPoly_mulOneSubPow, Polynomial.map_pow]

theorem integral_real (p : QPoly) (a b : ℚ) :
    (∫ x in (a : ℝ)..(b : ℝ), (real p).eval x) = (p.integralRat a b : ℝ) := by
  simpa only [real_eval, QPoly.eval_toExpr] using QPoly.integral_eval_toExpr p a b

theorem integralPoly_real (p : QPoly) :
    integralPoly (real p) = (p.integralRat (-1) 1 : ℝ) := by
  change (∫ x in (-1 : ℝ)..1, (real p).eval x) = _
  simpa only [Rat.cast_neg, Rat.cast_one] using integral_real p (-1) 1

/-- Coefficients of the integrated divided difference. This also proves that
every coefficient at index at least n vanishes. -/
theorem secondKind_coeff (n : ℕ) (p : ℝ[X]) (m : ℕ) :
    (Q0GaussExactness.secondKind n p).coeff m =
      ∑ r ∈ range (n - m), (moment r : ℝ) * p.coeff (m + r + 1) := by
  classical
  simp only [Q0GaussExactness.secondKind, Polynomial.finsetSum_coeff,
    Polynomial.coeff_C_mul_X_pow]
  calc
    (∑ r ∈ range n, ∑ k ∈ Icc (r + 1) n,
      if m = k - (r + 1) then (moment r : ℝ) * p.coeff k else 0) =
        ∑ r ∈ range (n - m), ∑ k ∈ Icc (r + 1) n,
          if m = k - (r + 1) then (moment r : ℝ) * p.coeff k else 0 := by
      symm
      apply Finset.sum_subset (Finset.range_mono (Nat.sub_le n m))
      intro r hr hrout
      apply Finset.sum_eq_zero
      intro k hk
      have hk' := Finset.mem_Icc.mp hk
      have hrout' : ¬ r < n - m := by simpa only [Finset.mem_range] using hrout
      exact ite_eq_right (by omega)
    _ = _ := by
      apply Finset.sum_congr rfl
      intro r hr
      have hr' := Finset.mem_range.mp hr
      have hmem : m + r + 1 ∈ Icc (r + 1) n :=
        Finset.mem_Icc.mpr ⟨by omega, by omega⟩
      calc
        (∑ k ∈ Icc (r + 1) n,
          if m = k - (r + 1) then (moment r : ℝ) * p.coeff k else 0) =
            (if m = (m + r + 1) - (r + 1) then
              (moment r : ℝ) * p.coeff (m + r + 1) else 0) := by
          apply Finset.sum_eq_single_of_mem (m + r + 1) hmem
          intro k hk hne
          have hk' := Finset.mem_Icc.mp hk
          exact ite_eq_right (by omega)
        _ = _ := ite_eq_left (by omega)

def secondCoeff (n : ℕ) (p : QPoly) (m : ℕ) : ℚ :=
  ∑ r ∈ range (n - m), qMoment r * coeff p (m + r + 1)

def secondKindCheck (n : ℕ) (p w : QPoly) : Bool :=
  decide (w.coeffs.toList.length ≤ n ∧
    ∀ m : Fin n, coeff w m = secondCoeff n p m)

theorem secondKindCheck_sound (n : ℕ) (p w : QPoly)
    (h : secondKindCheck n p w = true) :
    real w = Q0GaussExactness.secondKind n (real p) := by
  have hc : w.coeffs.toList.length ≤ n ∧
      ∀ m : Fin n, coeff w m = secondCoeff n p m := of_decide_eq_true h
  apply Polynomial.ext
  intro m
  rw [coeff_real, secondKind_coeff]
  by_cases hm : m < n
  · have heq := congrArg (fun q : ℚ => (q : ℝ)) (hc.2 ⟨m, hm⟩)
    simpa only [secondCoeff, Rat.cast_sum, Rat.cast_mul, qMoment_eq_moment,
      coeff_real] using heq
  · have hnm := Nat.le_of_not_gt hm
    rw [coeff, List.getD_eq_default w.coeffs.toList 0 (hc.1.trans hnm),
      Nat.sub_eq_zero_of_le hnm]
    simp

def recurrenceStep (k : ℕ) (previous current : QPoly) : QPoly :=
  scale (((k + 2 : ℕ) : ℚ)⁻¹)
    (sub (scale (((2 * k + 3 : ℕ) : ℚ)) (current.shiftPow 1))
      (scale (((k + 1 : ℕ) : ℚ)) previous))

/-- Direct connection to the actual source; no parallel recurrence is assumed. -/
def SourcePair (k : ℕ) (previous current : QPoly) : Prop :=
  (real previous, real current) = Q0LegendreInteger.polyPair k

theorem sourcePair_zero : SourcePair 0 (QPoly.constant 1) QPoly.X := by
  simp [SourcePair, Q0LegendreInteger.polyPair]

theorem sourcePair_of_checks (k : ℕ) (previous current previous' current' : QPoly)
    (hsource : SourcePair k previous current)
    (hprev : checkEq previous' previous = true)
    (hcurrent : checkEq current' current = true) :
    SourcePair k previous' current' := by
  change (real previous', real current') = _
  rw [checkEq_real previous' previous hprev, checkEq_real current' current hcurrent]
  exact hsource

theorem sourcePair_step (k : ℕ) (previous current next : QPoly)
    (hsource : SourcePair k previous current)
    (hstep : checkEq next (recurrenceStep k previous current) = true) :
    SourcePair (k + 1) current next := by
  have hprev := congrArg Prod.fst hsource
  have hcurrent := congrArg Prod.snd hsource
  change real previous = (Q0LegendreInteger.polyPair k).1 at hprev
  change real current = (Q0LegendreInteger.polyPair k).2 at hcurrent
  have hnext := checkEq_real next (recurrenceStep k previous current) hstep
  simp only [recurrenceStep, real_scale, real_sub, real_shiftPow, pow_one,
    Rat.cast_natCast, Rat.cast_inv] at hnext
  change (real current, real next) = _
  rw [hnext, hprev, hcurrent]
  rfl

def derivativeLeft (current : QPoly) : QPoly := current.derivative.mulOneSubPow 2

def derivativeRight (n : ℕ) (previous current : QPoly) : QPoly :=
  scale n (sub previous (current.shiftPow 1))

def bezoutLeft (n : ℕ) (previous second : QPoly) : QPoly :=
  sub ((scale n previous).mul second) (QPoly.constant 2)

@[simp] theorem real_derivativeLeft (p : QPoly) :
    real (derivativeLeft p) = (1 - X ^ 2) * (real p).derivative := by
  rw [derivativeLeft, real_mulOneSubPow, real_derivative, mul_comm]

def Conditions (k : ℕ) (previous current second witness : QPoly) : Prop :=
  coeff current (k + 1) ≠ 0 ∧
  (∀ j : Fin (k + 1), (current.shiftPow j).integralRat (-1) 1 = 0) ∧
  secondKindCheck (k + 1) current second = true ∧
  checkEq (derivativeLeft current) (derivativeRight (k + 1) previous current) = true ∧
  checkEq (bezoutLeft (k + 1) previous second) (current.mul witness) = true

instance (k : ℕ) (previous current second witness : QPoly) :
    Decidable (Conditions k previous current second witness) := by
  unfold Conditions
  infer_instance

def check (k : ℕ) (previous current second witness : QPoly) : Bool :=
  decide (Conditions k previous current second witness)

theorem actual_exactness_of_check (k : ℕ) (previous current second witness : QPoly)
    (hsource : SourcePair k previous current)
    (hcheck : check k previous current second witness = true)
    (node : Fin (k + 1) → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) k).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 2 * (k + 1)) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        (((k + 1 : ℕ) : ℝ) ^ 2 *
          ((Q0LegendreInteger.realPair (node i) k).1) ^ 2)) * f.eval (node i) := by
  have hc : Conditions k previous current second witness := of_decide_eq_true hcheck
  rcases hc with ⟨hlead, hmoments, hsecond, hderivative, hbezout⟩
  have hprev := congrArg Prod.fst hsource
  have hcurrent := congrArg Prod.snd hsource
  change real previous = (Q0LegendreInteger.polyPair k).1 at hprev
  change real current = (Q0LegendreInteger.polyPair k).2 at hcurrent
  have hdegree : (Q0LegendreInteger.polyPair k).2.natDegree = k + 1 := by
    apply Polynomial.natDegree_eq_of_le_of_coeff_ne_zero
      (Q0LegendreInteger.degree_polyPair k).2
    rw [← hcurrent, coeff_real]
    exact_mod_cast hlead
  have hmomentReal (j : ℕ) (hj : j < k + 1) :
      ∑ r ∈ range (2 * (k + 1)),
        ((Q0LegendreInteger.polyPair k).2 * X ^ j).coeff r * (moment r : ℝ) = 0 := by
    have hQ := hmoments ⟨j, hj⟩
    change (current.shiftPow j).integralRat (-1) 1 = 0 at hQ
    have hIntegral : integralPoly (real (current.shiftPow j)) = 0 := by
      rw [integralPoly_real, hQ, Rat.cast_zero]
    have hpoly : real (current.shiftPow j) = (Q0LegendreInteger.polyPair k).2 * X ^ j := by
      rw [real_shiftPow, hcurrent, mul_comm]
    have hdeg : ((Q0LegendreInteger.polyPair k).2 * X ^ j).natDegree < 2 * (k + 1) := by
      have h := Polynomial.natDegree_mul_le
        (p := (Q0LegendreInteger.polyPair k).2) (q := X ^ j)
      rw [hdegree, Polynomial.natDegree_X_pow] at h
      omega
    rw [hpoly, integralPoly_eq_moment_sum _ (2 * (k + 1)) hdeg] at hIntegral
    exact hIntegral
  have hsecondReal : real second =
      Q0GaussExactness.secondKind (k + 1) (Q0LegendreInteger.polyPair k).2 := by
    simpa only [hcurrent] using secondKindCheck_sound (k + 1) current second hsecond
  have hderivativeReal : (1 - X ^ 2) * (Q0LegendreInteger.polyPair k).2.derivative =
      C ((k + 1 : ℕ) : ℝ) *
        ((Q0LegendreInteger.polyPair k).1 - X * (Q0LegendreInteger.polyPair k).2) := by
    simpa only [real_derivativeLeft, derivativeRight, real_scale, real_sub,
      real_shiftPow, Rat.cast_natCast, pow_one, hprev, hcurrent] using
      checkEq_real (derivativeLeft current) (derivativeRight (k + 1) previous current) hderivative
  have hbezoutReal :
      C ((k + 1 : ℕ) : ℝ) * (Q0LegendreInteger.polyPair k).1 *
        Q0GaussExactness.secondKind (k + 1) (Q0LegendreInteger.polyPair k).2 - C 2 =
      (Q0LegendreInteger.polyPair k).2 * real witness := by
    simpa only [bezoutLeft, real_sub, real_mul, real_scale, real_constant,
      Rat.cast_natCast, Rat.cast_ofNat, hprev, hcurrent, hsecondReal] using
      checkEq_real (bezoutLeft (k + 1) previous second) (current.mul witness) hbezout
  exact actual_recurrence_gauss_exactness k node hinj hroot hdegree hmomentReal
    hderivativeReal (real witness) hbezoutReal f hf

def orderOnePrevious : QPoly := ⟨#[1]⟩
def orderOneCurrent : QPoly := ⟨#[0, 1]⟩
def orderOneSecond : QPoly := ⟨#[2]⟩
def orderOneWitness : QPoly := ⟨#[]⟩

theorem sourcePair_order_one : SourcePair 0 orderOnePrevious orderOneCurrent :=
  sourcePair_zero

theorem check_order_one :
    check 0 orderOnePrevious orderOneCurrent orderOneSecond orderOneWitness = true := by
  decide +kernel

theorem order_one_exactness (f : ℝ[X]) (hf : f.natDegree < 2) :
    (∫ x in (-1 : ℝ)..1, f.eval x) = 2 * f.eval 0 := by
  have h := actual_exactness_of_check 0 orderOnePrevious orderOneCurrent orderOneSecond orderOneWitness
    sourcePair_order_one check_order_one (fun _ : Fin 1 => (0 : ℝ))
    (by
      intro i j _
      apply Fin.ext
      have hi := i.isLt
      have hj := j.isLt
      omega)
    (by intro i; simp [Q0LegendreInteger.realPair]) f hf
  simpa [Q0LegendreInteger.realPair] using h

end Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates
