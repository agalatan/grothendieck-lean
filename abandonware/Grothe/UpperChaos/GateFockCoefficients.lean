import Grothe.UpperChaos.GaussianFockBessel
import Grothe.UpperChaos.ScaledActualCoherentL2

/-!
# Fock coefficients in the actual gate source order

Agent-ID: codex-2ca4.

The gate coordinates for each physical variable are ((y,u),(x,v)), whereas
the coherent generating variables are ((x,y),(u,v)). This module records
both permutations explicitly and transports the proved Bessel bound to the
actual scaled transform. No actual Hermite coefficient identity is assumed.
-/

open MeasureTheory

namespace Grothe.UpperChaos.GateFockCoefficients

open GaussianFockBessel ScaledActualCoherentL2
open OriginalHSParameterGates

noncomputable section

/-- Outgoing/incoming Hermite exponents in gate order for both physical
coordinates: ((m.q,n.p),(m.p,n.q)) in each physical block. -/
def gateMatrixIndexEquiv : (Powers4 × Powers4) ≃ Powers8 where
  toFun mn :=
    (((mn.1.1.2, mn.2.1.1), (mn.1.1.1, mn.2.1.2)),
      ((mn.1.2.2, mn.2.2.1), (mn.1.2.1, mn.2.2.2)))
  invFun ij :=
    (((ij.1.2.1, ij.1.1.1), (ij.2.2.1, ij.2.1.1)),
      ((ij.1.1.2, ij.1.2.2), (ij.2.1.2, ij.2.2.2)))
  left_inv := by rintro ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩; rfl
  right_inv := by rintro ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩; rfl

/-- The inverse source permutation takes gate coordinates to coherent order. -/
def gateToCoherentSources : Sources8 ≃ Sources8 where
  toFun zw :=
    (((zw.1.2.1, zw.1.1.1), (zw.1.1.2, zw.1.2.2)),
      ((zw.2.2.1, zw.2.1.1), (zw.2.1.2, zw.2.2.2)))
  invFun zw :=
    (((zw.1.1.2, zw.1.2.1), (zw.1.1.1, zw.1.2.2)),
      ((zw.2.1.2, zw.2.2.1), (zw.2.1.1, zw.2.2.2)))
  left_inv := by rintro ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩; rfl
  right_inv := by rintro ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩; rfl

/-- Normalized monomials match pointwise under the explicit dual permutations.
This is not an unproved change-of-measure or coefficient-integral identity. -/
theorem monomial8_gate_eq_coherent (mn : Powers4 × Powers4) (zw : Sources8) :
    monomial8 (gateMatrixIndexEquiv mn) zw =
      monomial8 (matrixIndexEquiv mn) (gateToCoherentSources zw) := by
  simp only [gateMatrixIndexEquiv, matrixIndexEquiv, gateToCoherentSources,
    Equiv.coe_fn_mk, monomial8, monomial4, monomial2, tensorFamily]
  ring

/-- Reindexing the full coefficient norm needs only the explicit index equivalence. -/
theorem tsum_gate_coefficient_sq_eq (F : Sources8 → ℂ) :
    (∑' mn : Powers4 × Powers4, ‖coefficient8 F (gateMatrixIndexEquiv mn)‖ ^ 2) =
      ∑' i : Powers8, ‖coefficient8 F i‖ ^ 2 :=
  gateMatrixIndexEquiv.tsum_eq (fun i => ‖coefficient8 F i‖ ^ 2)

/-- Gate-order Gaussian coefficient energies are summable for every L2 source. -/
theorem summable_gate_coefficient_sq {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) :
    Summable (fun mn : Powers4 × Powers4 =>
      ‖coefficient8 F (gateMatrixIndexEquiv mn)‖ ^ 2) := by
  simpa only [Function.comp_def] using
    gateMatrixIndexEquiv.summable_iff.mpr (summable_coefficient8_sq hF)

/-- The matrix-index norm bound in the gate's coordinate convention. -/
theorem tsum_gate_coefficient_sq_le {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) :
    (∑' mn : Powers4 × Powers4, ‖coefficient8 F (gateMatrixIndexEquiv mn)‖ ^ 2) ≤
      ∫ z, ‖F z‖ ^ 2 ∂sourceMeasure8 := by
  rw [tsum_gate_coefficient_sq_eq]
  exact tsum_coefficient8_sq_le hF

/-- The actual scaled transform has summable gate-order coefficient energies,
using its proved source-space L2 membership rather than a convergence premise. -/
theorem summable_scaledTransform_coefficients (g : Gate) (hg : gateOK g = true) :
    Summable (fun mn : Powers4 × Powers4 =>
      ‖coefficient8 (scaledTransform g) (gateMatrixIndexEquiv mn)‖ ^ 2) :=
  summable_gate_coefficient_sq (memLp_scaledTransform g hg)

/-- Bessel's upper bound for the actual scaled transform, with both the gate
weights and actual production multiplier retained in the norm integral. -/
theorem tsum_scaledTransform_coefficients_le (g : Gate) (hg : gateOK g = true) :
    (∑' mn : Powers4 × Powers4,
      ‖coefficient8 (scaledTransform g) (gateMatrixIndexEquiv mn)‖ ^ 2) ≤
      ∫ z, ‖scaledTransform g z‖ ^ 2 ∂sourceMeasure8 :=
  tsum_gate_coefficient_sq_le (memLp_scaledTransform g hg)

end
end Grothe.UpperChaos.GateFockCoefficients
