import Grothe.LowerAnalytic.Frame
import Mathlib.Probability.HasLaw
import Mathlib.Probability.Moments.Variance
import Grothe.LowerAnalytic.Fifth.Direction

/-! Finite cubic carriers on independent complex Gaussian coordinates Agent-ID: codex-a7c4 -/

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- One summand in the random conditional variance of the triple-product carrier. -/
def diffuseWeight (p : ℂ × ℂ) : ℝ := Complex.normSq p.1 * Complex.normSq p.2

abbrev diffuseBath (N : ℕ) := Measure.pi fun _ : Fin N => gaussC.prod gaussC

/-- The finite variance scale for N fresh independent triples. -/
def diffuseScale (N : ℕ) (b : Fin N → ℂ × ℂ) : ℝ :=
  (N : ℝ)⁻¹ * ∑ i, diffuseWeight (b i)

theorem diffuseScale_nonneg {N : ℕ} (b : Fin N → ℂ × ℂ) : 0 ≤ diffuseScale N b := by
  unfold diffuseScale diffuseWeight
  exact mul_nonneg (by positivity) (Finset.sum_nonneg fun i _ => mul_nonneg (Complex.normSq_nonneg _) (Complex.normSq_nonneg _))

private theorem diffuseWeight_measurable : Measurable diffuseWeight :=
  (Complex.continuous_normSq.measurable.comp measurable_fst).mul
    (Complex.continuous_normSq.measurable.comp measurable_snd)

private theorem diffuseWeight_memLp : MemLp diffuseWeight 2 (gaussC.prod gaussC) := by
  apply (memLp_two_iff_integrable_sq diffuseWeight_measurable.aestronglyMeasurable).mpr
  simpa only [diffuseWeight, mul_pow] using
    ((integrable_normSq_pow 2 (by norm_num)).mul_prod (integrable_normSq_pow 2 (by norm_num)))

private theorem diffuseWeight_mean : (∫ p, diffuseWeight p ∂(gaussC.prod gaussC)) = 1 := by
  unfold diffuseWeight
  rw [integral_prod_mul Complex.normSq Complex.normSq, integral_normSq_gaussC, one_mul]

private theorem diffuseWeight_variance : variance diffuseWeight (gaussC.prod gaussC) = 3 := by
  rw [variance_eq_sub diffuseWeight_memLp, diffuseWeight_mean]
  have h₂ : (∫ p, diffuseWeight p ^ 2 ∂(gaussC.prod gaussC)) = 4 := by
    simp only [diffuseWeight, mul_pow]
    rw [integral_prod_mul (fun z : ℂ => Complex.normSq z ^ 2) (fun z : ℂ => Complex.normSq z ^ 2), integral_normSq_pow_two]
    norm_num
  change (∫ p, diffuseWeight p ^ 2 ∂(gaussC.prod gaussC)) - (1 : ℝ)^2 = _
  rw [h₂]
  norm_num

private theorem diffuseScale_measurable (N : ℕ) : Measurable (diffuseScale N) :=
  measurable_const.mul (Finset.measurable_sum _ fun i _ => diffuseWeight_measurable.comp (measurable_pi_apply i))

theorem diffuseScale_mean {N : ℕ} (hN : 0 < N) : (∫ b, diffuseScale N b ∂(diffuseBath N)) = 1 := by
  have hcoord i := diffuseWeight_memLp.comp_measurePreserving
    (measurePreserving_eval (fun _ : Fin N => gaussC.prod gaussC) i)
  have mean (i : Fin N) : (∫ b, diffuseWeight (b i) ∂(diffuseBath N)) = 1 :=
    ((measurePreserving_eval (fun _ : Fin N => gaussC.prod gaussC) i).hasLaw.integral_comp
      diffuseWeight_measurable.aestronglyMeasurable).trans diffuseWeight_mean
  have hi (i : Fin N) : Integrable (fun b : Fin N → ℂ × ℂ => diffuseWeight (b i)) (diffuseBath N) :=
    (hcoord i).integrable one_le_two
  simp only [diffuseScale, integral_const_mul, integral_finsetSum _ (fun i _ => hi i),
    mean, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul, mul_one]
  exact inv_mul_cancel₀ (by exact_mod_cast (Nat.ne_of_gt hN) : (N : ℝ) ≠ 0)

