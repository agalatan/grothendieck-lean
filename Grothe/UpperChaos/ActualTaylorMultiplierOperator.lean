import Grothe.UpperChaos.ActualRectangleCoefficientAction
import Grothe.UpperChaos.SmoothComm
import Mathlib.MeasureTheory.Function.Holder
import Mathlib.Analysis.Normed.Operator.Mul

/-!
# The actual Taylor multiplier as a continuous operator on physical L²

Agent-ID: codex-2ca4.

The explicit `PhiBound` hypothesis gives an L-infinity multiplier, hence a
continuous L² operator by Holder. Its Hermite matrix is the actual physical
Gaussian matrix already used by the finite rectangle-tail estimate. The
complete Hermite basis then gives a convergent matrix expansion for every L²
input, including the projection outside the original input rectangle.

No matrix-entry identity or convergence assertion is assumed. This module
keeps `PhiBound` explicit and does not import the closed native phase cover as
a theorem premise. `ActualInfiniteRectangleOperator` passes the finite
selected-band estimate to this operator. Numerical source enclosures remain
separate obligations.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped BigOperators ComplexConjugate InnerProductSpace ENNReal

namespace Grothe.UpperChaos.ActualTaylorMultiplierOperator

open ActualTaylorFiniteCoefficients ActualFiniteRectangleOperator
open ActualMatrixRectangleTail

noncomputable section

local instance (n : Idx2) : Decidable (inputRectangle n) := by
  unfold inputRectangle
  infer_instance

/-- The production multiplier is essentially bounded, rather than merely L². -/
theorem memLp_infty_taylorPhasePower (hφ : PhiBound) (power : ℕ) :
    MemLp (taylorPhasePower power) ∞ mu2 :=
  memLp_top_of_bound (measurable_taylorPhasePower power).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_taylorPhasePower_le hφ power))

/-- Multiplication by the actual production `(i * phi)^power` on physical L². -/
def multiplier (hφ : PhiBound) (power : ℕ) :
    Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2 :=
  (ContinuousLinearMap.mul ℂ ℂ).holderL mu2 ∞ 2 2
    ((memLp_infty_taylorPhasePower hφ power).toLp (taylorPhasePower power))

/-- The bundled operator has the literal pointwise multiplier as a representative. -/
theorem multiplier_ae (hφ : PhiBound) (power : ℕ) (f : Lp ℂ 2 mu2) :
    multiplier hφ power f =ᵐ[mu2] fun u => taylorPhasePower power u * f u := by
  change (ContinuousLinearMap.mul ℂ ℂ).holder 2
    ((memLp_infty_taylorPhasePower hφ power).toLp (taylorPhasePower power)) f
      =ᵐ[mu2] _
  filter_upwards [ContinuousLinearMap.coeFn_holder (r := (2 : ENNReal))
    (ContinuousLinearMap.mul ℂ ℂ)
    ((memLp_infty_taylorPhasePower hφ power).toLp (taylorPhasePower power)) f,
    (memLp_infty_taylorPhasePower hφ power).coeFn_toLp] with u hu hp
  simpa only [ContinuousLinearMap.mul_apply', hp] using hu

/-- Exact identification with the production normalized physical matrix entry. -/
theorem inner_multiplier_hvec2 (hφ : PhiBound) (power : ℕ) (m n : Idx2) :
    ⟪hvec2 m, multiplier hφ power (hvec2 n)⟫_ℂ = matrixEntry power m n := by
  rw [L2.inner_def]
  unfold matrixEntry
  apply integral_congr_ae
  filter_upwards [multiplier_ae hφ power (hvec2 n),
    (memLp_hfun2 m).coeFn_toLp, (memLp_hfun2 n).coeFn_toLp] with u hu hm hn
  change hvec2 m u = hfun2 m u at hm
  change hvec2 n u = hfun2 n u at hn
  rw [hu, hm, hn, RCLike.inner_apply]
  ring

/-- The actual infinite matrix expansion converges for every physical L² input. -/
theorem hasSum_matrixEntry (hφ : PhiBound) (power : ℕ) (m : Idx2)
    (f : Lp ℂ 2 mu2) :
    HasSum (fun n => ⟪hvec2 n, f⟫_ℂ * matrixEntry power m n)
      ⟪hvec2 m, multiplier hφ power f⟫_ℂ := by
  simpa only [inner_multiplier_hvec2] using
    hasSum_inner_op (multiplier hφ power) m f

theorem tsum_matrixEntry (hφ : PhiBound) (power : ℕ) (m : Idx2)
    (f : Lp ℂ 2 mu2) :
    (∑' n, ⟪hvec2 n, f⟫_ℂ * matrixEntry power m n) =
      ⟪hvec2 m, multiplier hφ power f⟫_ℂ :=
  (hasSum_matrixEntry hφ power m f).tsum_eq

/-- The actual orthogonal projection outside the inclusive production rectangle. -/
def rectangleTail : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2 :=
  projOn {n | ¬ inputRectangle n}

/-- No boundary modes are dropped: a mode belongs to this tail exactly when
it fails the inclusive input rectangle predicate. -/
theorem inner_rectangleTail (n : Idx2) (f : Lp ℂ 2 mu2) :
    ⟪hvec2 n, rectangleTail f⟫_ℂ =
      if ¬ inputRectangle n then ⟪hvec2 n, f⟫_ℂ else 0 := by
  classical
  exact inner_projOn {n | ¬ inputRectangle n} n f

/-- Infinite expansion for the literal physical multiplier of the rectangle tail. -/
theorem hasSum_rectangleTail (hφ : PhiBound) (power : ℕ) (m : Idx2)
    (f : Lp ℂ 2 mu2) :
    HasSum (fun n => if ¬ inputRectangle n then
      ⟪hvec2 n, f⟫_ℂ * matrixEntry power m n else 0)
        ⟪hvec2 m, multiplier hφ power (rectangleTail f)⟫_ℂ := by
  classical
  have h := hasSum_matrixEntry hφ power m (rectangleTail f)
  simpa only [inner_rectangleTail, ite_mul, zero_mul] using h

/-- Finite matrix actions converge to the actual physical operator coefficient.
This is the limit required to extend finite selected-band bounds to all L² inputs. -/
theorem tendsto_rectangle_matrixAction (hφ : PhiBound) (power : ℕ) (m : Idx2)
    (f : Lp ℂ 2 mu2) :
    Filter.Tendsto (fun inputs : Finset Idx2 =>
      matrixAction power (rectangleComplementInputs inputs)
        (fun n => ⟪hvec2 n, f⟫_ℂ) m) Filter.atTop
      (nhds ⟪hvec2 m, multiplier hφ power (rectangleTail f)⟫_ℂ) := by
  classical
  have h := hasSum_rectangleTail hφ power m f
  simp only [HasSum, SummationFilter.unconditional_filter] at h
  refine Filter.Tendsto.congr ?_ h
  intro inputs
  simp only [matrixAction, rectangleComplementInputs, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro n _
  by_cases hn : ¬ inputRectangle n
  · simp only [ite_eq_left hn, mul_comm]
  · simp only [ite_eq_right hn]

end
end Grothe.UpperChaos.ActualTaylorMultiplierOperator
