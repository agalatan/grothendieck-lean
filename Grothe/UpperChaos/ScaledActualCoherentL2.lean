import Grothe.UpperChaos.ActualTaylorCoherent
import Grothe.UpperChaos.BipartitePolynomialL2
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.LinearCombination

/-!
# Source-space L2 of the scaled actual Taylor coherent transform

Agent-ID: codex-2ca4.

All eight source coordinates are in gate order: ((y,u),(x,v)) for each
physical coordinate. Outgoing sources are scaled by sqrt(R), and incoming
sources by their individual sqrt(axisWeight). The finite polynomial is
constructed over a source-polynomial coefficient ring, so its representation
is proved rather than assumed. The sole analytic premise is gateOK g = true.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ScaledActualCoherentL2

open ActualTaylorCoherent IndependentSourcePolynomial BipartitePolynomialL2
open OriginalHSParameterGates OriginalHSParameterSoundness OriginalHSQuadraticForms
open OriginalHSGaussianMass

noncomputable section

abbrev SourcePolynomial := MvPolynomial (Fin 8) ℂ

def coordinates (zw : TensorSources) : Fin 8 → ℂ :=
  ![zw.1.1.1, zw.1.1.2, zw.1.2.1, zw.1.2.2,
    zw.2.1.1, zw.2.1.2, zw.2.2.1, zw.2.2.2]

def powers (s : Fin 8 →₀ ℕ) : TensorPowers :=
  (((s 0, s 1), (s 2, s 3)), ((s 4, s 5), (s 6, s 7)))

private theorem eval_monomial_coordinates (zw : TensorSources)
    (s : Fin 8 →₀ ℕ) (c : ℂ) :
    MvPolynomial.eval (coordinates zw) (MvPolynomial.monomial s c) =
      c * tensorMonomial (powers s) zw := by
  simp only [MvPolynomial.eval_monomial, Finsupp.prod_pow, Fin.prod_univ_eight]
  simp only [coordinates, Matrix.cons_val_zero, Matrix.cons_val_succ,
    tensorMonomial, BipartitePolynomialL2.monomial, powers]
  ring

theorem eval_eq_support (P : SourcePolynomial) (zw : TensorSources) :
    MvPolynomial.eval (coordinates zw) P =
      ∑ s ∈ P.support, P.coeff s * tensorMonomial (powers s) zw := by
  classical
  have h := congrArg (MvPolynomial.eval (coordinates zw)) P.as_sum
  simpa only [map_sum, eval_monomial_coordinates] using h

/-- Every source polynomial is L2 against the full checked Gaussian tensor. -/
theorem memLp_eval_tensorKernel (P : SourcePolynomial) (g : Gate)
    (hg : gateOK g = true) :
    MemLp (fun zw => MvPolynomial.eval (coordinates zw) P * tensorKernel g zw)
      2 tensorMeasure := by
  simp_rw [eval_eq_support]
  exact memLp_tensor_polynomial P.support P.coeff powers g hg

/-- The moment recurrence lifted to polynomial coefficients in the actual
source variables. The outer polynomial variable is the first source. -/
def liftedMoment (r : ℝ) (B : SourcePolynomial) : ℕ → ℕ → Polynomial SourcePolynomial
  | 0, q => Polynomial.C (MvPolynomial.C ((r : ℂ)⁻¹)) ^ q * Polynomial.X ^ q
  | p + 1, q =>
      (liftedMoment r B p q).derivative +
        Polynomial.C (MvPolynomial.C ((r : ℂ)⁻¹) * B) * liftedMoment r B p q

/-- Specializing the coefficient ring recovers the already-proved recurrence. -/
theorem map_liftedMoment (r : ℝ) (B : SourcePolynomial) (v : Fin 8 → ℂ)
    (p q : ℕ) :
    (liftedMoment r B p q).map (MvPolynomial.eval v) =
      momentPolynomial r (MvPolynomial.eval v B) p q := by
  induction p with
  | zero => simp [liftedMoment, momentPolynomial]
  | succ p ih =>
    simp only [liftedMoment, momentPolynomial, Polynomial.map_add, Polynomial.map_mul,
      Polynomial.map_C, ← Polynomial.derivative_map, ih, map_mul, MvPolynomial.eval_C]
    rw [← Polynomial.C_mul, show (r : ℂ)⁻¹ * MvPolynomial.eval v B =
      MvPolynomial.eval v B / (r : ℂ) by simp only [div_eq_mul_inv]; ring]

/-- Substituting the first source produces a genuine finite source polynomial. -/
def insertedPolynomial (r : ℝ) (A B : SourcePolynomial) (p q : ℕ) : SourcePolynomial :=
  (liftedMoment r B p q).eval A

