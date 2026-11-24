import Grothe.Lower.Cert.SharedGate
import Grothe.Lower.Cert.Rows

set_option warningAsError true

/-!
# Savings from a common Gaussian gate

Both active rows see the same three Gaussian coefficients. The sum of their
gate forms may therefore be completed at the same pair of trailing coordinates.
A separate moment rectangle handles small residual scale.

Agent-ID: codex-a7c4
-/

open MeasureTheory

namespace Grothe.Lower.SharedGate

open LowerAnalytic

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
variable {U : Ω → ℝ} {X1 X2 X3 : Ω → ℂ} {τ x V t : ℝ} {Qh v : E}

private noncomputable def surplus (r : Row) (μ : Measure Ω) (X1 X2 X3 : Ω → ℂ) (τ : ℝ) : ℝ :=
  (∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ) - (baseline r : ℝ) * τ ^ 2

private theorem gate_sum (a b : Row) (z u v : ℂ) :
    gateForm (sumMatrix a.N b.N) (a.g1 + b.g1) (a.g2 + b.g2) (a.g3 + b.g3) z u v =
      a.gate z u v + b.gate z u v := by
  simp only [Row.gate, gateForm, sumMatrix, Rat.cast_add]
  ring

omit [IsProbabilityMeasure μ] in
private theorem surplus_nonneg (r : Row) (hr : RowFacts r) (hM : Moments μ U x)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (hg : Integrable (fun ω => r.gate (X1 ω) (X2 ω) (X3 ω)) μ) :
    0 ≤ surplus r μ X1 X2 X3 τ := by
  have hp : baseline r ≤ gatePrice r.N r.g1 r.g2 r.g3 := by
    unfold baseline
    linarith only [hr.2.2.1]
  exact sub_nonneg.mpr ((mul_le_mul_of_nonneg_right ((Rat.cast_le (K := ℝ)).mpr hp) (sq_nonneg τ)).trans
    (gate_integral_ge r.N r.g1 r.g2 r.g3 hr.2.1 X1 X2 X3 τ hX hM hg))

omit [IsProbabilityMeasure μ] in
private theorem pair_surplus (hM : Moments μ U x) (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (h8 : Integrable (fun ω => row08.gate (X1 ω) (X2 ω) (X3 ω)) μ)
    (h9 : Integrable (fun ω => row09.gate (X1 ω) (X2 ω) (X3 ω)) μ) :
    (gateExcess : ℝ) * τ ^ 2 ≤ surplus row08 μ X1 X2 X3 τ + surplus row09 μ X1 X2 X3 τ := by
  have hpoint := gate_integral_ge (sumMatrix row08.N row09.N) (row08.g1 + row09.g1)
    (row08.g2 + row09.g2) (row08.g3 + row09.g3) pair_ok.1 X1 X2 X3 τ hX hM
    (by
      simp only [gate_sum]
      exact h8.add h9)
  change (pairPrice row08 row09 : ℝ) * τ ^ 2 ≤ _ at hpoint
  simp only [gate_sum, integral_add h8 h9] at hpoint
  have hp := (Rat.cast_le (K := ℝ)).mpr pair_ok.2
  simp only [Rat.cast_sub] at hp
  unfold surplus
  nlinarith only [hpoint, mul_le_mul_of_nonneg_right hp (sq_nonneg τ)]

private theorem saved_row (r : Row) (reserve : ℚ) {Ψ : ℝ → ℝ}
    (hr : RowSharedWith r Ψ μ U X1 X2 X3 τ V t Qh v)
    (hlaw : Goal μ U (fun s => Ψ s - capPad) r.kappa (r.cap - reserve) (r.delta * τ)) :
    RowHolds ε r.ell r.beta ((r.env.C : ℝ) - ((reserve : ℝ) + surplus r μ X1 X2 X3 τ)) V t Qh v := by
  obtain ⟨_, hf, _, hV⟩ := hr
  have hb := hlaw (hf.sub (integrable_const _))
  rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul] at hb
  unfold RowHolds Row.env surplus baseline
  push_cast at hb ⊢
  nlinarith only [hV, hb]

