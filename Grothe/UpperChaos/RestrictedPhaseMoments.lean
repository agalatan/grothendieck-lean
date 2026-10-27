import Grothe.UpperChaos.ConcretePhaseMoments
import Grothe.UpperChaos.RestrictedWick

/-! Exact restricted phase moments, reusing the existing Horner evaluator.

The result is a finite rational expression multiplied by an exponential; it
does not assert a numerical tail enclosure. -/

open MeasureTheory Grothe.LowerAnalytic Grothe.Upper
open scoped ComplexConjugate
namespace Grothe.UpperChaos.PhaseMomentCheck
noncomputable section

/-- Reuse the original indexed Horner evaluator with the cutoff moment functional. -/
def cutMoment1 (rate L : ℚ) (j a b k : ℕ) (p : List ℤ) : ℚ :=
  indexedSum (fun m (c : ℤ) => (c : ℚ) * RestrictedWick.cutoffInvariantMomentQ rate L a b j m) k p

def cutMoment2 (rate L : ℚ) (j a b : ℕ) (p : List (List ℤ)) : ℚ :=
  indexedSum (fun n row => cutMoment1 rate L j a n 0 row) b p

def cutMoment3 (rate L : ℚ) (j a : ℕ) (p : List (List (List ℤ))) : ℚ :=
  indexedSum (fun n row => cutMoment2 rate L j n 0 row) a p

/-- The rational cutoff moment after clearing the shared exponential factor. -/
def cutPhasePowerMoment (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (eps L : ℚ) (j : ℕ) : ℚ :=
  cutMoment3 (1 + 2 * (j : ℚ) * eps) L j 0 (pow3 (integerPhase ts) (2 * j)) /
    (GrotheKernel.commonDen ts : ℚ) ^ (2 * j)

/-- Normalization brings every cutoff monomial's integral back to a rational,
so the existing `integral_horner` theorem applies unchanged. -/
def cutMomentWeight (rate L : ℚ) (j a b k : ℕ) (u : ℂ × ℂ) : ℝ :=
  Real.exp ((rate : ℝ) * (L : ℝ)) * momentWeight rate j a b k u

theorem cutMoment1_spec {rate L : ℚ} (hrate : 0 < rate) (hL : 0 ≤ L)
    (j a b k : ℕ) (p : List ℤ) :
    Integrable (fun u => cutMomentWeight rate L j a b k u * he1 p (conj u.1 * u.2).re)
      (RestrictedWick.muCut (L : ℝ)) ∧
      (∫ u, cutMomentWeight rate L j a b k u * he1 p (conj u.1 * u.2).re
        ∂(RestrictedWick.muCut (L : ℝ))) = (cutMoment1 rate L j a b k p : ℝ) := by
  have hp : (0 : ℝ) < rate := by exact_mod_cast hrate
  have hcancel : Real.exp ((rate : ℝ) * (L : ℝ)) *
      Real.exp (-((rate : ℝ) * (L : ℝ))) = 1 := by
    rw [← Real.exp_add, add_neg_cancel, Real.exp_zero]
  unfold he1 cutMoment1
  refine integral_horner (α := ℤ) (RestrictedWick.muCut (L : ℝ))
    (fun u => (conj u.1 * u.2).re) (fun n => cutMomentWeight rate L j a b n)
    (fun c _ => (c : ℝ))
    (fun n c => (c : ℚ) * RestrictedWick.cutoffInvariantMomentQ rate L a b j n) ?_ ?_ ?_ p k
  · intro n u
    simp only [cutMomentWeight, momentWeight, invariantMonomial, pow_succ]
    ring
  · intro n c
    have hi := integrable_invariant_monomial_damped a b j n hp
    have hic : Integrable (fun u => momentWeight rate j a b n u)
        (RestrictedWick.muCut (L : ℝ)) := by
      rw [RestrictedWick.muCut, Measure.restrict_prod_eq_prod_univ]
      exact hi.mono_measure Measure.restrict_le_self
    simpa only [cutMomentWeight] using (hic.const_mul (Real.exp ((rate : ℝ) * (L : ℝ)))).mul_const (c : ℝ)
  · intro n c
    simp only [cutMomentWeight, momentWeight]
    rw [integral_mul_const, integral_const_mul,
      RestrictedWick.integral_cut_invariant rate L hrate hL a b j n]
    push_cast
    rw [← mul_assoc, hcancel, one_mul]
    ring

theorem cutMoment2_spec {rate L : ℚ} (hrate : 0 < rate) (hL : 0 ≤ L)
    (j a b : ℕ) (p : List (List ℤ)) :
    Integrable (fun u => cutMomentWeight rate L j a b 0 u *
      he2 p (Complex.normSq u.2) (conj u.1 * u.2).re) (RestrictedWick.muCut (L : ℝ)) ∧
      (∫ u, cutMomentWeight rate L j a b 0 u *
        he2 p (Complex.normSq u.2) (conj u.1 * u.2).re ∂(RestrictedWick.muCut (L : ℝ))) =
        (cutMoment2 rate L j a b p : ℝ) := by
  refine integral_horner (RestrictedWick.muCut (L : ℝ)) (fun u => Complex.normSq u.2)
    (fun n => cutMomentWeight rate L j a n 0)
    (fun row u => he1 row (conj u.1 * u.2).re)
    (fun n row => cutMoment1 rate L j a n 0 row) ?_ ?_ ?_ p b
  · intro n u
    simp only [cutMomentWeight, momentWeight, invariantMonomial, pow_succ]
    ring
  · intro n row
    exact (cutMoment1_spec hrate hL j a n 0 row).1
  · intro n row
    exact (cutMoment1_spec hrate hL j a n 0 row).2

theorem cutMoment3_spec {rate L : ℚ} (hrate : 0 < rate) (hL : 0 ≤ L)
    (j a : ℕ) (p : List (List (List ℤ))) :
    Integrable (fun u => cutMomentWeight rate L j a 0 0 u *
      he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re)
        (RestrictedWick.muCut (L : ℝ)) ∧
      (∫ u, cutMomentWeight rate L j a 0 0 u *
        he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re
          ∂(RestrictedWick.muCut (L : ℝ))) = (cutMoment3 rate L j a p : ℝ) := by
  refine integral_horner (RestrictedWick.muCut (L : ℝ)) (fun u => Complex.normSq u.1)
    (fun n => cutMomentWeight rate L j n 0 0)
    (fun row u => he2 row (Complex.normSq u.2) (conj u.1 * u.2).re)
    (fun n row => cutMoment2 rate L j n 0 row) ?_ ?_ ?_ p a
  · intro n u
    simp only [cutMomentWeight, momentWeight, invariantMonomial, pow_succ]
    ring
  · intro n row
    exact (cutMoment2_spec hrate hL j n 0 row).1
  · intro n row
    exact (cutMoment2_spec hrate hL j n 0 row).2

/-- The cutoff integral of any integer invariant polynomial, obtained using
`integral_horner` rather than expanding the concrete phase polynomial. -/
theorem integral_polynomial_cut_damped {rate L : ℚ} (hrate : 0 < rate) (hL : 0 ≤ L)
    (j : ℕ) (p : List (List (List ℤ))) :
    (∫ u : ℂ × ℂ, (conj u.1 * u.2).im ^ (2 * j) *
      Real.exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) *
      he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re
        ∂(RestrictedWick.muCut (L : ℝ))) =
      Real.exp (-((rate : ℝ) * (L : ℝ))) * (cutMoment3 rate L j 0 p : ℝ) := by
  have h := (cutMoment3_spec hrate hL j 0 p).2
  have heq : (fun u => cutMomentWeight rate L j 0 0 0 u *
      he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re) =
      fun u : ℂ × ℂ => Real.exp ((rate : ℝ) * (L : ℝ)) *
        ((conj u.1 * u.2).im ^ (2 * j) *
          Real.exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) *
          he3 p (Complex.normSq u.1) (Complex.normSq u.2) (conj u.1 * u.2).re) := by
    funext u
    simp only [cutMomentWeight, momentWeight, invariantMonomial, pow_zero, mul_one]
    ring
  rw [heq, integral_const_mul] at h
  have hc : Real.exp (-((rate : ℝ) * (L : ℝ))) *
      Real.exp ((rate : ℝ) * (L : ℝ)) = 1 := by
    rw [← Real.exp_add, neg_add_cancel, Real.exp_zero]
  calc
    _ = (Real.exp (-((rate : ℝ) * (L : ℝ))) *
        Real.exp ((rate : ℝ) * (L : ℝ))) * _ := by rw [hc, one_mul]
    _ = _ := by rw [mul_assoc, h]

