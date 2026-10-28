import Grothe.UpperChaos.RationalWickParity

/-!
# Exact elimination of the square root in production Wick polynomials

The compiler output has only even powers of its radius variable. Halving those
exponents gives a rational polynomial evaluated at the squared radius. This
identity holds also at radius zero and requires no numerical approximation.

Agent-ID: codex-2ca4
-/

open MvPolynomial

namespace Grothe.UpperChaos.RationalSquaredRadius
open RationalWickMonomial RationalWickCompiler RationalWickParity
open RationalUnitTaylorSource
noncomputable section

/-- Replace every radius exponent by half its value. Correctness on even-radius
polynomials is proved below; the remaining three exponents are unchanged. -/
def squareRadiusQ (P : WickPoly) : WickPoly :=
  ∑ d ∈ P.support, monomial (d.update 0 (d 0 / 2)) (P.coeff d)

theorem evalWickQ_monomial (d : Fin 4 →₀ ℕ) (a : ℚ) (r b v κ : ℝ) :
    evalWickQ r b v κ (monomial d a) =
      (a : ℝ) * (r ^ d 0 * (b ^ d 1 * (v ^ d 2 * κ ^ d 3))) := by
  rw [evalWickQ, eval₂Hom_monomial,
    Finsupp.prod_fintype _ _ (fun _ => pow_zero _)]
  simp [Fin.prod_univ_succ]

/-- Halving even radius exponents preserves exact evaluation at the squared radius. -/
theorem eval_squareRadiusQ {P : WickPoly} (hP : RadiusParity P 0)
    (r b v κ : ℝ) :
    evalWickQ r b v κ P = evalWickQ (r ^ 2) b v κ (squareRadiusQ P) := by
  classical
  calc
    evalWickQ r b v κ P =
        ∑ d ∈ P.support, evalWickQ r b v κ (monomial d (P.coeff d)) := by
      conv_lhs => rw [P.as_sum]
      rw [map_sum]
    _ = _ := by
      unfold squareRadiusQ
      rw [map_sum]
      apply Finset.sum_congr rfl
      intro d hd
      have he : 2 * (d 0 / 2) = d 0 :=
        Nat.mul_div_cancel' (two_dvd_radius_exponent hP hd)
      have hp : (r ^ 2) ^ (d 0 / 2) = r ^ d 0 := by
        rw [← pow_mul, he]
      rw [evalWickQ_monomial, evalWickQ_monomial]
      simp [Finsupp.update_apply, hp]

/-- The actual source's rational compiler is exactly a squared-radius polynomial,
for every phase list, Taylor order and Hermite mode. -/
theorem eval_unitWickQ_sq (ts : List ((ℕ × ℕ × ℕ) × ℚ)) {N : ℕ}
    (i : GradedIdx N) (j : ℕ) (r b v κ : ℝ) :
    evalWickQ r b v κ (wickCompileQ (unitSourceQ ts i j)) =
      evalWickQ (r ^ 2) b v κ (squareRadiusQ (wickCompileQ (unitSourceQ ts i j))) :=
  eval_squareRadiusQ (radiusParity_unitWickQ ts i j) r b v κ

/-- The production evaluator at `sqrt s` contains no residual square root after
the exact polynomial conversion, including at the boundary `s = 0`. -/
theorem eval_unitWickQ_sqrt (ts : List ((ℕ × ℕ × ℕ) × ℚ)) {N : ℕ}
    (i : GradedIdx N) (j : ℕ) (s b v κ : ℝ) (hs : 0 ≤ s) :
    evalWickQ (Real.sqrt s) b v κ (wickCompileQ (unitSourceQ ts i j)) =
      evalWickQ s b v κ (squareRadiusQ (wickCompileQ (unitSourceQ ts i j))) := by
  rw [eval_unitWickQ_sq, Real.sq_sqrt hs]

end
end Grothe.UpperChaos.RationalSquaredRadius
