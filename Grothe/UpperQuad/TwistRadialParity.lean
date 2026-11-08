import Grothe.UpperQuad.TwistRadialExtension
import Grothe.UpperQuad.GaussianShiftParity

/-!
# Evenness of the actual twisted radial extension

The signed canonical shift is odd in the radial variable. Its conditional coefficient
parity cancels the primary Hermite parity, making each full graded radial component even.
The statement includes all natural phase powers and every fixed real panel sign.

Agent-ID: codex-2f3d. Refs #334, #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

open Complex FinitePolynomialMehler

/-- The signed canonical shift is odd, including the totalized values at profile zeros. -/
theorem shift_neg (r : ℂ) : shift (-r) = -shift r := by
  simp only [shift, neg_sq, neg_div]

/-- Every full graded radial component is even in the square-root variable. -/
theorem radial_even (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q) (σ : ℝ) :
    Function.Even (radial j q c d σ) := by
  intro r
  calc
    radial j q c d σ (-r) = (σ : ℂ) *
        (Complex.exp (-((-r) ^ 2)) * normalizedHf (q - d) (q + 1 - c) (-r) (-r) *
          GaussianShift.coefficient j (-r) (-(shift r)).re (-(shift r)).im (c, d)) := by
      rw [radial, shift_neg]
      ring
    _ = (σ : ℂ) *
        (Complex.exp (-(r ^ 2)) * normalizedHf (q - d) (q + 1 - c) r r *
          GaussianShift.coefficient j r (shift r).re (shift r).im (c, d)) := by
      rw [GaussianShift.primary_product_neg_neg j q c d hc hd]
    _ = radial j q c d σ r := by
      rw [radial]
      ring

end Grothe.UpperQuad.TwistRadialExt

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms ``Grothe.UpperQuad.GaussianShift.coefficient_neg_neg
  for target in #[``Grothe.UpperQuad.TwistRadialExt.shift_neg,
      ``Grothe.UpperQuad.TwistRadialExt.radial_even] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
