import Grothe.UpperReplacement.Cells
import Grothe.UpperReplacement.Moments
import Grothe.UpperReplacement.CellModes
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Periodic

set_option warningAsError true

-- Section: CellFourier

/-!
# The Fourier transform of the actual centered angular lookup

Agent-ID: codex-a7c4.

Every angular cell is integrated over its full width. The proof retains the sinc factor and
works at all integer frequencies, including zero and frequencies above the angular grid size.
-/

open MeasureTheory Real Set

namespace Grothe.UpperReplacement

noncomputable section

theorem angularIndex_lt {A : ℕ} (hA : 0 < A) (z : ℂ) : angularIndex A z < A := by
  unfold angularIndex
  exact Int.natMod_lt (by omega)

def angularFourierIntegrand (A : ℕ) (v : ℕ → ℂ) (m : ℤ) (θ : ℝ) : ℂ :=
  Complex.exp (((-(m : ℝ) * θ : ℝ) : ℂ) * Complex.I) *
    v (angularIndex A (Complex.exp ((θ : ℂ) * Complex.I)))

theorem measurable_angularFourierIntegrand (A : ℕ) (v : ℕ → ℂ) (m : ℤ) :
    Measurable (angularFourierIntegrand A v m) := by
  apply Measurable.mul (by fun_prop)
  exact (measurable_of_countable v).comp
    ((measurable_angularIndex A).comp (by fun_prop))

theorem angularFourierIntegrand_bound {A : ℕ} (hA : 0 < A) (v : ℕ → ℂ) (m : ℤ)
    (θ : ℝ) :
    ‖angularFourierIntegrand A v m θ‖ ≤ ∑ j ∈ Finset.range A, ‖v j‖ := by
  rw [angularFourierIntegrand, norm_mul, Complex.norm_exp_ofReal_mul_I, one_mul]
  exact Finset.single_le_sum (fun j _ ↦ norm_nonneg (v j))
    (Finset.mem_range.mpr (angularIndex_lt hA _))

theorem intervalIntegrable_angularFourierIntegrand {A : ℕ} (hA : 0 < A)
    (v : ℕ → ℂ) (m : ℤ) (a b : ℝ) :
    IntervalIntegrable (angularFourierIntegrand A v m) volume a b := by
  have : IsFiniteMeasure (volume.restrict (uIoc a b)) :=
    Real.isFiniteMeasure_restrict_Ioc _ _
  apply intervalIntegrable_iff.mpr
  exact Integrable.of_bound (measurable_angularFourierIntegrand A v m).aestronglyMeasurable
    (∑ j ∈ Finset.range A, ‖v j‖)
    (Filter.Eventually.of_forall (angularFourierIntegrand_bound hA v m))

