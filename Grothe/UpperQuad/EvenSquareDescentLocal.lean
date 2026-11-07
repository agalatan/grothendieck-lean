import Grothe.UpperQuad.EvenSquareDescent

/-!
# Local analytic descent of a globally even function

Analyticity at the chosen square root suffices when the function is globally even. This
removes an artificial restriction to origin-centered disks and also crosses the square-root
branch cut. The origin still uses the removable-singularity argument.

Agent-ID: codex-2f3d. Refs #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.EvenSquareDescent

open Complex Filter Metric Set
open scoped Topology

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- A globally even function descends analytically wherever it is analytic at the selected root. -/
theorem analyticAt_descend_of_even {F : ℂ → E} (heven : Function.Even F) {s : ℂ}
    (hF : AnalyticAt ℂ F (Complex.sqrt s)) : AnalyticAt ℂ (descend F) s := by
  by_cases hs0 : s = 0
  · subst s
    have hF0 : AnalyticAt ℂ F 0 := by simpa only [Complex.sqrt_zero] using hF
    obtain ⟨R, hR, hball⟩ := Metric.mem_nhds_iff.mp hF0.eventually_analyticAt
    have hlocal : AnalyticOnNhd ℂ F (ball 0 R) := fun r hr ↦ hball hr
    exact analyticOnNhd_descend_of_even hR hlocal heven 0
      (mem_ball_self (sq_pos_of_pos hR))
  · have hr0 : Complex.sqrt s ≠ 0 := by
      intro h
      have hsq := sqrt_sq s
      rw [h, zero_pow (by decide)] at hsq
      exact hs0 hsq.symm
    have hcomp : F =ᶠ[𝓝 (Complex.sqrt s)] descend F ∘ (fun r : ℂ ↦ r ^ 2) :=
      Filter.Eventually.of_forall fun r ↦ (descend_sq_of_even heven r).symm
    have hsq : AnalyticAt ℂ (fun r : ℂ ↦ r ^ 2) (Complex.sqrt s) := analyticAt_id.pow 2
    have hderiv : deriv (fun r : ℂ ↦ r ^ 2) (Complex.sqrt s) ≠ 0 := by
      simpa only [deriv_pow_field, Nat.cast_ofNat, Nat.reduceSub, pow_one] using
        mul_ne_zero (by norm_num : (2 : ℂ) ≠ 0) hr0
    have ha := (analyticAt_comp_iff_of_deriv_ne_zero hsq hderiv).mp (hF.congr hcomp)
    simpa only [sqrt_sq] using ha

end

end Grothe.UpperQuad.EvenSquareDescent

/-- info: 'Grothe.UpperQuad.EvenSquareDescent.analyticAt_descend_of_even' depends on axioms:
[propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperQuad.EvenSquareDescent.analyticAt_descend_of_even
