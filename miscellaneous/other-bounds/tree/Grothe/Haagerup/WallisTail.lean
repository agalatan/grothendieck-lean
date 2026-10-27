-- Grothe/Haagerup/WallisTail.lean
import Grothe.Upper.Haagerup
import Mathlib.Analysis.Real.Pi.Wallis

/-!
# A Wallis bound for the Gaussian phase coefficients

The normalized Haagerup coefficients are consecutive Wallis products in disguise.
A monotone rescaling and the Wallis limit give an all-index coefficient bound.
The resulting rational telescoping majorant applies to arbitrary tail intervals.
-/

namespace Grothe.HaagerupWallis

open Filter Finset
open scoped Topology

noncomputable section

/-- The finite Wallis product is the reciprocal of `haagG`. -/
lemma haagG_mul_wallis (n : ℕ) : (haagG n : ℝ) * Real.Wallis.W n = 1 := by
  induction n with
  | zero => norm_num [haagG, haagR, Real.Wallis.W]
  | succ n ih =>
    rw [Real.Wallis.W_succ]
    have hg : (haagG (n+1) : ℝ) = (haagG n : ℝ) *
        ((2*(n:ℝ)+1)*(2*(n:ℝ)+3))/(4*((n:ℝ)+1)^2) := by
      unfold haagG
      rw [haagR]
      push_cast
      field_simp
      ring
    rw [hg]
    have h1 : (2*(n:ℝ)+1) ≠ 0 := by positivity
    have h2 : (2*(n:ℝ)+3) ≠ 0 := by positivity
    have h3 : ((n:ℝ)+1) ≠ 0 := by positivity
    have h4 : (2*(n:ℝ)+2) ≠ 0 := by positivity
    field_simp
    nlinarith [ih]

/-- This shifted Wallis sequence increases to `4/π`. -/
def scaled (n : ℕ) : ℝ := (4*(n:ℝ)+1)*((n:ℝ)+1)*(haagR n : ℝ)

lemma scaled_succ (n : ℕ) :
    scaled (n+1) = scaled n + (haagR n : ℝ)/(4*((n:ℝ)+1)) := by
  unfold scaled
  rw [haagR]
  push_cast
  field_simp
  ring

lemma scaled_monotone : Monotone scaled := by
  apply monotone_nat_of_le_succ
  intro n
  rw [scaled_succ]
  have hr : (0:ℝ) ≤ (haagR n : ℝ) := by exact_mod_cast (haagR_pos n).le
  have h : 0 ≤ (haagR n : ℝ)/(4*((n:ℝ)+1)) := by positivity
  linarith

lemma scaled_eq_ratio (n : ℕ) :
    scaled n = ((4*(n:ℝ)+1)/(2*(n:ℝ)+1)) / Real.Wallis.W n := by
  have hw : Real.Wallis.W n ≠ 0 := (Real.Wallis.W_pos n).ne'
  have hn : (2*(n:ℝ)+1) ≠ 0 := by positivity
  have hg := haagG_mul_wallis n
  unfold haagG at hg
  push_cast at hg
  unfold scaled
  field_simp
  nlinarith [hg]

lemma tendsto_scaled : Tendsto scaled atTop (𝓝 (4/Real.pi)) := by
  have hden : Tendsto (fun n : ℕ => (2:ℝ)*(n:ℝ)+1) atTop atTop :=
    (tendsto_natCast_atTop_atTop.const_mul_atTop (by norm_num)).atTop_add tendsto_const_nhds
  have hratio : Tendsto (fun n : ℕ => (4*(n:ℝ)+1)/(2*(n:ℝ)+1)) atTop (𝓝 2) := by
    have hzero : Tendsto (fun n : ℕ => (1:ℝ)/(2*(n:ℝ)+1)) atTop (𝓝 0) :=
      tendsto_const_nhds.div_atTop hden
    have h : Tendsto (fun n : ℕ => (2:ℝ) - 1/(2*(n:ℝ)+1)) atTop (𝓝 (2-0)) :=
      tendsto_const_nhds.sub hzero
    have he (n : ℕ) : (4*(n:ℝ)+1)/(2*(n:ℝ)+1) = 2 - 1/(2*(n:ℝ)+1) := by
      field_simp
      ring
    simpa only [sub_zero, ← he] using h
  have h := hratio.div Real.Wallis.tendsto_W_nhds_pi_div_two (by positivity)
  have he : (2 : ℝ)/(Real.pi/2) = 4/Real.pi := by ring
  rw [he] at h
  exact h.congr' (Eventually.of_forall fun n => (scaled_eq_ratio n).symm)

