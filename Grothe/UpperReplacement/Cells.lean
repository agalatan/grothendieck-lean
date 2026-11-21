import Grothe.UpperReplacement.Pair
import Grothe.UpperChaos.DampedMoments

set_option warningAsError true

-- Section: CellResponse

/-!
# Disk-valued charge-one responses from relative polar cells

Agent-ID: codex-a7c4.

The cell table is queried using rotation-invariant coordinates. Multiplication by the phase of
the second coordinate then gives exact charge one, including the zero-coordinate cases.
Gaussian-integer cells are clipped by an exact integer comparison, making disk membership a
theorem for every input table, including malformed ones. Numerical checkers must evaluate the
same clipped entries.
-/

open MeasureTheory
open scoped ComplexConjugate

namespace Grothe.UpperReplacement

noncomputable section

/-- Rotation-invariant data sufficient to select a relative polar cell. -/
def relativeCoordinates (u : ℂ × ℂ) : ℝ × ℝ × ℂ :=
  (‖u.1‖, ‖u.2‖, u.1 * conj u.2)

theorem measurable_relativeCoordinates : Measurable relativeCoordinates := by
  unfold relativeCoordinates
  fun_prop

theorem relativeCoordinates_rot {c : ℂ} (hc : ‖c‖ = 1) (u : ℂ × ℂ) :
    relativeCoordinates (UpperChaos.rot2 c u) = relativeCoordinates u := by
  have hcc : c * conj c = 1 := by
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq, hc]
    norm_num
  simp only [relativeCoordinates, UpperChaos.rot2, norm_mul, hc, one_mul, map_mul]
  congr 2
  calc c * u.1 * (conj c * conj u.2) = (c * conj c) * (u.1 * conj u.2) := by ring
    _ = u.1 * conj u.2 := by rw [hcc, one_mul]

/-- Lift a bounded measurable lookup table into a charge-one response. -/
def liftResponse (lookup : ℝ × ℝ × ℂ → ℂ) (u : ℂ × ℂ) : ℂ :=
  Haag.ph u.2 * lookup (relativeCoordinates u)

theorem measurable_liftResponse {lookup : ℝ × ℝ × ℂ → ℂ} (hm : Measurable lookup) :
    Measurable (liftResponse lookup) :=
  (Haag.measurable_ph.comp measurable_snd).mul
    (hm.comp measurable_relativeCoordinates)

theorem norm_liftResponse_le {lookup : ℝ × ℝ × ℂ → ℂ}
    (hb : ∀ v, ‖lookup v‖ ≤ 1) (u : ℂ × ℂ) : ‖liftResponse lookup u‖ ≤ 1 := by
  rw [liftResponse, norm_mul]
  exact (mul_le_mul (Haag.norm_ph_le _) (hb _) (norm_nonneg _) zero_le_one).trans_eq
    (one_mul 1)

theorem liftResponse_charge {lookup : ℝ × ℝ × ℂ → ℂ}
    (c : ℂ) (u : ℂ × ℂ) (hc : ‖c‖ = 1) :
    liftResponse lookup (UpperChaos.rot2 c u) = c * liftResponse lookup u := by
  rw [liftResponse, relativeCoordinates_rot hc]
  change Haag.ph (c * u.2) * _ = _
  have hp : Haag.ph (c * u.2) = c * Haag.ph u.2 := by
    unfold Haag.ph
    rw [norm_mul, hc, one_mul]
    ring
  rw [hp, liftResponse, mul_assoc]

theorem memLp_liftResponse {lookup : ℝ × ℝ × ℂ → ℂ}
    (hm : Measurable lookup) (hb : ∀ v, ‖lookup v‖ ≤ 1) :
    MemLp (liftResponse lookup) 2 UpperChaos.mu2 :=
  MemLp.of_bound (measurable_liftResponse hm).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_liftResponse_le hb))

/-- A Gaussian-integer table entry divided by a positive integer scale, or zero if outside
the disk. The test is exact and is also used by the finite coefficient checker. -/
def clippedCell (scale : ℕ) (a b : ℤ) : ℂ :=
  if a * a + b * b ≤ (scale : ℤ) * scale then
    ((a : ℂ) + (b : ℂ) * Complex.I) / (scale : ℂ)
  else 0

