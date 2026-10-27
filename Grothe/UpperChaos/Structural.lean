import Grothe.UpperChaos.Realise2
import Grothe.Upper.PolynomialBridge

/-!
# The structural fields of `DirectHyps` as theorems (S2–S6, U1–U5 of PLAN_UPPER)

For a measurable, disk-valued rounding `G` of charge one on `ℂ²` and a charge-one truncation
`X ∈ L²(gaussC ⊗ gaussC)`, the tables `E = energy G`, `EX = energy X` satisfy the structural
fields of `DirectHyps`: `valid` (the kernel `radialKernel (kernelCoeff E)` is realised by the
two-channel Gaussian rounding with the preprocessors `primaryPoly`, `auxPoly`, hence dominated),
`summable`, `summableX` and both parity statements (from charge selection).  Consequently the sharp upper bound
holds for such `G, X` as soon as the selected comparison, table accuracy and Hardy fields do
(`fresh_upper_of_rounding`).
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Grothe.Upper

namespace Grothe.UpperChaos

noncomputable section

variable {G X : ℂ × ℂ → ℂ}

/-- **The structural fields of `DirectHyps`.** -/
theorem structural_fields (hGm : Measurable G) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hGch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) (hGL : MemLp G 2 mu2)
    (hXL : MemLp X 2 mu2) (hXch : ∀ c u, ‖c‖ = 1 → X (rot2 c u) = c * X u) :
    DominatedKernel (radialKernel (kernelCoeff (energy (hGL.toLp G)))) ∧
      (Summable fun p => |energy (hGL.toLp G) p|) ∧
      (Summable fun p => |energy (hXL.toLp X) p|) ∧
      ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → energy (hXL.toLp X) p = 0 :=
  ⟨(rounding_diskKernel hGm hG1 hGch hGL l1_primaryPoly l1_auxPoly).dominated,
    summable_abs_energy _, summable_abs_energy _, energy_eq_zero_of_even hXL hXch⟩


end

end Grothe.UpperChaos
