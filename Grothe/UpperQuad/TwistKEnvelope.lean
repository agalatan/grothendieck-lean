import Grothe.UpperQuad.TwistKVector
import Grothe.UpperQuad.TwistMatrixBound
import Grothe.UpperQuad.TwistContinuationIdentity
import Grothe.UpperQuad.TwistEllipseKSound
import Grothe.UpperQuad.TwistYEnvelope

/-!
# The checked coarse K expression bounds the actual twisted vector

The rational column parameters are instantiated in the production matrix estimate. The
finite K factorization is then identified with the Gaussian-shift continuation used by the
descended vector. Upper angle and imaginary-square bounds, together with a positive lower
bound on the shift norm squared, give exactly the real expression enclosed by `upsKI`.

There is no column-energy hypothesis, output multiplicity, or extra reciprocal Gaussian
rate in the final bound. The cutoff and the rational columns use the same production power.

Agent-ID: codex-1a87. Refs #334, #342, #343, #351.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistKEnvelope

open PolynomialHermite TwistFactorization TwistEllCheck

noncomputable section

/-- The finite checker index always denotes a positive Taylor power. -/
theorem powerNat_pos (g : Power) : 0 < powerNat g := by
  unfold powerNat
  omega

/-- The rational rate in the checker is the production Gaussian rate. -/
theorem lambdaQ_cast (g : Power) : (lambdaQ g : ℝ) = rate (powerNat g) := by
  unfold lambdaQ rate
  push_cast
  norm_num [Grothe.Upper.phaseEpsQ]
  ring

/-- The checked rational column expression is the integrated finite-Mehler bound. -/
theorem columnNormSqQ_cast (g : Power) (m : ℕ) :
    (columnNormSqQ g m : ℝ) =
      ((columnTauQ g m : ℝ) ^ m)⁻¹ *
        ((1 - (columnTauQ g m : ℝ)) *
          (1 - (2 * rate (powerNat g) - 1) * (columnTauQ g m : ℝ)))⁻¹ := by
  unfold columnNormSqQ
  push_cast
  rw [lambdaQ_cast]
  simp only [inv_pow, div_eq_mul_inv]

/-- The arithmetic phase expression is the analytic squared phase envelope. -/
theorem phaseSq_eq_phaseBoundSq (g : Power) (eta Y : ℝ) :
    phaseSq g eta Y = GaussianShift.phaseBoundSq (powerNat g) eta Y := by
  rw [GaussianShift.phaseBoundSq_eq]
  rfl

/-- Increasing the imaginary-square bound increases the phase expression. -/
theorem phaseSq_mono (g : Power) {eta : ℝ} (heta0 : 0 < eta) (heta1 : eta < 1)
    {Y Z : ℝ} (hYZ : Y ≤ Z) : phaseSq g eta Y ≤ phaseSq g eta Z := by
  rw [phaseSq_eq_phaseBoundSq, phaseSq_eq_phaseBoundSq]
  have hden : 0 < 1 - eta := sub_pos.mpr heta1
  have heps : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by
    norm_num [Grothe.Upper.phaseEpsQ]
  unfold GaussianShift.phaseBoundSq
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  exact Real.exp_le_exp.mpr
    (mul_le_mul_of_nonneg_left hYZ (by positivity))

/-- Every actual production column is bounded by its checked rational column parameter.
The phase bound is uniform over all retained output indices. -/
theorem sum_matrixColumn_sq_le (g : Power) {eta : ℝ}
    (heta0 : 0 < eta) (heta1 : eta < 1) (r : ℂ) {Y : ℝ} (hY : r.im ^ 2 ≤ Y)
    (S : Finset (ℕ × ℕ)) (a b : ℕ) :
    ∑ cd ∈ S, ‖matrixCoefficient (powerNat g) r cd.1 cd.2 a b‖ ^ 2 ≤
      phaseSq g eta Y * (columnNormSqQ g (a + b) : ℝ) := by
  obtain ⟨hσ0, hσ1, hσrate⟩ := columnTauQ_spec g (a + b)
  have hσ0' : (0 : ℝ) < (columnTauQ g (a + b) : ℝ) := by exact_mod_cast hσ0
  have hσ1' : (columnTauQ g (a + b) : ℝ) < 1 := by exact_mod_cast hσ1
  have hσrate' : (2 * rate (powerNat g) - 1) *
      (columnTauQ g (a + b) : ℝ) < 1 := by
    rw [← lambdaQ_cast]
    exact_mod_cast hσrate
  have hprod := sum_norm_matrixCoefficient_sq_le_production S (powerNat g)
    (powerNat_pos g) r a b heta0 heta1 hσ0' hσ1' hσrate'
  change _ ≤ GaussianShift.phaseBoundSq (powerNat g) eta (r.im ^ 2) * _ at hprod
  rw [← phaseSq_eq_phaseBoundSq, ← columnNormSqQ_cast] at hprod
  have hcolumn : (0 : ℝ) ≤ (columnNormSqQ g (a + b) : ℝ) := by
    exact_mod_cast (columnNormSqQ_pos g (a + b)).le
  exact hprod.trans
    (mul_le_mul_of_nonneg_right (phaseSq_mono g heta0 heta1 hY) hcolumn)

