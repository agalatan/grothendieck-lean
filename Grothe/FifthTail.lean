import Grothe.ListPoly
import Grothe.Haagerup
import Grothe.WallisTail

/-!
# The omitted blocks of the fifth kernel: `∑_{j ≥ 67} h_j ‖ρ₅^{2j+1}‖_𝒜 < 1/273360`

The fifth preprocessor of Heilman–Jones–Malavolta is `ρ₅(t) = t · P₅(t²)` with
`P₅ = (integer polynomial) / 10¹²`, source equation (5.4).  Since `ρ₅^k(t) = t^k P₅(t²)^k`,
the coefficient norms agree: `‖ρ₅^k‖_𝒜 = ‖P₅^k‖_𝒜`.

The research note proves (equation (2)) by exact integer convolution that
`‖P₅²⁰‖_𝒜 < 1/2` and `‖P₅¹³⁵‖_𝒜 < 1/300`, and then (equation (3)) groups the omitted
indices `j = 67 + 10k + r` to obtain the reserve `1/273360`, replacing the source's `1/268`.

The exact integer facts are established by `native_decide` (compiled evaluation of
`listPow`); everything else is an ordinary proof.
-/

namespace Grothe

open Polynomial

/-- Integer coefficients of `10¹² · P₅` (degree 37), source equation (5.4). -/
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

/-- `‖P₅¹³⁵‖_𝒜 < 1/300`. -/
theorem absSum_P5int_pow135 : 300 * absSum (listPow P5int 135) < (10 ^ 12) ^ 135 := by
  native_decide

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

/-- `‖P₅¹³⁵‖_𝒜 ≤ 1/300`. -/
lemma nrm_135 : nrm 135 ≤ 1 / 300 := by
  have h1 := nrm_mul_le_absSum 135
  have h2 : ((300 * absSum (listPow P5int 135) : ℕ) : ℝ) ≤ (((10 ^ 12) ^ 135 : ℕ) : ℝ) :=
    Nat.cast_le.mpr absSum_P5int_pow135.le
  rw [Nat.cast_mul, Nat.cast_pow, Nat.cast_pow, Nat.cast_ofNat, Nat.cast_ofNat] at h2
  generalize hD : (((10 : ℝ) ^ 12) ^ 135) = D at h1 h2
  have hD0 : 0 < D := by rw [← hD]; positivity
  rw [le_div_iff₀ (by norm_num : (0 : ℝ) < 300)]
  nlinarith

/-- `‖P₅^{135 + 20k + 2r}‖_𝒜 ≤ (1/300) 2^{-k}`. -/
theorem nrm_block_le (k r : ℕ) : nrm (135 + 20 * k + 2 * r) ≤ (1 / 300) * (1 / 2) ^ k := by
  have h2 : nrm 2 ≤ 1 := by
    have := nrm_mul_le_one 1 2 nrm_one_le
    simpa using this
  calc nrm (135 + 20 * k + 2 * r)
      ≤ nrm (135 + 20 * k) * nrm (2 * r) := nrm_add_le _ _
    _ ≤ (nrm 135 * nrm (20 * k)) * 1 :=
        mul_le_mul (nrm_add_le _ _) (nrm_mul_le_one 2 r h2) (nrm_nonneg _)
          (mul_nonneg (nrm_nonneg _) (nrm_nonneg _))
    _ ≤ ((1 / 300) * (1 / 2) ^ k) * 1 := by
        have h20 : nrm (20 * k) ≤ (1 / 2) ^ k :=
          (nrm_mul_le 20 k).trans (pow_le_pow_left₀ (nrm_nonneg _) nrm_20 _)
        have h135 : nrm 135 ≤ 1 / 300 := nrm_135
        exact mul_le_mul_of_nonneg_right
          (mul_le_mul h135 h20 (nrm_nonneg _) (by norm_num)) zero_le_one
    _ = (1 / 300) * (1 / 2) ^ k := by ring

/-- Submultiplicativity chain of the note: writing `2j+1 = 135 + 20k + 2r` with
`j = 67 + m`, `k = m / 10`, `r = m % 10`, we get `‖P₅^{2j+1}‖_𝒜 ≤ (1/300) 2^{-k}`. -/
theorem l1_P5_pow_odd_le (m : ℕ) :
    l1 (P5 ^ (2 * (m + 67) + 1)) ≤ (1 / 300) * (1 / 2) ^ (m / 10) := by
  have hdecomp : 2 * (m + 67) + 1 = 135 + 20 * (m / 10) + 2 * (m % 10) := by omega
  have := nrm_block_le (m / 10) (m % 10)
  rw [nrm_def] at this
  rw [hdecomp]
  exact this

/-- Closed form for the block sums `∑_{m<N} 2^{-⌊m/10⌋}`. -/
lemma sum_half_pow_div (N : ℕ) :
    ∑ m ∈ Finset.range N, ((1 : ℝ) / 2) ^ (m / 10)
      = 20 - (20 - ((N % 10 : ℕ) : ℝ)) * (1 / 2) ^ (N / 10) := by
  induction N with
  | zero => simp
  | succ N ih =>
    rw [Finset.sum_range_succ, ih]
    rcases Nat.lt_or_ge (N % 10) 9 with hlt | hge
    · have e1 : (N + 1) / 10 = N / 10 := by omega
      have e2 : (N + 1) % 10 = N % 10 + 1 := by omega
      rw [e1, e2]; push_cast; ring
    · have e1 : (N + 1) / 10 = N / 10 + 1 := by omega
      have e2 : (N + 1) % 10 = 0 := by omega
      have e3 : N % 10 = 9 := by omega
      rw [e1, e2, e3, pow_succ]; push_cast; ring

