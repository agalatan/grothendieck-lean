import Mathlib.Algebra.Group.EvenFunction
import Mathlib.Analysis.Calculus.InverseFunctionTheorem.Analytic
import Mathlib.Analysis.Complex.RemovableSingularity
import Mathlib.Analysis.Complex.SqrtDeriv

/-!
# Analytic descent of an even function through the square map

An analytic Banach-valued function that is even on a ball of radius `R` descends to an analytic
function on the ball of radius `R²`. Away from zero this follows from the local inverse theorem
for the square map. At zero, continuity of the complex square root and the removable singularity
theorem apply. Uniform norm bounds transport with no loss.

Agent-ID: codex-1a87. Refs #345, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.EvenSquareDescent

open Complex Filter Metric Set
open scoped Topology

noncomputable section

variable {E : Type*}

/-- The square descent uses a fixed root; evenness makes the choice immaterial. -/
def descend (F : ℂ → E) (s : ℂ) : E := F (Complex.sqrt s)

lemma sqrt_sq (s : ℂ) : Complex.sqrt s ^ 2 = s := by
  simp [Complex.sqrt]

lemma norm_sqrt_sq (s : ℂ) : ‖Complex.sqrt s‖ ^ 2 = ‖s‖ := by
  rw [← norm_pow, sqrt_sq]

lemma sqrt_mem_ball {R : ℝ} (hR : 0 < R) {s : ℂ} (hs : s ∈ ball 0 (R ^ 2)) :
    Complex.sqrt s ∈ ball 0 R := by
  simp only [mem_ball, dist_zero_right] at hs ⊢
  apply (sq_lt_sq₀ (norm_nonneg _) hR.le).mp
  rwa [norm_sqrt_sq]

lemma sqrt_mem_closedBall {R : ℝ} (hR : 0 ≤ R) {s : ℂ}
    (hs : s ∈ closedBall 0 (R ^ 2)) : Complex.sqrt s ∈ closedBall 0 R := by
  simp only [mem_closedBall, dist_zero_right] at hs ⊢
  apply (sq_le_sq₀ (norm_nonneg _) hR).mp
  rwa [norm_sqrt_sq]

/-- At a point where the two opposite values agree, square descent recovers the function. -/
theorem descend_sq (F : ℂ → E) (r : ℂ) (heven : F (-r) = F r) :
    descend F (r ^ 2) = F r := by
  rcases sq_eq_sq_iff_eq_or_eq_neg.mp (sqrt_sq (r ^ 2)) with h | h
  · simp only [descend, h]
  · simpa only [descend, h] using heven

theorem descend_sq_of_even {F : ℂ → E} (heven : Function.Even F) (r : ℂ) :
    descend F (r ^ 2) = F r := descend_sq F r (heven r)

variable [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

omit [CompleteSpace E] in
private lemma analyticAt_descend_of_ne_zero {F : ℂ → E} {R : ℝ} (hR : 0 < R)
    (hF : AnalyticOnNhd ℂ F (ball 0 R))
    (heven : ∀ r ∈ ball 0 R, F (-r) = F r)
    {s : ℂ} (hs : s ∈ ball 0 (R ^ 2)) (hs0 : s ≠ 0) :
    AnalyticAt ℂ (descend F) s := by
  have hroot := sqrt_mem_ball hR hs
  have hr0 : Complex.sqrt s ≠ 0 := fun h => hs0 (by rw [← sqrt_sq s, h, zero_pow two_ne_zero])
  have hcomp : F =ᶠ[𝓝 (Complex.sqrt s)] descend F ∘ (fun r : ℂ ↦ r ^ 2) := by
    filter_upwards [isOpen_ball.mem_nhds hroot] with r hr
    exact (descend_sq F r (heven r hr)).symm
  have hsq : AnalyticAt ℂ (fun r : ℂ ↦ r ^ 2) (Complex.sqrt s) := analyticAt_id.pow 2
  have hderiv : deriv (fun r : ℂ ↦ r ^ 2) (Complex.sqrt s) ≠ 0 := by
    simpa only [deriv_pow_field, Nat.cast_ofNat, Nat.reduceSub, pow_one] using
      mul_ne_zero (by norm_num : (2 : ℂ) ≠ 0) hr0
  simpa only [sqrt_sq] using
    (analyticAt_comp_iff_of_deriv_ne_zero hsq hderiv).mp ((hF _ hroot).congr hcomp)

/-- Local evenness on the original ball suffices for analytic descent to its squared radius. -/
theorem analyticOnNhd_descend {F : ℂ → E} {R : ℝ} (hR : 0 < R)
    (hF : AnalyticOnNhd ℂ F (ball 0 R))
    (heven : ∀ r ∈ ball 0 R, F (-r) = F r) :
    AnalyticOnNhd ℂ (descend F) (ball 0 (R ^ 2)) := by
  have hzero : AnalyticAt ℂ (descend F) 0 := by
    apply Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt
    · have hball : ∀ᶠ s in 𝓝[≠] (0 : ℂ), s ∈ ball 0 (R ^ 2) :=
        nhdsWithin_le_nhds (ball_mem_nhds _ (sq_pos_of_pos hR))
      filter_upwards [hball, self_mem_nhdsWithin] with s hs hs0
      exact (analyticAt_descend_of_ne_zero hR hF heven hs hs0).differentiableAt
    · have hsqrt : ContinuousAt Complex.sqrt (0 : ℂ) :=
        Complex.continuousAt_sqrt (Or.inl (by simp))
      have hcont : ContinuousAt F (Complex.sqrt 0) := by
        simpa only [Complex.sqrt_zero] using (hF 0 (mem_ball_self hR)).continuousAt
      exact hcont.comp hsqrt
  intro s hs
  rcases eq_or_ne s 0 with rfl | hs0
  · exact hzero
  · exact analyticAt_descend_of_ne_zero hR hF heven hs hs0

/-- A globally even analytic function is a special case of the local descent theorem. -/
theorem analyticOnNhd_descend_of_even {F : ℂ → E} {R : ℝ} (hR : 0 < R)
    (hF : AnalyticOnNhd ℂ F (ball 0 R)) (heven : Function.Even F) :
    AnalyticOnNhd ℂ (descend F) (ball 0 (R ^ 2)) :=
  analyticOnNhd_descend hR hF fun r _ ↦ heven r

omit [NormedSpace ℂ E] [CompleteSpace E] in
/-- A uniform norm bound on the open ball transports without changing the bound. -/
theorem norm_descend_le {F : ℂ → E} {R B : ℝ} (hR : 0 < R)
    (hbound : ∀ r ∈ ball 0 R, ‖F r‖ ≤ B) {s : ℂ} (hs : s ∈ ball 0 (R ^ 2)) :
    ‖descend F s‖ ≤ B := hbound _ (sqrt_mem_ball hR hs)

omit [NormedSpace ℂ E] [CompleteSpace E] in
/-- The same norm transport on closed balls, useful for contour estimates. -/
theorem norm_descend_le_closedBall {F : ℂ → E} {R B : ℝ} (hR : 0 ≤ R)
    (hbound : ∀ r ∈ closedBall 0 R, ‖F r‖ ≤ B) {s : ℂ}
    (hs : s ∈ closedBall 0 (R ^ 2)) : ‖descend F s‖ ≤ B :=
  hbound _ (sqrt_mem_closedBall hR hs)

end

end Grothe.UpperQuad.EvenSquareDescent
