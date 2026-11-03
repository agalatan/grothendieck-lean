import Grothe.UpperChaos.QuadraticPolynomialIntegrability
import Grothe.UpperChaos.OriginalHSGaussianMass
import Grothe.UpperChaos.ProductComplete

/-!
# Polynomial insertions into the full positive bipartite Gaussian

Agent-ID: codex-2ca4.

The exact Schur conditions give a positive coercive rate for all four complex
source variables before any integration. Every finite holomorphic polynomial
times the bipartite Gaussian is consequently square integrable. No moment,
source-space integrability, numerical cap, or operator identity is assumed.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.BipartitePolynomialL2

open QuadraticPolynomialIntegrability OriginalHSGaussianMass
open OriginalHSParameterGates OriginalHSQuadraticForms OriginalHSParameterSoundness

noncomputable section

abbrev PairSources := (ℂ × ℂ) × (ℂ × ℂ)
abbrev PairPowers := (ℕ × ℕ) × (ℕ × ℕ)
abbrev pairMeasure : Measure PairSources :=
  (gaussC.prod gaussC).prod (gaussC.prod gaussC)

def pairEnergy (z : ℂ × ℂ) : ℝ := Complex.normSq z.1 + Complex.normSq z.2

def sourceEnergy (zw : PairSources) : ℝ := pairEnergy zw.1 + pairEnergy zw.2

def image (p q r s : ℝ) (w : ℂ × ℂ) : ℂ × ℂ :=
  ((p : ℂ) * w.1 + (q : ℂ) * w.2, (r : ℂ) * w.1 + (s : ℂ) * w.2)

def coupling (p q r s : ℝ) (zw : PairSources) : ℂ :=
  (image p q r s zw.2).1 * zw.1.1 + (image p q r s zw.2).2 * zw.1.2

def residualRate (p q r s : ℝ) : ℝ :=
  coerciveRate (1 - p ^ 2 - r ^ 2) (-(p * q + r * s)) (1 - q ^ 2 - s ^ 2)

def sourceRate (p q r s : ℝ) : ℝ := min (1 / 2) (residualRate p q r s / 3)

def shiftedEnergy (p q r s : ℝ) (zw : PairSources) : ℝ :=
  Complex.normSq (zw.1.1 - conj (image p q r s zw.2).1) +
    Complex.normSq (zw.1.2 - conj (image p q r s zw.2).2)

theorem pairEnergy_nonneg (z : ℂ × ℂ) : 0 ≤ pairEnergy z :=
  add_nonneg (Complex.normSq_nonneg _) (Complex.normSq_nonneg _)

/-- The Schur remainder is exactly the accepted two-variable quadratic form. -/
theorem residual_identity (p q r s : ℝ) (w : ℂ × ℂ) :
    pairEnergy w - pairEnergy (image p q r s w) =
      quadraticForm (1 - p ^ 2 - r ^ 2) (-(p * q + r * s))
        (1 - q ^ 2 - s ^ 2) w.1 w.2 := by
  simp only [pairEnergy, image, quadraticForm, Complex.normSq_apply,
    Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.ofReal_re, Complex.ofReal_im, Complex.conj_re, Complex.conj_im]
  ring

/-- Exact completion of squares, with both source pairs retained. -/
theorem complete_square (p q r s : ℝ) (zw : PairSources) :
    sourceEnergy zw - 2 * (coupling p q r s zw).re =
      shiftedEnergy p q r s zw +
        (pairEnergy zw.2 - pairEnergy (image p q r s zw.2)) := by
  simp only [sourceEnergy, pairEnergy, coupling, shiftedEnergy,
    Complex.normSq_apply, Complex.sub_re, Complex.sub_im, Complex.add_re,
    Complex.mul_re, Complex.conj_re, Complex.conj_im]
  ring

