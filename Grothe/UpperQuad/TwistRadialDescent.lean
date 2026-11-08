import Grothe.UpperQuad.TwistRadialAnalytic
import Grothe.UpperQuad.TwistRadialParity
import Grothe.UpperQuad.TwistRadialReal
import Grothe.UpperQuad.EvenSquareDescentLocal

/-!
# The analytic continuation of the actual twisted radial integrand

Global evenness makes the square-root choice immaterial. The resulting function of the
production variable `s` is analytic at every point where the actual profile is nonzero,
including zero whenever the profile there is nonzero.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

open Complex Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

/-- The full radial component as a function of the production variable `s=r²`. -/
def descended (j q c d : ℕ) (σ : ℝ) : ℂ → ℂ :=
  EvenSquareDescent.descend (radial j q c d σ)

/-- Squaring recovers the radial component for every complex radius. -/
theorem descended_sq (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q) (σ : ℝ) (r : ℂ) :
    descended j q c d σ (r ^ 2) = radial j q c d σ r :=
  EvenSquareDescent.descend_sq_of_even (radial_even j q c d hc hd σ) r

/-- Every positive-power production component is analytic off the actual profile zeros.
No square-root branch-cut or nonzero-coordinate assumption is required. -/
theorem analyticAt_descended (j q c d : ℕ) (hj : 0 < j)
    (hc : c ≤ q + 1) (hd : d ≤ q) (σ : ℝ) {s : ℂ} (hv : QuadRem.vC s ≠ 0) :
    AnalyticAt ℂ (descended j q c d σ) s := by
  apply EvenSquareDescent.analyticAt_descend_of_even (radial_even j q c d hc hd σ)
  apply analyticAt_radial j q c d σ hj
  simpa only [EvenSquareDescent.sqrt_sq] using hv

/-- A profile nonvanishing certificate on any set supplies analyticity at
every point of that set. -/
theorem analyticOnNhd_descended (j q c d : ℕ) (hj : 0 < j)
    (hc : c ≤ q + 1) (hd : d ≤ q) (σ : ℝ) {S : Set ℂ}
    (hv : ∀ s ∈ S, QuadRem.vC s ≠ 0) :
    AnalyticOnNhd ℂ (descended j q c d σ) S :=
  fun s hs ↦ analyticAt_descended j q c d hj hc hd σ (hv s hs)

/-- The complex continuation agrees with the actual real twisted quadrature integrand. -/
theorem descended_real (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q)
    (σ s : ℝ) (hs : 0 ≤ s) (hv : Grothe.UpperChaos.vprof s ≠ 0)
    (hσ : σ = profileSign s) :
    descended j q c d σ (s : ℂ) = (twistIntegrand j q c d s : ℂ) := by
  have hsq : (Real.sqrt s : ℂ) ^ 2 = (s : ℂ) := by
    exact_mod_cast Real.sq_sqrt hs
  rw [← hsq, descended_sq j q c d hc hd]
  exact radial_real_of_sign j q c d hc hd σ s hs hv hσ

end

end Grothe.UpperQuad.TwistRadialExt

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms ``Grothe.UpperQuad.GaussianShift.analyticAt_coefficient_comp
  for target in #[``Grothe.UpperQuad.TwistRadialExt.descended_sq,
      ``Grothe.UpperQuad.TwistRadialExt.analyticAt_descended,
      ``Grothe.UpperQuad.TwistRadialExt.analyticOnNhd_descended,
      ``Grothe.UpperQuad.TwistRadialExt.descended_real] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