/-- Finite exact cutoff moment for any rational term list and damping parameter. -/
theorem integral_phaseOfTerms_pow_cut {ts : List ((ℕ × ℕ × ℕ) × ℚ)}
    {eps L : ℚ} (heps : 0 < eps) (hL : 0 ≤ L) (j : ℕ) :
    (∫ u : ℂ × ℂ, phaseOfTerms ts eps u ^ (2 * j) ∂(RestrictedWick.muCut (L : ℝ))) =
      Real.exp (-(((1 + 2 * (j : ℚ) * eps : ℚ) : ℝ) * (L : ℝ))) *
        (cutPhasePowerMoment ts eps L j : ℝ) := by
  let rate : ℚ := 1 + 2 * (j : ℚ) * eps
  have hr : 0 < rate := by dsimp [rate]; positivity
  have hden : (GrotheKernel.commonDen ts : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.ne_of_gt (commonDen_pos ts))
  have hden' := pow_ne_zero (2 * j) hden
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
    rw [eq_div_iff hden', phaseOfTerms, mul_pow, mul_pow, he,
      e3_pow3, e3_integerPhase ts, mul_pow]
    ring
  simp_rw [hpoint]
  rw [integral_div, integral_polynomial_cut_damped hr hL]
  simp only [cutPhasePowerMoment, Rat.cast_div, Rat.cast_pow, Rat.cast_natCast]
  dsimp [rate]
  ring

/-- Exact finite squared-radius cutoff expression for the actual phase used by
the rounding; no numerical tail enclosure is asserted. -/
theorem integral_phiT_pow_even_cut (L : ℚ) (hL : 0 ≤ L) (j : ℕ) :
    (∫ u, phiT u ^ (2 * j) ∂(RestrictedWick.muCut (L : ℝ))) =
      Real.exp (-(((1 + 2 * (j : ℚ) * phaseEpsQ : ℚ) : ℝ) * (L : ℝ))) *
        (cutPhasePowerMoment phaseTerms phaseEpsQ L j : ℝ) := by
  have heps : (0 : ℚ) < phaseEpsQ := by norm_num [phaseEpsQ]
  simpa only [phaseOfTerms, Complex.normSq_eq_norm_sq, phiT, Sphase, Ssum] using
    integral_phaseOfTerms_pow_cut heps hL j

end
end Grothe.UpperChaos.PhaseMomentCheck
