import Grothe.FifthTail

/-!
# The fifth kernel with cutoff `240`

The combined certificate sums the outer blocks `j < 320` of the fifth kernel exactly and
charges the omitted blocks `j ≥ 320` with the reserve

  `∑_{j ≥ 320} h_j ‖ρ₅^{2j+1}‖_𝒜 ≤ 1/(4·320·2³²)`,

obtained from `‖ρ₅^{2j+1}‖_𝒜 ≤ ‖ρ₅²⁰‖_𝒜^{32} ≤ 2⁻³²` for `j ≥ 320` and the Wallis tail
`∑_{j≥320} h_j ≤ 1/(4·320)` (source Lemma 6.1).
-/

namespace Grothe

noncomputable section

lemma nrm_320_shift_le (m : ℕ) : nrm (2 * (320 + m) + 1) ≤ (1 / 2 : ℝ) ^ 32 := by
  have e : 2 * (320 + m) + 1 = 20 * 32 + (2 * m + 1) := by omega
  rw [e]
  have h1 : nrm (20 * 32) ≤ (1 / 2 : ℝ) ^ 32 :=
    (nrm_mul_le 20 32).trans (pow_le_pow_left₀ (nrm_nonneg _) nrm_20 _)
  have h2 : nrm (2 * m + 1) ≤ 1 := by simpa using nrm_mul_le_one 1 (2 * m + 1) nrm_one_le
  calc nrm (20 * 32 + (2 * m + 1)) ≤ nrm (20 * 32) * nrm (2 * m + 1) := nrm_add_le _ _
    _ ≤ (1 / 2 : ℝ) ^ 32 * 1 := mul_le_mul h1 h2 (nrm_nonneg _) (by norm_num)
    _ = (1 / 2 : ℝ) ^ 32 := mul_one _

/-- **The reserve for the omitted fifth-kernel blocks `j ≥ 320`.** -/
theorem fifth_omitted_tail_320 :
    ∑' m : ℕ, h (320 + m) * l1 (P5 ^ (2 * (320 + m) + 1)) ≤ 1 / (4 * 320 * 2 ^ 32) := by
  have hs : Summable fun m => h (320 + m) := h_tail_summable 320 (by norm_num)
  have hle : ∀ m, h (320 + m) * l1 (P5 ^ (2 * (320 + m) + 1)) ≤ h (320 + m) * (1 / 2 : ℝ) ^ 32 := by
    intro m
    rw [← nrm_def]
    exact mul_le_mul_of_nonneg_left (nrm_320_shift_le m) (h_nonneg _)
  have htail := h_tail_le 320 (by norm_num)
  calc ∑' m, h (320 + m) * l1 (P5 ^ (2 * (320 + m) + 1))
      ≤ ∑' m, h (320 + m) * (1 / 2 : ℝ) ^ 32 := by
        refine Summable.tsum_le_tsum hle ?_ (hs.mul_right _)
        exact Summable.of_nonneg_of_le (fun m => mul_nonneg (h_nonneg _) (l1_nonneg _)) hle
          (hs.mul_right _)
    _ = (∑' m, h (320 + m)) * (1 / 2 : ℝ) ^ 32 := tsum_mul_right
    _ ≤ (1 / (4 * (320 : ℕ))) * (1 / 2 : ℝ) ^ 32 := by gcongr
    _ = 1 / (4 * 320 * 2 ^ 32) := by norm_num

/-- Certified finite part of the fifth tail (retained blocks `j < 320`, modes `≥ 240`), a
hypothesis of the final theorem; the handoff's directed total is `< 1.040219496692·10⁻¹²`
including the reserve `1/(4·320·2³²) ≈ 1.819·10⁻¹³`. -/
def fifthFinite240 : ℚ := 8.6e-13

/-- Total fifth tail bound with cutoff `240`. -/
def fifthT240 : ℚ := fifthFinite240 + 1 / (4 * 320 * 2 ^ 32)

end

end Grothe
