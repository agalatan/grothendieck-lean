import Grothe.UpperChaos.InvariantMoments
import Grothe.UpperChaos.PhaseMomentCheck
import Grothe.UpperChaos.PhiCover

/-!
# Integrating the exact integer phase polynomial

Indexed finite sums apply the invariant-monomial moment functional to a nested
integer coefficient list. The Horner integral lemma proves this operation sound
without expanding the polynomial into a large Lean expression.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.PhaseMomentCheck

/-- Sum coefficients with their actual indices, starting at a specified offset. -/
def indexedSum {α : Type} (term : ℕ → α → ℚ) : ℕ → List α → ℚ
  | _, [] => 0
  | n, a :: p => term n a + indexedSum term (n + 1) p

/-- The moment functional on the innermost coefficient list. -/
def moment1 (rate : ℚ) (j a b k : ℕ) (p : List ℤ) : ℚ :=
  indexedSum (fun m c => (c : ℚ) * invariantMoment rate a b j m) k p

/-- The moment functional on a bivariate coefficient list. -/
def moment2 (rate : ℚ) (j a b : ℕ) (p : List (List ℤ)) : ℚ :=
  indexedSum (fun n row => moment1 rate j a n 0 row) b p

/-- The moment functional on a trivariate coefficient list. -/
def moment3 (rate : ℚ) (j a : ℕ) (p : List (List (List ℤ))) : ℚ :=
  indexedSum (fun n row => moment2 rate j n 0 row) a p

/-- Exact even phase moment, computed from the original rational coefficient list. -/
def phasePowerMoment (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (eps : ℚ) (j : ℕ) : ℚ :=
  moment3 (1 + 2 * (j : ℚ) * eps) j 0 (pow3 (integerPhase ts) (2 * j)) /
    (GrotheKernel.commonDen ts : ℚ) ^ (2 * j)

noncomputable section

/-- Finite Horner integration, including the integrability needed at every addition. -/
theorem integral_horner {Ω α : Type} [MeasurableSpace Ω] (μ : Measure Ω)
    (x : Ω → ℝ) (w : ℕ → Ω → ℝ) (ev : α → Ω → ℝ) (term : ℕ → α → ℚ)
    (hstep : ∀ n u, w n u * x u = w (n + 1) u)
    (hi : ∀ n a, Integrable (fun u => w n u * ev a u) μ)
    (hm : ∀ n a, (∫ u, w n u * ev a u ∂μ) = (term n a : ℝ))
    (p : List α) (n : ℕ) :
    Integrable (fun u => w n u * evalG (fun a => ev a u) p (x u)) μ ∧
      (∫ u, w n u * evalG (fun a => ev a u) p (x u) ∂μ) =
        (indexedSum term n p : ℝ) := by
  induction p generalizing n with
  | nil => simp [indexedSum]
  | cons a p ih =>
      obtain ⟨hip, hmp⟩ := ih (n + 1)
      have he : (fun u => w n u * evalG (fun a => ev a u) (a :: p) (x u)) =
          fun u => w n u * ev a u +
            w (n + 1) u * evalG (fun a => ev a u) p (x u) := by
        funext u
        rw [evalG_cons, ← hstep]
        ring
      simp only [he]
      refine ⟨(hi n a).add hip, ?_⟩
      rw [integral_add (hi n a) hip, hm, hmp]
      simp [indexedSum]

/-- The damped invariant multiplying a coefficient list. -/
def momentWeight (rate : ℚ) (j a b k : ℕ) (u : ℂ × ℂ) : ℝ :=
  invariantMonomial a b j k u *
    Real.exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2))

theorem moment1_spec {rate : ℚ} (hrate : 0 < rate) (j a b k : ℕ) (p : List ℤ) :
    Integrable (fun u => momentWeight rate j a b k u * he1 p (conj u.1 * u.2).re)
      (gaussC.prod gaussC) ∧
      (∫ u, momentWeight rate j a b k u * he1 p (conj u.1 * u.2).re
        ∂gaussC.prod gaussC) = (moment1 rate j a b k p : ℝ) := by
  have hp : (0 : ℝ) < rate := by exact_mod_cast hrate
  unfold he1 moment1
  refine integral_horner (α := ℤ) (gaussC.prod gaussC) (fun u => (conj u.1 * u.2).re)
    (fun n => momentWeight rate j a b n) (fun c _ => (c : ℝ))
    (fun n c => (c : ℚ) * invariantMoment rate a b j n) ?_ ?_ ?_ p k
  · intro n u
    simp only [momentWeight, invariantMonomial, pow_succ]
    ring
  · intro n c
    exact (integrable_invariant_monomial_damped a b j n hp).mul_const c
  · intro n c
    simp only [momentWeight]
    rw [integral_mul_const, integral_invariant_monomial_damped a b j n hrate]
    push_cast
    ring

