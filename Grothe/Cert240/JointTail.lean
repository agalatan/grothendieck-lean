import Grothe.Haagerup
import Grothe.WallisTail
import Grothe.Cert240.Interface

/-!
# The joint first-order tail of the origin kernel

Let `λₙ = 2n+1`.  If the sixth-kernel coefficients satisfy `kₙ = ξₙ cₙ + Re(rₙ conj sₙ)` with
`ξₙ² = hₙ` and the first-order energies `∑_{n≥N} λₙ cₙ² ≤ E_C`, `∑ λₙ|rₙ|² ≤ E_L`,
`∑ λₙ|sₙ|² ≤ E_R`, then (weighted Cauchy–Schwarz)

  `∑_{n≥N} |kₙ| ≤ √(E_C W'_N) + √(E_L E_R)/(2N+1)`,  `W'_N = ∑_{n≥N} hₙ/(2n+1)`.

We also bound `W'_240` sharply: an exact rational partial sum (indices `240 ≤ n < 4000`) times
`π`, plus the telescoping remainder `hₙ/(2n+1) < (1/16)(1/(n+1/12)² − 1/(n+13/12)²)`.
-/

namespace Grothe

open Finset
open scoped ComplexConjugate

noncomputable section

/-! ### Cauchy–Schwarz for partial sums -/

lemma sum_mul_le_sqrt_mul_sqrt (s : Finset ℕ) (a b : ℕ → ℝ) (ha : ∀ n, 0 ≤ a n)
    (hb : ∀ n, 0 ≤ b n) :
    ∑ n ∈ s, a n * b n ≤ Real.sqrt (∑ n ∈ s, a n ^ 2) * Real.sqrt (∑ n ∈ s, b n ^ 2) := by
  rw [← Real.sqrt_mul (sum_nonneg fun n _ => sq_nonneg _)]
  refine (Real.le_sqrt (sum_nonneg fun n _ => mul_nonneg (ha n) (hb n)) (by positivity)).2 ?_
  exact Finset.sum_mul_sq_le_sq_mul_sq s a b

lemma sum_mul_le_of_partial (K : ℕ) (a b : ℕ → ℝ) (ha : ∀ n, 0 ≤ a n) (hb : ∀ n, 0 ≤ b n)
    (A B : ℝ) (hA : ∑ n ∈ range K, a n ^ 2 ≤ A) (hB : ∑ n ∈ range K, b n ^ 2 ≤ B) :
    ∑ n ∈ range K, a n * b n ≤ Real.sqrt A * Real.sqrt B :=
  (sum_mul_le_sqrt_mul_sqrt _ a b ha hb).trans
    (mul_le_mul (Real.sqrt_le_sqrt hA) (Real.sqrt_le_sqrt hB) (Real.sqrt_nonneg _)
      (Real.sqrt_nonneg _))

/-! ### `W'_N` -/

/-- `W'_N = ∑_{n ≥ N} hₙ / (2n+1)`. -/
def Wp (N : ℕ) : ℝ := ∑' n, h (N + n) / (2 * ((N + n : ℕ) : ℝ) + 1)

lemma Wp_term_nonneg (N n : ℕ) : 0 ≤ h (N + n) / (2 * ((N + n : ℕ) : ℝ) + 1) :=
  div_nonneg (h_nonneg _) (by positivity)

lemma Wp_summable (N : ℕ) (hN : 1 ≤ N) :
    Summable fun n => h (N + n) / (2 * ((N + n : ℕ) : ℝ) + 1) := by
  refine Summable.of_nonneg_of_le (Wp_term_nonneg N) (fun n => ?_) (h_tail_summable N hN)
  rw [div_le_iff₀ (by positivity)]
  have := h_nonneg (N + n)
  have h1 : (1 : ℝ) ≤ 2 * ((N + n : ℕ) : ℝ) + 1 := by
    have : (0 : ℝ) ≤ ((N + n : ℕ) : ℝ) := Nat.cast_nonneg _
    linarith
  nlinarith

/-- Telescoping majorant `G n = 1/(16 (n + 1/12)²)`. -/
def G (n : ℕ) : ℝ := 1 / (16 * ((n : ℝ) + 1 / 12) ^ 2)

lemma G_pos (n : ℕ) : 0 < G n := by unfold G; positivity