theorem norm_clippedCell_le (scale : ℕ) (a b : ℤ) : ‖clippedCell scale a b‖ ≤ 1 := by
  unfold clippedCell
  split_ifs with h
  · by_cases hs : scale = 0
    · simp [hs]
    have hs0 : (0 : ℝ) < scale := by exact_mod_cast Nat.pos_of_ne_zero hs
    rw [norm_div, Complex.norm_natCast, div_le_one hs0]
    have hr : (a : ℝ) * a + (b : ℝ) * b ≤ (scale : ℝ) * scale := by exact_mod_cast h
    have he : ‖(a : ℂ) + (b : ℂ) * Complex.I‖ ^ 2 = (a : ℝ) ^ 2 + (b : ℝ) ^ 2 := by
      rw [← Complex.normSq_eq_norm_sq]
      simp [Complex.normSq_apply, pow_two]
    nlinarith [norm_nonneg ((a : ℂ) + (b : ℂ) * Complex.I)]
  · simp

/-- The angular cells are centered at `2πj/N`; the half-open convention agrees with the
centered-cell Fourier multiplier in the audited certificate. -/
def angularIndex (N : ℕ) (z : ℂ) : ℕ :=
  (⌊(N : ℝ) * z.arg / (2 * Real.pi) + 1 / 2⌋ % (N : ℤ)).toNat

theorem measurable_angularIndex (N : ℕ) : Measurable (angularIndex N) := by
  exact (measurable_of_countable (fun k : ℤ ↦ (k % (N : ℤ)).toNat)).comp
    (by fun_prop : Measurable fun z : ℂ ↦
      ⌊(N : ℝ) * z.arg / (2 * Real.pi) + 1 / 2⌋)

/-- Row-major order: angular index, first radial index, second radial index. -/
def cellIndex (N A : ℕ) (R : ℝ) (v : ℝ × ℝ × ℂ) : ℕ :=
  angularIndex A v.2.2 * N * N + ⌊(N : ℝ) * v.1 / R⌋₊ * N +
    ⌊(N : ℝ) * v.2.1 / R⌋₊

theorem measurable_cellIndex (N A : ℕ) (R : ℝ) : Measurable (cellIndex N A R) := by
  have hm := measurable_angularIndex A
  unfold cellIndex
  fun_prop

/-- Lookup with zero extension outside the radial square and outside the supplied array. -/
def cellLookup (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ)
    (v : ℝ × ℝ × ℂ) : ℂ :=
  if v.1 < R ∧ v.2.1 < R then
    let q := table[cellIndex N A R v]?.getD (0, 0)
    clippedCell scale q.1 q.2
  else 0

theorem measurable_cellLookup (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ) :
    Measurable (cellLookup table scale N A R) := by
  have hs : MeasurableSet {v : ℝ × ℝ × ℂ | v.1 < R ∧ v.2.1 < R} :=
    (measurable_fst measurableSet_Iio).inter
      ((measurable_fst.comp measurable_snd) measurableSet_Iio)
  exact Measurable.ite hs
    ((measurable_of_countable fun k : ℕ ↦
      clippedCell scale (table[k]?.getD (0, 0)).1 (table[k]?.getD (0, 0)).2).comp
        (measurable_cellIndex N A R)) measurable_const

theorem norm_cellLookup_le (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ)
    (v : ℝ × ℝ × ℂ) : ‖cellLookup table scale N A R v‖ ≤ 1 := by
  unfold cellLookup
  split_ifs
  · exact norm_clippedCell_le _ _ _
  · simp

/-- The concrete form of the audited response; use `scale=2^26`, `N=128`, `A=64`, `R=6`. -/
def cellResponse (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ) : ℂ × ℂ → ℂ :=
  liftResponse (cellLookup table scale N A R)

theorem measurable_cellResponse (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ) :
    Measurable (cellResponse table scale N A R) :=
  measurable_liftResponse (measurable_cellLookup table scale N A R)

theorem norm_cellResponse_le (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ)
    (u : ℂ × ℂ) : ‖cellResponse table scale N A R u‖ ≤ 1 :=
  norm_liftResponse_le (norm_cellLookup_le table scale N A R) u

