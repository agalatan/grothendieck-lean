import Grothe.UpperChaos.AdaptiveRectangleComposition
import Grothe.UpperChaos.AdaptiveRetainedCoefficient
import Grothe.UpperChaos.AnalyticEnvelopeCell002
import Grothe.UpperChaos.AnalyticEnvelopeCell003
import Grothe.UpperChaos.AnalyticEnvelopeCell009
import Grothe.UpperChaos.Q0BasePairRoot7Leaf

/-!
# Complete actual base-pair integral on retained root 7

The exact midpoint tree splits only the auxiliary coordinate, with leaves
0, 10, 110, and 111. The first three intervals are the frozen analytic
envelope intervals; the fourth is the algebraic model-integral enclosure.
Local continuity gives exact integration over the complete reciprocal root
of radial strip 3. The sums introduce no source-omission or normalization
reserve, and the final pair has no numerical premises.

Agent-ID: codex-2ca4.
-/

open MeasureTheory Set LeanCert.Core

namespace Grothe.UpperChaos.Q0BasePairRoot7Integral

open AdaptiveRectanglePartition Q0BasePairKernelContinuity

def root : Rect :=
  ⟨20817949 / 1000000, 4164409 / 200000, 1 / 100, 1⟩

theorem root_eq_fixed : root = AdaptiveRetainedCoefficient.reciprocalRoot 3 := by
  decide +kernel

theorem root_valid : root.Valid := by decide +kernel

private theorem leaf0_eq : root.leftAux = AnalyticEnvelopeCell002.cell := by
  decide +kernel

private theorem leaf10_eq : root.rightAux.leftAux = AnalyticEnvelopeCell003.cell := by
  decide +kernel

private theorem leaf110_eq :
    root.rightAux.rightAux.leftAux = AnalyticEnvelopeCell009.cell := by
  decide +kernel

private theorem leaf111_eq : root.rightAux.rightAux.rightAux =
    (⟨20817949 / 1000000, 4164409 / 200000, 701 / 800, 1⟩ : Rect) := by
  decide +kernel

/-- The original leaf enclosures, added in their exact tree order. -/
def firstInterval : IntervalRat :=
  IntervalRat.add AnalyticEnvelopeCell002.firstInterval
    (IntervalRat.add AnalyticEnvelopeCell003.firstInterval
      (IntervalRat.add AnalyticEnvelopeCell009.firstInterval
        Q0BasePairRoot7Leaf.firstInterval))

def companionInterval : IntervalRat :=
  IntervalRat.add AnalyticEnvelopeCell002.companionInterval
    (IntervalRat.add AnalyticEnvelopeCell003.companionInterval
      (IntervalRat.add AnalyticEnvelopeCell009.companionInterval
        Q0BasePairRoot7Leaf.companionInterval))

/-- Both explicit reciprocal kernels are continuous on this entire root.
The auxiliary lower endpoint is positive, so both reciprocal denominators
stay nonzero. This is independent of all numerical leaf certificates. -/
private theorem continuous_pair :
    ContinuousOn (Function.uncurry (reciprocalFirst (1 / 1000000000000000)))
        root.domain ∧
      ContinuousOn (Function.uncurry (reciprocalCompanion (1 / 1000000000000000)))
        root.domain := by
  simpa only [Rect.domain] using
    continuousOn_reciprocal_pair (1 / 1000000000000000)
      (root.sLo : ℝ) (root.sHi : ℝ) (root.auxLo : ℝ) (root.auxHi : ℝ)
      (by norm_num [root])

/-- Three exact midpoint identities combine all four physical cells. -/
private theorem assemble (f : ℝ → ℝ → ℝ)
    (hf : ContinuousOn f.uncurry root.domain)
    {I0 I10 I110 I111 : IntervalRat}
    (h0 : root.leftAux.integral f ∈ I0)
    (h10 : root.rightAux.leftAux.integral f ∈ I10)
    (h110 : root.rightAux.rightAux.leftAux.integral f ∈ I110)
    (h111 : root.rightAux.rightAux.rightAux.integral f ∈ I111) :
    root.integral f ∈ IntervalRat.add I0
      (IntervalRat.add I10 (IntervalRat.add I110 I111)) := by
  have hv1 : root.rightAux.Valid := root.rightAux_valid root_valid
  have hv11 : root.rightAux.rightAux.Valid := root.rightAux.rightAux_valid hv1
  have hc1 : ContinuousOn f.uncurry root.rightAux.domain :=
    hf.mono (root.rightAux_domain_subset root_valid)
  have hc11 : ContinuousOn f.uncurry root.rightAux.rightAux.domain :=
    hc1.mono (root.rightAux.rightAux_domain_subset hv1)
  have h11 := root.rightAux.rightAux.integral_mem_add_splitAux hv11 f hc11 h110 h111
  have h1 := root.rightAux.integral_mem_add_splitAux hv1 f hc1 h10 h11
  exact root.integral_mem_add_splitAux root_valid f hf h0 h1

