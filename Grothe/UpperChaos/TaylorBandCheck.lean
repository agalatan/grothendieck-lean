import Grothe.UpperChaos.HermiteFinite
import Grothe.UpperChaos.TaylorBandData

/-!
# The third approximant's first captured band

The coefficients are exact dyadic values from the preserved binary64 centers.
The finite arithmetic check gives the norm of this concrete Hermite vector.
It does not assert a bound on its distance to the true Gaussian Taylor source.
-/

open MeasureTheory

namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- The explicitly listed charge-one modes through total degree eleven. -/
def thirdBand11Support : Finset Idx2 := (thirdBand11Terms.map Prod.fst).toFinset

/-- The coefficient at a listed mode, or zero when it is not listed. -/
def thirdBand11Coeff (i : Idx2) : ℚ :=
  ((thirdBand11Terms.find? (fun t => t.1 == i)).map Prod.snd).getD 0

/-- The concrete finite Hermite vector of the third approximant's first band. -/
noncomputable def thirdBand11 : Lp ℂ 2 mu2 :=
  hermiteFinite thirdBand11Support thirdBand11Coeff

/-- All listed modes have charge one and total degree at most eleven. -/
theorem thirdBand11_support : ∀ i ∈ thirdBand11Support,
    i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 ∧
      i.1.1 + i.1.2 + i.2.1 + i.2.2 ≤ 11 := by
  decide +kernel

/-- Exact sum of squares of the coefficients of the concrete band vector. -/
theorem thirdBand11_energy_check :
    (∑ i ∈ thirdBand11Support, thirdBand11Coeff i ^ 2) = thirdBand11EnergyQ := by
  native_decide

/-- The finite arithmetic certificate is the actual squared Hermite norm. -/
theorem norm_thirdBand11_sq : ‖thirdBand11‖ ^ 2 = (thirdBand11EnergyQ : ℝ) := by
  rw [thirdBand11, norm_hermiteFinite_sq_cast, thirdBand11_energy_check]

/-- A rational lower bound on the captured norm, suitable for the tail-energy interface. -/
theorem thirdBand11_norm_lower : (thirdBand11LowerQ : ℝ) ≤ ‖thirdBand11‖ := by
  have hq : thirdBand11LowerQ ^ 2 ≤ thirdBand11EnergyQ := by decide +kernel
  have hr : (thirdBand11LowerQ : ℝ) ^ 2 ≤ (thirdBand11EnergyQ : ℝ) := by
    exact_mod_cast hq
  have hnonneg : (0 : ℝ) ≤ thirdBand11LowerQ := by norm_num [thirdBand11LowerQ]
  nlinarith [norm_thirdBand11_sq, norm_nonneg thirdBand11]

/-- The matching rational upper enclosure of the same captured norm. -/
theorem thirdBand11_norm_upper : ‖thirdBand11‖ ≤ (thirdBand11UpperQ : ℝ) := by
  have hq : thirdBand11EnergyQ ≤ thirdBand11UpperQ ^ 2 := by decide +kernel
  have hr : (thirdBand11EnergyQ : ℝ) ≤ (thirdBand11UpperQ : ℝ) ^ 2 := by
    exact_mod_cast hq
  have hnonneg : (0 : ℝ) ≤ thirdBand11UpperQ := by norm_num [thirdBand11UpperQ]
  nlinarith [norm_thirdBand11_sq, norm_nonneg thirdBand11]

end Grothe.UpperChaos