/-- A triangular change of variables has an explicit elementary norm bound. -/
theorem sourceEnergy_le_shifted (p q r s : ℝ) (zw : PairSources) :
    sourceEnergy zw ≤ 2 * shiftedEnergy p q r s zw +
      2 * pairEnergy (image p q r s zw.2) + pairEnergy zw.2 := by
  have h1 := Complex.normSq_nonneg
    (zw.1.1 - 2 * conj (image p q r s zw.2).1)
  have h2 := Complex.normSq_nonneg
    (zw.1.2 - 2 * conj (image p q r s zw.2).2)
  simp only [sourceEnergy, pairEnergy, shiftedEnergy, Complex.normSq_apply,
    Complex.sub_re, Complex.sub_im, Complex.mul_re, Complex.mul_im,
    Complex.re_ofNat, Complex.im_ofNat, Complex.conj_re, Complex.conj_im] at *
  nlinarith

theorem sourceRate_pos {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) : 0 < sourceRate p q r s := by
  have hk : 0 < residualRate p q r s :=
    coerciveRate_pos hA (by simpa only [neg_sq] using hdet)
  exact lt_min (by norm_num) (div_pos hk (by norm_num))

/-- Full four-source coercivity follows from the original Schur threshold,
with no stronger gate or additional numerical margin. -/
theorem source_coercive {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) (zw : PairSources) :
    sourceRate p q r s * sourceEnergy zw ≤
      sourceEnergy zw - 2 * (coupling p q r s zw).re := by
  have hk : 0 < residualRate p q r s :=
    coerciveRate_pos hA (by simpa only [neg_sq] using hdet)
  have hr := quadraticForm_lower_bound hA
    (show 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (-(p * q + r * s)) ^ 2 by simpa only [neg_sq] using hdet) zw.2.1 zw.2.2
  change residualRate p q r s * pairEnergy zw.2 ≤ _ at hr
  rw [← residual_identity] at hr
  have hW := pairEnergy_nonneg zw.2
  have hM := pairEnergy_nonneg (image p q r s zw.2)
  have hD : 0 ≤ shiftedEnergy p q r s zw :=
    add_nonneg (Complex.normSq_nonneg _) (Complex.normSq_nonneg _)
  have hMle : pairEnergy (image p q r s zw.2) ≤ pairEnergy zw.2 := by
    have := mul_nonneg hk.le hW
    linarith
  have hsize := sourceEnergy_le_shifted p q r s zw
  have hsize' : sourceEnergy zw ≤
      2 * shiftedEnergy p q r s zw + 3 * pairEnergy zw.2 := by linarith
  have heps := (sourceRate_pos hA hdet).le
  have heps1 : 2 * sourceRate p q r s ≤ 1 := by
    have := min_le_left (1 / 2 : ℝ) (residualRate p q r s / 3)
    change sourceRate p q r s ≤ _ at this
    linarith
  have heps2 : 3 * sourceRate p q r s ≤ residualRate p q r s := by
    have := min_le_right (1 / 2 : ℝ) (residualRate p q r s / 3)
    change sourceRate p q r s ≤ _ at this
    linarith
  have hscale := mul_le_mul_of_nonneg_left hsize' heps
  have hDscale := mul_le_mul_of_nonneg_right heps1 hD
  have hWscale := mul_le_mul_of_nonneg_right heps2 hW
  rw [complete_square]
  nlinarith

/-- The complex Gaussian factor, before taking its squared norm. -/
def kernel (c : ℂ) (p q r s : ℝ) (zw : PairSources) : ℂ :=
  c * Complex.exp (coupling p q r s zw)

/-- The full kernel is bounded by a separable positive-rate Gaussian density. -/
theorem norm_kernel_sq_le (c : ℂ) {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) (zw : PairSources) :
    ‖kernel c p q r s zw‖ ^ 2 ≤ ‖c‖ ^ 2 *
      Real.exp (-(sourceRate p q r s - 1) * sourceEnergy zw) := by
  have h := source_coercive hA hdet zw
  simp only [kernel, norm_mul, mul_pow, Complex.norm_exp, ← Real.exp_nat_mul,
    Nat.cast_ofNat]
  apply mul_le_mul_of_nonneg_left _ (sq_nonneg _)
  apply Real.exp_le_exp.mpr
  nlinarith