/-- At a nonnegative argument the checked coefficient polynomial is increasing. -/
theorem coarseKPoly_mono (g : Power) {x y : ℝ} (hx : 0 ≤ x) (hxy : x ≤ y) :
    coarseKPoly g x ≤ coarseKPoly g y := by
  unfold coarseKPoly
  exact Finset.sum_le_sum fun m _ ↦
    mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hx hxy m) (columnCoeff_nonneg g m)

/-- Concrete production columns give the coarse K bound for the actual Gaussian-shift
coefficient energy, before replacing the shift geometry by interval bounds. -/
theorem sum_coefficient_sq_le_coarse_actual (g : Power) {eta : ℝ}
    (heta0 : 0 < eta) (heta1 : eta < 1) (r A : ℂ) {Y : ℝ} (hY : r.im ^ 2 ≤ Y)
    (hA : 0 < (A ^ 2).re) :
    ∑ cd ∈ indices (degree g),
      ‖GaussianShift.coefficient (powerNat g) r A.re A.im cd‖ ^ 2 ≤
        4 * phaseSq g eta Y * (‖A‖ ^ 2 / (A ^ 2).re) *
          (coarseKPoly g (Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) /
            (Real.sqrt (rate (powerNat g)) * ‖A‖))) ^ 2 := by
  have h := TwistKVector.sum_norm_Jext_sq_le_coarse
    (indices (degree g)) (degree g) (fun cd hcd ↦ mem_indices.mp hcd)
    (powerNat g) r A (phaseSq g eta Y) (phaseSq_nonneg g heta0.le Y)
    (fun m ↦ (columnNormSqQ g m : ℝ))
    (fun gh _ ↦ sum_matrixColumn_sq_le g heta0 heta1 r hY
      (indices (degree g)) gh.1 gh.2) hA
  simp only [Jext_eq_gaussianShift _ (powerNat_pos g), Prod.mk.eta] at h
  simpa only [coarseKPoly, columnCoeff, totalDegree, phaseDegree,
    Nat.cast_add, Nat.cast_one] using h

/-- Upper angle and lower norm-square bounds control the shell polynomial's argument.
The square-root expression is precisely the one evaluated by `upsKI`. -/
theorem canonical_argument_le (g : Power) {theta Theta Alo normA : ℝ}
    (htheta0 : 0 ≤ theta) (htheta : theta ≤ Theta)
    (hAlo0 : 0 < Alo) (hAlo : Alo ≤ normA ^ 2) :
    Real.sqrt 8 * theta / (Real.sqrt (rate (powerNat g)) * normA) ≤
      Real.sqrt (8 * (Theta ^ 2 / Alo) / (lambdaQ g : ℝ)) := by
  have hratio : theta ^ 2 / normA ^ 2 ≤ Theta ^ 2 / Alo :=
    (div_le_div_of_nonneg_right (pow_le_pow_left₀ htheta0 htheta 2)
      (sq_nonneg normA)).trans
        (div_le_div_of_nonneg_left (sq_nonneg Theta) hAlo0 hAlo)
  apply Real.le_sqrt_of_sq_le
  calc
    (Real.sqrt 8 * theta / (Real.sqrt (rate (powerNat g)) * normA)) ^ 2 =
        8 * (theta ^ 2 / normA ^ 2) / rate (powerNat g) := by
      rw [div_pow, mul_pow, mul_pow,
        Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 8), Real.sq_sqrt (rate_pos _).le]
      simp only [div_eq_mul_inv, mul_inv_rev]
      ring
    _ ≤ 8 * (Theta ^ 2 / Alo) / rate (powerNat g) :=
      div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_left hratio (by norm_num)) (rate_pos _).le
    _ = _ := by rw [lambdaQ_cast]

/-- The actual coefficient energy satisfies the exact coarse K expression enclosed by
the checker. All column estimates and continuation identities are discharged internally. -/
theorem sum_coefficient_sq_le_coarseKSq (g : Power) {eta : ℝ}
    (heta0 : 0 < eta) (heta1 : eta < 1) (r A : ℂ) {Y Theta Alo : ℝ}
    (hY : r.im ^ 2 ≤ Y) (hA : 0 < (A ^ 2).re)
    (hTheta : ‖A‖ ^ 2 / (A ^ 2).re ≤ Theta)
    (hAlo0 : 0 < Alo) (hAlo : Alo ≤ ‖A‖ ^ 2) :
    ∑ cd ∈ indices (degree g),
      ‖GaussianShift.coefficient (powerNat g) r A.re A.im cd‖ ^ 2 ≤
        coarseKSq g eta Y Theta Alo := by
  have htheta0 : 0 ≤ ‖A‖ ^ 2 / (A ^ 2).re := div_nonneg (sq_nonneg _) hA.le
  have hTheta0 : 0 ≤ Theta := htheta0.trans hTheta
  have hbase0 : 0 ≤ Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) /
      (Real.sqrt (rate (powerNat g)) * ‖A‖) := by positivity
  have hpoly := coarseKPoly_mono g hbase0
    (canonical_argument_le g htheta0 hTheta hAlo0 hAlo)
  have hpoly2 := pow_le_pow_left₀ (coarseKPoly_nonneg g hbase0) hpoly 2
  have hphase := phaseSq_nonneg g heta0.le Y
  have hfactor : 4 * phaseSq g eta Y * (‖A‖ ^ 2 / (A ^ 2).re) ≤
      4 * phaseSq g eta Y * Theta :=
    mul_le_mul_of_nonneg_left hTheta (by positivity)
  refine (sum_coefficient_sq_le_coarse_actual g heta0 heta1 r A hY hA).trans ?_
  unfold coarseKSq
  exact mul_le_mul hfactor hpoly2 (sq_nonneg _) (by positivity)