theorem cellResponse_charge (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ)
    (c : ℂ) (u : ℂ × ℂ) (hc : ‖c‖ = 1) :
    cellResponse table scale N A R (UpperChaos.rot2 c u) =
      c * cellResponse table scale N A R u :=
  liftResponse_charge c u hc

theorem memLp_cellResponse (table : Array (ℤ × ℤ)) (scale N A : ℕ) (R : ℝ) :
    MemLp (cellResponse table scale N A R) 2 UpperChaos.mu2 :=
  memLp_liftResponse (measurable_cellLookup table scale N A R)
    (norm_cellLookup_le table scale N A R)

end

end Grothe.UpperReplacement

-- Section: CellAngular

/-!
# Centered angular cells and their exact Fourier multiplier

Agent-ID: codex-a7c4.

The argument branch cut changes the integer cell number by a multiple of the number of cells.
The Fourier integral retains the sinc multiplier of a whole cell, including frequency zero.
-/

open MeasureTheory Real

namespace Grothe.UpperReplacement

noncomputable section

theorem angularIndex_exp (N : ℕ) (θ : ℝ) :
    angularIndex N (Complex.exp ((θ : ℂ) * Complex.I)) =
      (⌊(N : ℝ) * θ / (2 * π) + 1 / 2⌋ % (N : ℤ)).toNat := by
  let k : ℤ := ⌊(π - θ) / (2 * π)⌋
  have harg : (Complex.exp ((θ : ℂ) * Complex.I)).arg - θ = 2 * π * k := by
    simpa only [Complex.exp_mul_I] using Complex.arg_cos_add_sin_mul_I_sub θ
  have he : (N : ℝ) * (Complex.exp ((θ : ℂ) * Complex.I)).arg / (2 * π) + 1 / 2 =
      (N : ℝ) * θ / (2 * π) + 1 / 2 + ((N : ℤ) * k : ℤ) := by
    rw [show (Complex.exp ((θ : ℂ) * Complex.I)).arg = θ + 2 * π * k by linarith]
    push_cast
    field_simp
    ring
  unfold angularIndex
  rw [he, Int.floor_add_intCast]
  simp only [Int.add_emod, Int.mul_emod_right, add_zero, Int.emod_emod]

theorem angularIndex_pos_mul (N : ℕ) {r : ℝ} (hr : 0 < r) (z : ℂ) :
    angularIndex N ((r : ℂ) * z) = angularIndex N z := by
  simp only [angularIndex, Complex.arg_real_mul z hr]

/-- On each half-open centered cell, the index is exactly its residue class. -/
theorem angularIndex_on_cell {N : ℕ} (hN : 0 < N) (j : ℤ) {θ : ℝ}
    (hlo : 2 * π * ((j : ℝ) - 1 / 2) / N ≤ θ)
    (hhi : θ < 2 * π * ((j : ℝ) + 1 / 2) / N) :
    angularIndex N (Complex.exp ((θ : ℂ) * Complex.I)) = (j % N).toNat := by
  rw [angularIndex_exp]
  congr 2
  apply Int.floor_eq_iff.mpr
  have hNr : (0 : ℝ) < N := by exact_mod_cast hN
  have hp : (0 : ℝ) < 2 * π := by positivity
  have hl := (div_le_iff₀ hNr).mp hlo
  have hh := (lt_div_iff₀ hNr).mp hhi
  have hl' : (j : ℝ) - 1 / 2 ≤ (N : ℝ) * θ / (2 * π) :=
    (le_div_iff₀ hp).mpr (by nlinarith)
  have hh' : (N : ℝ) * θ / (2 * π) < (j : ℝ) + 1 / 2 :=
    (div_lt_iff₀ hp).mpr (by nlinarith)
  constructor <;> linarith

/-- The centered exponential integral, valid also at zero frequency or zero width. -/
theorem integral_exp_frequency (ω h : ℝ) :
    (∫ θ in -h..h, Complex.exp (((ω * θ : ℝ) : ℂ) * Complex.I)) =
      ((2 * h * sinc (ω * h) : ℝ) : ℂ) := by
  by_cases hω : ω = 0
  · simp [hω, intervalIntegral.integral_const, Complex.real_smul]
    ring
  have he := intervalIntegral.integral_comp_mul_left
    (fun t : ℝ ↦ Complex.exp ((t : ℂ) * Complex.I)) (a := -h) (b := h) hω
  rw [he, mul_neg, integral_exp_mul_I_eq_sinc]
  simp only [Complex.real_smul]
  have hc : (ω : ℂ) ≠ 0 := by exact_mod_cast hω
  push_cast
  field_simp