private theorem full_law (r : Row) (hr : RowFacts r) (hM : Moments μ U x) (hS : SteinCut μ U)
    (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ) {Ψ : ℝ → ℝ}
    (hΨ : CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax) :
    Goal μ U (fun s => Ψ s - capPad) r.kappa (r.cap - 0) (r.delta * τ) := by
  have hd := (Rat.cast_nonneg (K := ℝ)).mpr hr.1.le
  rw [sub_zero]
  exact hr.2.2.2 Ω μ U x _ _ hM hS hΨ (mul_nonneg hd hτ0) (mul_le_mul_of_nonneg_left hτ1 hd)

private theorem small_law (hM : Moments μ U x) (hτ0 : 0 ≤ τ) (hcut : τ ≤ (smallCut : ℝ))
    {Ψ : ℝ → ℝ} (hΨ : CapsHold (fun s => Ψ s - capPad) row08.nodeList row08.smax) :
    Goal μ U (fun s => Ψ s - capPad) row08.kappa (row08.cap - smallSaving) (row08.delta * τ) := by
  have hdq : 0 ≤ row08.delta := by decide +kernel
  have hd := (Rat.cast_nonneg (K := ℝ)).mpr hdq
  apply rect_sound μ hM hΨ row08.kappa (row08.cap - smallSaving) 0 xMax smallRect
    smallRectangle_ok (by simpa using hM.x0) hM.x1 (row08.delta * τ)
  · simpa only [smallRect, Rat.cast_zero] using mul_nonneg hd hτ0
  · simpa only [smallRect, Rat.cast_mul] using mul_le_mul_of_nonneg_left hcut hd

/-- The two actual row intercepts have nonnegative deductions with a uniform lower bound on their sum. -/
private theorem active_rows (hred : SharedReduction rowData V t Qh v) :
    ∃ d8 d9 : ℝ, 0 ≤ d8 ∧ 0 ≤ d9 ∧ (totalSaving : ℝ) ≤ d8 + d9 ∧
      RowHolds ε row08.ell row08.beta ((row08.env.C : ℝ) - d8) V t Qh v ∧
      RowHolds ε row09.ell row09.beta ((row09.env.C : ℝ) - d9) V t Qh v := by
  obtain ⟨Ω, _, μ, _, U, X1, X2, X3, τ, x, hM, hSI, hτ0, hτ1, hX, hshared⟩ := hred
  have hS := steinCut_of_inputs μ hM hSI
  have mem8 : row08 ∈ rowData := List.mem_of_getElem? (i := 7) (by rfl)
  have mem9 : row09 ∈ rowData := List.mem_of_getElem? (i := 8) (by rfl)
  obtain ⟨P8, h8⟩ := hshared row08 mem8
  obtain ⟨P9, h9⟩ := hshared row09 mem9
  have f8 := rowData_facts row08 mem8
  have f9 := rowData_facts row09 mem9
  let s8 := surplus row08 μ X1 X2 X3 τ
  let s9 := surplus row09 μ X1 X2 X3 τ
  have z8 : 0 ≤ s8 := surplus_nonneg row08 f8 hM hX h8.2.2.1
  have z9 : 0 ≤ s9 := surplus_nonneg row09 f9 hM hX h9.2.2.1
  have H9 : RowHolds ε row09.ell row09.beta ((row09.env.C : ℝ) - s9) V t Qh v := by
    simpa only [Rat.cast_zero, zero_add] using saved_row row09 0 h9 (full_law row09 f9 hM hS hτ0 hτ1 h9.1)
  by_cases hcut : τ ≤ (smallCut : ℝ)
  · have hsmall : 0 ≤ (smallSaving : ℝ) := by norm_num [smallSaving]
    have hsize := (Rat.cast_le (K := ℝ)).mpr availableSaving.2
    exact ⟨(smallSaving : ℝ) + s8, s9, add_nonneg hsmall z8, z9, by linarith only [hsize, z8, z9],
      saved_row row08 smallSaving h8 (small_law hM hτ0 hcut h8.1), H9⟩
  · have hlarge : (smallCut : ℝ) ≤ τ := (lt_of_not_ge hcut).le
    have hsq := mul_self_le_mul_self (by norm_num [smallCut] : 0 ≤ (smallCut : ℝ)) hlarge
    have hprice := (Rat.cast_nonneg (K := ℝ)).mpr availableSaving.1
    have hsize : (totalSaving : ℝ) ≤ (gateExcess : ℝ) * τ ^ 2 := by
      simpa only [totalSaving, Rat.cast_mul, Rat.cast_pow, pow_two] using mul_le_mul_of_nonneg_left hsq hprice
    refine ⟨s8, s9, z8, z9, hsize.trans (pair_surplus hM hX h8.2.2.1 h9.2.2.1), ?_, H9⟩
    simpa only [Rat.cast_zero, zero_add] using saved_row row08 0 h8 (full_law row08 f8 hM hS hτ0 hτ1 h8.1)

