import Grothe.HJM.OriginAnalytic
import Grothe.HJM.Origin

/-!
# Endpoint-subtracted coefficients of the actual origin branch

Agent-ID: codex-aa04.

The residual response is the original Gaussian response minus its endpoint
value times Gaussian phase. Linearity in the second inner-product argument
therefore identifies its coefficients with the endpoint-subtracted original
coefficients. The full weighted-energy identities now have precisely this
form, with the actual continuous energy integrals on the right.

The phase coefficient retains the signed Hermite convention. No absolute
value is inserted before endpoint subtraction, and no table or numerical
enclosure is asserted.
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- Equality of the actual left Gaussian L² vectors, including the phase
convention at zero. -/
theorem fResidualLp_eq_sub : fResidualLp = FLp - f 0 • Grothe.Haag.phaseLp := by
  calc
    fResidualLp = (memLp_F.sub (Grothe.Haag.memLp_ph.const_smul (f 0))).toLp
        (F - f 0 • Grothe.Haag.ph) := by
      apply MemLp.toLp_congr memLp_fResidual
        (memLp_F.sub (Grothe.Haag.memLp_ph.const_smul (f 0)))
      exact Filter.Eventually.of_forall fun z => by
        simp only [Pi.sub_apply, Pi.smul_apply, smul_eq_mul, F, fResidual]
        ring
    _ = FLp - f 0 • Grothe.Haag.phaseLp := by
      change (memLp_F.sub (Grothe.Haag.memLp_ph.const_smul (f 0))).toLp
          (F - f 0 • Grothe.Haag.ph) =
        memLp_F.toLp F - f 0 • Grothe.Haag.memLp_ph.toLp Grothe.Haag.ph
      exact (MemLp.toLp_sub memLp_F (Grothe.Haag.memLp_ph.const_smul (f 0))).trans
        (congrArg (fun V : Lp ℂ 2 gaussC => memLp_F.toLp F - V)
          (MemLp.toLp_const_smul (f 0) Grothe.Haag.memLp_ph))

/-- Equality of the actual right residual and endpoint-subtracted response. -/
theorem gResidualLp_eq_sub : gResidualLp = GLp - g 0 • Grothe.Haag.phaseLp := by
  calc
    gResidualLp = (memLp_G.sub (Grothe.Haag.memLp_ph.const_smul (g 0))).toLp
        (G - g 0 • Grothe.Haag.ph) := by
      apply MemLp.toLp_congr memLp_gResidual
        (memLp_G.sub (Grothe.Haag.memLp_ph.const_smul (g 0)))
      exact Filter.Eventually.of_forall fun z => by
        simp only [Pi.sub_apply, Pi.smul_apply, smul_eq_mul, G, gResidual]
        ring
    _ = GLp - g 0 • Grothe.Haag.phaseLp := by
      change (memLp_G.sub (Grothe.Haag.memLp_ph.const_smul (g 0))).toLp
          (G - g 0 • Grothe.Haag.ph) =
        memLp_G.toLp G - g 0 • Grothe.Haag.memLp_ph.toLp Grothe.Haag.ph
      exact (MemLp.toLp_sub memLp_G (Grothe.Haag.memLp_ph.const_smul (g 0))).trans
        (congrArg (fun V : Lp ℂ 2 gaussC => memLp_G.toLp G - V)
          (MemLp.toLp_const_smul (g 0) Grothe.Haag.memLp_ph))

/-- The left residual coefficient is the signed original coefficient minus
the endpoint contribution. The scalar is not conjugated: coefficients are
linear in the response, the inner product's second argument. -/
theorem chargeOneCoeff_fResidualLp (n : ℕ) :
    chargeOneCoeff fResidualLp n = chargeOneCoeff FLp n -
      f 0 * chargeOneCoeff Grothe.Haag.phaseLp n := by
  rw [fResidualLp_eq_sub, chargeOneCoeff_sub]
  simp only [chargeOneCoeff, inner_smul_right]

/-- The analogous exact subtraction for the asymmetric right response. -/
theorem chargeOneCoeff_gResidualLp (n : ℕ) :
    chargeOneCoeff gResidualLp n = chargeOneCoeff GLp n -
      g 0 * chargeOneCoeff Grothe.Haag.phaseLp n := by
  rw [gResidualLp_eq_sub, chargeOneCoeff_sub]
  simp only [chargeOneCoeff, inner_smul_right]

/-- Full weighted left energy in the original branch coefficients, in the
endpoint-subtracted form used for the origin tail estimate. -/
theorem f_endpoint_subtracted_hasSum_weighted_energy :
    HasSum (fun n : ℕ => (2 * (n : ℝ) + 1) ^ 2 *
      ‖chargeOneCoeff FLp n - f 0 * chargeOneCoeff Grothe.Haag.phaseLp n‖ ^ 2)
      (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) := by
  simpa only [chargeOneCoeff_fResidualLp] using fResidual_hasSum_weighted_energy

/-- Full weighted right energy with the original Gaussian normalization. -/
theorem g_endpoint_subtracted_hasSum_weighted_energy :
    HasSum (fun n : ℕ => (2 * (n : ℝ) + 1) ^ 2 *
      ‖chargeOneCoeff GLp n - g 0 * chargeOneCoeff Grothe.Haag.phaseLp n‖ ^ 2)
      (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) := by
  simpa only [chargeOneCoeff_gResidualLp] using gResidual_hasSum_weighted_energy

end

end Grothe.HJM.Origin