/-- Unnormalized holomorphic source monomial in the gate's four-source order. -/
def monomial (e : PairPowers) (zw : PairSources) : ℂ :=
  (zw.1.1 ^ e.1.1 * zw.1.2 ^ e.1.2) *
    (zw.2.1 ^ e.2.1 * zw.2.2 ^ e.2.2)

def radialMonomial (e : PairPowers) (zw : PairSources) : ℝ :=
  (Complex.normSq zw.1.1 ^ e.1.1 * Complex.normSq zw.1.2 ^ e.1.2) *
    (Complex.normSq zw.2.1 ^ e.2.1 * Complex.normSq zw.2.2 ^ e.2.2)

private theorem norm_pow_sq (z : ℂ) (n : ℕ) :
    ‖z ^ n‖ ^ 2 = Complex.normSq z ^ n := by
  rw [norm_pow, ← pow_mul, Complex.normSq_eq_norm_sq, ← pow_mul, Nat.mul_comm]

theorem norm_monomial_sq (e : PairPowers) (zw : PairSources) :
    ‖monomial e zw‖ ^ 2 = radialMonomial e zw := by
  simp only [monomial, radialMonomial, norm_mul, mul_pow, norm_pow_sq]

theorem radialMonomial_nonneg (e : PairPowers) (zw : PairSources) :
    0 ≤ radialMonomial e zw := by
  rw [← norm_monomial_sq]
  exact sq_nonneg _

/-- The product majorant is integrable for every monomial and positive rate. -/
theorem integrable_radialMonomial_damped (e : PairPowers) {rate : ℝ}
    (hrate : 0 < rate) :
    Integrable (fun zw => radialMonomial e zw *
      Real.exp (-(rate - 1) * sourceEnergy zw)) pairMeasure := by
  have h := ((integrable_normSq_pow_damped e.1.1 hrate).mul_prod
    (integrable_normSq_pow_damped e.1.2 hrate)).mul_prod
      ((integrable_normSq_pow_damped e.2.1 hrate).mul_prod
        (integrable_normSq_pow_damped e.2.2 hrate))
  refine h.congr (Filter.Eventually.of_forall fun zw => ?_)
  simp only [radialMonomial, sourceEnergy, pairEnergy, mul_add, Real.exp_add]
  ring

/-- Every monomial insertion is square integrable at the exact Schur threshold. -/
theorem memLp_monomial_kernel (e : PairPowers) (c : ℂ) {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    MemLp (fun zw => monomial e zw * kernel c p q r s zw) 2 pairMeasure := by
  refine (memLp_two_iff_integrable_sq_norm (by
    unfold monomial kernel coupling image
    fun_prop)).2 ?_
  refine ((integrable_radialMonomial_damped e (sourceRate_pos hA hdet)).const_mul
    (‖c‖ ^ 2)).mono' (by unfold monomial kernel coupling image; fun_prop)
      (Filter.Eventually.of_forall fun zw => ?_)
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), norm_mul, mul_pow,
    norm_monomial_sq]
  have h := mul_le_mul_of_nonneg_left (norm_kernel_sq_le c hA hdet zw)
    (radialMonomial_nonneg e zw)
  simpa only [mul_assoc, mul_left_comm] using h

