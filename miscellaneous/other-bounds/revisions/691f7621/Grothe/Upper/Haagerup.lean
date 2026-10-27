import Grothe.Upper.Compose
import Grothe.Upper.Head
import Grothe.Upper.Residual
import GrotheKernel.Haagerup

/-!
# Haagerup coefficients and sound finite composition

The positive coefficients `haagR`, their monotone telescoping majorant and
summability describe the Gaussian phase kernel. This module also proves the
soundness of the outward Horner residual checker for any rational polynomial.
The Gaussian identity is proved in `Grothe.Haagerup.Identity` and is used by
the active two-coordinate rounding realization. Endpoint-specific certificates
are preserved separately in `archive/weaker-upper-bounds/`.
-/

namespace Grothe

open Upper GrotheKernel Polynomial Finset

noncomputable section

/-! ### The coefficients -/

/-- `r_k = (1/2)_k² / (k!(k+1)!)`, by its recurrence. -/
def haagR : ℕ → ℚ
  | 0 => 1
  | k + 1 => haagR k * (((2 * k + 1) ^ 2 : ℕ) : ℚ) / ((4 * (k + 1) * (k + 2) : ℕ) : ℚ)

lemma haagAux_eq (n k : ℕ) :
    haagAux n k (haagR k) = (List.range n).map fun i => haagR (k + i) := by
  induction n generalizing k with
  | zero => rfl
  | succ n ih =>
    rw [haagAux, List.range_succ_eq_map, List.map_cons, List.map_map]
    have e : haagR k * (((2 * k + 1) ^ 2 : ℕ) : ℚ) / ((4 * (k + 1) * (k + 2) : ℕ) : ℚ)
        = haagR (k + 1) := rfl
    rw [e, ih]
    congr 1
    refine List.map_congr_left fun i _ => ?_
    simp only [Function.comp_apply]
    congr 1
    omega

lemma haagList_eq (K : ℕ) : haagList K = (List.range K).map haagR := by
  rw [haagList, show (1 : ℚ) = haagR 0 from rfl, haagAux_eq]
  simp

lemma haagR_pos (k : ℕ) : 0 < haagR k := by
  induction k with
  | zero => simp [haagR]
  | succ k ih =>
    rw [haagR]
    have h1 : (0 : ℚ) < (((2 * k + 1) ^ 2 : ℕ) : ℚ) := by positivity
    have h2 : (0 : ℚ) < ((4 * (k + 1) * (k + 2) : ℕ) : ℚ) := by positivity
    positivity

/-- `g_k = r_k (k+1)(2k+1)`. -/
def haagG (k : ℕ) : ℚ := haagR k * ((k + 1) * (2 * k + 1))

lemma haagG_succ_le (k : ℕ) : haagG (k + 1) ≤ haagG k := by
  unfold haagG
  rw [haagR]
  have hr := haagR_pos k
  push_cast
  have hk : (0 : ℚ) < 4 * (k + 1) * (k + 2) := by positivity
  rw [div_mul_eq_mul_div, div_le_iff₀ hk]
  have hpos : 0 ≤ haagR k * (2 * k + 1) * (k + 2) := by positivity
  nlinarith [hpos]

lemma haagG_antitone : Antitone haagG := antitone_nat_of_succ_le haagG_succ_le

/-- `r_k ≤ g_K / ((k+1)(2k+1))` for `k ≥ K`. -/
lemma haagR_le (K k : ℕ) (hk : K ≤ k) : haagR k ≤ haagG K / ((k + 1) * (2 * k + 1)) := by
  have h := haagG_antitone hk
  unfold haagG at h
  rw [le_div_iff₀ (by positivity)]
  exact h