/-- The normalized finite sum has exactly variance 3/N. -/
theorem diffuseScale_variance (N : ℕ) : variance (diffuseScale N) (diffuseBath N)  = (3 : ℝ) / N := by
  have hv := variance_sum_pi (fun _ : Fin N => diffuseWeight_memLp)
  have heq : (fun b : Fin N → ℂ × ℂ => ∑ i, diffuseWeight (b i)) =
      ∑ i : Fin N, fun b => diffuseWeight (b i) := by funext b; simp
  unfold diffuseScale
  rw [variance_const_mul, heq, hv]
  simp only [diffuseWeight_variance, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  by_cases hN : N = 0
  · simp [hN]
  · have hn : (N : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr hN
    field_simp

/-- The exact centered second moment of the finite conditional variance. -/
theorem diffuseScale_mse {N : ℕ} (hN : 0 < N) :
    (∫ b, (diffuseScale N b - 1)^2 ∂(diffuseBath N))  = (3 : ℝ) / N := by
  have hv := diffuseScale_variance N
  rwa [variance_eq_integral (diffuseScale_measurable N).aemeasurable, diffuseScale_mean hN] at hv

private theorem sqrt_sub_one_sq_le {s : ℝ} (hs : 0 ≤ s) : (√s - 1)^2 ≤ (s-1)^2 := by
  have hf : s-1 = (√s-1)*(√s+1) := by nlinarith only [Real.sq_sqrt hs]
  rw [hf, mul_pow]
  have h : 1 ≤ (√s+1)^2 := by nlinarith only [Real.sqrt_nonneg s, sq_nonneg (√s)]
  nlinarith only [mul_le_mul_of_nonneg_left h (sq_nonneg (√s-1))]

/-- On a product space with a fresh standard complex Gaussian, the scale-mixture
coupling incurs at most 3/N in squared L² cost, at every finite N. -/
theorem diffuseScale_gaussian_mse {N : ℕ} (hN : 0 < N) :
    (∫ p : (Fin N → ℂ × ℂ) × ℂ, ‖(((√(diffuseScale N p.1) : ℝ) : ℂ)*p.2) - p.2‖^2
      ∂((diffuseBath N).prod gaussC)) ≤ (3 : ℝ) / N := by
  have hfun (b : Fin N → ℂ × ℂ) (z : ℂ) :
      ‖(((√(diffuseScale N b) : ℝ) : ℂ)*z) - z‖^2 =
        (√(diffuseScale N b)-1)^2 * Complex.normSq z := by
    rw [show ((((√(diffuseScale N b) : ℝ) : ℂ)*z) - z) =
      (((√(diffuseScale N b)-1 : ℝ) : ℂ))*z by push_cast; ring, norm_mul, mul_pow,
      Complex.sq_norm z, Complex.norm_real, Real.norm_eq_abs, sq_abs]
  simp_rw [hfun]
  rw [integral_prod_mul (fun b => (√(diffuseScale N b)-1)^2) Complex.normSq,
    integral_normSq_gaussC, mul_one, ← diffuseScale_mse hN]
  refine integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _) ?_
    (Filter.Eventually.of_forall fun b => sqrt_sub_one_sq_le (diffuseScale_nonneg b))
  exact Integrable.of_integral_ne_zero (by rw [diffuseScale_mse hN]; positivity)

/-- The L² norm of an unnormalized linear test in the repository's real coordinates. -/
def linearRadius {N : ℕ} (c : Fin N → ℂ) := √(2 * ∑ i, ‖c i‖^2)

/-- A Gaussian copy of a linear test. At a zero coefficient vector it uses the first
coordinate, so a single measurable formula works on every fibre. -/
def unitLinearSample {n : ℕ} (c : Fin (n+1) → ℂ) (x : Fin ((n+1)+(n+1)) → ℝ) : ℂ :=
  if linearRadius c = 0 then (split2 (n := n) x).2 else ((linearRadius c)⁻¹ : ℝ) * linC (n+1) c x

/-- For every deterministic coefficient vector, the normalized finite linear sum has
exactly the same standard Gaussian law, including the zero-vector branch. -/
theorem hasLaw_unitLinearSample {n : ℕ} (c : Fin (n+1) → ℂ) :
    HasLaw (unitLinearSample c) gaussC (stdGaussian ((n+1)+(n+1))) := by
  by_cases hc : linearRadius c = 0
  · have he : unitLinearSample c = (fun x => (split2 (n := n) x).2) := by
      funext x; simp [unitLinearSample, hc]
    rw [he]
    exact (measurePreserving_snd.comp (measurePreserving_split2 (n := n))).hasLaw
  let u : L2G (n+1) := ∑ i, c i • zL (n+1) i
  have hrad : ‖u‖ = linearRadius c := by
    rw [linearRadius, ← norm_sq_sum_zL, Real.sqrt_sq (norm_nonneg _)]
  have hrpos : 0 < linearRadius c := lt_of_le_of_ne (Real.sqrt_nonneg _) (Ne.symm hc)
  let v : L2G (n+1) := (((linearRadius c)⁻¹ : ℝ) : ℂ) • u
  have hv_mem : v ∈ H10 (n+1) := (H10 (n+1)).smul_mem _
    ((H10 (n+1)).sum_mem (fun i _ => (H10 (n+1)).smul_mem _ (zL_mem_H10 _ i)))
  have hv_norm : ‖v‖ = 1 := by
    dsimp only [v]
    rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (inv_pos.mpr hrpos), hrad,
      inv_mul_cancel₀ hc]
  apply (hasLaw_unit_H10 v hv_mem hv_norm).congr
  filter_upwards [Lp.coeFn_smul ((((linearRadius c)⁻¹ : ℝ) : ℂ)) u, linL_ae (n+1) c] with x hx hz
  change _ = (((((linearRadius c)⁻¹ : ℝ) : ℂ) • u : L2G (n+1)) x)
  rw [hx]
  simp only [unitLinearSample, hc, ↓reduceIte, Pi.smul_apply, smul_eq_mul]
  exact congrArg (fun z : ℂ => (((linearRadius c)⁻¹ : ℝ) : ℂ) * z) hz.symm

