import Grothe.UpperChaos.CenterNormBypass
import Grothe.UpperChaos.CompactTaylorQuadrature
import Grothe.UpperChaos.TaylorErrorEnergy

/-!
Source-only proposal for task #295. Agent-ID: codex-7c2e.
UNCOMPILED: no inference, warning, axiom-guard or resource verdict is claimed.
The existing production centers and (i * phi)^j F0 sources are unchanged.
Exact center energies enter the whole-error identities. Rounded norm caps are
used ONLY for the already established compact-quadrature cutoff reserve.
-/

set_option warningAsError true

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos.WholeCenterEnergies

noncomputable section

/-- Analytic projection identity, independent of any finite certificate. -/
theorem re_inner_projOn_self (A : Set Idx2) (f : Lp ℂ 2 mu2) :
    Complex.re ⟪projOn A f, f⟫_ℂ = ‖projOn A f‖ ^ 2 := by
  have hP : projOn A f ∈ modeSpace A := (modeSpace A).starProjection_apply_mem f
  have hR : f - projOn A f ∈ (modeSpace A)ᗮ :=
    (modeSpace A).sub_starProjection_mem_orthogonal f
  have h := Submodule.inner_right_of_mem_orthogonal hP hR
  rw [inner_sub_right, sub_eq_zero] at h
  rw [h]
  exact inner_self_eq_norm_sq (𝕜 := ℂ) _

/-- Exact projected coverage gives total energy. Coverage is supplied below by
the existing disjoint-band decompositions of the actual centers. -/
theorem norm_sq_eq_sum_of_projected_coverage {ι : Type*} [Fintype ι]
    (A : ι → Set Idx2) (f : Lp ℂ 2 mu2)
    (hcover : ∑ i, projOn (A i) f = f) :
    ‖f‖ ^ 2 = ∑ i, ‖projOn (A i) f‖ ^ 2 := by
  classical
  calc
    ‖f‖ ^ 2 = Complex.re ⟪f, f⟫_ℂ := (inner_self_eq_norm_sq (𝕜 := ℂ) f).symm
    _ = Complex.re ⟪∑ i, projOn (A i) f, f⟫_ℂ :=
      congrArg (fun x => Complex.re ⟪x, f⟫_ℂ) hcover.symm
    _ = ∑ i, ‖projOn (A i) f‖ ^ 2 := by
      rw [sum_inner, Complex.re_sum]
      exact Finset.sum_congr rfl fun i _ => re_inner_projOn_self (A i) f

/-- Exact original six-band energy, not the square of a rounded norm cap. -/
def firstEnergyQ : ℚ := ∑ k : Fin 6, firstCenterBandEnergyQ k

/-- Exact original four-band energy, with no coefficient rescaling. -/
def secondEnergyQ : ℚ := ∑ k : Fin 4, secondCenterBandEnergyQ k

/-- The existing total energy of the unchanged 26-grade third center. -/
def thirdEnergyQ : ℚ := thirdCenterEnergyQ

theorem norm_firstCenter_sq_exact : ‖firstCenter‖ ^ 2 = (firstEnergyQ : ℝ) := by
  rw [norm_sq_eq_sum_of_projected_coverage firstCenterBandModes firstCenter
    CenterNormBypass.first_decomposition]
  simp only [norm_firstCenterBand_sq, firstEnergyQ, Rat.cast_sum]

theorem norm_secondCenter_sq_exact : ‖secondCenter‖ ^ 2 = (secondEnergyQ : ℝ) := by
  rw [norm_sq_eq_sum_of_projected_coverage secondCenterBandModes secondCenter
    CenterNormBypass.second_decomposition]
  simp only [norm_secondCenterBand_sq, secondEnergyQ, Rat.cast_sum]

theorem norm_thirdCenter_sq_exact : ‖thirdCenter‖ ^ 2 = (thirdEnergyQ : ℝ) :=
  norm_thirdCenter_sq

/-- Closed rational comparisons use the existing targets, not new native facts. -/
theorem firstEnergyQ_le_cap_sq : firstEnergyQ ≤ (161 / 100000 : ℚ) ^ 2 := by
  norm_num [firstEnergyQ, Fin.sum_univ_succ, firstCenterBandEnergyQ,
    firstCenterBandIntegerEnergy]

theorem secondEnergyQ_le_cap_sq : secondEnergyQ ≤ (3 / 125000 : ℚ) ^ 2 := by
  norm_num [secondEnergyQ, Fin.sum_univ_succ, secondCenterBandEnergyQ,
    secondCenterBandIntegerEnergy]