/-- The telescoping tail: `Σ_{i<n} r_{i+K} ≤ g_K/(2K)` for `K ≥ 1`. -/
lemma sum_haagR_le (K : ℕ) (hK : 1 ≤ K) (n : ℕ) :
    ∑ i ∈ range n, (haagR (i + K) : ℝ) ≤ (haagG K : ℝ) / (2 * K) := by
  have hg : (0 : ℝ) ≤ haagG K := by
    unfold haagG; have := haagR_pos K; push_cast; positivity
  have hterm : ∀ i, (haagR (i + K) : ℝ)
      ≤ (haagG K : ℝ) / 2 * (1 / ((i + K : ℕ) : ℝ) - 1 / ((i + 1 + K : ℕ) : ℝ)) := by
    intro i
    have h1 := haagR_le K (i + K) (by omega)
    have h1' : (haagR (i + K) : ℝ) ≤ (haagG K : ℝ) / (((i + K : ℕ) : ℝ) + 1)
        / (2 * ((i + K : ℕ) : ℝ) + 1) := by
      rw [div_div]
      exact_mod_cast h1
    refine h1'.trans ?_
    have hx : (1 : ℝ) ≤ ((i + K : ℕ) : ℝ) := by exact_mod_cast (show 1 ≤ i + K by omega)
    have e : ((i + 1 + K : ℕ) : ℝ) = ((i + K : ℕ) : ℝ) + 1 := by push_cast; ring
    rw [e]
    generalize ((i + K : ℕ) : ℝ) = x at hx ⊢
    rw [div_div, show (1 : ℝ) / x - 1 / (x + 1) = 1 / (x * (x + 1)) by field_simp; ring]
    rw [mul_one_div, div_div, div_le_div_iff₀ (by positivity) (by positivity)]
    nlinarith [mul_nonneg hg (show (0 : ℝ) ≤ x * (x + 1) by positivity)]
  calc ∑ i ∈ range n, (haagR (i + K) : ℝ)
      ≤ ∑ i ∈ range n, (haagG K : ℝ) / 2 * (1 / ((i + K : ℕ) : ℝ) - 1 / ((i + 1 + K : ℕ) : ℝ)) :=
        sum_le_sum fun i _ => hterm i
    _ = (haagG K : ℝ) / 2 * (1 / ((0 + K : ℕ) : ℝ) - 1 / ((n + K : ℕ) : ℝ)) := by
        rw [← mul_sum]
        congr 1
        exact sum_range_sub' (fun i => 1 / ((i + K : ℕ) : ℝ)) n
    _ ≤ (haagG K : ℝ) / 2 * (1 / (K : ℝ)) := by
        have : (0 : ℝ) ≤ 1 / ((n + K : ℕ) : ℝ) := by positivity
        rw [zero_add]
        exact mul_le_mul_of_nonneg_left (by linarith) (by positivity)
    _ = (haagG K : ℝ) / (2 * K) := by
        have hK' : (K : ℝ) ≠ 0 := by have : (0 : ℝ) < K := by exact_mod_cast hK
                                     exact this.ne'
        field_simp

/-- Haagerup's coefficients `c_k = (π/4) r_k`. -/
def haagCoeff (k : ℕ) : ℝ := Real.pi / 4 * haagR k

lemma haagCoeff_nonneg (k : ℕ) : 0 ≤ haagCoeff k := by
  unfold haagCoeff; have := haagR_pos k; positivity

lemma summable_haagCoeff : Summable fun k => |haagCoeff k| := by
  have h1 : Summable fun i => (haagR (i + 1) : ℝ) :=
    summable_of_sum_range_le (fun i => by exact_mod_cast (haagR_pos _).le)
      (sum_haagR_le 1 le_rfl)
  have h2 : Summable fun k => (haagR k : ℝ) := (summable_nat_add_iff 1).mp h1
  refine (h2.mul_left (Real.pi / 4)).congr fun k => ?_
  rw [abs_of_nonneg (haagCoeff_nonneg k)]
  rfl

/-- The tail `Σ_{k ≥ K} c_k ≤ (π/4) g_K/(2K)`. -/
lemma tsum_haagCoeff_tail_le (K : ℕ) (hK : 1 ≤ K) :
    ∑' i, haagCoeff (i + K) ≤ Real.pi / 4 * ((haagG K : ℝ) / (2 * K)) := by
  simp only [haagCoeff]
  rw [tsum_mul_left]
  exact mul_le_mul_of_nonneg_left (Real.tsum_le_of_sum_range_le
    (fun i => by exact_mod_cast (haagR_pos _).le) (sum_haagR_le K hK)) (by positivity)