theorem moment2_spec {rate : ℚ} (hrate : 0 < rate) (j a b : ℕ) (p : List (List ℤ)) :
    Integrable (fun u => momentWeight rate j a b 0 u *
      he2 p (Complex.normSq u.2) (conj u.1 * u.2).re) (gaussC.prod gaussC) ∧
      (∫ u, momentWeight rate j a b 0 u *
        he2 p (Complex.normSq u.2) (conj u.1 * u.2).re ∂gaussC.prod gaussC) =
        (moment2 rate j a b p : ℝ) := by
  refine integral_horner (gaussC.prod gaussC) (fun u => Complex.normSq u.2)
    (fun n => momentWeight rate j a n 0) (fun row u => he1 row (conj u.1 * u.2).re)
    (fun n row => moment1 rate j a n 0 row) ?_ ?_ ?_ p b
  · intro n u
    simp only [momentWeight, invariantMonomial, pow_succ]
    ring
  · intro n row
    exact (moment1_spec hrate j a n 0 row).1
  · intro n row
    exact (moment1_spec hrate j a n 0 row).2

theorem moment3_spec {rate : ℚ} (hrate : 0 < rate) (j a : ℕ)
    (p : List (List (List ℤ))) :
    Integrable (fun u => momentWeight rate j a 0 0 u *
      he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re)
      (gaussC.prod gaussC) ∧
      (∫ u, momentWeight rate j a 0 0 u *
        he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re
          ∂gaussC.prod gaussC) = (moment3 rate j a p : ℝ) := by
  refine integral_horner (gaussC.prod gaussC) (fun u => Complex.normSq u.1)
    (fun n => momentWeight rate j n 0 0)
    (fun row u => he2 row (Complex.normSq u.2) (conj u.1 * u.2).re)
    (fun n row => moment2 rate j n 0 row) ?_ ?_ ?_ p a
  · intro n u
    simp only [momentWeight, invariantMonomial, pow_succ]
    ring
  · intro n row
    exact (moment2_spec hrate j n 0 row).1
  · intro n row
    exact (moment2_spec hrate j n 0 row).2

/-- Exact integration of an integer polynomial with radial Gaussian damping. -/
theorem integral_polynomial_damped {rate : ℚ} (hrate : 0 < rate) (j : ℕ)
    (p : List (List (List ℤ))) :
    (∫ u : ℂ × ℂ, (conj u.1 * u.2).im ^ (2 * j) *
      Real.exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) *
      he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re
        ∂gaussC.prod gaussC) = (moment3 rate j 0 p : ℝ) := by
  simpa only [momentWeight, invariantMonomial, pow_zero, mul_one] using
    (moment3_spec hrate j 0 p).2

/-- The phase associated with a rational invariant polynomial. -/
def phaseOfTerms (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (eps : ℚ) (u : ℂ × ℂ) : ℝ :=
  (conj u.1 * u.2).im *
    Real.exp (-(eps : ℝ) * (Complex.normSq u.1 + Complex.normSq u.2)) *
    Ssum ts (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re

/-- **The exact even Gaussian phase moment is the finite rational polynomial calculation.** -/
theorem integral_phaseOfTerms_pow {ts : List ((ℕ × ℕ × ℕ) × ℚ)}
    {eps : ℚ} (heps : 0 < eps) (j : ℕ) :
    (∫ u : ℂ × ℂ, phaseOfTerms ts eps u ^ (2 * j) ∂gaussC.prod gaussC) =
      (phasePowerMoment ts eps j : ℝ) := by
  let rate : ℚ := 1 + 2 * (j : ℚ) * eps
  have hr : 0 < rate := by dsimp [rate]; positivity
  have hL : (GrotheKernel.commonDen ts : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.ne_of_gt (commonDen_pos ts))
  have hLn := pow_ne_zero (2 * j) hL
  have he (u : ℂ × ℂ) :
      Real.exp (-(eps : ℝ) * (Complex.normSq u.1 + Complex.normSq u.2)) ^ (2 * j) =
        Real.exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) := by
    rw [← Real.exp_nat_mul]
    congr 1
    dsimp [rate]
    push_cast
    ring
  have hpoint (u : ℂ × ℂ) : phaseOfTerms ts eps u ^ (2 * j) =
      ((conj u.1 * u.2).im ^ (2 * j) *
        Real.exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) *
        he3 (pow3 (integerPhase ts) (2 * j))
          (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re) /
        (GrotheKernel.commonDen ts : ℝ) ^ (2 * j) := by
    rw [eq_div_iff hLn, phaseOfTerms, mul_pow, mul_pow, he,
      e3_pow3, e3_integerPhase ts, mul_pow]
    ring
  simp_rw [hpoint]
  rw [integral_div, integral_polynomial_damped hr]
  simp only [phasePowerMoment, Rat.cast_div, Rat.cast_pow, Rat.cast_natCast]
  rfl

end

end Grothe.UpperChaos.PhaseMomentCheck