lemma scaled_le (n : ℕ) : scaled n ≤ 4/Real.pi :=
  scaled_monotone.ge_of_tendsto tendsto_scaled n

/-- A rational majorant for every Gaussian phase coefficient. -/
theorem coefficient_le (n : ℕ) :
    haagCoeff n ≤ 1/((4*(n:ℝ)+1)*((n:ℝ)+1)) := by
  have h := mul_le_mul_of_nonneg_left (scaled_le n) (show (0:ℝ) ≤ Real.pi/4 by positivity)
  have he : Real.pi/4*(4/Real.pi) = 1 := by field_simp
  rw [he] at h
  rw [le_div_iff₀ (by positivity)]
  unfold haagCoeff scaled at *
  nlinarith

/-- A rational tail majorant whose discrete derivative dominates every coefficient.
The correction is a three-point telescoping improvement of `2/(8n+1)`. -/
def tailMajorant (n : ℕ) : ℝ :=
  2/(8*(n:ℝ)+1) - 14/(3*(8*(n:ℝ)+1)*(8*(n:ℝ)+9)*(8*(n:ℝ)+17))

lemma tailMajorant_nonneg (n : ℕ) : 0 ≤ tailMajorant n := by
  unfold tailMajorant
  apply sub_nonneg.mpr
  rw [div_le_div_iff₀ (by positivity) (by positivity)]
  have h : (14:ℝ) ≤ 6*(8*(n:ℝ)+9)*(8*(n:ℝ)+17) := by nlinarith [sq_nonneg (n:ℝ)]
  calc
    (14:ℝ)*(8*(n:ℝ)+1) ≤ (6*(8*(n:ℝ)+9)*(8*(n:ℝ)+17))*(8*(n:ℝ)+1) :=
      mul_le_mul_of_nonneg_right h (by positivity)
    _ = _ := by ring

lemma coefficient_le_diff (n : ℕ) :
    haagCoeff n ≤ tailMajorant n - tailMajorant (n+1) := by
  apply (coefficient_le n).trans
  have he : tailMajorant n - tailMajorant (n+1) - 1/((4*(n:ℝ)+1)*((n:ℝ)+1)) =
      112*(32*(8*(n:ℝ)+1)+377) /
        ((8*(n:ℝ)+1)*(8*(n:ℝ)+9)*(8*(n:ℝ)+2)*
          (8*(n:ℝ)+8)*(8*(n:ℝ)+17)*(8*(n:ℝ)+25)) := by
    unfold tailMajorant
    push_cast
    field_simp
    ring
  have h : 0 ≤ 112*(32*(8*(n:ℝ)+1)+377) /
      ((8*(n:ℝ)+1)*(8*(n:ℝ)+9)*(8*(n:ℝ)+2)*
        (8*(n:ℝ)+8)*(8*(n:ℝ)+17)*(8*(n:ℝ)+25)) := by positivity
  rw [← he] at h
  linarith

/-- The same majorant controls each finite interval, a useful weighted-tail input. -/
theorem sum_coeff_le_diff (K N : ℕ) :
    ∑ i ∈ range N, haagCoeff (K+i) ≤ tailMajorant K - tailMajorant (K+N) := by
  calc
    _ ≤ ∑ i ∈ range N, (tailMajorant (K+i) - tailMajorant (K+(i+1))) :=
      sum_le_sum fun i _ => by simpa only [Nat.add_assoc] using coefficient_le_diff (K+i)
    _ = _ := by
      simpa only [Nat.add_zero] using sum_range_sub' (fun i => tailMajorant (K+i)) N

