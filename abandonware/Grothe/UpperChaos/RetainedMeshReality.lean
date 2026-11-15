import Grothe.UpperChaos.ProductionRectangleAssembly

/-!
# Reality of retained mesh coefficients

The checked compiled unit kernel is real-valued. Its auxiliary-first
rectangle integrals, their finite sum, and the Gaussian normalization are
therefore real. The existing reciprocal substitution transfers the statement
to the reciprocal mesh.
Agent-ID: codex-8c4d.
Real enclosure transfer: codex-2ca4.
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos.RetainedMeshReality

open Grothe.UpperChaos.QuadraturePartition
open Grothe.UpperChaos.RationalUnitRealKernelContinuity

noncomputable section

/-- Every finite retained mesh is real, for arbitrary cuts and selection. -/
theorem retainedMeshValue_im {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected] :
    (retainedMeshValue i j a n selected).im = 0 := by
  simp only [retainedMeshValue, rectangleIntegral, unitRectangleKernel,
    intervalIntegral.integral_ofReal, ← Complex.ofReal_inv,
    ← Complex.ofReal_sum, ← Complex.ofReal_mul, Complex.ofReal_im]

/-- The reciprocal mesh computes the same real quantity. -/
theorem retainedReciprocalMeshValue_im {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected] :
    (retainedReciprocalMeshValue i j a n selected).im = 0 := by
  rw [← retainedMeshValue_eq_reciprocal]
  exact retainedMeshValue_im i j a n selected

/-- A real interval bound controls the full complex norm of the mesh
coefficient; its imaginary part is already proved to vanish. -/
theorem norm_retainedReciprocalMeshValue_sub_rat {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected] (q : ℚ) :
    ‖retainedReciprocalMeshValue i j a n selected - (q : ℂ)‖ =
      |(retainedReciprocalMeshValue i j a n selected).re - (q : ℝ)| := by
  have him := retainedReciprocalMeshValue_im i j a n selected
  have heq : retainedReciprocalMeshValue i j a n selected - (q : ℂ) =
      (((retainedReciprocalMeshValue i j a n selected).re - (q : ℝ) : ℝ) : ℂ) := by
    apply Complex.ext <;> simp [him]
  rw [heq, Complex.norm_real, Real.norm_eq_abs]

/-- The actual retained Gaussian coefficient is real for every unit mode. -/
theorem retainedGaussianCoefficient_im {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected]
    (hmono : Monotone a) (hleft : a 0 = 0) (hright : a n = 80) :
    (⟪hvec2 (gradedIdx i),
      profileRetainedL2
        (profileIntervalUnion ((Finset.range n).filter selected) a (fun k => a (k + 1)))
        (measurableSet_profileIntervalUnion _ _ _) j⟫_ℂ).im = 0 := by
  rw [inner_profileRetained_eq_reciprocalMesh i j a n selected hmono hleft hright]
  exact retainedReciprocalMeshValue_im i j a n selected

end
end Grothe.UpperChaos.RetainedMeshReality