theorem thirdEnergyQ_le_cap_sq : thirdEnergyQ ≤ (9 / 2500000 : ℚ) ^ 2 := by
  norm_num [thirdEnergyQ, thirdCenterEnergyQ]

theorem norm_firstCenter_le : ‖firstCenter‖ ≤ (161 / 100000 : ℝ) := by
  have h := (Rat.cast_le (K := ℝ)).2 firstEnergyQ_le_cap_sq
  have hr : (firstEnergyQ : ℝ) ≤ (161 / 100000 : ℝ) ^ 2 := by
    simpa only [Rat.cast_pow, Rat.cast_div, Rat.cast_ofNat] using h
  nlinarith [norm_firstCenter_sq_exact, norm_nonneg firstCenter]

theorem norm_secondCenter_le : ‖secondCenter‖ ≤ (3 / 125000 : ℝ) := by
  have h := (Rat.cast_le (K := ℝ)).2 secondEnergyQ_le_cap_sq
  have hr : (secondEnergyQ : ℝ) ≤ (3 / 125000 : ℝ) ^ 2 := by
    simpa only [Rat.cast_pow, Rat.cast_div, Rat.cast_ofNat] using h
  nlinarith [norm_secondCenter_sq_exact, norm_nonneg secondCenter]

theorem norm_thirdCenter_le : ‖thirdCenter‖ ≤ (9 / 2500000 : ℝ) := by
  have h := (Rat.cast_le (K := ℝ)).2 thirdEnergyQ_le_cap_sq
  have hr : (thirdEnergyQ : ℝ) ≤ (9 / 2500000 : ℝ) ^ 2 := by
    simpa only [Rat.cast_pow, Rat.cast_div, Rat.cast_ofNat] using h
  nlinarith [norm_thirdCenter_sq_exact, norm_nonneg thirdCenter]

/-- Exact whole error: keep the original C1, with no rounded energy substitution. -/
theorem first_whole_error_sq :
    ‖(chargeFn_hpow phiBound 1).memLp.toLp (hpow 1) - firstCenter‖ ^ 2 =
      (phaseMomentValue 1 : ℝ) -
        2 * Complex.re ⟪firstCenter, (chargeFn_hpow phiBound 1).memLp.toLp (hpow 1)⟫_ℂ +
        (firstEnergyQ : ℝ) := by
  rw [norm_hpow_sub_sq (by decide : 0 < (1 : ℕ)), norm_firstCenter_sq_exact]

theorem second_whole_error_sq :
    ‖(chargeFn_hpow phiBound 2).memLp.toLp (hpow 2) - secondCenter‖ ^ 2 =
      (phaseMomentValue 2 : ℝ) -
        2 * Complex.re ⟪secondCenter, (chargeFn_hpow phiBound 2).memLp.toLp (hpow 2)⟫_ℂ +
        (secondEnergyQ : ℝ) := by
  rw [norm_hpow_sub_sq (by decide : 0 < (2 : ℕ)), norm_secondCenter_sq_exact]

theorem third_whole_error_sq :
    ‖(chargeFn_hpow phiBound 3).memLp.toLp (hpow 3) - thirdCenter‖ ^ 2 =
      (phaseMomentValue 3 : ℝ) -
        2 * Complex.re ⟪thirdCenter, (chargeFn_hpow phiBound 3).memLp.toLp (hpow 3)⟫_ℂ +
        (thirdEnergyQ : ℝ) := by
  rw [norm_hpow_sub_sq (by decide : 0 < (3 : ℕ)), norm_thirdCenter_sq_exact]

/-- The complete existing cutoff reserve, including softening and omitted domain,
specialized once to the original first center. No interior integral certificate. -/
theorem first_compact_cutoff_cost :
    ‖⟪firstCenter, (chargeFn_hpow phiBound 1).memLp.toLp (hpow 1)⟫_ℂ -
      compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80
        1 91 firstCenterCoeff‖ ≤ (805 : ℝ) / 10 ^ 20 := by
  have h := norm_inner_hpow_sub_compactQuadrature_cutoff_le 1 91 firstCenterCoeff
  change ‖⟪firstCenter, (chargeFn_hpow phiBound 1).memLp.toLp (hpow 1)⟫_ℂ -
      compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80
        1 91 firstCenterCoeff‖ ≤ ‖firstCenter‖ * (5 / 10 ^ 15 : ℝ) at h
  calc
    _ ≤ ‖firstCenter‖ * (5 / 10 ^ 15 : ℝ) := h
    _ ≤ (161 / 100000 : ℝ) * (5 / 10 ^ 15 : ℝ) :=
      mul_le_mul_of_nonneg_right norm_firstCenter_le (by positivity)
    _ = (805 : ℝ) / 10 ^ 20 := by norm_num

