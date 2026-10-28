import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Tactic

/-!
# Complex kernels and real models on a quadrature cell

An identity on the open cell suffices for equality of the iterated interval
integrals. In particular the auxiliary endpoint `u = 0` need not satisfy the
pointwise production-kernel identity. No numerical bound is asserted.

Agent-ID: codex-8c4d
-/

open MeasureTheory Set

namespace Grothe.UpperChaos.ComplexRealCellIntegral

/-- A complex kernel equal to a real model on the open rectangle has the
same iterated integral, embedded in `ℂ`. No integrability assumption is
needed for this equality of Mathlib's totalized interval integrals. -/
theorem integral_eq_ofReal_of_interior
    (K : ℝ → ℝ → ℂ) (f : ℝ → ℝ → ℝ) {sLo sHi uLo uHi : ℝ}
    (hsOrder : sLo ≤ sHi) (huOrder : uLo ≤ uHi)
    (hsNonneg : 0 ≤ sLo) (huNonneg : 0 ≤ uLo)
    (hK : ∀ u ∈ Ioo uLo uHi, ∀ s ∈ Ioo sLo sHi,
      0 < u → 0 ≤ s → K u s = (f s u : ℂ)) :
    (∫ u in uLo..uHi, ∫ s in sLo..sHi, K u s) =
      ((∫ u in uLo..uHi, ∫ s in sLo..sHi, f s u) : ℂ) := by
  calc
    _ = ∫ u in uLo..uHi, ∫ s in sLo..sHi, (f s u : ℂ) := by
      apply intervalIntegral.integral_congr_Ioo_of_le huOrder
      intro u hu
      apply intervalIntegral.integral_congr_Ioo_of_le hsOrder
      intro s hs
      exact hK u hu s hs (by linarith [hu.1]) (by linarith [hs.1])
    _ = _ := by simp only [intervalIntegral.integral_ofReal]

/-- The same bridge for rational centers and positive rational half-widths,
with the nonnegative lower endpoints used by the production quadrature. -/
theorem integral_eq_ofReal_of_affine_cell
    (K : ℝ → ℝ → ℂ) (f : ℝ → ℝ → ℝ) (cs hs cu hu : ℚ)
    (hhs : 0 < hs) (hhu : 0 < hu)
    (hsNonneg : 0 ≤ (cs : ℝ) - hs) (huNonneg : 0 ≤ (cu : ℝ) - hu)
    (hK : ∀ u ∈ Ioo ((cu : ℝ) - hu) ((cu : ℝ) + hu),
      ∀ s ∈ Ioo ((cs : ℝ) - hs) ((cs : ℝ) + hs),
        0 < u → 0 ≤ s → K u s = (f s u : ℂ)) :
    (∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
      ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), K u s) =
      ((∫ u in ((cu : ℝ) - hu)..((cu : ℝ) + hu),
        ∫ s in ((cs : ℝ) - hs)..((cs : ℝ) + hs), f s u) : ℂ) := by
  have hsPos : 0 < (hs : ℝ) := by exact_mod_cast hhs
  have huPos : 0 < (hu : ℝ) := by exact_mod_cast hhu
  apply integral_eq_ofReal_of_interior K f (by linarith) (by linarith)
    hsNonneg huNonneg hK

end Grothe.UpperChaos.ComplexRealCellIntegral