/-- Translating the centered cell contributes only the Fourier phase. -/
theorem integral_exp_frequency_cell (ω h c : ℝ) :
    (∫ θ in (c - h)..(c + h), Complex.exp (((ω * θ : ℝ) : ℂ) * Complex.I)) =
      Complex.exp (((ω * c : ℝ) : ℂ) * Complex.I) *
        ((2 * h * sinc (ω * h) : ℝ) : ℂ) := by
  calc
    _ = ∫ θ in -h..h, Complex.exp (((ω * (θ + c) : ℝ) : ℂ) * Complex.I) := by
      convert (intervalIntegral.integral_comp_add_right
        (fun θ : ℝ ↦ Complex.exp (((ω * θ : ℝ) : ℂ) * Complex.I)) c
        (a := -h) (b := h)).symm using 1
      congr 1 <;> ring
    _ = Complex.exp (((ω * c : ℝ) : ℂ) * Complex.I) *
        ∫ θ in -h..h, Complex.exp (((ω * θ : ℝ) : ℂ) * Complex.I) := by
      rw [← intervalIntegral.integral_const_mul]
      apply intervalIntegral.integral_congr
      intro θ _
      dsimp only
      rw [show (((ω * (θ + c) : ℝ) : ℂ) * Complex.I) =
        (((ω * c : ℝ) : ℂ) * Complex.I) + (((ω * θ : ℝ) : ℂ) * Complex.I) by
          push_cast; ring, Complex.exp_add]
    _ = _ := by rw [integral_exp_frequency]

end

end Grothe.UpperReplacement

-- Section: CellPartition

/-!
# Exact identification of a table entry on a radial-angular cell

Agent-ID: codex-a7c4.

The half-open radial cells use the same floor convention as `cellLookup`. Together with
`angularIndex_on_cell`, this identifies the actual piecewise constant response on each box.
-/

namespace Grothe.UpperReplacement

noncomputable section

theorem radialIndex_on_cell {N j : ℕ} (hN : 0 < N) {R r : ℝ} (hR : 0 < R)
    (hlo : R * j / N ≤ r) (hhi : r < R * (j + 1) / N) :
    ⌊(N : ℝ) * r / R⌋₊ = j := by
  have hNr : (0 : ℝ) < N := by exact_mod_cast hN
  have hr : 0 ≤ r := (by positivity : 0 ≤ R * j / N).trans hlo
  apply (Nat.floor_eq_iff (by positivity : 0 ≤ (N : ℝ) * r / R)).mpr
  have hl := (div_le_iff₀ hNr).mp hlo
  have hh := (lt_div_iff₀ hNr).mp hhi
  constructor
  · exact (le_div_iff₀ hR).mpr (by nlinarith)
  · exact (div_lt_iff₀ hR).mpr (by nlinarith)

theorem radius_lt_of_cell {N j : ℕ} (hj : j < N) {R r : ℝ} (hR : 0 < R)
    (hhi : r < R * (j + 1) / N) : r < R := by
  have hNr : (0 : ℝ) < N := by exact_mod_cast Nat.zero_lt_of_lt hj
  apply hhi.trans_le
  apply (div_le_iff₀ hNr).mpr
  have hjr : (j : ℝ) + 1 ≤ N := by exact_mod_cast (Nat.succ_le_iff.mpr hj)
  nlinarith

