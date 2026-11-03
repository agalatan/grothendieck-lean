import Grothe.UpperChaos.ScaledActualCoherentL2

/-!
# Rational source polynomial before the actual diagonal gate scaling

Agent-ID: codex-2ca4. Complete WIP proof bodies; compilation is pending.

The undamped production multiplier already has rational coefficients. Its
finite Gaussian moment recurrence can therefore be computed over rational
source polynomials before introducing the square roots of gate weights.
The theorem below identifies the resulting diagonal substitution with the
existing actualSourcePolynomial; no source-equality premise is introduced.

This is the source-polynomial part of rationalizing the source Gram value.
It does not assert that raw pair Gram entries are rational, or supply any
numerical source-norm enclosure. Their matching diagonal factors and the
rescaled pair moment evaluator remain separate obligations.
-/

open MvPolynomial

namespace Grothe.UpperChaos.ActualRationalSourcePolynomial

open ActualTaylorCoherent ScaledActualCoherentL2
open OriginalHSParameterGates OriginalHSQuadraticForms

noncomputable section

abbrev RationalSourcePolynomial := MvPolynomial (Fin 8) ℚ

/-- The exact rational radial rate, before casting into the analytic field. -/
def rateQ (power : ℕ) : ℚ := 1 + (power : ℚ) * Grothe.Upper.phaseEpsQ

theorem rateQ_cast (power : ℕ) : (rateQ power : ℝ) = rate power := by
  simp only [rateQ, rate, Rat.cast_add, Rat.cast_one, Rat.cast_mul, Rat.cast_natCast]

/-- The existing finite moment recurrence over a rational coefficient ring. -/
def liftedMomentQ (r : ℚ) (B : RationalSourcePolynomial) :
    ℕ → ℕ → Polynomial RationalSourcePolynomial
  | 0, q => Polynomial.C (MvPolynomial.C r⁻¹) ^ q * Polynomial.X ^ q
  | p + 1, q =>
      (liftedMomentQ r B p q).derivative +
        Polynomial.C (MvPolynomial.C r⁻¹ * B) * liftedMomentQ r B p q

def insertedPolynomialQ (r : ℚ) (A B : RationalSourcePolynomial)
    (p q : ℕ) : RationalSourcePolynomial :=
  (liftedMomentQ r B p q).eval A

/-- One rational source polynomial per actual Taylor power, independent of
the selected gate and with the literal production polynomial coefficients. -/
def rationalSourcePolynomial (power : ℕ) : RationalSourcePolynomial :=
  ∑ s ∈ (multiplierQ power).support,
    MvPolynomial.C ((multiplierQ power).coeff s) *
      (insertedPolynomialQ (rateQ power) (X 0 + X 1) (X 2 + X 3) (s 0) (s 1) *
       insertedPolynomialQ (rateQ power) (X 4 + X 5) (X 6 + X 7) (s 2) (s 3))

/-- The eight real diagonal factors in the original gate source order. -/
def sourceScale (g : Gate) : Fin 8 → ℝ :=
  ![Real.sqrt (g.r : ℝ), Real.sqrt (axisWeight g 0),
    Real.sqrt (g.r : ℝ), Real.sqrt (axisWeight g 1),
    Real.sqrt (g.r : ℝ), Real.sqrt (axisWeight g 2),
    Real.sqrt (g.r : ℝ), Real.sqrt (axisWeight g 3)]

/-- Cast rational coefficients and apply precisely the production diagonal scaling. -/
def scaleHom (g : Gate) : RationalSourcePolynomial →+* SourcePolynomial :=
  MvPolynomial.eval₂Hom (MvPolynomial.C.comp (Rat.castHom ℂ))
    (fun i => MvPolynomial.C (sourceScale g i : ℂ) * MvPolynomial.X i)

@[simp] theorem scaleHom_C (g : Gate) (r : ℚ) :
    scaleHom g (MvPolynomial.C r) = MvPolynomial.C (r : ℂ) := by
  simp [scaleHom]

@[simp] theorem scaleHom_X (g : Gate) (i : Fin 8) :
    scaleHom g (MvPolynomial.X i) =
      MvPolynomial.C (sourceScale g i : ℂ) * MvPolynomial.X i := by
  simp [scaleHom]

/-- Specializing the rational recurrence gives the original analytic recurrence. -/
theorem map_liftedMomentQ (g : Gate) (r : ℚ) (B : RationalSourcePolynomial)
    (p q : ℕ) :
    (liftedMomentQ r B p q).map (scaleHom g) =
      liftedMoment (r : ℝ) (scaleHom g B) p q := by
  have hcast : ((r : ℝ) : ℂ) = (r : ℂ) := by norm_cast
  induction p with
  | zero =>
      simp only [liftedMomentQ, liftedMoment, Polynomial.map_mul,
        Polynomial.map_pow, Polynomial.map_C, Polynomial.map_X, scaleHom_C,
        Rat.cast_inv, hcast]
  | succ p ih =>
      simp only [liftedMomentQ, liftedMoment, Polynomial.map_add,
        Polynomial.map_mul, Polynomial.map_C, ← Polynomial.derivative_map,
        ih, map_mul, scaleHom_C, Rat.cast_inv, hcast]

theorem map_insertedPolynomialQ (g : Gate) (r : ℚ)
    (A B : RationalSourcePolynomial) (p q : ℕ) :
    scaleHom g (insertedPolynomialQ r A B p q) =
      insertedPolynomial (r : ℝ) (scaleHom g A) (scaleHom g B) p q := by
  unfold insertedPolynomialQ insertedPolynomial
  rw [← Polynomial.eval₂_hom, Polynomial.eval₂_eq_eval_map, map_liftedMomentQ]

/-- The analytic production multiplier has exactly the rational support:
casting from rationals to complex numbers neither loses nor adds a term. -/
theorem multiplierPolynomial_support (power : ℕ) :
    (multiplierPolynomial power).support = (multiplierQ power).support := by
  unfold multiplierPolynomial
  exact MvPolynomial.support_map_of_injective _ (Rat.castHom ℂ).injective

/-- Exact reification of the actual source polynomial by diagonal substitution
of a finite rational polynomial. This holds for every gate, without assuming
gate positivity or a coefficient/source identity. -/
theorem scaleHom_rationalSourcePolynomial (g : Gate) :
    scaleHom g (rationalSourcePolynomial g.power) = actualSourcePolynomial g := by
  classical
  unfold rationalSourcePolynomial actualSourcePolynomial
  rw [multiplierPolynomial_support]
  simp only [map_sum, map_mul, scaleHom_C, map_insertedPolynomialQ, rateQ_cast,
    multiplierPolynomial, MvPolynomial.coeff_map]
  apply Finset.sum_congr rfl
  intro s hs
  simp only [map_add, scaleHom_X, sourceScale, xPolynomial, yPolynomial,
    uPolynomial, vPolynomial, Matrix.cons_val_zero, Matrix.cons_val_succ]

end
end Grothe.UpperChaos.ActualRationalSourcePolynomial