theorem eval_insertedPolynomial (r : ℝ) (A B : SourcePolynomial)
    (v : Fin 8 → ℂ) (p q : ℕ) :
    MvPolynomial.eval v (insertedPolynomial r A B p q) =
      (momentPolynomial r (MvPolynomial.eval v B) p q).eval (MvPolynomial.eval v A) := by
  have h := Polynomial.eval₂_at_apply (p := liftedMoment r B p q)
    (MvPolynomial.eval v) A
  rw [Polynomial.eval₂_eq_eval_map, map_liftedMoment] at h
  exact h.symm

/-- Gate source order: y0,u0,x0,v0,y1,u1,x1,v1. -/
def xPolynomial (g : Gate) : SourcePolynomial × SourcePolynomial :=
  (MvPolynomial.C (Real.sqrt (g.r : ℝ) : ℂ) * MvPolynomial.X 2,
    MvPolynomial.C (Real.sqrt (g.r : ℝ) : ℂ) * MvPolynomial.X 6)

def yPolynomial (g : Gate) : SourcePolynomial × SourcePolynomial :=
  (MvPolynomial.C (Real.sqrt (g.r : ℝ) : ℂ) * MvPolynomial.X 0,
    MvPolynomial.C (Real.sqrt (g.r : ℝ) : ℂ) * MvPolynomial.X 4)

def uPolynomial (g : Gate) : SourcePolynomial × SourcePolynomial :=
  (MvPolynomial.C (Real.sqrt (axisWeight g 0) : ℂ) * MvPolynomial.X 1,
    MvPolynomial.C (Real.sqrt (axisWeight g 2) : ℂ) * MvPolynomial.X 5)

def vPolynomial (g : Gate) : SourcePolynomial × SourcePolynomial :=
  (MvPolynomial.C (Real.sqrt (axisWeight g 1) : ℂ) * MvPolynomial.X 3,
    MvPolynomial.C (Real.sqrt (axisWeight g 3) : ℂ) * MvPolynomial.X 7)

def evalPair (P : SourcePolynomial × SourcePolynomial) (zw : TensorSources) : ℂ × ℂ :=
  (MvPolynomial.eval (coordinates zw) P.1, MvPolynomial.eval (coordinates zw) P.2)

/-- Finite source polynomial of the actual multiplier, including every rational
production term and the exact source scaling. -/
def actualSourcePolynomial (g : Gate) : SourcePolynomial :=
  ∑ s ∈ (multiplierPolynomial g.power).support,
    MvPolynomial.C ((multiplierPolynomial g.power).coeff s) *
      (insertedPolynomial (rate g.power)
        ((yPolynomial g).1 + (uPolynomial g).1)
        ((xPolynomial g).1 + (vPolynomial g).1) (s 0) (s 1) *
       insertedPolynomial (rate g.power)
        ((yPolynomial g).2 + (uPolynomial g).2)
        ((xPolynomial g).2 + (vPolynomial g).2) (s 2) (s 3))

theorem eval_actualSourcePolynomial (g : Gate) (zw : TensorSources) :
    MvPolynomial.eval (coordinates zw) (actualSourcePolynomial g) =
      coherentPolynomial g.power (evalPair (xPolynomial g) zw)
        (evalPair (yPolynomial g) zw) (evalPair (uPolynomial g) zw)
        (evalPair (vPolynomial g) zw) := by
  classical
  simp only [actualSourcePolynomial, coherentPolynomial, map_sum, map_mul,
    MvPolynomial.eval_C, eval_insertedPolynomial, map_add, evalPair]

def pairX (g : Gate) (zw : PairSources) : ℂ := (Real.sqrt (g.r : ℝ) : ℂ) * zw.2.1
def pairY (g : Gate) (zw : PairSources) : ℂ := (Real.sqrt (g.r : ℝ) : ℂ) * zw.1.1
def pairU (g : Gate) (side : Fin 2) (zw : PairSources) : ℂ :=
  (Real.sqrt (axisWeight g (2 * side.val)) : ℂ) * zw.1.2
def pairV (g : Gate) (side : Fin 2) (zw : PairSources) : ℂ :=
  (Real.sqrt (axisWeight g (2 * side.val + 1)) : ℂ) * zw.2.2

private theorem rate_eq (j : ℕ) : rate j = 1 + alpha j := by
  unfold rate alpha Grothe.Upper.phaseEpsQ
  push_cast
  ring

private theorem inv_rate_eq (j : ℕ) : (rate j : ℂ)⁻¹ = (nu j : ℂ) := by
  simp only [rate_eq, nu, Complex.ofReal_one,
    Complex.ofReal_add, one_div, Complex.ofReal_inv]