/-- Charge an interval at its initial weight, preserving the telescoping gain. -/
theorem weighted_block (w : ℕ → ℝ) (hw0 : ∀ k, 0 ≤ w k) (hw : Antitone w)
    (K N : ℕ) :
    ∑ i ∈ range N, haagCoeff (K+i) * w (K+i) ≤
      w K * (tailMajorant K - tailMajorant (K+N)) := by
  calc
    _ ≤ ∑ i ∈ range N, haagCoeff (K+i) * w K :=
      sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hw (Nat.le_add_right K i))
        (haagCoeff_nonneg _)
    _ = w K * ∑ i ∈ range N, haagCoeff (K+i) := by
      rw [mul_sum]
      exact sum_congr rfl fun i _ => mul_comm _ _
    _ ≤ _ := mul_le_mul_of_nonneg_left (sum_coeff_le_diff K N) (hw0 K)

/-- The sum of telescoping interval prices for successive block lengths. -/
def blockBound (w : ℕ → ℝ) : ℕ → List ℕ → ℝ
  | _, [] => 0
  | K, N :: rest => w K * (tailMajorant K - tailMajorant (K+N)) + blockBound w (K+N) rest

/-- A single argument handles any finite partition, not just the current power blocks. -/
theorem weighted_blocks (w : ℕ → ℝ) (hw0 : ∀ k, 0 ≤ w k) (hw : Antitone w)
    (K : ℕ) (widths : List ℕ) :
    ∑ i ∈ range widths.sum, haagCoeff (K+i) * w (K+i) ≤ blockBound w K widths := by
  induction widths generalizing K with
  | nil => simp [blockBound]
  | cons N rest ih =>
    simp only [List.sum_cons, sum_range_add, blockBound]
    exact add_le_add (weighted_block w hw0 hw K N)
      (by simpa only [Nat.add_assoc] using ih (K+N))

/-- The whole phase suffix has a closed rational bound. -/
theorem tail_le (K : ℕ) : ∑' i, haagCoeff (K+i) ≤ tailMajorant K := by
  apply Real.tsum_le_of_sum_range_le (fun _ => haagCoeff_nonneg _)
  intro N
  exact (sum_coeff_le_diff K N).trans (sub_le_self _ (tailMajorant_nonneg _))

/-- The usual Wallis suffix estimate holds at every positive starting index. -/
theorem tail_le_one_div_four (K : ℕ) (hK : 1 ≤ K) :
    ∑' i, haagCoeff (K+i) ≤ 1/(4*(K:ℝ)) := by
  have hpos : (0:ℝ) < K := by exact_mod_cast hK
  calc
    _ ≤ tailMajorant K := tail_le K
    _ ≤ 2/(8*(K:ℝ)+1) := by unfold tailMajorant; apply sub_le_self; positivity
    _ ≤ 1/(4*(K:ℝ)) := by
      rw [div_le_div_iff₀ (by positivity) (by positivity)]
      nlinarith

/-- The same estimate in the supported-suffix convention used by the preprocessor. -/
theorem supported_tail_le (K : ℕ) : ∑' k, |cHi K k| ≤ tailMajorant K := by
  rw [← (summable_cHi K).sum_add_tsum_nat_add K]
  have hzero : ∑ i ∈ range K, |cHi K i| = 0 :=
    sum_eq_zero fun i hi => by simp [cHi, mem_range.1 hi]
  have hshift : ∀ i, |cHi K (i+K)| = haagCoeff (K+i) := fun i => by
    simp [cHi, Nat.add_comm, abs_of_nonneg (haagCoeff_nonneg _)]
  rw [hzero, zero_add, tsum_congr hshift]
  exact tail_le K

end
end Grothe.HaagerupWallis