/-! ### Residual perturbation -/

lemma tsum_abs_le_add' {f g d : ℕ → ℝ} (hg : Summable fun n => |g n|)
    (hd : Summable fun n => |d n|) (h : ∀ n, |f n| ≤ |g n| + |d n|) :
    ∑' n, |f n| ≤ ∑' n, |g n| + ∑' n, |d n| := by
  rw [← hg.tsum_add hd]
  exact (Summable.of_nonneg_of_le (fun _ => abs_nonneg _) h (hg.add hd)).tsum_le_tsum h (hg.add hd)

/-- The residual of `h` is at most the residual of `g` plus the `ℓ¹` distance of `h` and `g`. -/
theorem residual_perturb' (h g : ℕ → ℝ) (hg : Summable fun n => |g n|)
    (hd : Summable fun n => |h n - g n|) (c : ℝ) :
    |h 0 - c| + ∑' n, |h (n + 1)| ≤ |g 0 - c| + ∑' n, |g (n + 1)| + ∑' n, |h n - g n| := by
  have h1 := tsum_abs_le_add' (f := fun n => h (n + 1)) (g := fun n => g (n + 1))
    (d := fun n => h (n + 1) - g (n + 1)) ((summable_nat_add_iff 1).mpr hg)
    ((summable_nat_add_iff 1).mpr hd) fun n => (abs_add_le _ _).trans_eq' (by rw [add_sub_cancel])
  rw [hd.tsum_eq_zero_add]
  linarith [abs_sub_le (h 0) (g 0) c]

/-! ### Splitting the coefficients -/

/-- The first `K` coefficients. -/
def cLo (K : ℕ) (k : ℕ) : ℝ := if k < K then haagCoeff k else 0

/-- The remaining coefficients. -/
def cHi (K : ℕ) (k : ℕ) : ℝ := if k < K then 0 else haagCoeff k

lemma summable_cHi (K : ℕ) : Summable fun k => |cHi K k| :=
  summable_haagCoeff.of_nonneg_of_le (fun _ => abs_nonneg _) fun k => by
    unfold cHi; split_ifs <;> simp

lemma summable_cLo (K : ℕ) : Summable fun k => |cLo K k| :=
  summable_haagCoeff.of_nonneg_of_le (fun _ => abs_nonneg _) fun k => by
    unfold cLo; split_ifs <;> simp

lemma tsum_abs_cHi_le (K : ℕ) (hK : 1 ≤ K) :
    ∑' k, |cHi K k| ≤ Real.pi / 4 * ((haagG K : ℝ) / (2 * K)) := by
  rw [← (summable_cHi K).sum_add_tsum_nat_add K]
  have h0 : ∑ i ∈ range K, |cHi K i| = 0 :=
    sum_eq_zero fun i hi => by simp [cHi, mem_range.1 hi]
  have e : ∀ i, |cHi K (i + K)| = haagCoeff (i + K) := fun i => by
    simp [cHi, abs_of_nonneg (haagCoeff_nonneg _)]
  rw [h0, zero_add, tsum_congr e]
  exact tsum_haagCoeff_tail_le K hK

lemma compCoeff_add {a b : ℕ → ℝ} (ha : Summable fun k => |a k|) (hb : Summable fun k => |b k|)
    {P : ℝ[X]} (hP : l1 P ≤ 1) (n : ℕ) :
    compCoeff (fun k => a k + b k) P n = compCoeff a P n + compCoeff b P n := by
  unfold compCoeff
  rw [← (summable_compCoeff_term ha hP n).tsum_add (summable_compCoeff_term hb hP n)]
  exact tsum_congr fun k => by ring

/-! ### The finite part as a Horner polynomial -/