private theorem one_sub_nu_eq (j : ℕ) : 1 - nu j = damping j := by
  have hα : 0 ≤ alpha j := by unfold alpha; positivity
  have hn : 1 + alpha j ≠ 0 := by positivity
  simp only [damping, nu]
  field_simp [hn]
  ring

private theorem gaussianCoherent_eq (j : ℕ) (x y u v : ℂ) :
    gaussianCoherent (rate j) x y u v = (nu j : ℂ) * Complex.exp
      (-(damping j : ℂ) * (x * y + u * v) + (nu j : ℂ) * (x * u + y * v)) := by
  unfold gaussianCoherent
  rw [inv_rate_eq]
  have hd : (1 : ℂ) - (nu j : ℂ) = (damping j : ℂ) := by
    exact_mod_cast one_sub_nu_eq j
  rw [hd]

/-- Scaling and the gate's within-pair permutation reproduce its exact matrix. -/
theorem scaled_pair_coupling (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (zw : PairSources) :
    -(damping g.power : ℂ) * (pairX g zw * pairY g zw + pairU g side zw * pairV g side zw) +
      (nu g.power : ℂ) * (pairX g zw * pairU g side zw + pairY g zw * pairV g side zw) =
      coupling (matrix00 g) (matrix01 g side) (matrix10 g side) (matrix11 g side) zw := by
  have hR := (radial_pos g hg).le
  have hP := (axisWeight_pos g hg (2 * side.val)).le
  have hs : ((Real.sqrt (g.r : ℝ) : ℂ)) ^ 2 = ((g.r : ℝ) : ℂ) := by
    exact_mod_cast Real.sq_sqrt hR
  unfold pairX pairY pairU pairV coupling image matrix00 matrix01 matrix10 matrix11
  rw [Real.sqrt_mul hR, Real.sqrt_mul hR, Real.sqrt_mul hP]
  push_cast
  linear_combination -(damping g.power : ℂ) * zw.1.1 * zw.2.1 * hs

theorem scaled_pair_gaussian (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (zw : PairSources) :
    gaussianCoherent (rate g.power) (pairX g zw) (pairY g zw)
      (pairU g side zw) (pairV g side zw) = gateKernel g side zw := by
  rw [gaussianCoherent_eq, scaled_pair_coupling g hg side zw]
  rfl

private theorem eval_pair_sources (g : Gate) (zw : TensorSources) :
    evalPair (xPolynomial g) zw = (pairX g zw.1, pairX g zw.2) ∧
    evalPair (yPolynomial g) zw = (pairY g zw.1, pairY g zw.2) ∧
    evalPair (uPolynomial g) zw = (pairU g 0 zw.1, pairU g 1 zw.2) ∧
    evalPair (vPolynomial g) zw = (pairV g 0 zw.1, pairV g 1 zw.2) := by
  simp [evalPair, xPolynomial, yPolynomial, uPolynomial, vPolynomial,
    coordinates, pairX, pairY, pairU, pairV]

/-- The actual coherent integral after all outgoing/input weights are applied. -/
def scaledTransform (g : Gate) (zw : TensorSources) : ℂ :=
  ∫ physical, coherentIntegrand g.power (evalPair (xPolynomial g) zw)
    (evalPair (yPolynomial g) zw) (evalPair (uPolynomial g) zw)
    (evalPair (vPolynomial g) zw) physical ∂mu2

/-- Exact factorization retains the actual polynomial and both inverse-rate masses. -/
theorem scaledTransform_eq (g : Gate) (hg : gateOK g = true) (zw : TensorSources) :
    scaledTransform g zw =
      MvPolynomial.eval (coordinates zw) (actualSourcePolynomial g) * tensorKernel g zw := by
  unfold scaledTransform
  rw [integral_coherentIntegrand, ← eval_actualSourcePolynomial]
  rcases eval_pair_sources g zw with ⟨hx, hy, hu, hv⟩
  rw [hx, hy, hu, hv]
  simp only [scaled_pair_gaussian g hg, tensorKernel]
  ring

/-- Source-space square integrability of the scaled actual multiplier follows
from the original checked gate. No source-norm or HS bound is a premise. -/
theorem memLp_scaledTransform (g : Gate) (hg : gateOK g = true) :
    MemLp (scaledTransform g) 2 tensorMeasure := by
  exact MemLp.ae_eq
    (Filter.Eventually.of_forall fun zw => (scaledTransform_eq g hg zw).symm)
    (memLp_eval_tensorKernel (actualSourcePolynomial g) g hg)

end
end Grothe.UpperChaos.ScaledActualCoherentL2