/-- `hₙ/(2n+1) < G n − G (n+1)`; after clearing denominators the difference is
`1343/1296 + 367/54 n + 17/3 n² > 0`. -/
lemma h_div_lt_G (n : ℕ) : h n / (2 * (n : ℝ) + 1) < G n - G (n + 1) := by
  have h1 := h_lt n
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have h2 : (0 : ℝ) < 2 * (n : ℝ) + 1 := by positivity
  have h3 : h n / (2 * (n : ℝ) + 1) < 1 / (4 * ((n : ℝ) + 1 / 4) * (n + 1) * (2 * n + 1)) := by
    calc h n / (2 * (n : ℝ) + 1) < (1 / (4 * ((n : ℝ) + 1 / 4) * (n + 1))) / (2 * (n : ℝ) + 1) :=
          div_lt_div_of_pos_right h1 h2
      _ = 1 / (4 * ((n : ℝ) + 1 / 4) * (n + 1) * (2 * n + 1)) := by rw [div_div]
  refine h3.trans_le ?_
  unfold G
  push_cast
  set L : ℝ := 4 * ((n : ℝ) + 1 / 4) * (n + 1) * (2 * n + 1) with hL
  set A : ℝ := ((n : ℝ) + 1 / 12) ^ 2 with hA
  set B : ℝ := ((n : ℝ) + 1 + 1 / 12) ^ 2 with hB
  have hLpos : 0 < L := by rw [hL]; positivity
  have hApos : 0 < A := by rw [hA]; positivity
  have hBpos : 0 < B := by rw [hB]; positivity
  have key : L * (B - A) - 16 * A * B
      = 1343 / 1296 + 367 / 54 * (n : ℝ) + 17 / 3 * (n : ℝ) ^ 2 := by
    rw [hL, hA, hB]; ring
  have hpos : 0 ≤ 1343 / 1296 + 367 / 54 * (n : ℝ) + 17 / 3 * (n : ℝ) ^ 2 := by positivity
  rw [div_sub_div _ _ (by positivity) (by positivity),
    div_le_div_iff₀ hLpos (by positivity)]
  nlinarith [key, hpos]

lemma Wp_partial_le (N M : ℕ) :
    ∑ k ∈ range M, h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) ≤ G N - G (N + M) := by
  calc ∑ k ∈ range M, h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1)
      ≤ ∑ k ∈ range M, (G (N + k) - G (N + (k + 1))) := by
        apply sum_le_sum
        intro k _
        have := (h_div_lt_G (N + k)).le
        push_cast at this ⊢
        exact this
    _ = G (N + 0) - G (N + M) := Finset.sum_range_sub' (fun k => G (N + k)) M
    _ = G N - G (N + M) := by rw [Nat.add_zero]

/-- `W'_N ≤ 1/(16 (N + 1/12)²)`. -/
theorem Wp_le_G (N : ℕ) : Wp N ≤ G N := by
  apply Real.tsum_le_of_sum_le (Wp_term_nonneg N)
  intro s
  calc ∑ k ∈ s, h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1)
      ≤ ∑ k ∈ range (s.sup id + 1), h (N + k) / (2 * ((N + k : ℕ) : ℝ) + 1) := by
        apply sum_le_sum_of_subset_of_nonneg
        · intro k hk; exact mem_range.2 (Nat.lt_succ_of_le (le_sup (f := id) hk))
        · intro k _ _; exact Wp_term_nonneg N k
    _ ≤ G N - G (N + (s.sup id + 1)) := Wp_partial_le N _
    _ ≤ G N := by linarith [G_pos (N + (s.sup id + 1))]

/-! ### `hₙ = π · hRat n` and the exact partial sum -/

lemma h_succ (n : ℕ) :
    h (n + 1) = h n * ((2 * (n : ℝ) + 1) ^ 2) / (4 * ((n : ℝ) + 1) * ((n : ℝ) + 2)) := by
  rw [h_eq, h_eq, pc_succ, mul_pow, div_pow]
  have h1 : (0 : ℝ) < (n : ℝ) + 1 := by positivity
  have h2 : (0 : ℝ) < (n : ℝ) + 2 := by positivity
  have h3 : (0 : ℝ) < 2 * (n : ℝ) + 2 := by positivity
  push_cast
  field_simp
  ring

theorem h_eq_pi_mul_hRat (n : ℕ) : h n = Real.pi * (Cert240.hRat n : ℝ) := by
  induction n with
  | zero =>
    rw [h, Cert240.hRat]
    simp
    ring
  | succ n ih =>
    rw [h_succ, ih, Cert240.hRat]
    push_cast
    ring

