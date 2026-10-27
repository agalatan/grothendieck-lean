import Grothe.HJM.OriginTail
import Grothe.HJM.OriginPanelBudget
import Grothe.HJM.OriginPhaseCoefficients
import Grothe.HJM.OriginWitnessData

/-!
# Finite test vectors for actual visible origin energy

Agent-ID: codex-aa04. Numerical correlation bounds remain explicit inputs.

One signed correlation certifies the energy of an entire finite spectral
prefix. The test need not enclose each coefficient separately. Perturbation
is charged to the same Gaussian response in L², with the original degree.
-/

open MeasureTheory Finset Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

def visibleEnergy (R : Lp ℂ 2 gaussC) (N : ℕ) : ℝ :=
  ∑ n ∈ range N, (2 * (n : ℝ) + 1) ^ 2 * ‖chargeOneCoeff R n‖ ^ 2

def testMass (y : ℕ → ℂ) (N : ℕ) : ℝ := ∑ n ∈ range N, ‖y n‖ ^ 2

def testCorrelation (y : ℕ → ℂ) (R : Lp ℂ 2 gaussC) (N : ℕ) : ℂ :=
  ∑ n ∈ range N, conj (y n) * ((2 * (n : ℝ) + 1 : ℝ) : ℂ) * chargeOneCoeff R n

theorem visibleEnergy_nonneg (R : Lp ℂ 2 gaussC) (N : ℕ) : 0 ≤ visibleEnergy R N := by
  exact sum_nonneg fun n _ => mul_nonneg (sq_nonneg _) (sq_nonneg _)

theorem testMass_nonneg (y : ℕ → ℂ) (N : ℕ) : 0 ≤ testMass y N := by
  exact sum_nonneg fun n _ => sq_nonneg _

/-- The finite signed test is evaluated before taking its norm. -/
theorem testCorrelation_le_sqrt (y : ℕ → ℂ) (R : Lp ℂ 2 gaussC) (N : ℕ) :
    (testCorrelation y R N).re ≤ Real.sqrt (testMass y N) * Real.sqrt (visibleEnergy R N) := by
  calc
    _ ≤ ‖testCorrelation y R N‖ := Complex.re_le_norm _
    _ ≤ ∑ n ∈ range N, ‖conj (y n) * ((2 * (n : ℝ) + 1 : ℝ) : ℂ) * chargeOneCoeff R n‖ :=
      norm_sum_le _ _
    _ = ∑ n ∈ range N, ‖y n‖ * ((2 * (n : ℝ) + 1) * ‖chargeOneCoeff R n‖) := by
      apply sum_congr rfl
      intro n _hn
      simp only [norm_mul, Complex.norm_conj, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (by positivity : (0 : ℝ) ≤ 2 * (n : ℝ) + 1)]
      ring
    _ ≤ _ := by
      simpa only [testMass, visibleEnergy, mul_pow] using
        Real.sum_mul_le_sqrt_mul_sqrt (range N) (fun n => ‖y n‖)
          (fun n => (2 * (n : ℝ) + 1) * ‖chargeOneCoeff R n‖)