/-- The array uses angular-major, then first-radius, then second-radius order. -/
theorem cellLookup_eq_entry (table : Array (ℤ × ℤ)) (scale A : ℕ)
    {N i j k : ℕ} (hi : i < N) (hj : j < N) {R r s : ℝ} (hR : 0 < R) {z : ℂ}
    (hr0 : R * i / N ≤ r) (hr1 : r < R * (i + 1) / N)
    (hs0 : R * j / N ≤ s) (hs1 : s < R * (j + 1) / N)
    (hk : angularIndex A z = k) :
    cellLookup table scale N A R (r, s, z) =
      let v := table[k * N * N + i * N + j]?.getD (0, 0)
      clippedCell scale v.1 v.2 := by
  have hN := Nat.zero_lt_of_lt hi
  have hr := radialIndex_on_cell hN hR hr0 hr1
  have hs := radialIndex_on_cell hN hR hs0 hs1
  simp only [cellLookup, radius_lt_of_cell hi hR hr1, radius_lt_of_cell hj hR hs1,
    and_self, ↓reduceIte, cellIndex, hk, hr, hs]

end

end Grothe.UpperReplacement

-- Section: CellIntegrals

/-!
# Actual Hermite coefficients as cell integrals

Agent-ID: codex-a7c4.

Charge cancellation removes one common Gaussian angle from the complete tensor integrand.
The radial Jacobian and Gaussian density are retained explicitly. The generic radial change of
variables proof is adapted from `UpperChaos.TaylorRadialIntegral`, without its production-Taylor
certificate imports.
-/

open MeasureTheory Real Set Grothe.LowerAnalytic Grothe.UpperChaos
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperReplacement

noncomputable section

/-- Radial integration for complex-valued functions of the standard Gaussian. -/
theorem integral_gaussC_radial_complex (f : ℝ → ℂ) (hf : Measurable f) :
    (∫ z, f ‖z‖ ∂gaussC) =
      2 * ∫ r in Ioi (0 : ℝ), (r * exp (-r ^ 2) : ℂ) * f r := by
  rw [integral_gaussC_eq_volume_complex (fun z : ℂ => f ‖z‖)
      (hf.comp measurable_norm),
    ← Complex.integral_comp_polarCoord_symm, polarCoord_target]
  have hp : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 • ((π⁻¹ * exp (-Complex.normSq (Complex.polarCoord.symm p))) •
        f ‖Complex.polarCoord.symm p‖) =
        ((π⁻¹ : ℝ) : ℂ) * ((p.1 * exp (-p.1 ^ 2) : ℂ) * f p.1) * 1 := by
    intro p hp
    rw [Complex.normSq_eq_norm_sq, norm_polarCoord_symm_of_mem hp]
    simp only [Complex.real_smul]
    push_cast
    ring
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hp,
    Measure.volume_eq_prod,
    setIntegral_prod_mul
      (fun r : ℝ => ((π⁻¹ : ℝ) : ℂ) * ((r * exp (-r ^ 2) : ℂ) * f r))
      (fun _ : ℝ => (1 : ℂ)) (Ioi 0) (Ioo (-π) π),
    integral_const_mul]
  have hangle : (∫ _θ in Ioo (-π) π, (1 : ℂ)) = ((2 * π : ℝ) : ℂ) := by
    have hr : (∫ _θ in Ioo (-π) π, (1 : ℝ)) = 2 * π := by
      simp only [integral_const, smul_eq_mul, mul_one, Measure.real,
        Measure.restrict_apply_univ, Real.volume_Ioo]
      rw [ENNReal.toReal_ofReal (by linarith [pi_pos])]
      ring
    exact (integral_complex_ofReal (f := fun _θ : ℝ => (1 : ℝ))
      (μ := volume.restrict (Ioo (-π) π))).trans (congrArg Complex.ofReal hr)
  rw [hangle]
  push_cast
  have hπ : (π : ℂ) ≠ 0 := by exact_mod_cast pi_ne_zero
  have cancel (x : ℂ) : (π : ℂ)⁻¹ * x * (2 * (π : ℂ)) = 2 * x := by
    calc
      _ = ((π : ℂ)⁻¹ * (π : ℂ)) * (2 * x) := by ring
      _ = _ := by rw [inv_mul_cancel₀ hπ, one_mul]
  exact cancel _


/-- The complete coefficient slice, before any numerical or polynomial approximation. -/
def coefficientSlice (F : ℂ × ℂ → ℂ) (i : Idx2) (z : ℂ) : ℂ :=
  ∫ w, conj (hfun2 i (z, w)) * F (z, w) ∂gaussC