lemma sum_half_pow_div_le (N : ℕ) :
    ∑ m ∈ Finset.range N, ((1 : ℝ) / 2) ^ (m / 10) ≤ 20 := by
  rw [sum_half_pow_div]
  have h0 : N % 10 ≤ 9 := by omega
  have h1 : ((N % 10 : ℕ) : ℝ) ≤ 9 := by exact_mod_cast h0
  have h2 : (0 : ℝ) ≤ (1 / 2) ^ (N / 10) := by positivity
  nlinarith

/-- Termwise majorant for the omitted fifth-kernel blocks. -/
lemma fifth_term_le (m : ℕ) :
    h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1))
      ≤ (1 / (4 * 67 * 68)) * (1 / 300) * (1 / 2) ^ (m / 10) := by
  rw [mul_assoc]
  exact mul_le_mul (h_add_67_le m) (l1_P5_pow_odd_le m) (l1_nonneg _) (by positivity)

/-- **Research note, equation (3).**  The omitted outer blocks of the fifth kernel satisfy
`∑_{j ≥ 67} h_j ‖P₅^{2j+1}‖_𝒜 ≤ 1/273360`, which replaces the source reserve `1/268`. -/
theorem fifth_omitted_tail :
    ∑' m : ℕ, h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1)) ≤ 1 / 273360 := by
  apply Real.tsum_le_of_sum_le
  · intro m; exact mul_nonneg (h_nonneg _) (l1_nonneg _)
  · intro s
    calc ∑ m ∈ s, h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1))
        ≤ ∑ m ∈ s, (1 / (4 * 67 * 68)) * (1 / 300) * ((1 : ℝ) / 2) ^ (m / 10) :=
          Finset.sum_le_sum fun m _ => fifth_term_le m
      _ ≤ ∑ m ∈ Finset.range (s.sup id + 1),
            (1 / (4 * 67 * 68)) * (1 / 300) * ((1 : ℝ) / 2) ^ (m / 10) := by
          apply Finset.sum_le_sum_of_subset_of_nonneg
          · intro m hm
            exact Finset.mem_range.2 (Nat.lt_succ_of_le (Finset.le_sup (f := id) hm))
          · intro m _ _; positivity
      _ = (1 / (4 * 67 * 68)) * (1 / 300) *
            ∑ m ∈ Finset.range (s.sup id + 1), ((1 : ℝ) / 2) ^ (m / 10) := by
          rw [Finset.mul_sum]
      _ ≤ (1 / (4 * 67 * 68)) * (1 / 300) * 20 := by
          gcongr; exact sum_half_pow_div_le _
      _ = 1 / 273360 := by norm_num

/-- The omitted-block series is summable (its partial sums are bounded). -/
theorem fifth_omitted_summable :
    Summable fun m : ℕ => h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1)) := by
  refine summable_of_sum_range_le (c := 1 / 273360)
    (fun m => mul_nonneg (h_nonneg _) (l1_nonneg _)) fun N => ?_
  calc ∑ m ∈ Finset.range N, h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1))
      ≤ ∑ m ∈ Finset.range N, (1 / (4 * 67 * 68)) * (1 / 300) * ((1 : ℝ) / 2) ^ (m / 10) :=
        Finset.sum_le_sum fun m _ => fifth_term_le m
    _ = (1 / (4 * 67 * 68)) * (1 / 300) * ∑ m ∈ Finset.range N, ((1 : ℝ) / 2) ^ (m / 10) := by
        rw [Finset.mul_sum]
    _ ≤ (1 / (4 * 67 * 68)) * (1 / 300) * 20 := by gcongr; exact sum_half_pow_div_le _
    _ = 1 / 273360 := by norm_num

/-- Every odd power has `‖P₅^{2j+1}‖_𝒜 ≤ 1` (source (5.6): `‖ρ₅‖_𝒜 ≤ 1`). -/
lemma l1_P5_pow_le_one (j : ℕ) : l1 (P5 ^ j) ≤ 1 := by
  have := nrm_mul_le_one 1 j nrm_one_le
  rw [one_mul, nrm_def] at this
  exact this

/-- **The source's reserve (6.20)**: charging the omitted blocks with `‖ρ₅‖_𝒜 ≤ 1` and the
Wallis tail `∑_{j ≥ 67} h_j ≤ 1/(4·67)` gives only `1/268`; the note's `1/273360` is a factor
`1020` smaller. -/
theorem fifth_omitted_tail_source :
    ∑' m : ℕ, h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1)) ≤ 1 / 268 := by
  have hs : Summable fun m : ℕ => h (67 + m) := h_tail_summable 67 (by norm_num)
  calc ∑' m : ℕ, h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1))
      ≤ ∑' m : ℕ, h (67 + m) := by
        refine Summable.tsum_le_tsum (fun m => ?_) fifth_omitted_summable hs
        rw [add_comm m 67]
        calc h (67 + m) * l1 (P5 ^ (2 * (67 + m) + 1)) ≤ h (67 + m) * 1 :=
              mul_le_mul_of_nonneg_left (l1_P5_pow_le_one _) (h_nonneg _)
          _ = h (67 + m) := mul_one _
    _ ≤ 1 / (4 * (67 : ℕ)) := h_tail_le 67 (by norm_num)
    _ = 1 / 268 := by norm_num

end

end Grothe