/-- A lower correlation enclosure and an upper test-mass enclosure imply a
visible-energy lower bound by one exact rational comparison. -/
theorem visibleEnergy_ge_of_test (y : ℕ → ℂ) (R : Lp ℂ 2 gaussC) (N : ℕ)
    (B L V : ℝ) (hB : 0 < B) (hL : 0 ≤ L)
    (hmass : testMass y N ≤ B) (hcorr : L ≤ (testCorrelation y R N).re)
    (harith : B * V ≤ L ^ 2) : V ≤ visibleEnergy R N := by
  have h := hcorr.trans (testCorrelation_le_sqrt y R N)
  have hsq : L ^ 2 ≤ testMass y N * visibleEnergy R N := by
    have hh := (sq_le_sq₀ hL (mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _))).mpr h
    simpa only [mul_pow, Real.sq_sqrt (testMass_nonneg y N),
      Real.sq_sqrt (visibleEnergy_nonneg R N)] using hh
  have hmass' := mul_le_mul_of_nonneg_right hmass (visibleEnergy_nonneg R N)
  exact le_of_mul_le_mul_left (harith.trans (hsq.trans hmass')) hB

def weightedTest (y : ℕ → ℂ) (N : ℕ) : Lp ℂ 2 gaussC :=
  ∑ n ∈ range N, (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * y n) • chargeOneMode n

/-- The norm of the test is computed in the actual charge-one Hermite basis. -/
theorem weightedTest_norm_sq (y : ℕ → ℂ) (N : ℕ) :
    ‖weightedTest y N‖ ^ 2 =
      ∑ n ∈ range N, (2 * (n : ℝ) + 1) ^ 2 * ‖y n‖ ^ 2 := by
  let b : ℕ → ℂ := fun n => ((2 * (n : ℝ) + 1 : ℝ) : ℂ) * y n
  have hb : weightedTest y N = ∑ n ∈ range N, b n • chargeOneMode n := rfl
  have hsq : ‖weightedTest y N‖ ^ 2 = ∑ n ∈ range N, ‖b n‖ ^ 2 := by
    rw [hb, @InnerProductSpace.norm_sq_eq_re_inner ℂ]
    rw [show (inner ℂ (∑ n ∈ range N, b n • chargeOneMode n)
        (∑ n ∈ range N, b n • chargeOneMode n)) =
        ∑ n ∈ range N, conj (b n) * b n from
          orthonormal_chargeOneMode.inner_sum b b (range N)]
    simp [Complex.sq_norm, Complex.normSq_apply]
  rw [hsq]
  apply sum_congr rfl
  intro n _hn
  simp only [b, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (by positivity : (0 : ℝ) ≤ 2 * (n : ℝ) + 1), mul_pow]

/-- The original degree gives a uniform norm bound on a finite test. -/
theorem weightedTest_norm_sq_le (y : ℕ → ℂ) (N : ℕ) :
    ‖weightedTest y N‖ ^ 2 ≤ (2 * (N : ℝ) - 1) ^ 2 * testMass y N := by
  rw [weightedTest_norm_sq]
  calc
    _ ≤ ∑ n ∈ range N, (2 * (N : ℝ) - 1) ^ 2 * ‖y n‖ ^ 2 := by
      apply sum_le_sum
      intro n hn
      have hnreal : (n : ℝ) + 1 ≤ N := by
        exact_mod_cast (Nat.succ_le_of_lt (mem_range.mp hn))
      apply mul_le_mul_of_nonneg_right _ (sq_nonneg _)
      exact pow_le_pow_left₀ (by positivity) (by linarith) 2
    _ = _ := by rw [testMass, mul_sum]

/-- A mass bound below 12 suffices to bound the weighted test norm by 830 at
the HJM cutoff. This bound is deliberately independent of the coefficient
table and is wide enough for the rational test vectors. -/
theorem weightedTest_norm_le_830 (y : ℕ → ℂ) (hmass : testMass y 120 ≤ 12) :
    ‖weightedTest y 120‖ ≤ 830 := by
  have h := weightedTest_norm_sq_le y 120
  have hmass' := mul_le_mul_of_nonneg_left hmass (sq_nonneg (2 * (120 : ℝ) - 1))
  have hn := norm_nonneg (weightedTest y 120)
  norm_num at h hmass'
  nlinarith

/-- Scaling the coefficients by `sqrt(n+1)` makes test mass a rational
weighted norm when the underlying coefficients are complex rationals. -/
def laguerreTest (a : ℕ → ℂ) (n : ℕ) : ℂ :=
  (Real.sqrt ((n : ℝ) + 1) : ℂ) * a n

theorem laguerreTest_mass (a : ℕ → ℂ) (N : ℕ) :
    testMass (laguerreTest a) N = ∑ n ∈ range N, ((n : ℝ) + 1) * ‖a n‖ ^ 2 := by
  unfold testMass
  apply sum_congr rfl
  intro n _hn
  simp only [laguerreTest, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (Real.sqrt_nonneg _), mul_pow,
    Real.sq_sqrt (by positivity : (0 : ℝ) ≤ (n : ℝ) + 1)]

/-- A rational list supplies the test vector; out-of-range indices use zero. -/
def rationalAlpha (xs : List (ℚ × ℚ)) (n : ℕ) : ℂ :=
  (((xs.getD n (0, 0)).1 : ℝ) : ℂ) +
    Complex.I * (((xs.getD n (0, 0)).2 : ℝ) : ℂ)

theorem rationalAlpha_norm_sq (xs : List (ℚ × ℚ)) (n : ℕ) :
    ‖rationalAlpha xs n‖ ^ 2 =
      ((((xs.getD n (0, 0)).1 ^ 2 + (xs.getD n (0, 0)).2 ^ 2 : ℚ)) : ℝ) := by
  rw [← Complex.normSq_eq_norm_sq]
  simp only [rationalAlpha, Complex.normSq_apply, Complex.add_re, Complex.add_im,
    Complex.mul_re, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
    Complex.I_re, Complex.I_im, zero_mul, mul_zero, one_mul, sub_zero, zero_add]
  push_cast
  ring

private theorem rational_list_sum_range (f : ℕ → ℚ) : ∀ k : ℕ,
    ((List.range k).map f).sum = ∑ n ∈ range k, f n
  | 0 => by simp
  | k + 1 => by
    rw [List.range_succ, List.map_append, List.sum_append,
      rational_list_sum_range f k, sum_range_succ]
    simp

/-- The executable rational mass checker is exactly the actual Hermite-basis
test mass; no unproved numerical table claim is used. -/
theorem rationalAlpha_testMass (xs : List (ℚ × ℚ)) :
    testMass (laguerreTest (rationalAlpha xs)) 120 = (OriginWitnessData.mass xs : ℝ) := by
  rw [laguerreTest_mass]
  unfold OriginWitnessData.mass
  rw [rational_list_sum_range]
  push_cast
  apply sum_congr rfl
  intro n _hn
  simp only [rationalAlpha_norm_sq, Rat.cast_add, Rat.cast_pow]

def leftRationalWitness : ℕ → ℂ := laguerreTest (rationalAlpha OriginWitnessData.leftAlpha)
def rightRationalWitness : ℕ → ℂ := laguerreTest (rationalAlpha OriginWitnessData.rightAlpha)

theorem leftRationalWitness_mass :
    testMass leftRationalWitness 120 ≤ (OriginWitnessData.leftMassCap : ℝ) := by
  rw [leftRationalWitness, rationalAlpha_testMass]
  exact Rat.cast_le.mpr OriginWitnessData.left_mass_check

theorem rightRationalWitness_mass :
    testMass rightRationalWitness 120 ≤ (OriginWitnessData.rightMassCap : ℝ) := by
  rw [rightRationalWitness, rationalAlpha_testMass]
  exact Rat.cast_le.mpr OriginWitnessData.right_mass_check

/-- The positive rational central-binomial ratio `(1/2)_n / n!`, defined
by the elementary recurrence used by the endpoint moment certificate. -/
def phaseRatio : ℕ → ℚ
  | 0 => 1
  | n + 1 => phaseRatio n * ((2 * (n : ℚ) + 1) / (2 * ((n : ℚ) + 1)))

theorem phaseRatio_pos (n : ℕ) : 0 < phaseRatio n := by
  induction n with
  | zero => norm_num [phaseRatio]
  | succ n ih =>
    rw [phaseRatio]
    positivity

/-- The accepted Haagerup recurrence is the square of the central-binomial
recurrence divided by `n+1`. -/
theorem haagR_eq_phaseRatio_sq (n : ℕ) :
    haagR n * ((n : ℚ) + 1) = phaseRatio n ^ 2 := by
  induction n with
  | zero => norm_num [haagR, phaseRatio]
  | succ n ih =>
    have h1 : (n : ℚ) + 1 ≠ 0 := by positivity
    have h2 : (n : ℚ) + 2 ≠ 0 := by positivity
    calc
      haagR (n + 1) * (((n + 1 : ℕ) : ℚ) + 1) =
          (haagR n * ((n : ℚ) + 1)) *
            ((2 * (n : ℚ) + 1) / (2 * ((n : ℚ) + 1))) ^ 2 := by
        rw [haagR]
        push_cast
        field_simp [h1, h2]
        ring
      _ = phaseRatio (n + 1) ^ 2 := by rw [ih, phaseRatio]; ring

/-- The signed endpoint coefficient has a common scalar `sqrt(π/4)` and
an exact rational factor after multiplication by `sqrt(n+1)`. -/
theorem phaseCoeff_sqrt_index (n : ℕ) :
    (Real.sqrt ((n : ℝ) + 1) : ℂ) * chargeOneCoeff Grothe.Haag.phaseLp n =
      (((Real.sqrt (Real.pi / 4) * ((-1 : ℝ) ^ n * (phaseRatio n : ℝ)) : ℝ)) : ℂ) := by
  have hr : (0 : ℝ) ≤ (phaseRatio n : ℝ) := by exact_mod_cast (phaseRatio_pos n).le
  have hrat : (haagR n : ℝ) * ((n : ℝ) + 1) = (phaseRatio n : ℝ) ^ 2 := by
    exact_mod_cast haagR_eq_phaseRatio_sq n
  have hsq : (Real.sqrt ((n : ℝ) + 1) * Real.sqrt (haagCoeff n)) ^ 2 =
      (Real.sqrt (Real.pi / 4) * (phaseRatio n : ℝ)) ^ 2 := by
    rw [mul_pow, mul_pow, Real.sq_sqrt (by positivity : (0 : ℝ) ≤ (n : ℝ) + 1),
      Real.sq_sqrt (haagCoeff_nonneg n), Real.sq_sqrt (by positivity : (0 : ℝ) ≤ Real.pi / 4)]
    calc
      _ = (Real.pi / 4) * ((haagR n : ℝ) * ((n : ℝ) + 1)) := by
        rw [haagCoeff]
        ring
      _ = _ := by rw [hrat]
  have hmag : Real.sqrt ((n : ℝ) + 1) * Real.sqrt (haagCoeff n) =
      Real.sqrt (Real.pi / 4) * (phaseRatio n : ℝ) :=
    (sq_eq_sq₀ (mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _))
      (mul_nonneg (Real.sqrt_nonneg _) hr)).mp hsq
  have hsigned : Real.sqrt ((n : ℝ) + 1) * ((-1 : ℝ) ^ n * Real.sqrt (haagCoeff n)) =
      Real.sqrt (Real.pi / 4) * ((-1 : ℝ) ^ n * (phaseRatio n : ℝ)) := by
    calc
      _ = (-1 : ℝ) ^ n * (Real.sqrt ((n : ℝ) + 1) * Real.sqrt (haagCoeff n)) := by ring
      _ = _ := by rw [hmag]; ring
  simpa only [phase_chargeOneCoeff_eq_signed_sqrt, Complex.ofReal_mul] using
    congrArg (fun x : ℝ => (x : ℂ)) hsigned

theorem testCorrelation_eq_inner (y : ℕ → ℂ) (R : Lp ℂ 2 gaussC) (N : ℕ) :
    testCorrelation y R N = ⟪weightedTest y N, R⟫_ℂ := by
  simp only [weightedTest, sum_inner, inner_smul_left, map_mul, Complex.conj_ofReal,
    chargeOneCoeff, testCorrelation]
  apply sum_congr rfl
  intro n _hn
  ring

/-- The normalized Laguerre correlation isolates the factor `sqrt(n+1)`
which cancels the actual Hermite radial normalization. -/
theorem laguerreTest_correlation (a : ℕ → ℂ) (V : Lp ℂ 2 gaussC) (N : ℕ) :
    testCorrelation (laguerreTest a) V N =
      ∑ n ∈ range N, (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (a n)) *
        ((Real.sqrt ((n : ℝ) + 1) : ℂ) * chargeOneCoeff V n) := by
  unfold testCorrelation laguerreTest
  apply sum_congr rfl
  intro n _hn
  simp only [map_mul, Complex.conj_ofReal]
  ring

/-- The endpoint contribution is an exact finite sum of rational
central-binomial ratios with the original alternating Hermite signs. -/
theorem laguerreTest_phaseCorrelation (a : ℕ → ℂ) (N : ℕ) :
    testCorrelation (laguerreTest a) Grothe.Haag.phaseLp N =
      (Real.sqrt (Real.pi / 4) : ℂ) *
        ∑ n ∈ range N, ((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (a n) *
          ((((-1 : ℝ) ^ n * (phaseRatio n : ℝ) : ℝ)) : ℂ) := by
  calc
    _ = ∑ n ∈ range N, (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (a n)) *
        ((Real.sqrt ((n : ℝ) + 1) : ℂ) * chargeOneCoeff Grothe.Haag.phaseLp n) :=
      laguerreTest_correlation a Grothe.Haag.phaseLp N
    _ = ∑ n ∈ range N, (((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (a n)) *
        ((Real.sqrt (Real.pi / 4) : ℂ) *
          ((((-1 : ℝ) ^ n * (phaseRatio n : ℝ) : ℝ)) : ℂ)) := by
      apply sum_congr rfl
      intro n _hn
      rw [phaseCoeff_sqrt_index, Complex.ofReal_mul]
    _ = _ := by
      rw [mul_sum]
      apply sum_congr rfl
      intro n _hn
      ring

/-- Endpoint subtraction stays signed through the finite correlation. -/
theorem testCorrelation_sub_phase (y : ℕ → ℂ) (V : Lp ℂ 2 gaussC) (u : ℂ) (N : ℕ) :
    testCorrelation y (V - u • Grothe.Haag.phaseLp) N =
      testCorrelation y V N - u * testCorrelation y Grothe.Haag.phaseLp N := by
  unfold testCorrelation
  rw [mul_sum, ← sum_sub_distrib]
  apply sum_congr rfl
  intro n _hn
  rw [chargeOneCoeff_sub]
  simp only [chargeOneCoeff, inner_smul_right]
  ring

/-- Concrete form consumed by a polynomial Gaussian moment enclosure: only
the approximation's test correlation is integrated numerically, and the
subtracted phase contribution is the explicit signed rational sum. -/
theorem laguerreTest_approxResidualCorrelation
    (a : ℕ → ℂ) (V : Lp ℂ 2 gaussC) (u : ℂ) (N : ℕ) :
    testCorrelation (laguerreTest a) (V - u • Grothe.Haag.phaseLp) N =
      testCorrelation (laguerreTest a) V N - u *
        ((Real.sqrt (Real.pi / 4) : ℂ) *
          ∑ n ∈ range N, ((2 * (n : ℝ) + 1 : ℝ) : ℂ) * conj (a n) *
            ((((-1 : ℝ) ^ n * (phaseRatio n : ℝ) : ℝ)) : ℂ)) := by
  rw [testCorrelation_sub_phase, laguerreTest_phaseCorrelation]

/-- A single response approximation controls this complete finite signed test.
The endpoint term is identical on both sides and cancels exactly. -/
theorem testCorrelation_error (y : ℕ → ℂ) (F V U : Lp ℂ 2 gaussC) (N : ℕ)
    (δ : ℝ) (hclose : ‖F - V‖ ≤ δ) :
    |(testCorrelation y (F - U) N).re - (testCorrelation y (V - U) N).re| ≤
      ‖weightedTest y N‖ * δ := by
  rw [testCorrelation_eq_inner, testCorrelation_eq_inner]
  have he : ⟪weightedTest y N, F - U⟫_ℂ - ⟪weightedTest y N, V - U⟫_ℂ =
      ⟪weightedTest y N, F - V⟫_ℂ := by
    simp only [inner_sub_right]
    ring
  rw [← Complex.sub_re, he]
  exact (Complex.abs_re_le_norm _).trans
    ((norm_inner_le_norm _ _).trans
      (mul_le_mul_of_nonneg_left hclose (norm_nonneg _)))

/-- The left actual response and its polynomial approximation give the same
signed finite test up to a single Gaussian L² error. -/
theorem left_testCorrelation_error (y : ℕ → ℂ) (N : ℕ) :
    |(testCorrelation y fResidualLp N).re -
      (testCorrelation y (OriginPanels.leftApproxLp - f 0 • Grothe.Haag.phaseLp) N).re| ≤
        ‖weightedTest y N‖ * (OriginPanels.responseError : ℝ) := by
  simpa only [fResidualLp_eq_sub] using
    testCorrelation_error y FLp OriginPanels.leftApproxLp (f 0 • Grothe.Haag.phaseLp) N
      OriginPanels.responseError OriginPanels.leftApprox_norm_error

/-- The corresponding estimate uses the same shared cutoff and budget on the right. -/
theorem right_testCorrelation_error (y : ℕ → ℂ) (N : ℕ) :
    |(testCorrelation y gResidualLp N).re -
      (testCorrelation y (OriginPanels.rightApproxLp - g 0 • Grothe.Haag.phaseLp) N).re| ≤
        ‖weightedTest y N‖ * (OriginPanels.responseError : ℝ) := by
  simpa only [gResidualLp_eq_sub] using
    testCorrelation_error y GLp OriginPanels.rightApproxLp (g 0 • Grothe.Haag.phaseLp) N
      OriginPanels.responseError OriginPanels.rightApprox_norm_error

theorem witnessError_le_one_hundred_millionth (y : ℕ → ℂ) (hmass : testMass y 120 ≤ 12) :
    ‖weightedTest y 120‖ * (OriginPanels.responseError : ℝ) ≤ (1 / 10 ^ 8 : ℝ) := by
  have hn := weightedTest_norm_le_830 y hmass
  have he : (0 : ℝ) ≤ OriginPanels.responseError := by norm_num [OriginPanels.responseError]
  have h := mul_le_mul_of_nonneg_right hn he
  norm_num [OriginPanels.responseError] at h ⊢
  linarith

theorem left_visibleEnergy_eq (N : ℕ) :
    visibleEnergy fResidualLp N = ∑ n ∈ range N, leftEnergyTerm n := rfl

theorem right_visibleEnergy_eq (N : ℕ) :
    visibleEnergy gResidualLp N = ∑ n ∈ range N, rightEnergyTerm n := rfl

/-- Four concrete scalar conditions suffice for the left visible-energy target:
the mass is bounded by B ≤ 12, and a single signed correlation is bounded
below after paying the universal 10⁻⁸ approximation allowance. -/
theorem left_visibleEnergy_of_witness (y : ℕ → ℂ) (B L : ℝ)
    (hB : 0 < B) (hB12 : B ≤ 12) (hL : 0 ≤ L)
    (hmass : testMass y 120 ≤ B)
    (hcorr : L + (1 / 10 ^ 8 : ℝ) ≤
      (testCorrelation y (OriginPanels.leftApproxLp - f 0 • Grothe.Haag.phaseLp) 120).re)
    (harith : B * (23 / 2 : ℝ) ≤ L ^ 2) :
    (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, leftEnergyTerm n := by
  have he := (left_testCorrelation_error y 120).trans
    (witnessError_le_one_hundred_millionth y (hmass.trans hB12))
  have hc : L ≤ (testCorrelation y fResidualLp 120).re := by
    have hl := (abs_le.mp he).1
    linarith
  rw [← left_visibleEnergy_eq]
  exact visibleEnergy_ge_of_test y fResidualLp 120 B L (23 / 2) hB hL hmass hc harith

/-- The same single-correlation interface for the asymmetric right response. -/
theorem right_visibleEnergy_of_witness (y : ℕ → ℂ) (B L : ℝ)
    (hB : 0 < B) (hB12 : B ≤ 12) (hL : 0 ≤ L)
    (hmass : testMass y 120 ≤ B)
    (hcorr : L + (1 / 10 ^ 8 : ℝ) ≤
      (testCorrelation y (OriginPanels.rightApproxLp - g 0 • Grothe.Haag.phaseLp) 120).re)
    (harith : B * (23 / 2 : ℝ) ≤ L ^ 2) :
    (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, rightEnergyTerm n := by
  have he := (right_testCorrelation_error y 120).trans
    (witnessError_le_one_hundred_millionth y (hmass.trans hB12))
  have hc : L ≤ (testCorrelation y gResidualLp 120).re := by
    have hl := (abs_le.mp he).1
    linarith
  rw [← right_visibleEnergy_eq]
  exact visibleEnergy_ge_of_test y gResidualLp 120 B L (23 / 2) hB hL hmass hc harith

/-- The checked left witness reduces the visible-energy certificate to one
signed correlation of the polynomial approximation. -/
theorem left_visibleEnergy_of_rationalWitness
    (hcorr : (OriginWitnessData.leftCorrelationLower : ℝ) + (1 / 10 ^ 8 : ℝ) ≤
      (testCorrelation leftRationalWitness
        (OriginPanels.leftApproxLp - f 0 • Grothe.Haag.phaseLp) 120).re) :
    (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, leftEnergyTerm n := by
  apply left_visibleEnergy_of_witness leftRationalWitness OriginWitnessData.leftMassCap
    OriginWitnessData.leftCorrelationLower
  · norm_num [OriginWitnessData.leftMassCap]
  · norm_num [OriginWitnessData.leftMassCap]
  · norm_num [OriginWitnessData.leftCorrelationLower]
  · exact leftRationalWitness_mass
  · exact hcorr
  · have h : (((OriginWitnessData.leftMassCap * OriginWitnessData.visibleTarget : ℚ) : ℝ)) ≤
        (((OriginWitnessData.leftCorrelationLower ^ 2 : ℚ) : ℝ)) :=
      Rat.cast_le.mpr OriginWitnessData.left_visible_arithmetic
    norm_num only [OriginWitnessData.visibleTarget, Rat.cast_mul, Rat.cast_div,
      Rat.cast_pow, Rat.cast_ofNat] at h ⊢
    exact h

/-- The corresponding checked right witness also needs one signed correlation. -/
theorem right_visibleEnergy_of_rationalWitness
    (hcorr : (OriginWitnessData.rightCorrelationLower : ℝ) + (1 / 10 ^ 8 : ℝ) ≤
      (testCorrelation rightRationalWitness
        (OriginPanels.rightApproxLp - g 0 • Grothe.Haag.phaseLp) 120).re) :
    (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, rightEnergyTerm n := by
  apply right_visibleEnergy_of_witness rightRationalWitness OriginWitnessData.rightMassCap
    OriginWitnessData.rightCorrelationLower
  · norm_num [OriginWitnessData.rightMassCap]
  · norm_num [OriginWitnessData.rightMassCap]
  · norm_num [OriginWitnessData.rightCorrelationLower]
  · exact rightRationalWitness_mass
  · exact hcorr
  · have h : (((OriginWitnessData.rightMassCap * OriginWitnessData.visibleTarget : ℚ) : ℝ)) ≤
        (((OriginWitnessData.rightCorrelationLower ^ 2 : ℚ) : ℝ)) :=
      Rat.cast_le.mpr OriginWitnessData.right_visible_arithmetic
    norm_num only [OriginWitnessData.visibleTarget, Rat.cast_mul, Rat.cast_div,
      Rat.cast_pow, Rat.cast_ofNat] at h ⊢
    exact h

end

end Grothe.HJM.Origin