theorem linear_eq_radius_mul_unit {n : ℕ} (c : Fin (n+1) → ℂ) (x : Fin ((n+1)+(n+1)) → ℝ) :
    linC (n+1) c x = (linearRadius c : ℂ) * unitLinearSample c x := by
  by_cases hc : linearRadius c = 0
  · rw [hc, Complex.ofReal_zero, zero_mul]
    have hs := Real.sq_sqrt (by positivity : 0 ≤ 2 * ∑ i, ‖c i‖ ^ 2)
    change linearRadius c ^ 2 = _ at hs
    rw [hc] at hs
    have hsum : ∑ i, ‖c i‖^2 = 0 := by linarith only [hs]
    have hcoord := (Finset.sum_eq_zero_iff_of_nonneg (fun i _ => sq_nonneg ‖c i‖)).mp hsum
    apply Finset.sum_eq_zero
    intro i hi
    have hz := hcoord i hi
    have : c i = 0 := norm_eq_zero.mp (by nlinarith only [hz])
    simp [this]
  · simp only [unitLinearSample, hc, ↓reduceIte]
    rw [← mul_assoc, ← Complex.ofReal_mul, mul_inv_cancel₀ hc]
    simp

/-- The coefficient of the raw real-coordinate linear generator in a normalized
triple product of three standard proper complex Gaussian variables. -/
def diffuseCoeff {N : ℕ} (b : Fin N → ℂ × ℂ) (i : Fin N) : ℂ :=
  (((√(2 * (N:ℝ)))⁻¹ : ℝ) : ℂ) * ((b i).1 * conj (b i).2)