theorem second_compact_cutoff_cost :
    ‖⟪secondCenter, (chargeFn_hpow phiBound 2).memLp.toLp (hpow 2)⟫_ℂ -
      compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80
        2 46 secondCenterCoeff‖ ≤ (12 : ℝ) / 10 ^ 20 := by
  have h := norm_inner_hpow_sub_compactQuadrature_cutoff_le 2 46 secondCenterCoeff
  change ‖⟪secondCenter, (chargeFn_hpow phiBound 2).memLp.toLp (hpow 2)⟫_ℂ -
      compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80
        2 46 secondCenterCoeff‖ ≤ ‖secondCenter‖ * (5 / 10 ^ 15 : ℝ) at h
  calc
    _ ≤ ‖secondCenter‖ * (5 / 10 ^ 15 : ℝ) := h
    _ ≤ (3 / 125000 : ℝ) * (5 / 10 ^ 15 : ℝ) :=
      mul_le_mul_of_nonneg_right norm_secondCenter_le (by positivity)
    _ = (12 : ℝ) / 10 ^ 20 := by norm_num

theorem third_compact_cutoff_cost :
    ‖⟪thirdCenter, (chargeFn_hpow phiBound 3).memLp.toLp (hpow 3)⟫_ℂ -
      compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80
        3 26 thirdCenterCoeff‖ ≤ (18 : ℝ) / 10 ^ 21 := by
  have h := norm_inner_hpow_sub_compactQuadrature_cutoff_le 3 26 thirdCenterCoeff
  change ‖⟪thirdCenter, (chargeFn_hpow phiBound 3).memLp.toLp (hpow 3)⟫_ℂ -
      compactTaylorQuadratureValue finiteLaplaceEta finiteLaplaceCutoff 80
        3 26 thirdCenterCoeff‖ ≤ ‖thirdCenter‖ * (5 / 10 ^ 15 : ℝ) at h
  calc
    _ ≤ ‖thirdCenter‖ * (5 / 10 ^ 15 : ℝ) := h
    _ ≤ (9 / 2500000 : ℝ) * (5 / 10 ^ 15 : ℝ) :=
      mul_le_mul_of_nonneg_right norm_thirdCenter_le (by positivity)
    _ = (18 : ℝ) / 10 ^ 21 := by norm_num

end
end Grothe.UpperChaos.WholeCenterEnergies

/- Per-target axiom guards are appended by prepare_packet.py. They remain UNEXECUTED. -/

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.CenterNormBypass.first_decomposition
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.CenterNormBypass.first_decomposition: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.CenterNormBypass.second_decomposition
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.CenterNormBypass.second_decomposition: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.firstEnergyQ_le_cap_sq
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.firstEnergyQ_le_cap_sq: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.firstCenter_band_energy_check._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.first_compact_cutoff_cost
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.first_compact_cutoff_cost: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.firstCenter_band_energy_check._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.first_whole_error_sq
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.first_whole_error_sq: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.firstCenter_band_energy_check._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.norm_firstCenter_le
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.norm_firstCenter_le: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.firstCenter_band_energy_check._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.norm_firstCenter_sq_exact
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.norm_firstCenter_sq_exact: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.secondCenter_band_energy_check._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.norm_secondCenter_le
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.norm_secondCenter_le: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.secondCenter_band_energy_check._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.norm_secondCenter_sq_exact
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.norm_secondCenter_sq_exact: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.norm_sq_eq_sum_of_projected_coverage
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.norm_sq_eq_sum_of_projected_coverage: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.norm_thirdCenter_le
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.norm_thirdCenter_le: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.norm_thirdCenter_sq_exact
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.norm_thirdCenter_sq_exact: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.re_inner_projOn_self
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.re_inner_projOn_self: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.secondEnergyQ_le_cap_sq
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.secondEnergyQ_le_cap_sq: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.secondCenter_band_energy_check._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.second_compact_cutoff_cost
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.second_compact_cutoff_cost: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.secondCenter_band_energy_check._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.second_whole_error_sq
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.second_whole_error_sq: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.thirdEnergyQ_le_cap_sq
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.thirdEnergyQ_le_cap_sq: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.third_compact_cutoff_cost
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.third_compact_cutoff_cost: {bad}"

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound, `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1, `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  let deps ← Lean.collectAxioms ``Grothe.UpperChaos.WholeCenterEnergies.third_whole_error_sq
  let bad := deps.filter fun n => !allowed.contains n
  unless bad.isEmpty do throwError m!"Unexpected axioms for Grothe.UpperChaos.WholeCenterEnergies.third_whole_error_sq: {bad}"