/-- The smaller of the two mixture weights prices the shared saving at each point of the cell. -/
theorem cell_bound (c : AffineEnvCell) (hok : sharedCellOK c = true)
    (hv : ‖v‖ ^ 2 = 2) (hred : SharedReduction rowData V t Qh v)
    (hlo : (c.lo : ℝ) ≤ t) (hhi : t ≤ c.hi) : V ≤ (hatCap : ℝ) := by
  obtain ⟨hs, hl, hr, hleft, hright⟩ := of_decide_eq_true hok
  let θ : ℝ := (c.offset : ℝ) + c.slope * t
  have hs' : 0 ≤ (c.slope : ℝ) := by exact_mod_cast hs
  have left : 0 ≤ (c.offset : ℝ) + c.slope * c.lo := by exact_mod_cast hl
  have right : (c.offset : ℝ) + c.slope * c.hi ≤ 1 := by exact_mod_cast hr
  have hθ0 : 0 ≤ θ := left.trans (add_le_add_right (mul_le_mul_of_nonneg_left hlo hs') _)
  have hθ1 : θ ≤ 1 := (add_le_add_right (mul_le_mul_of_nonneg_left hhi hs') _).trans right
  have h01 := sub_nonneg.mpr hθ1
  obtain ⟨d8, d9, z8, z9, hsum, H8, H9⟩ := active_rows hred
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have mixed := (RowHolds.mix hε hv H8 H9 θ hθ0 hθ1).le hε.le
  have choose (q8 q9 : ℚ)
      (hsave : (1 - θ) * (q8 : ℝ) + θ * (q9 : ℝ) ≤ (1 - θ) * d8 + θ * d9)
      (hcap : affineCellCap (discount row08.env q8) (discount row09.env q9) c ≤ hatCap) :
      V ≤ (hatCap : ℝ) := by
    have val := mix_le_affineCellCap (discount row08.env q8) (discount row09.env q9) c t hlo hhi
    change t ^ 2 - 2 * ((1 - θ) * (row08.ell : ℝ) + θ * row09.ell) * t +
      ((1 - θ) * ((row08.env.C - q8 : ℚ) : ℝ) + θ * ((row09.env.C - q9 : ℚ) : ℝ) -
      2 / (ε : ℝ) * θ * (1 - θ) * (row08.beta - row09.beta : ℝ) ^ 2) ≤ _ at val
    simp only [Rat.cast_sub] at val
    apply le_trans _ ((Rat.cast_le (K := ℝ)).mpr hcap)
    nlinarith only [mixed, val, hsave]
  by_cases hθ : θ ≤ 1 - θ
  · apply choose 0 totalSaving _ hright
    simp only [Rat.cast_zero, mul_zero, zero_add]
    nlinarith only [mul_le_mul_of_nonneg_left hsum hθ0, mul_nonneg (sub_nonneg.mpr hθ) z8]
  · apply choose totalSaving 0 _ hleft
    simp only [Rat.cast_zero, mul_zero, add_zero]
    nlinarith only [mul_le_mul_of_nonneg_left hsum h01, mul_nonneg (sub_nonneg.mpr (lt_of_not_ge hθ).le) z9]

end Grothe.Lower.SharedGate
