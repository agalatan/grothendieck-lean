import Grothe.ListPoly
import Grothe.Haagerup
import Grothe.WallisTail

/-!
# The fifth kernel: contraction of `ρ₅` and the reserve for the omitted blocks

The fifth preprocessor is `ρ₅(t) = t · P₅(t²)` with `P₅ = (integer polynomial) / 10¹²`.  Since
`ρ₅^k(t) = t^k P₅(t²)^k`, the coefficient norms agree: `‖ρ₅^k‖_𝒜 = ‖P₅^k‖_𝒜`.  Exact integer
convolution shows `‖P₅‖_𝒜 < 1` and `‖P₅²⁰‖_𝒜 < 1/2` (`native_decide`).

The certificate sums the outer blocks `j < 320` of the fifth kernel exactly and charges the
omitted blocks `j ≥ 320` with the reserve

  `∑_{j ≥ 320} h_j ‖P₅^{2j+1}‖_𝒜 ≤ 1/(4·320·2³²)`,

obtained from `‖P₅^{2j+1}‖_𝒜 ≤ ‖P₅²⁰‖_𝒜^{32} ≤ 2⁻³²` for `j ≥ 320` and the Wallis tail
`∑_{j≥320} h_j ≤ 1/(4·320)`.
-/

namespace Grothe

open Polynomial

/-- Integer coefficients of `10¹² · P₅` (degree 37). -/
def P5int : List ℤ :=
  [94626045381, -856254413568, 0, 0, 0, 0, 0, 0, 0, 0, 1274576105, 0, 0, 8312996734,
   1885453067, 1662844635, 9295485863, 9399425108, 8540450681, 847985940, 3771690693,
   873880329, 0, 0, 0, 0, 0, -419180236, 0, -311954497, -455650279, -996284704, 0, 0, 0,
   -865568525, 0, 206113648]

/-- `‖ρ₅‖_𝒜 = 1 - 7·10⁻¹²` (exact). -/
theorem absSum_P5int : absSum P5int = 10 ^ 12 - 7 := by decide

theorem absSum_P5int_pow1 : absSum (listPow P5int 1) ≤ 10 ^ 12 := by decide

/-- `‖P₅²⁰‖_𝒜 < 1/2`, i.e. `2 · (sum of |coefficients| of (10¹²P₅)²⁰) < (10¹²)²⁰`. -/
theorem absSum_P5int_pow20 : 2 * absSum (listPow P5int 20) < (10 ^ 12) ^ 20 := by native_decide

noncomputable section

/-- The real polynomial `P₅`. -/
def P5 : ℝ[X] := C (((10 : ℝ) ^ 12)⁻¹) * ofList P5int

/-- `nrm k = ‖P₅ᵏ‖_𝒜`.  Irreducible so that `nrm 135` is never unfolded to a 135-fold product
during unification. -/
@[irreducible] def nrm (k : ℕ) : ℝ := l1 (P5 ^ k)

lemma nrm_def (k : ℕ) : nrm k = l1 (P5 ^ k) := by unfold nrm; rfl

lemma nrm_nonneg (k : ℕ) : 0 ≤ nrm k := by rw [nrm_def]; exact l1_nonneg _

lemma nrm_add_le (a b : ℕ) : nrm (a + b) ≤ nrm a * nrm b := by
  rw [nrm_def, nrm_def, nrm_def, pow_add]; exact l1_mul_le _ _

lemma nrm_mul_le (a b : ℕ) : nrm (a * b) ≤ nrm a ^ b := by
  rw [nrm_def, nrm_def, pow_mul]; exact l1_pow_le _ _

lemma nrm_mul_le_one (a b : ℕ) (ha : nrm a ≤ 1) : nrm (a * b) ≤ 1 :=
  (nrm_mul_le a b).trans (pow_le_one₀ (nrm_nonneg a) ha)

/-- Bridge: `‖P₅ᵏ‖_𝒜 · (10¹²)ᵏ ≤ absSum ((10¹² P₅)ᵏ)`. -/
lemma nrm_mul_le_absSum (k : ℕ) :
    nrm k * ((10 : ℝ) ^ 12) ^ k ≤ (absSum (listPow P5int k) : ℝ) := by
  rw [nrm_def]
  unfold P5
  rw [mul_pow, ← C_pow]
  calc l1 (C ((((10 : ℝ) ^ 12)⁻¹) ^ k) * ofList P5int ^ k) * ((10 : ℝ) ^ 12) ^ k
      ≤ |(((10 : ℝ) ^ 12)⁻¹) ^ k| * l1 (ofList P5int ^ k) * ((10 : ℝ) ^ 12) ^ k := by
        gcongr; exact l1_C_mul_le _ _
    _ = l1 (ofList P5int ^ k) := by
        rw [abs_of_nonneg (by positivity), inv_pow]; field_simp
    _ ≤ _ := l1_ofList_listPow_le _ _

lemma nrm_one_le : nrm 1 ≤ 1 := by
  have h1 := nrm_mul_le_absSum 1
  have h2 : ((absSum (listPow P5int 1) : ℕ) : ℝ) ≤ ((10 ^ 12 : ℕ) : ℝ) :=
    Nat.cast_le.mpr absSum_P5int_pow1
  rw [Nat.cast_pow, Nat.cast_ofNat] at h2
  rw [pow_one] at h1
  have hD0 : (0 : ℝ) < 10 ^ 12 := by positivity
  nlinarith

/-- `‖P₅²⁰‖_𝒜 ≤ 1/2`. -/
lemma nrm_20 : nrm 20 ≤ 1 / 2 := by
  have h1 := nrm_mul_le_absSum 20
  have h2 : ((2 * absSum (listPow P5int 20) : ℕ) : ℝ) ≤ (((10 ^ 12) ^ 20 : ℕ) : ℝ) :=
    Nat.cast_le.mpr absSum_P5int_pow20.le
  rw [Nat.cast_mul, Nat.cast_pow, Nat.cast_pow, Nat.cast_ofNat, Nat.cast_ofNat] at h2
  generalize hD : (((10 : ℝ) ^ 12) ^ 20) = D at h1 h2
  have hD0 : 0 < D := by rw [← hD]; positivity
  rw [le_div_iff₀ (by norm_num : (0 : ℝ) < 2)]
  nlinarith

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
theorem fifth_reserve :
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

/-- Certified contribution of the retained blocks `j < 320` to the modes `≥ 240` (a hypothesis
of the final theorem; the directed computation gives less than `8.6·10⁻¹³`). -/
def fifthFinite : ℚ := 8.6e-13

/-- Total fifth tail bound: retained blocks plus the reserve for `j ≥ 320`. -/
def fifthT : ℚ := fifthFinite + 1 / (4 * 320 * 2 ^ 32)

end

end Grothe