/-- Actual first integral over the whole fixed root, with no leaf premises. -/
theorem first_integral_mem :
    root.integral (reciprocalFirst (1 / 1000000000000000)) ∈ firstInterval := by
  apply assemble _ continuous_pair.1
  · rw [leaf0_eq]
    have hk : AnalyticEnvelopeCell002.firstKernel (1 / 1000000000000000) =
        reciprocalFirst (1 / 1000000000000000) := by
      funext s u
      rfl
    simpa only [hk] using
      AnalyticEnvelopeCell002.first_integral_mem (1 / 1000000000000000)
  · rw [leaf10_eq]
    have hk : AnalyticEnvelopeCell003.firstKernel (1 / 1000000000000000) =
        reciprocalFirst (1 / 1000000000000000) := by
      funext s u
      rfl
    simpa only [hk] using
      AnalyticEnvelopeCell003.first_integral_mem (1 / 1000000000000000)
  · rw [leaf110_eq]
    have hk : AnalyticEnvelopeCell009.firstKernel (1 / 1000000000000000) =
        reciprocalFirst (1 / 1000000000000000) := by
      funext s u
      rfl
    simpa only [hk] using
      AnalyticEnvelopeCell009.first_integral_mem (1 / 1000000000000000)
  · rw [leaf111_eq]
    simpa only [Rect.integral, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat, div_one] using
      Q0BasePairRoot7Leaf.integrals_mem.1

/-- Actual signed companion integral over the whole fixed root. -/
theorem companion_integral_mem :
    root.integral (reciprocalCompanion (1 / 1000000000000000)) ∈
      companionInterval := by
  apply assemble _ continuous_pair.2
  · rw [leaf0_eq]
    have hk : AnalyticEnvelopeCell002.companionKernel (1 / 1000000000000000) =
        reciprocalCompanion (1 / 1000000000000000) := by
      funext s u
      rfl
    simpa only [hk] using
      AnalyticEnvelopeCell002.companion_integral_mem (1 / 1000000000000000)
  · rw [leaf10_eq]
    have hk : AnalyticEnvelopeCell003.companionKernel (1 / 1000000000000000) =
        reciprocalCompanion (1 / 1000000000000000) := by
      funext s u
      rfl
    simpa only [hk] using
      AnalyticEnvelopeCell003.companion_integral_mem (1 / 1000000000000000)
  · rw [leaf110_eq]
    have hk : AnalyticEnvelopeCell009.companionKernel (1 / 1000000000000000) =
        reciprocalCompanion (1 / 1000000000000000) := by
      funext s u
      rfl
    simpa only [hk] using
      AnalyticEnvelopeCell009.companion_integral_mem (1 / 1000000000000000)
  · rw [leaf111_eq]
    simpa only [Rect.integral, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat, div_one] using
      Q0BasePairRoot7Leaf.integrals_mem.2

/-- The complete original four-leaf tree encloses both actual base-pair integrals. -/
theorem integrals_mem :
    root.integral (reciprocalFirst (1 / 1000000000000000)) ∈ firstInterval ∧
      root.integral (reciprocalCompanion (1 / 1000000000000000)) ∈
        companionInterval :=
  ⟨first_integral_mem, companion_integral_mem⟩

/-- The identical enclosure attached to the canonical retained root. -/
theorem fixed_root_integrals_mem :
    (AdaptiveRetainedCoefficient.reciprocalRoot 3).integral
        (reciprocalFirst (1 / 1000000000000000)) ∈ firstInterval ∧
      (AdaptiveRetainedCoefficient.reciprocalRoot 3).integral
        (reciprocalCompanion (1 / 1000000000000000)) ∈ companionInterval := by
  rw [← root_eq_fixed]
  exact integrals_mem

end Grothe.UpperChaos.Q0BasePairRoot7Integral
