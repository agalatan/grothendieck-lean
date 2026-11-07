import Grothe.UpperQuad.GaussianShiftAnalytic
import Grothe.UpperQuad.QuadIntegrandExt
import Grothe.UpperQuad.HermiteRadialVector

/-!
# The complex radial extension of the actual twisted integrand

The signed profile ratio is holomorphic wherever the complex profile is nonzero. The fixed
real panel sign is outside the coefficient. The Gaussian damping here is only `exp(-r²)`;
the continued phase already contains its own damping.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

noncomputable section

/-- The signed canonical shift in the radial variable. -/
def shift (r : ℂ) : ℂ := r / ((QuadRem.kappa : ℂ) * QuadRem.vC (r ^ 2))

/-- One full unscaled twisted radial component, with a fixed real panel sign. -/
def radial (j q c d : ℕ) (σ : ℝ) (r : ℂ) : ℂ :=
  Complex.exp (-(r ^ 2)) * (σ : ℂ) *
    FinitePolynomialMehler.normalizedHf (q - d) (q + 1 - c) r r *
      GaussianShift.coefficient j r (shift r).re (shift r).im (c, d)

end

end Grothe.UpperQuad.TwistRadialExt