end

end Grothe.UpperQuad.TwistKEnvelope

namespace Grothe.UpperQuad.TwistRadialExt

open GrotheQuad PolynomialHermite TwistEllCheck

noncomputable section

/-- The primary radial envelope times the checker-compatible coarse K envelope. -/
def kBoundSq (g : Power) (t eta Slo X Y Theta Alo : ℝ) : ℝ :=
  primaryBoundSq (degree g) t Slo X Y * coarseKSq g eta Y Theta Alo

theorem kBoundSq_nonneg (g : Power) {t eta Theta : ℝ}
    (ht0 : 0 < t) (ht1 : t < 1) (heta : 0 ≤ eta) (hTheta : 0 ≤ Theta)
    (Slo X Y Alo : ℝ) : 0 ≤ kBoundSq g t eta Slo X Y Theta Alo :=
  mul_nonneg (primaryBoundSq_nonneg _ ht0 ht1 _ _ _)
    (coarseKSq_nonneg g heta hTheta _ _)

/-- The full descended vector satisfies the exact primary-times-coarse-K expression.
The positive real-square condition is the canonical K contour condition. -/
theorem norm_descendedVector_sq_le_kBoundSq (g : Power)
    (σ : ℝ) (hσ : |σ| = 1) {s r : ℂ} (hr : r ^ 2 = s)
    {t eta : ℝ} (ht0 : 0 < t) (ht1 : t < 1) (heta0 : 0 < eta) (heta1 : eta < 1)
    {Slo X Y Theta Alo : ℝ} (hSlo : Slo ≤ s.re) (hX : r.re ^ 2 ≤ X)
    (hY : r.im ^ 2 ≤ Y) (hA : 0 < ((shift r) ^ 2).re)
    (hTheta : ‖shift r‖ ^ 2 / ((shift r) ^ 2).re ≤ Theta)
    (hAlo0 : 0 < Alo) (hAlo : Alo ≤ ‖shift r‖ ^ 2) :
    ‖descendedVector (powerNat g) σ s‖ ^ 2 ≤ kBoundSq g t eta Slo X Y Theta Alo := by
  have hactual := norm_descendedVector_sq_le_of_sq (powerNat g) σ hσ hr t ht0 ht1
  refine hactual.trans ?_
  unfold kBoundSq
  exact mul_le_mul
    (radial_primary_le_primaryBoundSq _ ht0 ht1 s r hSlo hX hY)
    (TwistKEnvelope.sum_coefficient_sq_le_coarseKSq g heta0 heta1 r (shift r)
      hY hA hTheta hAlo0 hAlo)
    (Finset.sum_nonneg fun _ _ ↦ sq_nonneg _)
    (primaryBoundSq_nonneg _ ht0 ht1 _ _ _)

/-- A certified squared K cap gives the norm bound required by the panel remainder. -/
theorem norm_descendedVector_le_of_kBoundSq_le_sq (g : Power)
    (σ : ℝ) (hσ : |σ| = 1) {s r : ℂ} (hr : r ^ 2 = s)
    {t eta : ℝ} (ht0 : 0 < t) (ht1 : t < 1) (heta0 : 0 < eta) (heta1 : eta < 1)
    {Slo X Y Theta Alo M : ℝ} (hSlo : Slo ≤ s.re) (hX : r.re ^ 2 ≤ X)
    (hY : r.im ^ 2 ≤ Y) (hA : 0 < ((shift r) ^ 2).re)
    (hTheta : ‖shift r‖ ^ 2 / ((shift r) ^ 2).re ≤ Theta)
    (hAlo0 : 0 < Alo) (hAlo : Alo ≤ ‖shift r‖ ^ 2) (hM : 0 ≤ M)
    (hcap : kBoundSq g t eta Slo X Y Theta Alo ≤ M ^ 2) :
    ‖descendedVector (powerNat g) σ s‖ ≤ M :=
  (sq_le_sq₀ (norm_nonneg _) hM).mp
    ((norm_descendedVector_sq_le_kBoundSq g σ hσ hr ht0 ht1 heta0 heta1
      hSlo hX hY hA hTheta hAlo0 hAlo).trans hcap)

end

end Grothe.UpperQuad.TwistRadialExt