lemma hRat_nonneg (n : ℕ) : 0 ≤ Cert240.hRat n := by
  induction n with
  | zero => simp [Cert240.hRat]
  | succ n ih =>
    rw [Cert240.hRat]
    exact div_nonneg (mul_nonneg ih (sq_nonneg _)) (by positivity)

/-- Efficient evaluation of `∑_{k<K} hRat (n+k) / (2(n+k)+1)` given `cur = hRat n`. -/
def wSum : ℕ → ℕ → ℚ → ℚ
  | _, 0, _ => 0
  | n, K + 1, cur =>
    cur / (2 * (n : ℚ) + 1)
      + wSum (n + 1) K (cur * ((2 * (n : ℚ) + 1) ^ 2) / (4 * ((n : ℚ) + 1) * ((n : ℚ) + 2)))

lemma wSum_eq (K : ℕ) : ∀ n, wSum n K (Cert240.hRat n)
    = ∑ k ∈ range K, Cert240.hRat (n + k) / (2 * ((n + k : ℕ) : ℚ) + 1) := by
  induction K with
  | zero => intro n; simp [wSum]
  | succ K ih =>
    intro n
    rw [wSum, Finset.sum_range_succ', ← Cert240.hRat]
    rw [ih (n + 1)]
    simp only [Nat.add_zero, Nat.cast_add, Nat.cast_one]
    rw [add_comm]
    congr 1
    refine sum_congr rfl fun k _ => ?_
    rw [show n + 1 + k = n + (k + 1) by omega]
    push_cast
    ring_nf

/-- The exact rational partial sum `∑_{240 ≤ n < 4000} hRat n/(2n+1)` is at most `qS`. -/
def qS : ℚ := 171952051399020033726251155599 / 500000000000000000000000000000000000

theorem wSum_240_le : wSum 240 3760 (Cert240.hRat 240) ≤ qS := by native_decide

/-- Upper bound for `W'_240`. -/
def WpHi : ℚ := 1084312690134381188293543488787 / 10 ^ 36

theorem Wp_240_le : Wp 240 ≤ (WpHi : ℝ) := by
  have hs := Wp_summable 240 (by norm_num)
  have hsplit := hs.sum_add_tsum_nat_add 3760
  have e1 : ∑ k ∈ range 3760, h (240 + k) / (2 * ((240 + k : ℕ) : ℝ) + 1)
      = Real.pi * (wSum 240 3760 (Cert240.hRat 240) : ℝ) := by
    rw [wSum_eq]
    push_cast
    rw [Finset.mul_sum]
    refine sum_congr rfl fun k _ => ?_
    rw [h_eq_pi_mul_hRat]
    push_cast
    ring
  have e2 : ∑' k, h (240 + (k + 3760)) / (2 * ((240 + (k + 3760) : ℕ) : ℝ) + 1) = Wp 4000 := by
    unfold Wp
    refine tsum_congr fun k => ?_
    rw [show 240 + (k + 3760) = 4000 + k by omega]
  unfold Wp
  rw [← hsplit, e1, e2]
  have hW := (Wp_le_G 4000)
  have hq : (wSum 240 3760 (Cert240.hRat 240) : ℝ) ≤ (qS : ℝ) := by exact_mod_cast wSum_240_le
  have hpi := Real.pi_lt_d20
  have hpi0 := Real.pi_pos
  have hG : G 4000 ≤ (1 / 16) / (4000 + 1 / 12) ^ 2 := by
    unfold G; norm_num
  have hq0 : (0 : ℝ) ≤ (wSum 240 3760 (Cert240.hRat 240) : ℝ) := by
    have : (0 : ℚ) ≤ wSum 240 3760 (Cert240.hRat 240) := by
      rw [wSum_eq]
      exact sum_nonneg fun k _ => div_nonneg (hRat_nonneg _) (by positivity)
    exact_mod_cast this
  calc Real.pi * (wSum 240 3760 (Cert240.hRat 240) : ℝ) + Wp 4000
      ≤ 3.14159265358979323847 * (qS : ℝ) + (1 / 16) / (4000 + 1 / 12) ^ 2 :=
        add_le_add (mul_le_mul hpi.le hq hq0 (by norm_num)) (hW.trans hG)
    _ ≤ (WpHi : ℝ) := by unfold qS WpHi; norm_num

end

end Grothe