/-- Horner's rule over the reals: `r₀ + Y (r₁ + Y (r₂ + …))`. -/
def hornerP (Y : ℝ[X]) : List ℚ → ℝ[X]
  | [] => 0
  | r :: rs => C (r : ℝ) + Y * hornerP Y rs

lemma hornerP_eq (Y : ℝ[X]) (rs : List ℚ) :
    hornerP Y rs = ∑ k ∈ range rs.length, C ((rs.getD k 0 : ℚ) : ℝ) * Y ^ k := by
  induction rs with
  | nil => simp [hornerP]
  | cons r rs ih =>
    rw [hornerP, ih, List.length_cons, sum_range_succ', mul_sum]
    simp only [List.getD_cons_succ, List.getD_cons_zero, pow_zero, mul_one, pow_succ]
    rw [add_comm]
    congr 1
    exact sum_congr rfl fun k _ => by ring

lemma memB_hornerI {M : ℕ} {Y : ℝ[X]} {YI : List Ival} (hY : memB M Y YI) (rs : List ℚ) :
    memB M (hornerP Y rs) (hornerI M YI rs) := by
  induction rs with
  | nil => exact memB_zero M
  | cons r rs ih =>
    exact memB_take (memB_add (memB_single (mem_ofRatI r)) (memB_conv hY ih))

/-- **Soundness of the Haagerup residual check.** -/
theorem haag_le_of_check {M : ℕ} {pl rs : List ℚ} {s cap : ℚ} (h : haagOK M pl rs s cap = true) :
    ∑ n ∈ range M, |(ofListQ pl * hornerP (X * ofListQ pl ^ 2) rs).coeff n
      - if n = 0 then (s : ℝ) else 0| ≤ cap := by
  simp only [haagOK, decide_eq_true_eq] at h
  have hP := memB_ofListQ pl M
  have hY : memB M (X * ofListQ pl ^ 2) (zeroI :: convI (pl.map ofRatI) (pl.map ofRatI)) := by
    rw [sq]
    exact memB_mono (memB_X_mul (memB_conv hP hP)) (Nat.le_succ M)
  have hB := memB_add (memB_take (memB_conv hP (memB_hornerI hY rs)))
    (memB_single (N := M) (mem_neg (mem_ofRatI s)))
  have h1 := absSum_le hB
  have h2 : (haagInt M pl rs s : ℝ) ≤ cap * D := (Int.cast_le.2 h).trans (ofRatLo_le _)
  refine le_of_mul_le_mul_right ((le_of_eq ?_).trans (h1.trans h2)) D_pos
  congr 1
  refine sum_congr rfl fun n _ => ?_
  rw [coeff_add, coeff_C]
  congr 1
  split_ifs <;> ring

/-! ### Degrees -/

lemma natDegree_ofListQ_le : ∀ l : List ℚ, (ofListQ l).natDegree ≤ l.length - 1
  | [] => by simp [ofListQ]
  | [a] => by simp [ofListQ]
  | a :: b :: l => by
    have ih := natDegree_ofListQ_le (b :: l)
    simp only [ofListQ] at ih ⊢
    refine (natDegree_add_le _ _).trans (max_le (by simp) ?_)
    refine (natDegree_mul_le).trans ?_
    have := natDegree_X_le (R := ℝ)
    simp only [List.length_cons] at ih ⊢
    omega

lemma coeff_compTerm_eq_zero {P : ℝ[X]} {d : ℕ} (hP : P.natDegree ≤ d)
    {k n : ℕ} (hn : k + (2 * k + 1) * d < n) :
    (compTerm P k).coeff n = 0 := by
  apply coeff_eq_zero_of_natDegree_lt
  refine lt_of_le_of_lt (natDegree_mul_le) ?_
  have h1 : (X ^ k : ℝ[X]).natDegree ≤ k := natDegree_X_pow_le k
  have h2 : (P ^ (2 * k + 1)).natDegree ≤ (2 * k + 1) * d :=
    (natDegree_pow_le).trans (Nat.mul_le_mul_left _ hP)
  omega


end

end Grothe
