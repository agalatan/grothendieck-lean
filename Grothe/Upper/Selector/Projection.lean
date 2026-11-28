import Grothe.Upper.Selector.Gaussian

/-!
# Simultaneous complex Gaussian projections

Every pair of coordinates of a Gaussian field projected onto unit vectors has the
two-variable Mehler law for their inner product. The computation below identifies
both laws by their real characteristic functions, including singular covariances.
-/

open MeasureTheory ProbabilityTheory Complex Finset
open scoped InnerProductSpace ComplexConjugate

set_option warningAsError true

namespace Grothe.Upper.Selector

noncomputable section

private def project {ι : Type} [Fintype ι] (v : EuclideanSpace ℂ ι) : (ι → ℂ) →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun g => ∑ i, v i * g i
      map_add' := fun x y => by simp [mul_add, sum_add_distrib]
      map_smul' := fun r x => by simp [Complex.real_smul, ← mul_sum, mul_left_comm] }

private def dualCoeff (L : StrongDual ℝ ℂ) : ℂ := (L 1 : ℂ) - I * (L I : ℂ)

private lemma dualCoeff_apply (L : StrongDual ℝ ℂ) (z : ℂ) : L z = (dualCoeff L * z).re := by
  rw [dual_complex_apply]
  simp [dualCoeff, Complex.mul_re]
  ring

private def dualLeft (L : StrongDual ℝ (ℂ × ℂ)) := dualCoeff (L.comp (.inl ℝ ℂ ℂ))
private def dualRight (L : StrongDual ℝ (ℂ × ℂ)) := dualCoeff (L.comp (.inr ℝ ℂ ℂ))

private lemma dual_pair (L : StrongDual ℝ (ℂ × ℂ)) (x y : ℂ) :
    L (x, y) = (dualLeft L * x + dualRight L * y).re := by
  change L (x, y) = (dualCoeff (L.comp (.inl ℝ ℂ ℂ)) * x +
    dualCoeff (L.comp (.inr ℝ ℂ ℂ)) * y).re
  rw [Complex.add_re, ← dualCoeff_apply, ← dualCoeff_apply]
  simpa using L.map_add (x, 0) (0, y)

private lemma dual_pair_sq (L : StrongDual ℝ (ℂ × ℂ)) (x y : ℂ) :
    L (x, y) ^ 2 + L (x * I, y * I) ^ 2 = ‖dualLeft L * x + dualRight L * y‖ ^ 2 := by
  rw [dual_pair, dual_pair, ← mul_assoc, ← mul_assoc, ← add_mul, Complex.mul_I_re,
    ← Complex.normSq_eq_norm_sq, Complex.normSq_apply]
  ring

private lemma project_single {ι : Type} [Fintype ι] [DecidableEq ι]
    (x : EuclideanSpace ℂ ι) (k : ι) (z : ℂ) :
    project x (Pi.single k z) = x k * z := by
  change (∑ j, x j * (Pi.single k z : ι → ℂ) j) = _
  rw [sum_eq_single k]
  · simp
  · intro j _ hjk
    simp [Pi.single_eq_of_ne hjk]
  · simp