theorem angularFourierIntegrand_periodic (A : ℕ) (v : ℕ → ℂ) (m : ℤ) :
    Function.Periodic (angularFourierIntegrand A v m) (2 * π) := by
  intro θ
  have he : Complex.exp (((θ + 2 * π : ℝ) : ℂ) * Complex.I) =
      Complex.exp ((θ : ℂ) * Complex.I) := by
    push_cast
    rw [add_mul, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
  have hm : Complex.exp (((-(m : ℝ) * (θ + 2 * π) : ℝ) : ℂ) * Complex.I) =
      Complex.exp (((-(m : ℝ) * θ : ℝ) : ℂ) * Complex.I) := by
    rw [show (((-(m : ℝ) * (θ + 2 * π) : ℝ) : ℂ) * Complex.I) =
      (((-(m : ℝ) * θ : ℝ) : ℂ) * Complex.I) + ((-m : ℤ) : ℂ) *
        (2 * (π : ℂ) * Complex.I) by push_cast; ring,
      Complex.exp_add, Complex.exp_int_mul_two_pi_mul_I, mul_one]
  simp only [angularFourierIntegrand, he, hm]

/-- Integration on one whole centered cell. Endpoints are irrelevant to Lebesgue integration. -/
theorem integral_angularFourierIntegrand_cell {A j : ℕ} (hA : 0 < A) (hj : j < A)
    (v : ℕ → ℂ) (m : ℤ) :
    (∫ θ in (2 * π * ((j : ℝ) - 1 / 2) / A)..(2 * π * ((j : ℝ) + 1 / 2) / A),
      angularFourierIntegrand A v m θ) =
        Complex.exp (((-(m : ℝ) * (2 * π * j / A) : ℝ) : ℂ) * Complex.I) *
          ((2 * (π / A) * sinc (-(m : ℝ) * (π / A)) : ℝ) : ℂ) * v j := by
  have hAr : (0 : ℝ) < A := by exact_mod_cast hA
  have hab : 2 * π * ((j : ℝ) - 1 / 2) / A ≤
      2 * π * ((j : ℝ) + 1 / 2) / A := by
    apply div_le_div_of_nonneg_right _ hAr.le
    nlinarith [pi_pos]
  calc
    _ = ∫ θ in (2 * π * ((j : ℝ) - 1 / 2) / A)..
        (2 * π * ((j : ℝ) + 1 / 2) / A),
        Complex.exp (((-(m : ℝ) * θ : ℝ) : ℂ) * Complex.I) * v j := by
      apply intervalIntegral.integral_congr_ae
      filter_upwards [Measure.ae_ne volume (2 * π * ((j : ℝ) + 1 / 2) / A)] with θ hne hθ
      rw [uIoc_of_le hab] at hθ
      have hi := angularIndex_on_cell hA (j : ℤ)
        (by simpa only [Int.cast_natCast] using hθ.1.le)
        (by simpa only [Int.cast_natCast] using lt_of_le_of_ne hθ.2 hne)
      have hj0 : (0 : ℤ) ≤ j := by positivity
      have hjA : (j : ℤ) < A := by exact_mod_cast hj
      simp only [Int.emod_eq_of_lt hj0 hjA, Int.toNat_natCast] at hi
      exact congrArg (fun k ↦ Complex.exp
        (((-(m : ℝ) * θ : ℝ) : ℂ) * Complex.I) * v k) hi
    _ = _ := by
      rw [intervalIntegral.integral_mul_const]
      have h := integral_exp_frequency_cell (-(m : ℝ)) (π / A) (2 * π * j / A)
      convert congrArg (fun z : ℂ ↦ z * v j) h using 1
      congr 2 <;> ring

/-- The exact centered-cell DFT, with no discarded high-frequency modes. -/
theorem integral_angularFourierIntegrand {A : ℕ} (hA : 0 < A) (v : ℕ → ℂ) (m : ℤ) :
    (∫ θ in (-π)..π, angularFourierIntegrand A v m θ) =
      ∑ j ∈ Finset.range A,
        Complex.exp (((-(m : ℝ) * (2 * π * j / A) : ℝ) : ℂ) * Complex.I) *
          ((2 * (π / A) * sinc (-(m : ℝ) * (π / A)) : ℝ) : ℂ) * v j := by
  let a : ℕ → ℝ := fun j ↦ 2 * π * ((j : ℝ) - 1 / 2) / A
  have hAr : (A : ℝ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt hA
  have h₀ : a 0 = -(π / A) := by dsimp [a]; ring
  have hA' : a A = -(π / A) + 2 * π := by dsimp [a]; field_simp; ring
  have hnext (j : ℕ) : a (j + 1) = 2 * π * ((j : ℝ) + 1 / 2) / A := by
    dsimp [a]
    push_cast
    ring
  have hsum := intervalIntegral.sum_integral_adjacent_intervals (a := a) (n := A)
    (fun j _ ↦ intervalIntegrable_angularFourierIntegrand hA v m (a j) (a (j + 1)))
  rw [h₀, hA'] at hsum
  have hper := (angularFourierIntegrand_periodic A v m).intervalIntegral_add_eq
    (-π) (-(π / A))
  rw [show -π + 2 * π = π by ring] at hper
  rw [hper, ← hsum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [hnext]
  exact integral_angularFourierIntegrand_cell hA (Finset.mem_range.mp hj) v m

/-- The normalized angular coefficient of the actual piecewise constant response. -/
def angularCellCoefficient (A : ℕ) (v : ℕ → ℂ) (m : ℤ) : ℂ :=
  (2 * (π : ℂ))⁻¹ * ∫ θ in (-π)..π, angularFourierIntegrand A v m θ

theorem angularCellCoefficient_eq_dft {A : ℕ} (hA : 0 < A) (v : ℕ → ℂ) (m : ℤ) :
    angularCellCoefficient A v m =
      (((sinc ((m : ℝ) * (π / A)) / A : ℝ)) : ℂ) *
        ∑ j ∈ Finset.range A,
          Complex.exp (((-(m : ℝ) * (2 * π * j / A) : ℝ) : ℂ) * Complex.I) * v j := by
  rw [angularCellCoefficient, integral_angularFourierIntegrand hA,
    Finset.mul_sum, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j _
  simp only [neg_mul, sinc_neg]
  have hp : (π : ℂ) ≠ 0 := by exact_mod_cast pi_ne_zero
  have hAc : (A : ℂ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt hA
  push_cast
  field_simp

theorem integral_angularFourierIntegrand_reflected (A : ℕ) (v : ℕ → ℂ) (m : ℤ) :
    (∫ θ in (-π)..π, angularFourierIntegrand A v m (-θ)) =
      2 * (π : ℂ) * angularCellCoefficient A v m := by
  rw [intervalIntegral.integral_comp_neg, neg_neg, angularCellCoefficient]
  have hp : 2 * (π : ℂ) ≠ 0 := by
    exact mul_ne_zero (by norm_num) (by exact_mod_cast pi_ne_zero)
  rw [← mul_assoc, mul_inv_cancel₀ hp, one_mul]

end

end Grothe.UpperReplacement

-- Section: CellPolar

/-!
# Polar separation for the actual production Hermite functions

Agent-ID: codex-a7c4.

The Gaussian Jacobian, tensor normalization, and angular character are proved for the same
Hermite functions that define `pairEnergy`. No external convention for Laguerre signs is used.
-/

open MeasureTheory Real Set Grothe.LowerAnalytic Grothe.UpperChaos
open scoped ComplexConjugate

namespace Grothe.UpperReplacement

noncomputable section

/-- Polar Gaussian integration for a separated complex-valued integrand. The total Bochner
integral convention makes the identity valid without separate integrability hypotheses. -/
theorem integral_gaussC_separated_complex (F : ℂ → ℂ) (hF : Measurable F)
    (f g : ℝ → ℂ)
    (he : ∀ r θ : ℝ, 0 < r → -π < θ → θ < π →
      F ((r : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) = f r * g θ) :
    (∫ z, F z ∂gaussC) =
      ((π⁻¹ : ℝ) : ℂ) * (∫ r in Ioi (0 : ℝ), (r * exp (-r ^ 2) : ℂ) * f r) *
        ∫ θ in (-π)..π, g θ := by
  rw [integral_gaussC_eq_volume_complex F hF,
    ← Complex.integral_comp_polarCoord_symm, polarCoord_target]
  have hp : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 • ((π⁻¹ * exp (-Complex.normSq (Complex.polarCoord.symm p))) •
        F (Complex.polarCoord.symm p)) =
        (((π⁻¹ : ℝ) : ℂ) * ((p.1 * exp (-p.1 ^ 2) : ℂ) * f p.1)) * g p.2 := by
    intro p hp
    rw [Complex.normSq_eq_norm_sq, norm_polarCoord_symm_of_mem hp]
    have hz : Complex.polarCoord.symm p =
        (p.1 : ℂ) * Complex.exp ((p.2 : ℂ) * Complex.I) := by
      simp only [Complex.polarCoord_symm_apply, Complex.exp_mul_I, Complex.ofReal_cos,
        Complex.ofReal_sin]
    rw [hz, he p.1 p.2 hp.1 hp.2.1 hp.2.2]
    simp only [Complex.real_smul]
    push_cast
    ring
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hp,
    Measure.volume_eq_prod]
  rw [setIntegral_prod_mul
    (fun r : ℝ ↦ ((π⁻¹ : ℝ) : ℂ) * ((r * exp (-r ^ 2) : ℂ) * f r)) g,
    integral_const_mul,
    ← integral_Ioc_eq_integral_Ioo,
    ← intervalIntegral.integral_of_le (show -π ≤ π by linarith [pi_pos])]

theorem hfun2_factor (i : Idx2) (z w : ℂ) :
    hfun2 i (z, w) = hfun i.1 z * hfun i.2 w := by
  have hn : nrm2 i = nrm i.1.1 i.1.2 * nrm i.2.1 i.2.2 := by
    unfold nrm2 nrm fac2
    rw [Nat.cast_mul, Real.sqrt_mul (by positivity), mul_inv]
  rw [hfun2, hn]
  simp only [H2, hfun, Complex.ofReal_mul]
  ring

theorem phase_character (p q : ℕ) (θ : ℝ) :
    Complex.exp ((θ : ℂ) * Complex.I) ^ p *
      conj (Complex.exp ((θ : ℂ) * Complex.I)) ^ q =
      Complex.exp (((((p : ℝ) - q) * θ : ℝ) : ℂ) * Complex.I) := by
  rw [← Complex.exp_conj, ← Complex.exp_nat_mul, ← Complex.exp_nat_mul, ← Complex.exp_add]
  congr 1
  simp only [map_mul, Complex.conj_ofReal, Complex.conj_I]
  push_cast
  ring

/-- Exact radial polynomial times its angular character, with the production normalization. -/
theorem hfun_polar (p q : ℕ) (r θ : ℝ) :
    hfun (p, q) ((r : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) =
      Complex.exp (((((p : ℝ) - q) * θ : ℝ) : ℂ) * Complex.I) *
        ((nrm p q * radialHermite p q r : ℝ) : ℂ) := by
  have hc : conj (Complex.exp ((θ : ℂ) * Complex.I)) *
      Complex.exp ((θ : ℂ) * Complex.I) = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq,
      Complex.norm_exp_ofReal_mul_I]
    norm_num
  rw [hfun, mul_comm (r : ℂ), ev_mul_H hc, phase_character,
    ev_H_eq_radialHermite, Complex.ofReal_mul]
  push_cast
  ring

end

end Grothe.UpperReplacement

-- Section: CellPartitionIntegrals

/-!
# Finite radial partitions of Gaussian integrals

Agent-ID: codex-a7c4.

This connects half-open floor-indexed radial cells to exact ordinary interval integrals.
The value on a boundary is handled by the actual floor convention, or by a stated null-set
identity when changing integration domains.
-/

open MeasureTheory Real Set Finset Grothe.LowerAnalytic

namespace Grothe.UpperReplacement

noncomputable section

def radialMask (N j : ℕ) (R : ℝ) : Set ℂ :=
  {z | R * j / N ≤ ‖z‖ ∧ ‖z‖ < R * (j + 1) / N}

theorem measurableSet_radialMask (N j : ℕ) (R : ℝ) : MeasurableSet (radialMask N j R) :=
  (measurableSet_le measurable_const measurable_norm).inter
    (measurableSet_lt measurable_norm measurable_const)

theorem radial_floor_mem {N : ℕ} (hN : 0 < N) {R r : ℝ} (hR : 0 < R) (hr : 0 ≤ r)
    (hcut : r < R) :
    ⌊(N : ℝ) * r / R⌋₊ < N ∧
      R * ⌊(N : ℝ) * r / R⌋₊ / N ≤ r ∧
      r < R * (⌊(N : ℝ) * r / R⌋₊ + 1) / N := by
  have hNr : (0 : ℝ) < N := by exact_mod_cast hN
  have hx : 0 ≤ (N : ℝ) * r / R := by positivity
  have hlo := Nat.floor_le hx
  have hhi := Nat.lt_floor_add_one ((N : ℝ) * r / R)
  refine ⟨(Nat.floor_lt hx).mpr ?_, ?_, ?_⟩
  · exact (div_lt_iff₀ hR).mpr (by nlinarith)
  · apply (div_le_iff₀ hNr).mpr
    have h := (le_div_iff₀ hR).mp hlo
    nlinarith
  · apply (lt_div_iff₀ hNr).mpr
    have h := (div_lt_iff₀ hR).mp hhi
    nlinarith

/-- An integrand supported below `R` is exactly the sum of its radial-cell restrictions. -/
theorem sum_radialMask_indicator {N : ℕ} (hN : 0 < N) {R : ℝ} (hR : 0 < R)
    (F : ℂ → ℂ) (hzero : ∀ z, R ≤ ‖z‖ → F z = 0) (z : ℂ) :
    (∑ j ∈ range N, (radialMask N j R).indicator F z) = F z := by
  classical
  by_cases hz : ‖z‖ < R
  · let k := ⌊(N : ℝ) * ‖z‖ / R⌋₊
    obtain ⟨hk, hlo, hhi⟩ := radial_floor_mem hN hR (norm_nonneg z) hz
    rw [sum_eq_single k]
    · exact indicator_of_mem (show z ∈ radialMask N k R from ⟨hlo, hhi⟩) F
    · intro j _ hj
      apply indicator_of_notMem
      intro h
      have he := radialIndex_on_cell hN hR h.1 h.2
      exact hj he.symm
    · exact fun h ↦ (h (mem_range.mpr hk)).elim
  · rw [hzero z (le_of_not_gt hz)]
    apply sum_eq_zero
    intro j hj
    apply indicator_of_notMem
    intro h
    exact hz (radius_lt_of_cell (mem_range.mp hj) hR h.2)

theorem integral_radialMask_sum {N : ℕ} (hN : 0 < N) {R : ℝ} (hR : 0 < R)
    {F : ℂ → ℂ} (hF : Integrable F gaussC) (hzero : ∀ z, R ≤ ‖z‖ → F z = 0) :
    (∫ z, F z ∂gaussC) =
      ∑ j ∈ range N, ∫ z, (radialMask N j R).indicator F z ∂gaussC := by
  rw [← integral_finsetSum (range N) (fun j _ ↦ hF.indicator (measurableSet_radialMask N j R))]
  exact integral_congr_ae (Filter.Eventually.of_forall fun z ↦
    (sum_radialMask_indicator hN hR F hzero z).symm)

/-- The positive-radius integral of a radial-cell indicator is the usual interval integral. -/
theorem integral_Ioi_radial_indicator (f : ℝ → ℂ) {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) :
    (∫ r in Ioi (0 : ℝ), (Ico a b).indicator f r) = ∫ r in a..b, f r := by
  rw [setIntegral_indicator measurableSet_Ico, intervalIntegral.integral_of_le hab]
  apply setIntegral_congr_set
  filter_upwards [Measure.ae_ne volume (0 : ℝ), Measure.ae_ne volume a,
    Measure.ae_ne volume b] with r hr0 hra hrb
  apply propext
  simp only [mem_inter_iff, Set.mem_Ioi, Set.mem_Ico, Set.mem_Ioc]
  constructor
  · rintro ⟨_, h₀, h₁⟩
    exact ⟨lt_of_le_of_ne h₀ (Ne.symm hra), h₁.le⟩
  · rintro ⟨h₀, h₁⟩
    exact ⟨ha.trans_lt h₀, h₀.le, lt_of_le_of_ne h₁ hrb⟩

/-- Exact evaluation when the integrand separates into a radial factor and an angular factor
on every radial cell. All finite exchanges are justified by integrability of the actual source. -/
theorem integral_gaussC_radial_cells {N : ℕ} (hN : 0 < N) {R : ℝ} (hR : 0 < R)
    {F : ℂ → ℂ} (hFm : Measurable F) (hFI : Integrable F gaussC)
    (hzero : ∀ z, R ≤ ‖z‖ → F z = 0) (f : ℝ → ℂ) (g : ℕ → ℝ → ℂ)
    (hcell : ∀ j < N, ∀ r θ : ℝ, 0 < r →
      R * j / N ≤ r → r < R * (j + 1) / N → -π < θ → θ < π →
      F ((r : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) = f r * g j θ) :
    (∫ z, F z ∂gaussC) =
      ∑ j ∈ range N, ((π⁻¹ : ℝ) : ℂ) *
        (∫ r in (R * j / N)..(R * (j + 1) / N), (r * exp (-r ^ 2) : ℂ) * f r) *
          ∫ θ in (-π)..π, g j θ := by
  rw [integral_radialMask_sum hN hR hFI hzero]
  apply sum_congr rfl
  intro j hj
  rw [integral_gaussC_separated_complex
    ((radialMask N j R).indicator F) (hFm.indicator (measurableSet_radialMask N j R))
    ((Ico (R * j / N) (R * (j + 1) / N)).indicator f) (g j)]
  · have hi : (fun r : ℝ ↦ (r * exp (-r ^ 2) : ℂ) *
        (Ico (R * j / N) (R * (j + 1) / N)).indicator f r) =
        (Ico (R * j / N) (R * (j + 1) / N)).indicator
          (fun r : ℝ ↦ (r * exp (-r ^ 2) : ℂ) * f r) := by
      ext r
      by_cases hr : r ∈ Ico (R * j / N) (R * (j + 1) / N) <;> simp [hr]
    rw [hi, integral_Ioi_radial_indicator _ (by positivity) (by
      apply div_le_div_of_nonneg_right _ (by positivity)
      nlinarith)]
  · intro r θ hr hθ₀ hθ₁
    have hn : ‖(r : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)‖ = r := by
      rw [norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one,
        Complex.norm_real, Real.norm_of_nonneg hr.le]
    by_cases hmem : r ∈ Ico (R * j / N) (R * (j + 1) / N)
    · have hm : (r : ℂ) * Complex.exp ((θ : ℂ) * Complex.I) ∈ radialMask N j R := by
        simpa only [radialMask, Set.mem_ofPred_eq, hn, Set.mem_Ico] using hmem
      rw [indicator_of_mem hm, indicator_of_mem hmem]
      exact hcell j (mem_range.mp hj) r θ hr hmem.1 hmem.2 hθ₀ hθ₁
    · have hm : (r : ℂ) * Complex.exp ((θ : ℂ) * Complex.I) ∉ radialMask N j R := by
        simpa only [radialMask, Set.mem_ofPred_eq, hn, Set.mem_Ico] using hmem
      rw [indicator_of_notMem hm, indicator_of_notMem hmem, zero_mul]

end

end Grothe.UpperReplacement

-- Section: CellCoefficients

/-!
# Coefficients of the actual dyadic cell responses

Agent-ID: codex-a7c4.

The first coordinate is made real by the proved common-rotation invariance. The remaining
angle is reflected, so its coefficient has exactly the negative-frequency DFT convention.
-/

open MeasureTheory Real Set Finset Grothe.LowerAnalytic Grothe.UpperChaos
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperReplacement

noncomputable section

def cellEntry (table : Array (ℤ × ℤ)) (scale N k i j : ℕ) : ℂ :=
  let v := table[k * N * N + i * N + j]?.getD (0, 0)
  clippedCell scale v.1 v.2

def normalizedRadial (p q : ℕ) (r : ℝ) : ℝ := nrm p q * radialHermite p q r

def normalizedRadialMoment (p q : ℕ) (a b : ℝ) : ℝ :=
  nrm p q * radialHermiteMoment p q a b

theorem integral_normalizedRadial (p q : ℕ) (a b : ℝ) :
    (∫ r in a..b, (r * exp (-r ^ 2) : ℂ) * (normalizedRadial p q r : ℂ)) =
      (1 / 2 : ℂ) * (normalizedRadialMoment p q a b : ℂ) := by
  have he : ∀ r : ℝ,
      (r * exp (-r ^ 2) : ℂ) * (normalizedRadial p q r : ℂ) =
        (((nrm p q / 2 : ℝ)) : ℂ) *
          ((2 * r * exp (-r ^ 2) * radialHermite p q r : ℝ) : ℂ) := by
    intro r
    simp only [normalizedRadial]
    push_cast
    ring
  simp_rw [he]
  rw [intervalIntegral.integral_const_mul, intervalIntegral.integral_ofReal]
  simp only [normalizedRadialMoment, radialHermiteMoment]
  push_cast
  ring

theorem cellResponse_polar_left (table : Array (ℤ × ℤ)) (scale A : ℕ)
    {N i j : ℕ} (hi : i < N) (hj : j < N) {R r s : ℝ}
    (hR : 0 < R) (hr : 0 < r) (hs : 0 < s)
    (hr0 : R * i / N ≤ r) (hr1 : r < R * (i + 1) / N)
    (hs0 : R * j / N ≤ s) (hs1 : s < R * (j + 1) / N) (θ : ℝ) :
    cellResponse table scale N A R ((r : ℂ), (s : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) =
      Complex.exp ((θ : ℂ) * Complex.I) *
        cellEntry table scale N
          (angularIndex A (Complex.exp (((-θ : ℝ) : ℂ) * Complex.I))) i j := by
  have hn : ‖(s : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)‖ = s := by
    rw [norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one,
      Complex.norm_real, Real.norm_of_nonneg hs.le]
  have hp : Haag.ph ((s : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) =
      Complex.exp ((θ : ℂ) * Complex.I) := by
    unfold Haag.ph
    rw [hn]
    have hsc : (s : ℂ) ≠ 0 := by exact_mod_cast hs.ne'
    field_simp
  have hz : (r : ℂ) * conj ((s : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) =
      ((r * s : ℝ) : ℂ) * Complex.exp (((-θ : ℝ) : ℂ) * Complex.I) := by
    rw [map_mul, Complex.conj_ofReal, ← Complex.exp_conj]
    simp only [map_mul, Complex.conj_ofReal, Complex.conj_I]
    push_cast
    rw [show (θ : ℂ) * -Complex.I = -(θ : ℂ) * Complex.I by ring]
    ring
  have hk := angularIndex_pos_mul A (mul_pos hr hs)
    (Complex.exp (((-θ : ℝ) : ℂ) * Complex.I))
  unfold cellResponse liftResponse relativeCoordinates
  rw [hp, Complex.norm_real, Real.norm_of_nonneg hr.le, hn, hz]
  congr 1
  exact cellLookup_eq_entry table scale A hi hj hR hr0 hr1 hs0 hs1 hk

/-- The tensor basis character cancels the phase lift to leave the relative frequency. -/
theorem cell_integrand_polar (table : Array (ℤ × ℤ)) (scale A : ℕ)
    {N i j : ℕ} (hi : i < N) (hj : j < N) {R r s : ℝ}
    (hR : 0 < R) (hr : 0 < r) (hs : 0 < s)
    (hr0 : R * i / N ≤ r) (hr1 : r < R * (i + 1) / N)
    (hs0 : R * j / N ≤ s) (hs1 : s < R * (j + 1) / N)
    (u : Idx2) (hu : u.1.1 + u.2.1 = u.1.2 + u.2.2 + 1) (θ : ℝ) :
    conj (hfun2 u ((r : ℂ), (s : ℂ) * Complex.exp ((θ : ℂ) * Complex.I))) *
      cellResponse table scale N A R
        ((r : ℂ), (s : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) =
      (normalizedRadial u.2.1 u.2.2 s : ℂ) *
        ((normalizedRadial u.1.1 u.1.2 r : ℂ) *
          angularFourierIntegrand A (fun k ↦ cellEntry table scale N k i j)
            ((u.1.1 : ℤ) - u.1.2) (-θ)) := by
  rw [cellResponse_polar_left table scale A hi hj hR hr hs hr0 hr1 hs0 hs1 θ,
    hfun2_factor, hfun_eq_radialHermite, hfun_polar]
  have hcharge : 1 - ((u.2.1 : ℝ) - u.2.2) = (u.1.1 : ℝ) - u.1.2 := by
    have h : (u.1.1 : ℝ) + u.2.1 = (u.1.2 : ℝ) + u.2.2 + 1 := by exact_mod_cast hu
    linarith
  have he : conj (Complex.exp (((((u.2.1 : ℝ) - u.2.2) * θ : ℝ) : ℂ) * Complex.I)) *
      Complex.exp ((θ : ℂ) * Complex.I) =
        Complex.exp (((-(((u.1.1 : ℤ) - u.1.2 : ℤ) : ℝ) * (-θ) : ℝ) : ℂ) * Complex.I) := by
    rw [← Complex.exp_conj, ← Complex.exp_add]
    congr 1
    simp only [map_mul, Complex.conj_ofReal, Complex.conj_I]
    have hc : ((1 - ((u.2.1 : ℝ) - u.2.2) : ℝ) : ℂ) =
        (((u.1.1 : ℝ) - u.1.2 : ℝ) : ℂ) := congrArg Complex.ofReal hcharge
    push_cast at hc ⊢
    linear_combination (θ : ℂ) * Complex.I * hc
  simp only [map_mul, Complex.conj_ofReal, normalizedRadial, angularFourierIntegrand]
  calc
    _ = ((nrm u.2.1 u.2.2 * radialHermite u.2.1 u.2.2 s : ℝ) : ℂ) *
        (((nrm u.1.1 u.1.2 * radialHermite u.1.1 u.1.2 r : ℝ) : ℂ) *
          ((conj (Complex.exp (((((u.2.1 : ℝ) - u.2.2) * θ : ℝ) : ℂ) * Complex.I)) *
            Complex.exp ((θ : ℂ) * Complex.I)) *
              cellEntry table scale N
                (angularIndex A (Complex.exp (((-θ : ℝ) : ℂ) * Complex.I))) i j)) := by ring
    _ = _ := by rw [he]

theorem integrable_cell_coefficient_slice (table : Array (ℤ × ℤ)) (scale N A : ℕ)
    (R : ℝ) (u : Idx2) (z : ℂ) :
    Integrable (fun w : ℂ ↦ conj (hfun2 u (z, w)) * cellResponse table scale N A R (z, w))
      gaussC := by
  have hL : MemLp (fun w : ℂ ↦ cellResponse table scale N A R (z, w)) 2 gaussC :=
    MemLp.of_bound
      ((measurable_cellResponse table scale N A R).comp
        (measurable_const.prodMk measurable_id)).aestronglyMeasurable 1
      (Filter.Eventually.of_forall fun w ↦ norm_cellResponse_le table scale N A R (z, w))
  have h := ((memLp_hfun u.2).star.integrable_mul hL).const_mul (conj (hfun u.1 z))
  convert h using 1
  funext w
  rw [hfun2_factor, map_mul, mul_assoc]
  rfl

def cellRowCoefficient (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ)
    (u : Idx2) (i : ℕ) : ℂ :=
  ∑ j ∈ range N,
    (normalizedRadialMoment u.2.1 u.2.2 (R * j / N) (R * (j + 1) / N) : ℂ) *
      angularCellCoefficient A (fun k ↦ cellEntry table scale N k i j)
        ((u.1.1 : ℤ) - u.1.2)

/-- Evaluate the actual conditional coefficient on one first-radius cell. -/
theorem coefficientSlice_cell (table : Array (ℤ × ℤ)) (scale A : ℕ)
    {N i : ℕ} (hi : i < N) {R r : ℝ} (hR : 0 < R) (hr : 0 < r)
    (hr0 : R * i / N ≤ r) (hr1 : r < R * (i + 1) / N)
    (u : Idx2) (hu : u.1.1 + u.2.1 = u.1.2 + u.2.2 + 1) :
    coefficientSlice (cellResponse table scale N A R) u (r : ℂ) =
      (normalizedRadial u.1.1 u.1.2 r : ℂ) * cellRowCoefficient table scale N A R u i := by
  have hN : 0 < N := Nat.zero_lt_of_lt hi
  let F : ℂ → ℂ := fun w ↦
    conj (hfun2 u ((r : ℂ), w)) * cellResponse table scale N A R ((r : ℂ), w)
  have hFm : Measurable F := by
    have hh : Measurable (fun w : ℂ ↦ hfun2 u ((r : ℂ), w)) := by
      have h₀ : Measurable (fun _ : ℂ ↦ (nrm2 u : ℂ)) := measurable_const
      have h₁ : Measurable (fun _ : ℂ ↦ ev (r : ℂ) (H u.1.1 u.1.2)) := measurable_const
      have h₂ : Measurable (fun w : ℂ ↦ ev w (H u.2.1 u.2.2)) :=
        (UpperChaos.continuous_ev (H u.2.1 u.2.2)).measurable
      exact h₀.mul (h₁.mul h₂)
    exact (Complex.continuous_conj.measurable.comp hh).mul
      ((measurable_cellResponse table scale N A R).comp
        (measurable_const.prodMk measurable_id))
  have hzero : ∀ w, R ≤ ‖w‖ → F w = 0 := by
    intro w hw
    simp [F, cellResponse, liftResponse, cellLookup, relativeCoordinates, not_lt.mpr hw]
  have h := integral_gaussC_radial_cells hN hR hFm
    (integrable_cell_coefficient_slice table scale N A R u r) hzero
    (fun s ↦ (normalizedRadial u.2.1 u.2.2 s : ℂ))
    (fun j θ ↦ (normalizedRadial u.1.1 u.1.2 r : ℂ) *
      angularFourierIntegrand A (fun k ↦ cellEntry table scale N k i j)
        ((u.1.1 : ℤ) - u.1.2) (-θ))
    (fun j hj s θ hs hs0 hs1 _ _ ↦
      cell_integrand_polar table scale A hi hj hR hr hs hr0 hr1 hs0 hs1 u hu θ)
  change (∫ w, F w ∂gaussC) = _
  rw [h, cellRowCoefficient, Finset.mul_sum]
  apply sum_congr rfl
  intro j _
  rw [integral_normalizedRadial, intervalIntegral.integral_const_mul,
    integral_angularFourierIntegrand_reflected]
  have hp : (π : ℂ) ≠ 0 := by exact_mod_cast pi_ne_zero
  push_cast
  field_simp

/-- The complete finite cell contraction, before any interval replacement. -/
def cellCoefficient (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ) (u : Idx2) : ℂ :=
  ∑ i ∈ range N,
    (normalizedRadialMoment u.1.1 u.1.2 (R * i / N) (R * (i + 1) / N) : ℂ) *
      cellRowCoefficient table scale N A R u i

/-- The finite contraction equals the actual `L²` Hermite coefficient. No numerical accuracy
premise is used here; numerical enclosures can therefore be applied to this exact identity. -/
theorem cellCoefficient_eq_inner (table : Array (ℤ × ℤ)) (scale A : ℕ)
    {N : ℕ} (hN : 0 < N) {R : ℝ} (hR : 0 < R) (u : Idx2)
    (hu : u.1.1 + u.2.1 = u.1.2 + u.2.2 + 1) :
    ⟪hvec2 u, (memLp_cellResponse table scale N A R).toLp (cellResponse table scale N A R)⟫_ℂ =
      cellCoefficient table scale N A R u := by
  let F := cellResponse table scale N A R
  have hFm := measurable_cellResponse table scale N A R
  have hFL := memLp_cellResponse table scale N A R
  have hFc := cellResponse_charge table scale N A R
  have hI : Integrable (fun v : ℂ × ℂ ↦ conj (hfun2 u v) * F v) mu2 :=
    (memLp_hfun2 u).star.integrable_mul hFL
  have hs : Integrable (coefficientSlice F u) gaussC := hI.integral_prod_left
  have hz : ∀ z, R ≤ ‖z‖ → coefficientSlice F u z = 0 := by
    intro z hz
    simp [coefficientSlice, F, cellResponse, liftResponse, cellLookup, relativeCoordinates,
      not_lt.mpr hz]
  rw [hvec2, inner_toLp2]
  change (∫ v, conj (hfun2 u v) * F v ∂mu2) = _
  rw [integral_prod _ hI]
  change (∫ z, coefficientSlice F u z ∂gaussC) = _
  rw [integral_gaussC_radial_cells hN hR (measurable_coefficientSlice hFm u) hs hz
    (fun r ↦ (normalizedRadial u.1.1 u.1.2 r : ℂ))
    (fun i _ ↦ cellRowCoefficient table scale N A R u i)]
  · unfold cellCoefficient
    apply sum_congr rfl
    intro i _
    rw [integral_normalizedRadial, intervalIntegral.integral_const]
    simp only [Complex.real_smul]
    have hp : (π : ℂ) ≠ 0 := by exact_mod_cast pi_ne_zero
    push_cast
    field_simp
    ring
  · intro i hi r θ hr hr0 hr1 _ _
    rw [mul_comm (r : ℂ), coefficientSlice_rot hFc u hu _ _
      (Complex.norm_exp_ofReal_mul_I θ)]
    exact coefficientSlice_cell table scale A hi hR hr hr0 hr1 u hu

end

end Grothe.UpperReplacement

-- Section: HeadCoefficients

/-!
# Exact finite heads for pairs of charge-one responses

Agent-ID: codex-a7c4.

The finite head contains every charge-one tensor Hermite mode through the indicated grade.
Its coefficients are signed cross overlaps. No symmetry, positivity, or angular cutoff is assumed.
-/

open MeasureTheory Finset Polynomial
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperReplacement

open UpperChaos Upper

noncomputable section

/-- The complete finite frequency/radial coordinate domain through grade `K`. -/
def cellHeadCoordinates (K : ℕ) : Finset (ℤ × ℕ × ℕ) :=
  (Finset.Icc (-(K : ℤ)) ((K : ℤ) + 1) ×ˢ (range (K + 1) ×ˢ range (K + 1))).filter
    (fun v ↦ modeShift v.1 + v.2.1 + v.2.2 ≤ K)

def cellModeEmbedding : (ℤ × ℕ × ℕ) ↪ Idx2 :=
  ⟨fun v ↦ cellMode v.1 v.2.1 v.2.2, cellMode_injective⟩

def cellModeHead (K : ℕ) : Finset Idx2 := (cellHeadCoordinates K).map cellModeEmbedding

theorem mem_cellModeHead_iff {K : ℕ} {i : Idx2} :
    i ∈ cellModeHead K ↔
      i.1.2 + i.2.2 ≤ K ∧ i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 := by
  constructor
  · intro hi
    obtain ⟨⟨m, a, b⟩, hv, rfl⟩ := mem_map.mp hi
    have hg := (mem_filter.mp hv).2
    change (cellMode m a b).1.2 + (cellMode m a b).2.2 ≤ K ∧ _
    exact ⟨by simpa only [cellMode_grade] using hg, cellMode_charge m a b⟩
  · rintro ⟨hg, hc⟩
    let m : ℤ := (i.1.1 : ℤ) - i.1.2
    let a := min i.1.1 i.1.2
    let b := min i.2.1 i.2.2
    have he : cellMode m a b = i := cellMode_reconstruct i hc
    have hh := (cellMode_head_iff m a b K).mp (by rw [he]; exact hg)
    have ha : a < K + 1 := by omega
    have hb : b < K + 1 := by omega
    apply mem_map.mpr
    refine ⟨(m, a, b), ?_, he⟩
    exact mem_filter.mpr ⟨mem_product.mpr
      ⟨Finset.mem_Icc.mpr ⟨hh.1, hh.2.1⟩,
        mem_product.mpr ⟨mem_range.mpr ha, mem_range.mpr hb⟩⟩, hh.2.2⟩

def crossCoefficient (F G : Lp ℂ 2 mu2) (i : Idx2) : ℝ :=
  (conj ⟪hvec2 i, F⟫_ℂ * ⟪hvec2 i, G⟫_ℂ).re

theorem crossCoefficient_polarization (F G : Lp ℂ 2 mu2) (i : Idx2) :
    crossCoefficient F G i =
      (‖⟪hvec2 i, F + G⟫_ℂ‖ ^ 2 - ‖⟪hvec2 i, F - G⟫_ℂ‖ ^ 2) / 4 := by
  rw [inner_add_right, inner_sub_right, norm_add_sq (𝕜 := ℂ), norm_sub_sq (𝕜 := ℂ)]
  simp only [crossCoefficient, RCLike.inner_apply, RCLike.re_to_complex]
  rw [mul_comm (conj _)]
  ring

theorem summable_abs_crossCoefficient (F G : Lp ℂ 2 mu2) :
    Summable fun i ↦ |crossCoefficient F G i| := by
  refine Summable.of_nonneg_of_le (fun _ ↦ abs_nonneg _) (fun i ↦ ?_)
    (((hasSum_energy2 (F + G)).summable.add (hasSum_energy2 (F - G)).summable).div_const 4)
  rw [crossCoefficient_polarization, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 4)]
  apply div_le_div_of_nonneg_right _ (by norm_num)
  have hab (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) : |a - b| ≤ a + b := by
    exact (abs_sub a b).trans_eq (by rw [abs_of_nonneg ha, abs_of_nonneg hb])
  exact hab _ _ (sq_nonneg _) (sq_nonneg _)

theorem crossCoefficient_zero {F G : Lp ℂ 2 mu2} (hF : ChargeOne F) (i : Idx2)
    (hi : i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1) : crossCoefficient F G i = 0 := by
  simp [crossCoefficient, hF i hi]

/-- Ungroup the bidegree energies into the individual tensor Hermite coefficients. -/
theorem bivarKernel_pair_eq_tsum (F G : Lp ℂ 2 mu2) {P Q : ℝ[X]}
    (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1) (j : ℕ) :
    bivarKernel P Q (pairEnergy F G) j =
      ∑' i, crossCoefficient F G i * (termOf P Q (bideg i)).coeff j := by
  have hs := Grothe.summable_mul_coeff
    (fun i : Idx2 ↦ l1_termOf_le_one hP hQ (bideg i))
    (summable_abs_crossCoefficient F G) j
  have hf := hs.hasSum.tsum_fiberwise bideg
  have he (nm : ℕ × ℕ) :
      (∑' i : bideg ⁻¹' {nm},
        crossCoefficient F G i.1 * (termOf P Q (bideg i.1)).coeff j) =
          pairEnergy F G nm * (termOf P Q nm).coeff j := by
    have hb (i : bideg ⁻¹' {nm}) : bideg i.1 = nm := i.2
    simp_rw [hb]
    rw [tsum_mul_right, pairEnergy_eq_overlap]
    rfl
  simp_rw [he] at hf
  exact hf.tsum_eq

/-- Locality for a general pair of preprocessors: grade above `j` contributes nothing. -/
theorem termOf_coeff_zero_above_grade (P Q : ℝ[X]) (i : Idx2)
    (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) {j : ℕ}
    (hj : j < i.1.2 + i.2.2) : (termOf P Q (bideg i)).coeff j = 0 := by
  rw [termOf, shiftOf_bideg hi, coeff_X_pow_mul']
  exact ite_eq_right (by omega)

/-- A finite head through `K` contains every contributing Hermite mode. -/
theorem bivarKernel_pair_eq_finite_head {F G : Lp ℂ 2 mu2} (hF : ChargeOne F)
    {P Q : ℝ[X]} (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1)
    {j K : ℕ} (hj : j ≤ K) :
    bivarKernel P Q (pairEnergy F G) j =
      ∑ i ∈ cellModeHead K,
        crossCoefficient F G i * (termOf P Q (bideg i)).coeff j := by
  rw [bivarKernel_pair_eq_tsum F G hP hQ j]
  apply tsum_eq_sum
  intro i hi
  by_cases hc : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
  · have hgrade : K < i.1.2 + i.2.2 := by
      rw [mem_cellModeHead_iff] at hi
      omega
    rw [termOf_coeff_zero_above_grade P Q i hc (hj.trans_lt hgrade), mul_zero]
  · rw [crossCoefficient_zero hF i hc, zero_mul]

/-- When both preprocessors coincide, their product depends only on the total grade. -/
theorem termOf_same_of_charge (P : ℝ[X]) (i : Idx2)
    (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) :
    termOf P P (bideg i) =
      X ^ (i.1.2 + i.2.2) * P ^ (2 * (i.1.2 + i.2.2) + 1) := by
  rw [termOf, shiftOf_bideg hi, ← pow_add]
  have hd : (bideg i).1 + (bideg i).2 = 2 * (i.1.2 + i.2.2) + 1 := by
    dsimp [bideg]
    omega
  rw [hd]

end

end Grothe.UpperReplacement
