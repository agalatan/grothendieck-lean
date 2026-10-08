import Grothe.Haagerup
import Grothe.WallisTail
import Grothe.Upper.Interface

/-!
# The joint first-order tails of the origin kernels

Let `λₙ = 2n+1`.  If the coefficients of an origin kernel satisfy `Hₙ = ξₙ cₙ + Re(rₙ conj sₙ)`
with `ξₙ² = hₙ` and the first-order energies `∑_{n≥N} λₙ cₙ² ≤ E_C`, `∑ λₙ|rₙ|² ≤ E_L`,
`∑ λₙ|sₙ|² ≤ E_R`, then (weighted Cauchy–Schwarz)

  `∑_{n≥N} |Hₙ| ≤ √(E_C W'_N) + √(E_L E_R)/(2N+1)`,  `W'_N = ∑_{n≥N} hₙ/(2n+1)`.

Polarization (`u = r + iκs`, `v = r − iκs`, `Im(u v̄) = 2κ Re(r s̄)`) replaces the product
term by `√(E₊E₋)/(2κ(2N+1))` with the tail energies `E₊, E₋` of `u, v`
(`polarized_tail_bound`).  We also bound `W'_240` sharply: an exact rational partial sum
(indices `240 ≤ n < 4000`) times `π`, plus the telescoping remainder
`hₙ/(2n+1) < (1/16)(1/(n+1/12)² − 1/(n+13/12)²)`, and evaluate the tail bounds of the two
origin kernels (`tailH`, `tailHs`).
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

theorem h_eq_pi_mul_hRat (n : ℕ) : h n = Real.pi * (Upper.hRat n : ℝ) := by
  induction n with
  | zero =>
    rw [h, Upper.hRat]
    simp
    ring
  | succ n ih =>
    rw [h_succ, ih, Upper.hRat]
    push_cast
    ring

/-- Efficient evaluation of `∑_{k<K} hRat (n+k) / (2(n+k)+1)` given `cur = hRat n`. -/
def wSum : ℕ → ℕ → ℚ → ℚ
  | _, 0, _ => 0
  | n, K + 1, cur =>
    cur / (2 * (n : ℚ) + 1)
      + wSum (n + 1) K (cur * ((2 * (n : ℚ) + 1) ^ 2) / (4 * ((n : ℚ) + 1) * ((n : ℚ) + 2)))