private def pairMap (ρ : ℂ) : (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun p => (p.1, mY ρ p)
      map_add' := fun p q => by ext <;> simp [mY, mul_add]; ring
      map_smul' := fun r p => by ext <;> simp [mY, Complex.real_smul]; ring }

private lemma gram_energy {ι : Type} [Fintype ι] (x y : EuclideanSpace ℂ ι)
    (hx : ‖x‖ = 1) (hy : ‖y‖ = 1) (A B : ℂ) :
    ‖A • x + B • y‖ ^ 2 = ‖A + B * inner ℂ x y‖ ^ 2 + ‖B * sig (inner ℂ x y)‖ ^ 2 := by
  let ρ := inner ℂ x y
  have hr : ‖ρ‖ ≤ 1 := by simpa [ρ, hx, hy] using norm_inner_le_norm (𝕜 := ℂ) x y
  have hs : ‖sig ρ‖ ^ 2 = 1 - ‖ρ‖ ^ 2 := by
    rw [sig, Complex.norm_real, Real.norm_eq_abs, sq_abs, Real.sq_sqrt (by nlinarith [norm_nonneg ρ])]
  change ‖A • x + B • y‖ ^ 2 = ‖A + B * ρ‖ ^ 2 + ‖B * sig ρ‖ ^ 2
  rw [norm_add_sq (𝕜 := ℂ), norm_add_sq (𝕜 := ℂ), inner_smul_left, inner_smul_right,
    norm_smul, norm_smul, hx, hy, mul_one, mul_one, norm_mul, norm_mul, mul_pow, mul_pow, hs,
    RCLike.inner_apply]
  rw [show conj A * (B * inner ℂ x y) = B * ρ * conj A by dsimp [ρ]; ring]
  ring

/-- The field of complex projections has the joint Mehler law at each pair of unit vectors. -/
theorem projection_pair_law {ι : Type} [Fintype ι]
    (x y : EuclideanSpace ℂ ι) (hx : ‖x‖ = 1) (hy : ‖y‖ = 1) :
    (Measure.pi fun _ : ι => gaussC).map (fun g => (∑ i, x i * g i, ∑ i, y i * g i)) =
      mu2.map (fun u => (u.1, mY (inner ℂ x y) u)) := by
  classical
  let F := (project x).prod (project y)
  let ρ := inner ℂ x y
  change (Measure.pi fun _ : ι => gaussC).map F = mu2.map (pairMap ρ)
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, charFunDual_map, charFunDual_pi, show mu2 = gaussC.prod gaussC from rfl,
    charFunDual_prod, charFunDual_gaussC, charFunDual_gaussC, ← Complex.exp_add]
  simp_rw [charFunDual_gaussC, ← Complex.exp_sum]
  congr 1
  have he (k : ι) :
      (((L.comp F).comp (.single ℝ (fun _ : ι => ℂ) k)) 1) ^ 2 +
        (((L.comp F).comp (.single ℝ (fun _ : ι => ℂ) k)) I) ^ 2 =
      ‖dualLeft L * x k + dualRight L * y k‖ ^ 2 := by
    change L (project x (Pi.single k 1), project y (Pi.single k 1)) ^ 2 +
      L (project x (Pi.single k I), project y (Pi.single k I)) ^ 2 = _
    simp_rw [project_single, mul_one]
    exact dual_pair_sq L _ _
  have hfst :
      (((L.comp (pairMap ρ)).comp (.inl ℝ ℂ ℂ)) 1)^2 +
        (((L.comp (pairMap ρ)).comp (.inl ℝ ℂ ℂ)) I)^2 =
      ‖dualLeft L + dualRight L * ρ‖ ^ 2 := by
    simpa [pairMap, mY] using dual_pair_sq L 1 ρ
  have hsnd :
      (((L.comp (pairMap ρ)).comp (.inr ℝ ℂ ℂ)) 1)^2 +
        (((L.comp (pairMap ρ)).comp (.inr ℝ ℂ ℂ)) I)^2 =
      ‖dualRight L * sig ρ‖ ^ 2 := by
    simpa [pairMap, mY] using dual_pair_sq L 0 (sig ρ)
  rw [hfst, hsnd]
  simp_rw [he]
  rw [← sum_div, sum_neg_distrib, ← Complex.ofReal_sum]
  have hsum : ∑ k, ‖dualLeft L * x k + dualRight L * y k‖ ^ 2 =
      ‖dualLeft L • x + dualRight L • y‖ ^ 2 :=
    (PiLp.norm_sq_eq_of_L2 (fun _ : ι => ℂ) (dualLeft L • x + dualRight L • y)).symm
  rw [hsum, gram_energy x y hx hy]
  simp only [ρ, Complex.ofReal_add]
  ring

end

end Grothe.Upper.Selector