theorem linearRadius_diffuseCoeff {N : ℕ} (b : Fin N → ℂ × ℂ) :
    linearRadius (diffuseCoeff b) = √(diffuseScale N b) := by
  unfold linearRadius diffuseScale
  congr 1
  have hh : 2 * (√(2 * (N : ℝ)))⁻¹ ^ 2 = (N:ℝ)⁻¹ := by
    rw [inv_pow, Real.sq_sqrt (by positivity)]
    by_cases hN : N = 0
    · simp [hN]
    · have hn : (N : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr hN
      field_simp
  simp only [diffuseCoeff, norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs,
    Complex.norm_conj, Complex.sq_norm, diffuseWeight]
  rw [← Finset.mul_sum, ← mul_assoc, hh]

/-- The finite triple polynomial, on the product of the bath and the independent
real Gaussian coordinates for its fresh linear variables. -/
def diffuseTriple {n : ℕ} (p : (Fin (n+1) → ℂ × ℂ) × (Fin ((n+1)+(n+1)) → ℝ)) : ℂ :=
  linC (n+1) (diffuseCoeff p.1) p.2

def diffuseCopy {n : ℕ} (p : (Fin (n+1) → ℂ × ℂ) × (Fin ((n+1)+(n+1)) → ℝ)) : ℂ :=
  unitLinearSample (diffuseCoeff p.1) p.2

abbrev diffuseSpace (n : ℕ) := (diffuseBath (n+1)).prod (stdGaussian ((n+1)+(n+1)))

private theorem measurable_diffuseCoeff {N : ℕ} (i : Fin N) :
    Measurable (fun b : Fin N → ℂ × ℂ => diffuseCoeff b i) := by
  exact measurable_const.mul ((measurable_fst.comp (measurable_pi_apply i)).mul
    (Complex.continuous_conj.measurable.comp (measurable_snd.comp (measurable_pi_apply i))))

theorem measurable_diffuseTriple (n : ℕ) : Measurable (diffuseTriple (n := n)) := by
  unfold diffuseTriple linC
  exact Finset.measurable_sum _ fun i _ =>
    ((measurable_diffuseCoeff i).comp measurable_fst).mul ((continuous_zc (n+1) i).measurable.comp measurable_snd)

theorem measurable_diffuseCopy (n : ℕ) : Measurable (diffuseCopy (n := n)) := by
  have hrad : Measurable (fun p : (Fin (n+1) → ℂ × ℂ) × (Fin ((n+1)+(n+1)) → ℝ) =>
      linearRadius (diffuseCoeff p.1)) := by
    simp_rw [linearRadius_diffuseCoeff]
    exact ((diffuseScale_measurable _).comp measurable_fst).sqrt
  apply Measurable.ite (measurableSet_eq_fun hrad measurable_const)
    (measurable_snd.comp ((split2 (n := n)).measurable.comp measurable_snd))
  exact (Complex.continuous_ofReal.measurable.comp hrad.inv).mul (measurable_diffuseTriple n)

/-- The normalized copy has exactly the standard complex Gaussian law jointly with
the entire original bath. The proof uses each finite fibre's exact law. -/
theorem measurePreserving_diffuseCopy (n : ℕ) :
    MeasurePreserving (fun p => (p.1, diffuseCopy p)) (diffuseSpace n) ((diffuseBath (n+1)).prod gaussC) :=
  (MeasurePreserving.id (diffuseBath (n+1))).skew_product (g := fun b x => unitLinearSample (diffuseCoeff b) x)
    (measurable_diffuseCopy n)
    (Filter.Eventually.of_forall fun b => (hasLaw_unitLinearSample (diffuseCoeff b)).map_eq)

theorem diffuseTriple_eq {n : ℕ} (p : (Fin (n+1) → ℂ × ℂ) × (Fin ((n+1)+(n+1)) → ℝ)) :
    diffuseTriple p = ((√(diffuseScale (n+1) p.1) : ℝ) : ℂ) * diffuseCopy p := by
  simpa only [diffuseTriple, diffuseCopy, linearRadius_diffuseCoeff] using
    linear_eq_radius_mul_unit (diffuseCoeff p.1) p.2

/-- The actual finite triple polynomial and a Gaussian copy on its own sample space
have squared L² distance at most 3/N. The copy is independent of the whole bath. -/
theorem diffuseTriple_gaussian_mse (n : ℕ) :
    (∫ p, ‖diffuseTriple p - diffuseCopy p‖^2 ∂(diffuseSpace n)) ≤ (3:ℝ)/(n+1) := by
  let F (p : (Fin (n+1) → ℂ × ℂ) × ℂ) : ℝ :=
    ‖(((√(diffuseScale (n+1) p.1) : ℝ) : ℂ)*p.2) - p.2‖^2
  have hm : Measurable F := by
    have hm := diffuseScale_measurable (n+1)
    dsimp [F]
    fun_prop
  have hi := (measurePreserving_diffuseCopy n).hasLaw.integral_comp hm.aestronglyMeasurable
  simp_rw [diffuseTriple_eq]
  exact hi.trans_le (by simpa using diffuseScale_gaussian_mse (Nat.succ_pos n))

theorem diffuseTriple_second (n : ℕ) : (∫ p, ‖diffuseTriple p‖^2 ∂(diffuseSpace n)) = 1 := by
  let F (p : (Fin (n+1) → ℂ × ℂ) × ℂ) := diffuseScale (n+1) p.1 * Complex.normSq p.2
  have hm : Measurable F := ((diffuseScale_measurable _).comp measurable_fst).mul
    (Complex.continuous_normSq.measurable.comp measurable_snd)
  have hi := (measurePreserving_diffuseCopy n).hasLaw.integral_comp hm.aestronglyMeasurable
  simp_rw [diffuseTriple_eq, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs,
    Real.sq_sqrt (diffuseScale_nonneg _), Complex.sq_norm]
  refine hi.trans ?_
  dsimp only [F]
  rw [integral_prod_mul (diffuseScale (n+1)) Complex.normSq, integral_normSq_gaussC,
    diffuseScale_mean (Nat.succ_pos n), one_mul]

theorem diffuseTriple_mean (n : ℕ) : (∫ p, diffuseTriple p ∂(diffuseSpace n)) = 0 := by
  let F (p : (Fin (n+1) → ℂ × ℂ) × ℂ) : ℂ := ((√(diffuseScale (n+1) p.1) : ℝ) : ℂ)*p.2
  have hm : Measurable F := (Complex.continuous_ofReal.measurable.comp
    ((diffuseScale_measurable _).comp measurable_fst).sqrt).mul measurable_snd
  have hi := (measurePreserving_diffuseCopy n).hasLaw.integral_comp hm.aestronglyMeasurable
  simp_rw [diffuseTriple_eq]
  refine hi.trans ?_
  dsimp only [F]
  have hz : (∫ z : ℂ, z ∂gaussC) = 0 := integral_eq_zero_of_rot id (-1) (by simp) (by simp)
  rw [integral_prod_mul (fun b => ((√(diffuseScale (n+1) b) : ℝ) : ℂ)) (fun z : ℂ => z), hz, mul_zero]

end

end Grothe.LowerAnalytic