/-- Arbitrary finite polynomial insertion follows by actual L2 finite linearity. -/
theorem memLp_finite_polynomial_kernel {ι : Type*} (t : Finset ι)
    (d : ι → ℂ) (e : ι → PairPowers) (c : ℂ) {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    MemLp (fun zw => (∑ i ∈ t, d i * monomial (e i) zw) *
      kernel c p q r s zw) 2 pairMeasure := by
  have h := memLp_finsetSum t (fun i _ =>
    (memLp_monomial_kernel (e i) c hA hdet).const_mul (d i))
  refine MemLp.ae_eq (Filter.Eventually.of_forall fun zw => ?_) h
  simp only [Finset.sum_mul, mul_assoc]

/-- The checked production gate supplies the exact hypotheses of the generic theorem. -/
theorem memLp_gate_polynomial {ι : Type*} (t : Finset ι)
    (d : ι → ℂ) (e : ι → PairPowers) (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) :
    MemLp (fun zw => (∑ i ∈ t, d i * monomial (e i) zw) *
      kernel (nu g.power : ℂ) (matrix00 g) (matrix01 g side)
        (matrix10 g side) (matrix11 g side) zw) 2 pairMeasure := by
  apply memLp_finite_polynomial_kernel
  · rw [matrix_leadingRate_eq g hg side]
    exact leadingRate_pos g hg side
  · rw [matrix_determinant_eq g hg side]
    exact (pair_positive g hg side).determinant

/-- The actual checked scalar Gaussian kernel for one physical pair. -/
def gateKernel (g : Gate) (side : Fin 2) (zw : PairSources) : ℂ :=
  kernel (nu g.power : ℂ) (matrix00 g) (matrix01 g side)
    (matrix10 g side) (matrix11 g side) zw

theorem memLp_gate_monomial (e : PairPowers) (g : Gate)
    (hg : gateOK g = true) (side : Fin 2) :
    MemLp (fun zw => monomial e zw * gateKernel g side zw) 2 pairMeasure := by
  apply memLp_monomial_kernel
  · rw [matrix_leadingRate_eq g hg side]
    exact leadingRate_pos g hg side
  · rw [matrix_determinant_eq g hg side]
    exact (pair_positive g hg side).determinant

abbrev TensorSources := PairSources × PairSources
abbrev TensorPowers := PairPowers × PairPowers
abbrev tensorMeasure : Measure TensorSources := pairMeasure.prod pairMeasure

def tensorMonomial (e : TensorPowers) (zw : TensorSources) : ℂ :=
  monomial e.1 zw.1 * monomial e.2 zw.2

def tensorKernel (g : Gate) (zw : TensorSources) : ℂ :=
  gateKernel g 0 zw.1 * gateKernel g 1 zw.2

/-- Polynomial insertion across both physical pairs is genuinely L2. -/
theorem memLp_tensor_monomial (e : TensorPowers) (g : Gate)
    (hg : gateOK g = true) :
    MemLp (fun zw => tensorMonomial e zw * tensorKernel g zw) 2 tensorMeasure := by
  have h := ProductComplete.memLp_prod_mul
    (memLp_gate_monomial e.1 g hg 0) (memLp_gate_monomial e.2 g hg 1)
  refine MemLp.ae_eq (Filter.Eventually.of_forall fun zw => ?_) h
  dsimp only [tensorMonomial, tensorKernel]
  ring

/-- Every finite polynomial in all eight source coordinates is allowed.
The only premise is the existing checked gate, not a source-norm estimate. -/
theorem memLp_tensor_polynomial {ι : Type*} (t : Finset ι)
    (d : ι → ℂ) (e : ι → TensorPowers) (g : Gate) (hg : gateOK g = true) :
    MemLp (fun zw => (∑ i ∈ t, d i * tensorMonomial (e i) zw) *
      tensorKernel g zw) 2 tensorMeasure := by
  have h := memLp_finsetSum t (fun i _ =>
    (memLp_tensor_monomial (e i) g hg).const_mul (d i))
  refine MemLp.ae_eq (Filter.Eventually.of_forall fun zw => ?_) h
  simp only [Finset.sum_mul, mul_assoc]

end
end Grothe.UpperChaos.BipartitePolynomialL2