theorem measurable_coefficientSlice {F : ℂ × ℂ → ℂ} (hF : Measurable F) (i : Idx2) :
    Measurable (coefficientSlice F i) := by
  have hh : Continuous (hfun2 i) := continuous_const.mul
    (((continuous_ev _).comp continuous_fst).mul ((continuous_ev _).comp continuous_snd))
  have hm : Measurable (fun u : ℂ × ℂ ↦ conj (hfun2 i u) * F u) :=
    (Complex.continuous_conj.comp hh).measurable.mul hF
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

/-- The normalized basis has exactly the same charge as its unnormalized polynomial. -/
theorem tensorHermite_charge (i : Idx2)
    (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) (c : ℂ) (u : ℂ × ℂ)
    (hc : ‖c‖ = 1) : hfun2 i (rot2 c u) = c * hfun2 i u := by
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]
    simp
  have hphase : c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2) = c := by
    rw [hi, pow_succ]
    calc
      c ^ (i.1.2 + i.2.2) * c * conj c ^ (i.1.2 + i.2.2) =
          c * (conj c * c) ^ (i.1.2 + i.2.2) := by rw [mul_pow]; ring
      _ = c := by simp only [hcc, one_pow, mul_one]
  simp only [hfun2, H2_rot2 hcc, hphase]
  ring

theorem coefficientSlice_rot {F : ℂ × ℂ → ℂ}
    (hF : ∀ c u, ‖c‖ = 1 → F (rot2 c u) = c * F u)
    (i : Idx2) (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1)
    (c z : ℂ) (hc : ‖c‖ = 1) : coefficientSlice F i (c * z) = coefficientSlice F i z := by
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]
    norm_num
  refine (integral_rot_gaussC c hc
    (fun w : ℂ ↦ conj (hfun2 i (c * z, w)) * F (c * z, w))).symm.trans
    (integral_congr_ae (Filter.Eventually.of_forall fun w ↦ ?_))
  change conj (hfun2 i (rot2 c (z, w))) * F (rot2 c (z, w)) = _
  rw [tensorHermite_charge i hi c (z, w) hc, hF c (z, w) hc,
    map_mul, mul_mul_mul_comm, hcc, one_mul]

theorem coefficientSlice_eq_norm {F : ℂ × ℂ → ℂ}
    (hF : ∀ c u, ‖c‖ = 1 → F (rot2 c u) = c * F u)
    (i : Idx2) (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) (z : ℂ) :
    coefficientSlice F i z = coefficientSlice F i (‖z‖ : ℂ) := by
  by_cases hz : z = 0
  · simp [hz]
  have hn : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.mpr hz
  let c : ℂ := z / (‖z‖ : ℂ)
  have hc : ‖c‖ = 1 := by
    dsimp only [c]
    rw [norm_div, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (norm_nonneg z)]
    exact div_self (norm_ne_zero_iff.mpr hz)
  have he : c * (‖z‖ : ℂ) = z := div_mul_cancel₀ z hn
  have h := coefficientSlice_rot hF i hi c (‖z‖ : ℂ) hc
  rw [he] at h
  exact h

/-- The actual `L²` coefficient equals the one-radius integral used by the cell evaluator. -/
theorem inner_hvec2_eq_radial {F : ℂ × ℂ → ℂ} (hm : Measurable F) (hL : MemLp F 2 mu2)
    (hc : ∀ c u, ‖c‖ = 1 → F (rot2 c u) = c * F u)
    (i : Idx2) (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) :
    ⟪hvec2 i, hL.toLp F⟫_ℂ =
      2 * ∫ r : ℝ in Ioi 0, (r * exp (-r ^ 2) : ℂ) * coefficientSlice F i (r : ℂ) := by
  rw [hvec2, inner_toLp2]
  have hI : Integrable (fun u ↦ conj (hfun2 i u) * F u) mu2 :=
    (memLp_hfun2 i).star.integrable_mul hL
  calc
    _ = ∫ z, coefficientSlice F i z ∂gaussC := integral_prod _ hI
    _ = ∫ z, coefficientSlice F i (‖z‖ : ℂ) ∂gaussC := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (coefficientSlice_eq_norm hc i hi)
    _ = _ := integral_gaussC_radial_complex _
      ((measurable_coefficientSlice hm i).comp Complex.measurable_ofReal)

end

end Grothe.UpperReplacement