lemma wSum_eq (K : ℕ) : ∀ n, wSum n K (Upper.hRat n)
    = ∑ k ∈ range K, Upper.hRat (n + k) / (2 * ((n + k : ℕ) : ℚ) + 1) := by
  induction K with
  | zero => intro n; simp [wSum]
  | succ K ih =>
    intro n
    rw [wSum, Finset.sum_range_succ', ← Upper.hRat]
    rw [ih (n + 1)]
    simp only [Nat.add_zero, Nat.cast_add, Nat.cast_one]
    rw [add_comm]
    congr 1
    refine sum_congr rfl fun k _ => ?_
    rw [show n + 1 + k = n + (k + 1) by omega]
    ring_nf

/-- The exact rational partial sum `∑_{240 ≤ n < 4000} hRat n/(2n+1)` is at most `qS`. -/
def qS : ℚ := 171952051399020033726251155599 / 500000000000000000000000000000000000

theorem wSum_le : wSum 240 3760 (Upper.hRat 240) ≤ qS := by native_decide

/-- Upper bound for `W'_240`. -/
def WpHi : ℚ := 1084312690134381188293543488787 / 10 ^ 36

theorem Wp_le : Wp 240 ≤ (WpHi : ℝ) := by
  have hs := Wp_summable 240 (by norm_num)
  have hsplit := hs.sum_add_tsum_nat_add 3760
  have e1 : ∑ k ∈ range 3760, h (240 + k) / (2 * ((240 + k : ℕ) : ℝ) + 1)
      = Real.pi * (wSum 240 3760 (Upper.hRat 240) : ℝ) := by
    rw [wSum_eq]
    push_cast
    rw [Finset.mul_sum]
    refine sum_congr rfl fun k _ => ?_
    rw [h_eq_pi_mul_hRat]
    ring
  have e2 : ∑' k, h (240 + (k + 3760)) / (2 * ((240 + (k + 3760) : ℕ) : ℝ) + 1) = Wp 4000 := by
    unfold Wp
    refine tsum_congr fun k => ?_
    rw [show 240 + (k + 3760) = 4000 + k by omega]
  unfold Wp
  rw [← hsplit, e1, e2]
  have hW := (Wp_le_G 4000)
  have hq : (wSum 240 3760 (Upper.hRat 240) : ℝ) ≤ (qS : ℝ) := by exact_mod_cast wSum_le
  have hpi := Real.pi_lt_d20
  have hpi0 := Real.pi_pos
  have hG : G 4000 ≤ (1 / 16) / (4000 + 1 / 12) ^ 2 := by
    unfold G; norm_num
  have hq0 : (0 : ℝ) ≤ (wSum 240 3760 (Upper.hRat 240) : ℝ) := by
    have : (0 : ℚ) ≤ wSum 240 3760 (Upper.hRat 240) := by
      rw [wSum_eq]
      exact sum_nonneg fun k _ => div_nonneg (Upper.hRat_nonneg _) (by positivity)
    exact_mod_cast this
  calc Real.pi * (wSum 240 3760 (Upper.hRat 240) : ℝ) + Wp 4000
      ≤ 3.14159265358979323847 * (qS : ℝ) + (1 / 16) / (4000 + 1 / 12) ^ 2 :=
        add_le_add (mul_le_mul hpi.le hq hq0 (by norm_num)) (hW.trans hG)
    _ ≤ (WpHi : ℝ) := by unfold qS WpHi; norm_num

/-! ### The joint tail inequality -/

/-- **Weighted Cauchy–Schwarz tail bound**.  With
`λₙ = 2n+1`, `ξₙ² = hₙ` and the first-order energies of `c, r, s` on `n ≥ N` bounded by
`E_C, E_L, E_R`,  `∑_{n≥N} |ξₙcₙ + Re(rₙ s̄ₙ)| ≤ √E_C √W'_N + √E_L √E_R/(2N+1)`. -/
theorem joint_tail_bound (N : ℕ) (hN : 1 ≤ N) (ξ c : ℕ → ℝ) (r s : ℕ → ℂ) (EC EL ER : ℝ)
    (hξ : ∀ n, ξ n ^ 2 = h n)
    (hcs : Summable fun n => (2 * ((N + n : ℕ) : ℝ) + 1) * c (N + n) ^ 2)
    (hEC : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * c (N + n) ^ 2 ≤ EC)
    (hrs : Summable fun n => (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n)‖ ^ 2)
    (hEL : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n)‖ ^ 2 ≤ EL)
    (hss : Summable fun n => (2 * ((N + n : ℕ) : ℝ) + 1) * ‖s (N + n)‖ ^ 2)
    (hER : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖s (N + n)‖ ^ 2 ≤ ER) :
    ∑' n, |ξ (N + n) * c (N + n) + (r (N + n) * conj (s (N + n))).re|
      ≤ Real.sqrt EC * Real.sqrt (Wp N) + Real.sqrt EL * Real.sqrt ER / (2 * N + 1) := by
  have hlam1 : ∀ n : ℕ, (2 * (N : ℝ) + 1) ≤ 2 * ((N + n : ℕ) : ℝ) + 1 := by
    intro n; push_cast; linarith [(Nat.cast_nonneg n : (0 : ℝ) ≤ n)]
  have hlam0 : ∀ n : ℕ, 0 < 2 * ((N + n : ℕ) : ℝ) + 1 := fun n => by positivity
  have hN0 : (0 : ℝ) < 2 * (N : ℝ) + 1 := by positivity
  -- the four auxiliary nonnegative sequences
  set a : ℕ → ℝ := fun n => Real.sqrt (h (N + n) / (2 * ((N + n : ℕ) : ℝ) + 1)) with ha
  set b : ℕ → ℝ := fun n => Real.sqrt (2 * ((N + n : ℕ) : ℝ) + 1) * |c (N + n)| with hb
  set a' : ℕ → ℝ := fun n => Real.sqrt (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n)‖ with ha'
  set b' : ℕ → ℝ := fun n => Real.sqrt (2 * ((N + n : ℕ) : ℝ) + 1) * ‖s (N + n)‖ with hb'
  have hterm : ∀ n, |ξ (N + n) * c (N + n) + (r (N + n) * conj (s (N + n))).re|
      ≤ a n * b n + a' n * b' n / (2 * N + 1) := by
    intro n
    have e1 : a n * b n = |ξ (N + n)| * |c (N + n)| := by
      simp only [ha, hb]
      rw [← mul_assoc, ← Real.sqrt_mul (div_nonneg (h_nonneg _) (hlam0 n).le),
        div_mul_cancel₀ _ (hlam0 n).ne', ← hξ, Real.sqrt_sq_eq_abs]
    have e2 : a' n * b' n = (2 * ((N + n : ℕ) : ℝ) + 1) * (‖r (N + n)‖ * ‖s (N + n)‖) := by
      simp only [ha', hb']
      have := Real.mul_self_sqrt (hlam0 n).le
      calc Real.sqrt (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n)‖
            * (Real.sqrt (2 * ((N + n : ℕ) : ℝ) + 1) * ‖s (N + n)‖)
          = (Real.sqrt (2 * ((N + n : ℕ) : ℝ) + 1) * Real.sqrt (2 * ((N + n : ℕ) : ℝ) + 1))
            * (‖r (N + n)‖ * ‖s (N + n)‖) := by ring
        _ = _ := by rw [this]
    rw [e1, e2]
    have h3 : |(r (N + n) * conj (s (N + n))).re| ≤ ‖r (N + n)‖ * ‖s (N + n)‖ := by
      calc |(r (N + n) * conj (s (N + n))).re| ≤ ‖r (N + n) * conj (s (N + n))‖ :=
            Complex.abs_re_le_norm _
        _ = ‖r (N + n)‖ * ‖s (N + n)‖ := by rw [norm_mul, Complex.norm_conj]
    have h4 : ‖r (N + n)‖ * ‖s (N + n)‖
        ≤ (2 * ((N + n : ℕ) : ℝ) + 1) * (‖r (N + n)‖ * ‖s (N + n)‖) / (2 * N + 1) := by
      rw [le_div_iff₀ hN0]
      have := hlam1 n
      have hp : 0 ≤ ‖r (N + n)‖ * ‖s (N + n)‖ := by positivity
      nlinarith
    calc |ξ (N + n) * c (N + n) + (r (N + n) * conj (s (N + n))).re|
        ≤ |ξ (N + n) * c (N + n)| + |(r (N + n) * conj (s (N + n))).re| := abs_add_le _ _
      _ = |ξ (N + n)| * |c (N + n)| + |(r (N + n) * conj (s (N + n))).re| := by rw [abs_mul]
      _ ≤ _ := add_le_add le_rfl (h3.trans h4)
  have ha0 : ∀ n, 0 ≤ a n := fun n => Real.sqrt_nonneg _
  have hb0 : ∀ n, 0 ≤ b n := fun n => mul_nonneg (Real.sqrt_nonneg _) (abs_nonneg _)
  have ha'0 : ∀ n, 0 ≤ a' n := fun n => mul_nonneg (Real.sqrt_nonneg _) (norm_nonneg _)
  have hb'0 : ∀ n, 0 ≤ b' n := fun n => mul_nonneg (Real.sqrt_nonneg _) (norm_nonneg _)
  have hsW := Wp_summable N hN
  -- partial-sum energy bounds
  have hA : ∀ K, ∑ n ∈ range K, a n ^ 2 ≤ Wp N := by
    intro K
    calc ∑ n ∈ range K, a n ^ 2 = ∑ n ∈ range K, h (N + n) / (2 * ((N + n : ℕ) : ℝ) + 1) := by
          refine sum_congr rfl fun n _ => ?_
          simp only [ha]
          exact Real.sq_sqrt (Wp_term_nonneg N n)
      _ ≤ Wp N := hsW.sum_le_tsum _ fun n _ => Wp_term_nonneg N n
  have hB : ∀ K, ∑ n ∈ range K, b n ^ 2 ≤ EC := by
    intro K
    calc ∑ n ∈ range K, b n ^ 2 = ∑ n ∈ range K, (2 * ((N + n : ℕ) : ℝ) + 1) * c (N + n) ^ 2 := by
          refine sum_congr rfl fun n _ => ?_
          simp only [hb]
          rw [mul_pow, Real.sq_sqrt (hlam0 n).le, sq_abs]
      _ ≤ ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * c (N + n) ^ 2 :=
          hcs.sum_le_tsum _ fun n _ => by positivity
      _ ≤ EC := hEC
  have hA' : ∀ K, ∑ n ∈ range K, a' n ^ 2 ≤ EL := by
    intro K
    calc ∑ n ∈ range K, a' n ^ 2 = ∑ n ∈ range K, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n)‖ ^ 2 := by
          refine sum_congr rfl fun n _ => ?_
          simp only [ha']
          rw [mul_pow, Real.sq_sqrt (hlam0 n).le]
      _ ≤ ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n)‖ ^ 2 :=
          hrs.sum_le_tsum _ fun n _ => by positivity
      _ ≤ EL := hEL
  have hB' : ∀ K, ∑ n ∈ range K, b' n ^ 2 ≤ ER := by
    intro K
    calc ∑ n ∈ range K, b' n ^ 2 = ∑ n ∈ range K, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖s (N + n)‖ ^ 2 := by
          refine sum_congr rfl fun n _ => ?_
          simp only [hb']
          rw [mul_pow, Real.sq_sqrt (hlam0 n).le]
      _ ≤ ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖s (N + n)‖ ^ 2 :=
          hss.sum_le_tsum _ fun n _ => by positivity
      _ ≤ ER := hER
  apply Real.tsum_le_of_sum_le (fun n => abs_nonneg _)
  intro S
  calc ∑ n ∈ S, |ξ (N + n) * c (N + n) + (r (N + n) * conj (s (N + n))).re|
      ≤ ∑ n ∈ range (S.sup id + 1), |ξ (N + n) * c (N + n) + (r (N + n) * conj (s (N + n))).re| := by
        apply sum_le_sum_of_subset_of_nonneg
        · intro n hn; exact mem_range.2 (Nat.lt_succ_of_le (le_sup (f := id) hn))
        · intro n _ _; exact abs_nonneg _
    _ ≤ ∑ n ∈ range (S.sup id + 1), (a n * b n + a' n * b' n / (2 * N + 1)) :=
        sum_le_sum fun n _ => hterm n
    _ = ∑ n ∈ range (S.sup id + 1), a n * b n
          + (∑ n ∈ range (S.sup id + 1), a' n * b' n) / (2 * N + 1) := by
        rw [sum_add_distrib, sum_div]
    _ ≤ Real.sqrt (Wp N) * Real.sqrt EC + Real.sqrt EL * Real.sqrt ER / (2 * N + 1) := by
        refine add_le_add (sum_mul_le_of_partial _ a b ha0 hb0 _ _ (hA _) (hB _)) ?_
        exact div_le_div_of_nonneg_right (sum_mul_le_of_partial _ a' b' ha'0 hb'0 _ _ (hA' _) (hB' _))
          hN0.le
    _ = Real.sqrt EC * Real.sqrt (Wp N) + Real.sqrt EL * Real.sqrt ER / (2 * N + 1) := by ring

/-! ### Polarization -/

/-- **Polarized tail bound.**  With `u = r + iκs`, `v = r − iκs` (`κ > 0`),
`Im(u v̄) = 2κ Re(r s̄)`, so the tail energies `E₊, E₋` of `u, v` bound the product term:
`∑_{n≥N} |ξₙcₙ + Re(rₙ s̄ₙ)| ≤ √E_C √W'_N + √E₊ √E₋ / (2κ(2N+1))`. -/
theorem polarized_tail_bound (N : ℕ) (hN : 1 ≤ N) (ξ c : ℕ → ℝ) (r s : ℕ → ℂ) (κ : ℝ)
    (hκ : 0 < κ) (EC Ep Em : ℝ) (hξ : ∀ n, ξ n ^ 2 = h n)
    (hcs : Summable fun n => (2 * ((N + n : ℕ) : ℝ) + 1) * c (N + n) ^ 2)
    (hEC : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * c (N + n) ^ 2 ≤ EC)
    (hus : Summable fun n =>
      (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n) + Complex.I * κ * s (N + n)‖ ^ 2)
    (hEp : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n) + Complex.I * κ * s (N + n)‖ ^ 2 ≤ Ep)
    (hvs : Summable fun n =>
      (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n) - Complex.I * κ * s (N + n)‖ ^ 2)
    (hEm : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n) - Complex.I * κ * s (N + n)‖ ^ 2 ≤ Em) :
    ∑' n, |ξ (N + n) * c (N + n) + (r (N + n) * conj (s (N + n))).re|
      ≤ Real.sqrt EC * Real.sqrt (Wp N) + Real.sqrt Ep * Real.sqrt Em / (2 * κ * (2 * N + 1)) := by
  -- the rotated left sequence `r' = (−i/(2κ)) u` and the right sequence `v`
  obtain ⟨r', hr'⟩ : ∃ r' : ℕ → ℂ, ∀ n, r' n
      = ((1 / (2 * κ) : ℝ) : ℂ) * (-Complex.I) * (r n + Complex.I * κ * s n) := ⟨_, fun _ => rfl⟩
  obtain ⟨v, hv⟩ : ∃ v : ℕ → ℂ, ∀ n, v n = r n - Complex.I * κ * s n := ⟨_, fun _ => rfl⟩
  have hκ0 : κ ≠ 0 := hκ.ne'
  have key : ∀ n, (r' n * conj (v n)).re = (r n * conj (s n)).re := by
    intro n
    rw [hr', hv]
    simp only [Complex.mul_re, Complex.mul_im, Complex.add_re, Complex.add_im, Complex.sub_re,
      Complex.sub_im, Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im,
      Complex.neg_re, Complex.neg_im, Complex.I_re, Complex.I_im]
    field_simp
    ring
  have hnorm : ∀ n, ‖r' n‖ ^ 2 = (1 / (2 * κ)) ^ 2 * ‖r n + Complex.I * κ * s n‖ ^ 2 := by
    intro n
    rw [hr', norm_mul, norm_mul, Complex.norm_real, norm_neg, Complex.norm_I, mul_one,
      Real.norm_eq_abs, abs_of_pos (by positivity), mul_pow]
  have hus' : Summable fun n => (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r' (N + n)‖ ^ 2 := by
    simp_rw [hnorm]
    have := hus.mul_left ((1 / (2 * κ)) ^ 2)
    refine this.congr fun n => ?_
    ring
  have hEp' : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖r' (N + n)‖ ^ 2 ≤ (1 / (2 * κ)) ^ 2 * Ep := by
    simp_rw [hnorm]
    have e : ∀ n, (2 * ((N + n : ℕ) : ℝ) + 1) * ((1 / (2 * κ)) ^ 2 * ‖r (N + n) + Complex.I * κ * s (N + n)‖ ^ 2)
        = (1 / (2 * κ)) ^ 2 * ((2 * ((N + n : ℕ) : ℝ) + 1) * ‖r (N + n) + Complex.I * κ * s (N + n)‖ ^ 2) :=
      fun n => by ring
    simp_rw [e]
    rw [tsum_mul_left]
    exact mul_le_mul_of_nonneg_left hEp (by positivity)
  have hvs' : Summable fun n => (2 * ((N + n : ℕ) : ℝ) + 1) * ‖v (N + n)‖ ^ 2 := by
    simp_rw [hv]; exact hvs
  have hEm' : ∑' n, (2 * ((N + n : ℕ) : ℝ) + 1) * ‖v (N + n)‖ ^ 2 ≤ Em := by
    simp_rw [hv]; exact hEm
  have hjt := joint_tail_bound N hN ξ c r' v EC ((1 / (2 * κ)) ^ 2 * Ep) Em hξ hcs hEC hus' hEp'
    hvs' hEm'
  simp_rw [key] at hjt
  refine hjt.trans (le_of_eq ?_)
  have hEp0 : 0 ≤ Ep := le_trans (tsum_nonneg fun n => by positivity) hEp
  rw [Real.sqrt_mul (by positivity), Real.sqrt_sq (by positivity)]
  congr 1
  rw [one_div, inv_mul_eq_div, div_mul_eq_mul_div, div_div]

/-! ### Numerical tail bounds of the two origin kernels -/

/-- Certified tail bound of the origin kernel `H` beyond mode `240`:
`√(E_C W'_240) + √(E₊E₋)/(2κ·481) ≤ tailH ≈ 6.2047300734506·10⁻⁵` with `κ = 999511/10⁶`. -/
def tailH : ℚ := 6204730073450556719421453 / 10 ^ 29

theorem tailH_numeric (EC Ep Em : ℝ) (hEC0 : 0 ≤ EC) (hEp0 : 0 ≤ Ep) (hEm0 : 0 ≤ Em)
    (hEC : EC ≤ 0.0035203939734987528839) (hEp : Ep ≤ 0.0000182773096480245802715)
    (hEm : Em ≤ 0.0035186722940462150571) :
    Real.sqrt EC * Real.sqrt (Wp Upper.modes)
      + Real.sqrt Ep * Real.sqrt Em / (2 * (999511 / 10 ^ 6) * (2 * (Upper.modes : ℝ) + 1))
      ≤ (tailH : ℝ) := by
  have hW := Wp_le
  have hW0 : 0 ≤ Wp 240 := tsum_nonneg (Wp_term_nonneg 240)
  have u1 : Real.sqrt EC * Real.sqrt (Wp Upper.modes) ≤ 61783556548140672545206539 / 10 ^ 30 := by
    rw [← Real.sqrt_mul hEC0, Real.sqrt_le_left (by norm_num)]
    calc EC * Wp Upper.modes ≤ 0.0035203939734987528839 * (WpHi : ℝ) := by gcongr
      _ ≤ _ := by unfold WpHi; norm_num
  have u2 : Real.sqrt Ep * Real.sqrt Em ≤ 126798918635183625667344941 / (5 * 10 ^ 29) := by
    rw [← Real.sqrt_mul hEp0, Real.sqrt_le_left (by norm_num)]
    calc Ep * Em ≤ 0.0000182773096480245802715 * 0.0035186722940462150571 := by gcongr
      _ ≤ _ := by norm_num
  calc Real.sqrt EC * Real.sqrt (Wp Upper.modes)
        + Real.sqrt Ep * Real.sqrt Em / (2 * (999511 / 10 ^ 6) * (2 * (Upper.modes : ℝ) + 1))
      ≤ 61783556548140672545206539 / 10 ^ 30
          + 126798918635183625667344941 / (5 * 10 ^ 29)
            / (2 * (999511 / 10 ^ 6) * (2 * (Upper.modes : ℝ) + 1)) :=
        add_le_add u1 (div_le_div_of_nonneg_right u2 (by norm_num [Upper.modes]))
    _ ≤ (tailH : ℝ) := by unfold tailH; norm_num [Upper.modes]

/-- Certified tail bound of the modified origin kernel `H*` beyond mode `240`:
`√(E_C W'_240) + √(E₊E₋)/(2·481) ≤ tailHs ≈ 7.3094019757564·10⁻⁵` with `κ = 1`. -/
def tailHs : ℚ := 73094019757564146051671493 / 10 ^ 30

theorem tailHs_numeric (EC Ep Em : ℝ) (hEC0 : 0 ≤ EC) (hEp0 : 0 ≤ Ep) (hEm0 : 0 ≤ Em)
    (hEC : EC ≤ 0.0048623361335078433465) (hEp : Ep ≤ 0.0000444870768551502459631)
    (hEm : Em ≤ 0.0048623361335204498121) :
    Real.sqrt EC * Real.sqrt (Wp Upper.modes)
      + Real.sqrt Ep * Real.sqrt Em / (2 * 1 * (2 * (Upper.modes : ℝ) + 1))
      ≤ (tailHs : ℝ) := by
  have hW := Wp_le
  have hW0 : 0 ≤ Wp 240 := tsum_nonneg (Wp_term_nonneg 240)
  have u1 : Real.sqrt EC * Real.sqrt (Wp Upper.modes) ≤ 9076319440291359835543097 / (125 * 10 ^ 27) := by
    rw [← Real.sqrt_mul hEC0, Real.sqrt_le_left (by norm_num)]
    calc EC * Wp Upper.modes ≤ 0.0048623361335078433465 * (WpHi : ℝ) := by gcongr
      _ ≤ _ := by unfold WpHi; norm_num
  have u2 : Real.sqrt Ep * Real.sqrt Em ≤ 116273148573600801842075363 / (25 * 10 ^ 28) := by
    rw [← Real.sqrt_mul hEp0, Real.sqrt_le_left (by norm_num)]
    calc Ep * Em ≤ 0.0000444870768551502459631 * 0.0048623361335204498121 := by gcongr
      _ ≤ _ := by norm_num
  calc Real.sqrt EC * Real.sqrt (Wp Upper.modes)
        + Real.sqrt Ep * Real.sqrt Em / (2 * 1 * (2 * (Upper.modes : ℝ) + 1))
      ≤ 9076319440291359835543097 / (125 * 10 ^ 27)
          + 116273148573600801842075363 / (25 * 10 ^ 28) / (2 * 1 * (2 * (Upper.modes : ℝ) + 1)) :=
        add_le_add u1 (div_le_div_of_nonneg_right u2 (by norm_num [Upper.modes]))
    _ ≤ (tailHs : ℝ) := by unfold tailHs; norm_num [Upper.modes]

end

end Grothe
