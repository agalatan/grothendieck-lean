import Grothe.UpperQuad.TwistRadialExtension
import Grothe.UpperQuad.GaussianShiftReal
import Grothe.UpperQuad.TwistRadial

/-!
# The actual real slice of the twisted radial extension

At a nonnegative radial node, the signed profile ratio and the swapped normalized Hermite
factor recover the existing twisted radial integrand. The measure is already expressed in
the squared radius, so its Gaussian density is `exp(-s)` with no additional Jacobian.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

open Complex Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator
open FinitePolynomialMehler
open scoped ComplexConjugate

noncomputable section

/-- On real arguments the normalized formal polynomial is the existing Hermite function. -/
theorem normalizedHf_ofReal (p q : ℕ) (r : ℝ) :
    normalizedHf p q (r : ℂ) (r : ℂ) = hfun (p, q) (r : ℂ) := by
  simp only [normalizedHf, hfun, Mehler.ev_H_eq_Hf, Complex.conj_ofReal]

/-- Swapping the formal Hermite indices gives the conjugated primary factor. -/
theorem normalizedHf_swap_eq_conj_hfun (p q : ℕ) (r : ℝ) :
    normalizedHf q p (r : ℂ) (r : ℂ) = conj (hfun (p, q) (r : ℂ)) := by
  rw [normalizedHf_ofReal]
  simp only [hfun, map_mul, Complex.conj_ofReal, conj_ev_H_swap]
  congr 1
  simp only [nrm, Nat.mul_comm]

/-- The swapped formal primary factor agrees with the actual radial Laguerre factor
on the full graded rectangle, including the zero-radius endpoint. -/
theorem normalizedHf_swapped_psiR (q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q)
    (s : ℝ) (hs : 0 ≤ s) :
    normalizedHf (q - d) (q + 1 - c) (Real.sqrt s : ℂ) (Real.sqrt s : ℂ) =
      (psiR q c d s : ℂ) := by
  rw [normalizedHf_swap_eq_conj_hfun, conj_primary_psiR q c d hc hd hs]

/-- The complex profile ratio specializes to the signed canonical shift.
This algebraic identity also holds at a profile zero under totalized division. -/
theorem shift_sqrt_signed (s : ℝ) (hs : 0 ≤ s) :
    shift (Real.sqrt s : ℂ) = ((profileSign s * profileShift s : ℝ) : ℂ) := by
  have hreal : Real.sqrt s / (QuadRem.kappa * vprof s) =
      profileSign s * profileShift s := by
    by_cases h : vprof s < 0
    · simp [profileSign, profileShift, profileScale, QuadRem.kappa, h, abs_of_neg h,
        div_neg_eq_neg_div]
    · simp [profileSign, profileShift, profileScale, QuadRem.kappa, h,
        abs_of_nonneg (le_of_not_gt h)]
  rw [shift, ← Complex.ofReal_pow, Real.sq_sqrt hs, QuadRem.vC_ofReal,
    ← Complex.ofReal_mul, ← Complex.ofReal_div, hreal]

/-- The complex radial component is exactly the existing unscaled twisted integrand
on its actual signed real slice. -/
theorem radial_real (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q)
    (s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0) :
    radial j q c d (profileSign s) (Real.sqrt s : ℂ) = (twistIntegrand j q c d s : ℂ) := by
  rw [radial, shift_sqrt_signed s hs, Complex.ofReal_re, Complex.ofReal_im,
    normalizedHf_swapped_psiR q c d hc hd s hs, ← Complex.ofReal_pow,
    Real.sq_sqrt hs, ← Complex.ofReal_neg, ← Complex.ofReal_exp]
  have hcoef := GaussianShift.twistCoef_eq_signed_coefficient j s hs hv (c, d)
  calc
    _ = (Real.exp (-s) : ℂ) * ((psiR q c d s : ℂ) * twistCoef j s (c, d)) := by
      rw [hcoef]
      ring
    _ = (twistIntegrand j q c d s : ℂ) := by
      rw [twistCoef_eq_re]
      simp only [twistIntegrand, Complex.ofReal_mul]

/-- A fixed panel sign can be supplied through its equality with the actual profile sign. -/
theorem radial_real_of_sign (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q)
    (σ s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0) (hσ : σ = profileSign s) :
    radial j q c d σ (Real.sqrt s : ℂ) = (twistIntegrand j q c d s : ℂ) := by
  rw [hσ]
  exact radial_real j q c d hc hd s hs hv

end

end Grothe.UpperQuad.TwistRadialExt

open Lean Elab Command
run_cmd do
  let inherited ←
    Lean.collectAxioms ``Grothe.UpperQuad.GaussianShift.twistCoef_eq_signed_coefficient
  for target in #[``Grothe.UpperQuad.TwistRadialExt.normalizedHf_swapped_psiR,
      ``Grothe.UpperQuad.TwistRadialExt.shift_sqrt_signed,
      ``Grothe.UpperQuad.TwistRadialExt.radial_real,
      ``Grothe.UpperQuad.TwistRadialExt.radial_real_of_sign] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
