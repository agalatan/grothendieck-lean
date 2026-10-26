import Grothe.UpperChaos.PhiDense
import Mathlib.Analysis.Complex.ExponentialBounds

/-!
# The phase cover: soundness of the checker

`g(U, V, W) = (UV − W²) e^{−(21/10)(U+V)} S(U, V, W)²` is the square of the phase
`φ = D e^{−ε(U+V)} S` (`D² = UV − W²`, `ε = 21/20`).

* `leaf_sound`: a passing leaf of the checker bounds `g ≤ 99/100` on its box (first-order expansion of
  the exponential around the centre, `exp_first_order`; the exponential at the centre, `exp_centre_le`);
* `walk_sound`: a passing tree covers its box; `splitAll_cover`: the 64 cubes cover the root box
  `[0, 64]² × [−32, 32]`;
* `far_sound`: for `U + V ≥ 60` the crude bound `Σ|c| s^{i+j}(s/2)^k` and the decay of
  `s^n e^{−21 s/20}` (`pow_mul_exp_le`) give `|φ| ≤ 1/10`.
-/

open GrotheKernel Finset

namespace Grothe.UpperChaos

noncomputable section

/-- `(UV − W²) e^{−(21/10)(U+V)} S²`. -/
def gphi (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (U V W : ℝ) : ℝ :=
  (U * V - W ^ 2) * Real.exp (-(21 / 10) * (U + V)) * Ssum ts U V W ^ 2

/-! ### The exponential -/

lemma exp_neg_one_le : Real.exp (-1) ≤ (qn : ℝ) / qd := by
  have h := Real.exp_one_gt_d9
  rw [Real.exp_neg, qn, qd]
  rw [inv_le_comm₀ (Real.exp_pos 1) (by norm_num)]
  push_cast
  rw [inv_div]
  linarith [show (2718281828 : ℝ) / 1000000000 ≤ 2.7182818283 by norm_num]

/-- First order: `|e^{−t} − (1 − t)| ≤ a²/2 + 2a³/9` for `|t| ≤ a ≤ 1`. -/
lemma exp_first_order {t a : ℝ} (ht : |t| ≤ a) (ha : a ≤ 1) :
    |Real.exp (-t) - (1 - t)| ≤ a ^ 2 / 2 + 2 * a ^ 3 / 9 := by
  have h := Real.exp_bound (x := -t) (by rw [abs_neg]; linarith) (n := 3) (by norm_num)
  simp only [Finset.sum_range_succ, Finset.sum_range_zero] at h
  norm_num at h
  have ha0 : 0 ≤ a := (abs_nonneg t).trans ht
  have h2 : t ^ 2 ≤ a ^ 2 := by rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg t) ht 2
  have h3 : |t| ^ 3 ≤ a ^ 3 := pow_le_pow_left₀ (abs_nonneg t) ht 3
  have e : Real.exp (-t) - (1 - t) = (Real.exp (-t) - (1 + -t + (-t) ^ 2 / 2)) + t ^ 2 / 2 := by ring
  rw [e]
  refine (abs_add_le _ _).trans ?_
  rw [abs_of_nonneg (by positivity : (0 : ℝ) ≤ t ^ 2 / 2)]
  have h' : |Real.exp (-t) - (1 + -t + (-t) ^ 2 / 2)| ≤ |t| ^ 3 * (2 / 9) := by
    convert h using 2; simp
  nlinarith

/-- `720 den⁶ T(f/den) = expDen f den`, `T` the degree-6 Taylor polynomial. -/
lemma expDen_eq (f den : ℤ) (hden : (den : ℝ) ≠ 0) :
    ((expDen f den : ℤ) : ℝ) = 720 * (den : ℝ) ^ 6
      * ∑ i ∈ Finset.range 7, ((f : ℝ) / den) ^ i / (Nat.factorial i) := by
  simp only [expDen, Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial]
  push_cast
  field_simp
  ring

/-- **The exponential at the centre**: `e^{−21 s/den} ≤ (qn/qd)^n · 720 den⁶/expDen f den`. -/
lemma exp_centre_le {s : ℤ} (hs : 0 ≤ s) :
    let den : ℤ := 10 * (2 : ℤ) ^ SC
    let n : ℕ := (21 * s / den).toNat
    Real.exp (-(21 / 10) * ((s : ℝ) / (2 : ℝ) ^ SC))
      ≤ ((qn : ℝ) / qd) ^ n * (720 * (den : ℝ) ^ 6 / ((expDen (21 * s - den * n) den : ℤ) : ℝ)) := by
  intro den n
  have hden : (0 : ℤ) < den := by simp [den]
  have hq0 : 0 ≤ 21 * s / den := Int.ediv_nonneg (by omega) hden.le
  have hn : ((n : ℕ) : ℤ) = 21 * s / den := Int.toNat_of_nonneg hq0
  have h1 : den * n ≤ 21 * s := by rw [hn]; exact Int.mul_ediv_self_le hden.ne'
  have hdenR : (0 : ℝ) < den := by exact_mod_cast hden
  set f : ℤ := 21 * s - den * n with hf
  have hf0 : (0 : ℝ) ≤ (f : ℝ) / den := div_nonneg (by exact_mod_cast (by omega : (0 : ℤ) ≤ f)) hdenR.le
  have hx : -(21 / 10) * ((s : ℝ) / (2 : ℝ) ^ SC) = -(n : ℝ) + -((f : ℝ) / den) := by
    have : ((den : ℤ) : ℝ) = 10 * (2 : ℝ) ^ SC := by simp [den]
    rw [hf]
    push_cast
    rw [this]
    field_simp
    ring
  have hT : 0 < ∑ i ∈ Finset.range 7, ((f : ℝ) / den) ^ i / (Nat.factorial i) := by
    rw [Finset.sum_range_succ']
    simp only [pow_zero, Nat.factorial_zero, Nat.cast_one, div_one]
    have : 0 ≤ ∑ i ∈ Finset.range 6, ((f : ℝ) / den) ^ (i + 1) / (Nat.factorial (i + 1)) :=
      Finset.sum_nonneg fun i _ => by positivity
    linarith
  have hE : Real.exp (-((f : ℝ) / den))
      ≤ 1 / ∑ i ∈ Finset.range 7, ((f : ℝ) / den) ^ i / (Nat.factorial i) := by
    rw [Real.exp_neg, ← one_div]
    exact one_div_le_one_div_of_le hT (Real.sum_le_exp_of_nonneg hf0 7)
  rw [hx, Real.exp_add, expDen_eq f den hdenR.ne']
  have hpow : Real.exp (-(n : ℝ)) ≤ ((qn : ℝ) / qd) ^ n := by
    rw [show -(n : ℝ) = n * (-1) by ring, Real.exp_nat_mul]
    exact pow_le_pow_left₀ (Real.exp_pos _).le exp_neg_one_le n
  calc Real.exp (-(n : ℝ)) * Real.exp (-((f : ℝ) / den))
      ≤ ((qn : ℝ) / qd) ^ n * (1 / ∑ i ∈ Finset.range 7, ((f : ℝ) / den) ^ i / (Nat.factorial i)) :=
        mul_le_mul hpow hE (Real.exp_pos _).le (by positivity)
    _ = ((qn : ℝ) / qd) ^ n * (720 * (den : ℝ) ^ 6
          / (720 * (den : ℝ) ^ 6 * ∑ i ∈ Finset.range 7, ((f : ℝ) / den) ^ i / (Nat.factorial i))) := by
        congr 1; field_simp

/-! ### Leaves -/

/-- The point `(U, V, W)` lies in the (scaled) box. -/
def InBox (b : Box) (U V W : ℝ) : Prop :=
  (b.Ul : ℝ) ≤ (2 : ℝ) ^ SC * U ∧ (2 : ℝ) ^ SC * U ≤ b.Uh ∧
  (b.Vl : ℝ) ≤ (2 : ℝ) ^ SC * V ∧ (2 : ℝ) ^ SC * V ≤ b.Vh ∧
  (b.Wl : ℝ) ≤ (2 : ℝ) ^ SC * W ∧ (2 : ℝ) ^ SC * W ≤ b.Wh

lemma commonDen_pos (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : 0 < commonDen ts := by
  unfold commonDen
  suffices h : ∀ (l : List ((ℕ × ℕ × ℕ) × ℚ)) (a : ℕ), 0 < a →
      0 < l.foldl (fun l t => Nat.lcm l t.2.den) a from h ts 1 one_pos
  intro l
  induction l with
  | nil => intro a ha; exact ha
  | cons t l ih => intro a ha; exact ih _ (Nat.lcm_pos ha t.2.den_pos)

/-- `|S U − m| ≤ r` from the box and centring. -/
lemma abs_sub_centre {lo hi : ℤ} {x : ℝ} (hlo : (lo : ℝ) ≤ x) (hhi : x ≤ hi)
    (hc : hi - (lo + hi) / 2 = (lo + hi) / 2 - lo) :
    |x - ((lo + hi) / 2 : ℤ)| ≤ (((lo + hi) / 2 - lo).toNat : ℝ) := by
  have hle : lo ≤ hi := by exact_mod_cast hlo.trans hhi
  have hnn : 0 ≤ (lo + hi) / 2 - lo := by omega
  rw [show ((((lo + hi) / 2 - lo).toNat : ℕ) : ℝ) = (((lo + hi) / 2 - lo : ℤ) : ℝ) by
    rw [← Int.cast_natCast, Int.toNat_of_nonneg hnn]]
  rw [abs_le]
  have h1 : ((hi - (lo + hi) / 2 : ℤ) : ℝ) = (((lo + hi) / 2 - lo : ℤ) : ℝ) := by
    exact_mod_cast hc
  push_cast at h1 ⊢
  constructor <;> linarith

lemma w2lo_le {b : Box} {w : ℝ} (hl : (b.Wl : ℝ) ≤ w) (hh : w ≤ b.Wh) :
    ((w2lo b : ℤ) : ℝ) ≤ w ^ 2 := by
  unfold w2lo
  split_ifs with h
  · simp; positivity
  · push_cast
    rcases not_and_or.1 h with h1 | h1
    · have : (0 : ℝ) < b.Wl := by exact_mod_cast (by omega : (0 : ℤ) < b.Wl)
      exact (min_le_left _ _).trans (by nlinarith)
    · have : (b.Wh : ℝ) < 0 := by exact_mod_cast (by omega : b.Wh < 0)
      exact (min_le_right _ _).trans (by nlinarith)

lemma add_sub_cancel' (m x : ℝ) : m + (x - m) = x := by ring

lemma D_bound {S U V W Uh Vh w2 : ℝ} (hS : 0 < S) (hU : 0 ≤ U) (hV : 0 ≤ V) (hU2 : S * U ≤ Uh)
    (hV2 : S * V ≤ Vh) (h2 : w2 ≤ (S * W) ^ 2) : S ^ 2 * (U * V - W ^ 2) ≤ Uh * Vh - w2 := by
  have h1 : S * U * (S * V) ≤ Uh * Vh :=
    mul_le_mul hU2 hV2 (by positivity) ((by positivity : (0 : ℝ) ≤ S * U).trans hU2)
  nlinarith

/-- The second bound on `UV − W²` (around the centre). -/
lemma D_bound_centre {S U V W mU mV mW rU rV rW : ℝ} (hmU : 0 ≤ mU) (hmV : 0 ≤ mV)
    (hU : |S * U - mU| ≤ rU) (hV : |S * V - mV| ≤ rV) (hW : |S * W - mW| ≤ rW) :
    S ^ 2 * (U * V - W ^ 2)
      ≤ mU * mV - mW * mW + mV * rU + mU * rV + 2 * |mW| * rW + rU * rV := by
  set x := S * U - mU
  set y := S * V - mV
  set z := S * W - mW
  have e : S ^ 2 * (U * V - W ^ 2)
      = mU * mV + mU * y + mV * x + x * y - mW * mW - 2 * mW * z - z ^ 2 := by
    simp only [x, y, z]; ring
  have hxy : x * y ≤ rU * rV := by
    have := abs_mul x y
    have h1 : |x| * |y| ≤ rU * rV := mul_le_mul hU hV (abs_nonneg _) ((abs_nonneg _).trans hU)
    linarith [le_abs_self (x * y)]
  have hy : mU * y ≤ mU * rV := mul_le_mul_of_nonneg_left ((le_abs_self y).trans hV) hmU
  have hx : mV * x ≤ mV * rU := mul_le_mul_of_nonneg_left ((le_abs_self x).trans hU) hmV
  have hz : -(2 * mW * z) ≤ 2 * |mW| * rW := by
    have : |mW * z| ≤ |mW| * rW := by rw [abs_mul]; exact mul_le_mul_of_nonneg_left hW (abs_nonneg _)
    linarith [neg_abs_le (mW * z)]
  nlinarith [sq_nonneg z]

/-- The real arithmetic of a leaf. -/
lemma leaf_arith {S K D M Ec Eb Y G : ℝ} (hS : 0 < S) (hK : 0 < K) (hD0 : 0 ≤ D)
    (hD : S ^ 2 * D ≤ M) (hE0 : 0 ≤ Ec) (hE : Ec ≤ Eb) (hY : K * |Y| ≤ G)
    (hmain : M * Eb * G ^ 2 ≤ (tN : ℝ) / tD * S ^ 2 * K ^ 2) :
    D * Ec * Y ^ 2 ≤ (tN : ℝ) / tD := by
  have hSK : 0 < S ^ 2 * K ^ 2 := by positivity
  have hM0 : 0 ≤ M := (mul_nonneg (sq_nonneg S) hD0).trans hD
  have hY2 : (K * Y) ^ 2 ≤ G ^ 2 := by
    rw [← sq_abs, abs_mul, abs_of_pos hK]
    exact pow_le_pow_left₀ (by positivity) hY 2
  rw [← mul_le_mul_iff_of_pos_right hSK]
  calc D * Ec * Y ^ 2 * (S ^ 2 * K ^ 2) = (S ^ 2 * D) * Ec * (K * Y) ^ 2 := by ring
    _ ≤ M * Eb * G ^ 2 :=
        mul_le_mul (mul_le_mul hD hE hE0 hM0) hY2 (sq_nonneg _) (mul_nonneg hM0 (hE0.trans hE))
    _ ≤ (tN : ℝ) / tD * S ^ 2 * K ^ 2 := hmain
    _ = (tN : ℝ) / tD * (S ^ 2 * K ^ 2) := by ring

/-- `e^{−(21/10)(U+V)}` = centre · (first-order factor)². -/
lemma exp_split {S U V mU mV : ℝ} (hS : 0 < S) :
    Real.exp (-(21 / 10) * (U + V)) = Real.exp (-(21 / 10) * ((mU + mV) / S))
      * Real.exp (-(21 / 20) * (((S * U - mU) + (S * V - mV)) / S)) ^ 2 := by
  rw [← Real.exp_nat_mul, ← Real.exp_add]
  congr 1
  field_simp
  ring

/-- The first-order bound: `K |e^{−ε h} S| ≤ Gn/Gd`. -/
lemma first_order_bound {S K U V mU mV rU rV Pn Sn Sv : ℝ} (hS : 0 < S) (hK : 0 < K)
    (hrs : 21 * (rU + rV) ≤ 20 * S) (hU : |S * U - mU| ≤ rU) (hV : |S * V - mV| ≤ rV)
    (hPn : |(20 * S - 21 * ((S * U - mU) + (S * V - mV))) * (K * Sv)| ≤ Pn)
    (hSn : |K * Sv| ≤ Sn) :
    K * |Real.exp (-(21 / 20) * (((S * U - mU) + (S * V - mV)) / S)) * Sv|
      ≤ (18 * (20 * S) ^ 2 * Pn + Sn * (180 * S * (21 * (rU + rV)) ^ 2 + 4 * (21 * (rU + rV)) ^ 3))
        / (18 * (20 * S) ^ 3) := by
  have hrU : 0 ≤ rU := (abs_nonneg _).trans hU
  have hrV : 0 ≤ rV := (abs_nonneg _).trans hV
  have hSn0 : 0 ≤ Sn := (abs_nonneg _).trans hSn
  have ha1 : 21 * (rU + rV) / (20 * S) ≤ 1 := by rw [div_le_one (by positivity)]; exact hrs
  have hta : |21 / 20 * (((S * U - mU) + (S * V - mV)) / S)| ≤ 21 * (rU + rV) / (20 * S) := by
    rw [abs_mul, abs_of_pos (by norm_num : (0 : ℝ) < 21 / 20), abs_div, abs_of_pos hS]
    have h1 := abs_add_le (S * U - mU) (S * V - mV)
    rw [show 21 * (rU + rV) / (20 * S) = 21 / 20 * ((rU + rV) / S) by field_simp]
    gcongr
    linarith
  have hR := exp_first_order hta ha1
  have e1 : K * (Real.exp (-(21 / 20) * (((S * U - mU) + (S * V - mV)) / S)) * Sv)
      = (20 * S - 21 * ((S * U - mU) + (S * V - mV))) * (K * Sv) / (20 * S)
        + (Real.exp (-(21 / 20 * (((S * U - mU) + (S * V - mV)) / S)))
            - (1 - 21 / 20 * (((S * U - mU) + (S * V - mV)) / S))) * (K * Sv) := by
    rw [neg_mul]; field_simp; ring
  rw [← abs_of_pos hK, ← abs_mul, e1]
  have h2 := mul_le_mul hR hSn (abs_nonneg _) (by positivity)
  have h4 := div_le_div_of_nonneg_right hPn (by positivity : (0 : ℝ) ≤ 20 * S)
  calc _ ≤ |(20 * S - 21 * ((S * U - mU) + (S * V - mV))) * (K * Sv) / (20 * S)|
        + |(Real.exp (-(21 / 20 * (((S * U - mU) + (S * V - mV)) / S)))
            - (1 - 21 / 20 * (((S * U - mU) + (S * V - mV)) / S))) * (K * Sv)| := abs_add_le _ _
    _ ≤ Pn / (20 * S) + ((21 * (rU + rV) / (20 * S)) ^ 2 / 2
          + 2 * (21 * (rU + rV) / (20 * S)) ^ 3 / 9) * Sn := by
        refine add_le_add ?_ ?_
        · rw [abs_div, abs_of_pos (by positivity : (0 : ℝ) < 20 * S)]; exact h4
        · rw [abs_mul]; exact h2
    _ = _ := by field_simp; ring

/-- The integer inequality of a leaf, read in the reals. -/
lemma main_real {S K M D G Gd den : ℝ} {n : ℕ} (hS : 0 < S) (hK : 0 < K) (hD : 0 < D)
    (hGd : 0 < Gd)
    (h : (tD : ℝ) * M * (qn : ℝ) ^ n * den ^ 6 * 720 * G ^ 2
      ≤ (tN : ℝ) * S ^ 2 * (qd : ℝ) ^ n * D * Gd ^ 2 * K ^ 2) :
    M * (((qn : ℝ) / qd) ^ n * (720 * den ^ 6 / D)) * (G / Gd) ^ 2 ≤ (tN : ℝ) / tD * S ^ 2 * K ^ 2 := by
  have htD : (0 : ℝ) < tD := by norm_num [tD]
  have hqd : (0 : ℝ) < (qd : ℝ) ^ n := by norm_num [qd]
  rw [div_pow, div_pow,
    show M * ((qn : ℝ) ^ n / (qd : ℝ) ^ n * (720 * den ^ 6 / D)) * (G ^ 2 / Gd ^ 2)
      = (tD * M * (qn : ℝ) ^ n * den ^ 6 * 720 * G ^ 2) / (tD * (qd : ℝ) ^ n * D * Gd ^ 2) by
      field_simp]
  rw [div_le_iff₀ (by positivity)]
  calc (tD : ℝ) * M * (qn : ℝ) ^ n * den ^ 6 * 720 * G ^ 2
      ≤ (tN : ℝ) * S ^ 2 * (qd : ℝ) ^ n * D * Gd ^ 2 * K ^ 2 := h
    _ = (tN : ℝ) / tD * S ^ 2 * K ^ 2 * (tD * (qd : ℝ) ^ n * D * Gd ^ 2) := by field_simp

lemma expDen_centre_pos {s : ℤ} (hs : 0 ≤ s) :
    (0 : ℝ) < ((expDen (21 * s - 10 * 2 ^ SC * ((21 * s / (10 * 2 ^ SC)).toNat : ℤ))
      (10 * 2 ^ SC) : ℤ) : ℝ) := by
  have hden : (0 : ℤ) < 10 * 2 ^ SC := by positivity
  have hq0 : 0 ≤ 21 * s / (10 * 2 ^ SC) := Int.ediv_nonneg (by omega) hden.le
  have h1 : 10 * 2 ^ SC * (((21 * s / (10 * 2 ^ SC)).toNat : ℕ) : ℤ) ≤ 21 * s := by
    rw [Int.toNat_of_nonneg hq0]; exact Int.mul_ediv_self_le hden.ne'
  have hf : 0 ≤ 21 * s - 10 * 2 ^ SC * ((21 * s / (10 * 2 ^ SC)).toNat : ℤ) := by omega
  have : 0 < expDen (21 * s - 10 * 2 ^ SC * ((21 * s / (10 * 2 ^ SC)).toNat : ℤ)) (10 * 2 ^ SC) := by
    unfold expDen; positivity
  exact_mod_cast this

lemma toNat_cast {r : ℤ} (h : 0 ≤ r) : ((r.toNat : ℕ) : ℝ) = (r : ℝ) := by
  rw [← Int.cast_natCast, Int.toNat_of_nonneg h]

/-- **Soundness of the exponential test.** -/
theorem expTest_sound {L : ℕ} {M s G Gd : ℤ} (h : expTest L M s G Gd = true) (hL : 0 < L) {D Ex Y : ℝ}
    (hD0 : 0 ≤ D) (hD : ((2 : ℝ) ^ SC) ^ 2 * D ≤ M) (hEx0 : 0 ≤ Ex)
    (hEx : Ex ≤ Real.exp (-(21 / 10) * ((s : ℝ) / (2 : ℝ) ^ SC)))
    (hY : (L : ℝ) * ((2 : ℝ) ^ SC) ^ DEG * |Y| ≤ (G : ℝ) / Gd) :
    D * Ex * Y ^ 2 ≤ (tN : ℝ) / tD := by
  simp only [expTest, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨hs, hGd⟩, hmain⟩ := h
  have hSpos : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
  have hK : (0 : ℝ) < (L : ℝ) * ((2 : ℝ) ^ SC) ^ DEG := by positivity
  have hEc := exp_centre_le hs
  push_cast at hEc
  refine leaf_arith hSpos hK hD0 hD hEx0 (hEx.trans hEc) hY ?_
  refine main_real hSpos hK (expDen_centre_pos hs) (by exact_mod_cast hGd) ?_
  exact_mod_cast hmain

/-- **Soundness of a leaf.** -/
theorem leaf_sound {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true) {b : Box}
    (hleaf : leafOK (commonDen ts) (denseA0 ts) b = true) {U V W : ℝ} (hb : InBox b U V W)
    (hW2 : W ^ 2 ≤ U * V) : gphi ts U V W ≤ (tN : ℝ) / tD := by
  obtain ⟨hU1, hU2, hV1, hV2, hW1, hWh⟩ := hb
  simp only [leafOK, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq, and_assoc] at hleaf
  obtain ⟨hcU, hcV, hcW, hUl, hVl, hrU, hrV, hrW, hcase⟩ := hleaf
  have hSpos : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
  have hL := commonDen_pos ts
  have hUnn : 0 ≤ U := by
    have : (0 : ℝ) ≤ b.Ul := by exact_mod_cast hUl
    nlinarith
  have hVnn : 0 ≤ V := by
    have : (0 : ℝ) ≤ b.Vl := by exact_mod_cast hVl
    nlinarith
  have hxUn := abs_sub_centre hU1 hU2 hcU
  have hxVn := abs_sub_centre hV1 hV2 hcV
  have hxWn := abs_sub_centre hW1 hWh hcW
  have hSn := abs_e3_le (shiftAll ((b.Ul + b.Uh) / 2) ((b.Vl + b.Vh) / 2)
    ((b.Wl + b.Wh) / 2) (denseA0 ts)) hxUn hxVn hxWn
  have hPn := abs_e3_le (firstOrder (shiftAll ((b.Ul + b.Uh) / 2) ((b.Vl + b.Vh) / 2)
    ((b.Wl + b.Wh) / 2) (denseA0 ts))) hxUn hxVn hxWn
  rw [e3_firstOrder, e3_shiftAll] at hPn
  rw [e3_shiftAll] at hSn
  simp only [add_sub_cancel'] at hPn hSn
  rw [e3_denseA0 hts, mul_comm DEG SC, pow_mul] at hPn hSn
  rw [toNat_cast hrU] at hxUn
  rw [toNat_cast hrV] at hxVn
  rw [toNat_cast hrW] at hxWn
  have hK : (0 : ℝ) < (commonDen ts : ℝ) * ((2 : ℝ) ^ SC) ^ DEG := by positivity
  -- `S²(UV − W²) ≤ M`
  have hD : ((2 : ℝ) ^ SC) ^ 2 * (U * V - W ^ 2)
      ≤ ((max 0 (min (b.Uh * b.Vh - w2lo b)
      ((b.Ul + b.Uh) / 2 * ((b.Vl + b.Vh) / 2) - (b.Wl + b.Wh) / 2 * ((b.Wl + b.Wh) / 2)
        + (b.Vl + b.Vh) / 2 * ((b.Ul + b.Uh) / 2 - b.Ul) + (b.Ul + b.Uh) / 2 * ((b.Vl + b.Vh) / 2 - b.Vl)
        + 2 * (((b.Wl + b.Wh) / 2).natAbs : ℤ) * ((b.Wl + b.Wh) / 2 - b.Wl)
        + ((b.Ul + b.Uh) / 2 - b.Ul) * ((b.Vl + b.Vh) / 2 - b.Vl))) : ℤ) : ℝ) := by
    refine le_trans ?_ (Int.cast_le.2 (le_max_right _ _))
    rw [Int.cast_min]
    refine le_min ?_ ?_
    · have h2 := w2lo_le hW1 hWh
      push_cast
      exact D_bound hSpos hUnn hVnn hU2 hV2 h2
    · have hmU : (0 : ℝ) ≤ (((b.Ul + b.Uh) / 2 : ℤ) : ℝ) := by exact_mod_cast (by omega)
      have hmV : (0 : ℝ) ≤ (((b.Vl + b.Vh) / 2 : ℤ) : ℝ) := by exact_mod_cast (by omega)
      have := D_bound_centre hmU hmV hxUn hxVn hxWn
      rw [Int.natCast_natAbs]
      push_cast at this ⊢
      exact this
  unfold gphi
  rcases hcase with hcorner | hfirst
  · -- the corner test
    refine expTest_sound hcorner hL (by linarith) hD (Real.exp_pos _).le ?_ ?_
    · apply Real.exp_le_exp.2
      have : ((b.Ul + b.Vl : ℤ) : ℝ) ≤ (2 : ℝ) ^ SC * (U + V) := by push_cast; linarith
      have h' : ((b.Ul + b.Vl : ℤ) : ℝ) / (2 : ℝ) ^ SC ≤ U + V := by
        rw [div_le_iff₀ hSpos]; linarith
      linarith
    · rw [abs_mul, abs_of_pos hK] at hSn
      push_cast; rw [div_one]; exact hSn
  · -- the first-order test
    simp only [firstTest, Bool.and_eq_true, decide_eq_true_eq] at hfirst
    obtain ⟨ha, htest⟩ := hfirst
    have hrs : 21 * ((((b.Ul + b.Uh) / 2 - b.Ul : ℤ) : ℝ) + (((b.Vl + b.Vh) / 2 - b.Vl : ℤ) : ℝ))
        ≤ 20 * (2 : ℝ) ^ SC := by
      have := (Int.cast_le (R := ℝ)).2 ha
      push_cast at this ⊢
      linarith
    have hG := first_order_bound hSpos hK hrs hxUn hxVn hPn hSn
    rw [exp_split (mU := (((b.Ul + b.Uh) / 2 : ℤ) : ℝ)) (mV := (((b.Vl + b.Vh) / 2 : ℤ) : ℝ)) hSpos]
    rw [show ∀ a b c d : ℝ, a * (b * c ^ 2) * d ^ 2 = a * b * (c * d) ^ 2 from fun a b c d => by ring]
    refine expTest_sound htest hL (by linarith) hD (Real.exp_pos _).le ?_ ?_
    · push_cast; exact le_rfl
    · convert hG using 2
      · push_cast; ring
      · push_cast; ring

/-! ### The tree -/

lemma inBox_split {b : Box} {c : Char} (hc : c = 'U' ∨ c = 'V' ∨ c = 'W') {U V W : ℝ}
    (h : InBox b U V W) : InBox (splitBox b c).1 U V W ∨ InBox (splitBox b c).2 U V W := by
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := h
  rcases hc with rfl | rfl | rfl
  · rcases le_total ((2 : ℝ) ^ SC * U) (((b.Ul + b.Uh) / 2 : ℤ) : ℝ) with hm | hm
    · left; exact ⟨h1, hm, h3, h4, h5, h6⟩
    · right; exact ⟨hm, h2, h3, h4, h5, h6⟩
  · rcases le_total ((2 : ℝ) ^ SC * V) (((b.Vl + b.Vh) / 2 : ℤ) : ℝ) with hm | hm
    · left; exact ⟨h1, h2, h3, hm, h5, h6⟩
    · right; exact ⟨h1, h2, hm, h4, h5, h6⟩
  · rcases le_total ((2 : ℝ) ^ SC * W) (((b.Wl + b.Wh) / 2 : ℤ) : ℝ) with hm | hm
    · left; exact ⟨h1, h2, h3, h4, h5, hm⟩
    · right; exact ⟨h1, h2, h3, h4, hm, h6⟩

/-- **Soundness of the tree walk.** -/
theorem walk_sound {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true) :
    ∀ (fuel : ℕ) (cs : List Char) (b : Box) (rest : List Char),
      walk (commonDen ts) (denseA0 ts) fuel cs b = some rest →
      ∀ U V W : ℝ, InBox b U V W → W ^ 2 ≤ U * V → U + V < 60 → gphi ts U V W ≤ (tN : ℝ) / tD := by
  intro fuel
  induction fuel with
  | zero => intro cs b rest h; simp [walk] at h
  | succ fuel ih =>
    intro cs b rest h U V W hb hW2 h60
    cases cs with
    | nil => simp [walk] at h
    | cons c cs =>
      simp only [walk] at h
      by_cases hL : c = 'L'
      · subst hL
        simp only [↓reduceIte] at h
        by_cases hok : leafOK (commonDen ts) (denseA0 ts) b = true
        · exact leaf_sound hts hok hb hW2
        · simp [hok] at h
      by_cases hF : c = 'F'
      · subst hF
        simp only [show ('F' : Char) ≠ 'L' by decide, ↓reduceIte] at h
        by_cases hfl : farLeaf b = true
        · have hfar : 60 * (2 : ℤ) ^ SC ≤ b.Ul + b.Vl := by simpa [farLeaf] using hfl
          obtain ⟨h1, -, h3, -, -, -⟩ := hb
          have : (60 : ℝ) * (2 : ℝ) ^ SC ≤ (2 : ℝ) ^ SC * U + (2 : ℝ) ^ SC * V := by
            have := (Int.cast_le (R := ℝ)).2 hfar; push_cast at this; linarith
          have hS : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
          nlinarith
        · simp [hfl] at h
      by_cases hX : c = 'X'
      · subst hX
        simp only [show ('X' : Char) ≠ 'L' by decide, show ('X' : Char) ≠ 'F' by decide,
          ↓reduceIte] at h
        by_cases hel : emptyLeaf b = true
        · have he : 0 ≤ b.Ul ∧ 0 ≤ b.Vl ∧ b.Uh * b.Vh < w2lo b := by simpa [emptyLeaf, and_assoc] using hel
          obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hb
          have hS : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
          have hU : 0 ≤ U := by
            have : (0 : ℝ) ≤ b.Ul := by exact_mod_cast he.1
            nlinarith
          have hV : 0 ≤ V := by
            have : (0 : ℝ) ≤ b.Vl := by exact_mod_cast he.2.1
            nlinarith
          have hlt : (b.Uh : ℝ) * b.Vh < w2lo b := by exact_mod_cast he.2.2
          have hw := w2lo_le h5 h6
          have hUV := D_bound hS hU hV h2 h4 hw
          nlinarith
        · simp [hel] at h
      by_cases hS : c = 'U' ∨ c = 'V' ∨ c = 'W'
      swap
      · simp [hL, hF, hX, hS] at h
      simp only [hL, hF, hX, hS, ↓reduceIte] at h
      · cases h1 : walk (commonDen ts) (denseA0 ts) fuel cs (splitBox b c).1 with
        | none => simp [h1] at h
        | some rest' =>
          simp only [h1] at h
          rcases inBox_split hS hb with hb' | hb'
          · exact ih cs _ rest' h1 U V W hb' hW2 h60
          · exact ih rest' _ rest h U V W hb' hW2 h60

/-- **The cubes cover their box.** -/
theorem splitAll_cover : ∀ (cs : List Char), (∀ c ∈ cs, c = 'U' ∨ c = 'V' ∨ c = 'W') →
    ∀ (b : Box) {U V W : ℝ}, InBox b U V W → ∃ b' ∈ splitAll cs b, InBox b' U V W
  | [], _, b, _, _, _, h => ⟨b, by simp [splitAll], h⟩
  | c :: cs, hcs, b, U, V, W, h => by
    have hc := hcs c (by simp)
    have hcs' : ∀ c ∈ cs, c = 'U' ∨ c = 'V' ∨ c = 'W' := fun c hc => hcs c (by simp [hc])
    rcases inBox_split hc h with h1 | h1
    · obtain ⟨b', hb', h'⟩ := splitAll_cover cs hcs' _ h1
      exact ⟨b', by simp [splitAll, hb'], h'⟩
    · obtain ⟨b', hb', h'⟩ := splitAll_cover cs hcs' _ h1
      exact ⟨b', by simp [splitAll, hb'], h'⟩

lemma length_splitAll : ∀ (cs : List Char) (b : Box), (splitAll cs b).length = 2 ^ cs.length
  | [], _ => by simp [splitAll]
  | c :: cs, b => by
    simp only [splitAll, List.length_append, length_splitAll cs, List.length_cons, pow_succ]
    ring

/-! ### The far field -/

/-- `s^n e^{−21 s/20} ≤ 60^n e^{−63}` for `n ≤ 63 ≤ (21/20) s`. -/
lemma pow_mul_exp_le {n : ℕ} (hn : n ≤ 63) {s : ℝ} (hs : 60 ≤ s) :
    s ^ n * Real.exp (-(21 / 20) * s) ≤ 60 ^ n * Real.exp (-63) := by
  have h1 : s / 60 ≤ Real.exp (s / 60 - 1) := by linarith [Real.add_one_le_exp (s / 60 - 1)]
  have h0 : 0 ≤ s / 60 := by positivity
  have h2 : (s / 60) ^ n ≤ Real.exp ((21 / 20) * (s - 60)) := by
    calc (s / 60) ^ n ≤ Real.exp (s / 60 - 1) ^ n := pow_le_pow_left₀ h0 h1 n
      _ = Real.exp (n * (s / 60 - 1)) := by rw [← Real.exp_nat_mul]
      _ ≤ Real.exp ((21 / 20) * (s - 60)) := by
          apply Real.exp_le_exp.2
          have : (n : ℝ) ≤ 63 := by exact_mod_cast hn
          have : 0 ≤ s / 60 - 1 := by linarith
          nlinarith
  have e : s ^ n = 60 ^ n * (s / 60) ^ n := by rw [div_pow]; field_simp
  rw [e, mul_assoc]
  refine mul_le_mul_of_nonneg_left ?_ (by positivity)
  calc (s / 60) ^ n * Real.exp (-(21 / 20) * s)
      ≤ Real.exp ((21 / 20) * (s - 60)) * Real.exp (-(21 / 20) * s) :=
        mul_le_mul_of_nonneg_right h2 (Real.exp_pos _).le
    _ = Real.exp (-63) := by rw [← Real.exp_add]; congr 1; ring

lemma abs_list_sum_le {β : Type} (l : List β) (f : β → ℝ) :
    |(l.map f).sum| ≤ (l.map fun t => |f t|).sum := by
  induction l with
  | nil => simp
  | cons t l ih => simp only [List.map_cons, List.sum_cons]; exact (abs_add_le _ _).trans (by linarith)

lemma list_sum_le {β : Type} (l : List β) (f g : β → ℝ) (h : ∀ t ∈ l, f t ≤ g t) :
    (l.map f).sum ≤ (l.map g).sum := by
  induction l with
  | nil => simp
  | cons t l ih =>
    simp only [List.map_cons, List.sum_cons]
    exact add_le_add (h t (by simp)) (ih fun t ht => h t (by simp [ht]))

lemma foldl_add_rat {β : Type} (g : β → ℚ) (l : List β) (a : ℚ) :
    l.foldl (fun s t => s + g t) a = a + (l.map g).sum := by
  induction l generalizing a with
  | nil => simp
  | cons t l ih => simp [ih]; ring

lemma exp_63_ge : ((qd : ℝ) / qn) ^ 63 ≤ Real.exp 63 := by
  have h := Real.exp_one_gt_d9
  have h1 : (qd : ℝ) / qn ≤ Real.exp 1 := by
    rw [qd, qn]; push_cast; linarith [show (2718281828 : ℝ) / 1000000000 ≤ 2.7182818283 by norm_num]
  calc ((qd : ℝ) / qn) ^ 63 ≤ Real.exp 1 ^ 63 :=
        pow_le_pow_left₀ (by rw [qd, qn]; positivity) h1 63
    _ = Real.exp 63 := by rw [← Real.exp_nat_mul]; norm_num

/-- **The far field**: `g ≤ 1/100` for `U + V ≥ 60`. -/
theorem far_sound {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true)
    (hfar : farOK ts = true) {U V W : ℝ} (hU : 0 ≤ U) (hV : 0 ≤ V) (hW2 : W ^ 2 ≤ U * V)
    (h60 : 60 ≤ U + V) : gphi ts U V W ≤ 1 / 100 := by
  set s := U + V with hs_def
  have hs0 : 0 ≤ s := by linarith
  have hUs : U ≤ s := by linarith
  have hVs : V ≤ s := by linarith
  have hUV4 : U * V ≤ (s / 2) ^ 2 := by nlinarith [sq_nonneg (U - V)]
  have hWs : |W| ≤ s / 2 := by
    rw [abs_le]; constructor <;> nlinarith [sq_nonneg (W + s / 2), sq_nonneg (W - s / 2)]
  have hdeg : ∀ t ∈ ts, t.1.1 + t.1.2.1 + t.1.2.2 ≤ DEG := fun t ht => by
    have := List.all_eq_true.1 hts t ht
    simp at this; exact this.1
  -- the sum of the crude terms
  set X : ℝ := (ts.map fun t => |(t.2 : ℝ)| / 2 ^ (t.1.2.2 + 1)
      * (s ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1) * Real.exp (-(21 / 20) * s))).sum with hX
  have hX0 : 0 ≤ X := by
    rw [hX]
    exact List.sum_nonneg (fun x hx => by
      obtain ⟨t, -, rfl⟩ := List.mem_map.1 hx
      positivity)
  -- `|S| · (s/2) e^{−21s/20} ≤ X`
  have hS : |Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s)) ≤ X := by
    have h1 := abs_list_sum_le ts fun t => (t.2 : ℝ) * U ^ t.1.1 * V ^ t.1.2.1 * W ^ t.1.2.2
    have h2 : (ts.map fun t => |(t.2 : ℝ) * U ^ t.1.1 * V ^ t.1.2.1 * W ^ t.1.2.2|).sum
        ≤ (ts.map fun t => |(t.2 : ℝ)| * s ^ t.1.1 * s ^ t.1.2.1 * (s / 2) ^ t.1.2.2).sum := by
      refine list_sum_le _ _ _ fun t _ => ?_
      rw [abs_mul, abs_mul, abs_mul, abs_pow, abs_pow, abs_pow, abs_of_nonneg hU, abs_of_nonneg hV]
      gcongr
    have hE : 0 ≤ s / 2 * Real.exp (-(21 / 20) * s) := by positivity
    calc |Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s))
        ≤ (ts.map fun t => |(t.2 : ℝ)| * s ^ t.1.1 * s ^ t.1.2.1 * (s / 2) ^ t.1.2.2).sum
            * (s / 2 * Real.exp (-(21 / 20) * s)) :=
          mul_le_mul_of_nonneg_right (h1.trans h2) hE
      _ = X := by
          rw [hX, list_sum_mul]
          congr 1
          refine List.map_congr_left fun t _ => ?_
          rw [div_pow, pow_add, pow_add, pow_succ]
          field_simp
          ring
  -- `X ≤ e^{−63} · tot ≤ 1/10`
  have hXle : X ≤ 1 / 10 := by
    have h1 : X ≤ (ts.map fun t => |(t.2 : ℝ)| / 2 ^ (t.1.2.2 + 1)
        * (60 ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1) * Real.exp (-63))).sum := by
      refine list_sum_le _ _ _ fun t ht => ?_
      refine mul_le_mul_of_nonneg_left (pow_mul_exp_le ?_ h60) (by positivity)
      have := hdeg t ht; simp only [DEG] at this; omega
    have hfar' := hfar
    simp only [farOK, decide_eq_true_eq] at hfar'
    rw [foldl_add_rat (fun t : (ℕ × ℕ × ℕ) × ℚ => (if t.2 < 0 then -t.2 else t.2) / (2 : ℚ) ^ (t.1.2.2 + 1)
      * (60 : ℚ) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1)), zero_add] at hfar'
    have hc := (Rat.cast_le (K := ℝ)).2 hfar'
    push_cast at hc
    rw [List.map_map] at hc
    have habs : ∀ q : ℚ, ((if q < 0 then -q else q : ℚ) : ℝ) = |(q : ℝ)| := fun q => by
      split_ifs with h
      · rw [abs_of_neg (by exact_mod_cast h)]; push_cast; ring
      · rw [abs_of_nonneg (by exact_mod_cast not_lt.1 h)]
    have e1 : (ts.map fun t => |(t.2 : ℝ)| / 2 ^ (t.1.2.2 + 1)
        * (60 ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1) * Real.exp (-63))).sum
        = (ts.map ((fun r : ℚ => (r : ℝ)) ∘ fun t => (if t.2 < 0 then -t.2 else t.2)
            / (2 : ℚ) ^ (t.1.2.2 + 1) * (60 : ℚ) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1))).sum
          * Real.exp (-63) := by
      rw [list_sum_mul]
      congr 1
      refine List.map_congr_left fun t _ => ?_
      simp only [Function.comp]
      push_cast
      rw [habs]; ring
    rw [e1] at h1
    have hq : (0 : ℝ) < (qn : ℝ) ^ 63 := by rw [qn]; positivity
    have h63 := exp_63_ge
    have hexp : Real.exp (-63) * Real.exp 63 = 1 := by rw [← Real.exp_add]; norm_num
    set T := (ts.map ((fun r : ℚ => (r : ℝ)) ∘ fun t => (if t.2 < 0 then -t.2 else t.2)
            / (2 : ℚ) ^ (t.1.2.2 + 1) * (60 : ℚ) ^ (t.1.1 + t.1.2.1 + t.1.2.2 + 1))).sum
    have hT : T ≤ 1 / 10 * ((qd : ℝ) / qn) ^ 63 := by
      rw [div_pow, mul_div_assoc', le_div_iff₀ hq]; exact hc
    calc X ≤ T * Real.exp (-63) := h1
      _ ≤ 1 / 10 * Real.exp 63 * Real.exp (-63) := by
          refine mul_le_mul_of_nonneg_right (hT.trans ?_) (Real.exp_pos _).le
          exact mul_le_mul_of_nonneg_left h63 (by norm_num)
      _ = 1 / 10 := by rw [mul_assoc, mul_comm (Real.exp 63), hexp, mul_one]
  -- conclude
  have hUVW : U * V - W ^ 2 ≤ (s / 2) ^ 2 := by nlinarith [sq_nonneg W]
  have hUVW0 : 0 ≤ U * V - W ^ 2 := by linarith
  have he : Real.exp (-(21 / 10) * (U + V)) = Real.exp (-(21 / 20) * s) ^ 2 := by
    rw [← Real.exp_nat_mul]; congr 1; rw [hs_def]; push_cast; ring
  unfold gphi
  rw [he]
  have hA : (U * V - W ^ 2) * Real.exp (-(21 / 20) * s) ^ 2 * Ssum ts U V W ^ 2
      ≤ (|Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s))) ^ 2 := by
    rw [mul_pow, mul_pow, sq_abs]
    have : 0 ≤ Real.exp (-(21 / 20) * s) ^ 2 * Ssum ts U V W ^ 2 := by positivity
    nlinarith
  have hB : (|Ssum ts U V W| * (s / 2 * Real.exp (-(21 / 20) * s))) ^ 2 ≤ (1 / 10) ^ 2 :=
    pow_le_pow_left₀ (by positivity) (hS.trans hXle) 2
  linarith [show ((1 : ℝ) / 10) ^ 2 = 1 / 100 by norm_num]

/-! ### The range checks -/

/-- A passing range check gives the admissibility, the far field and every cube of the range. -/
lemma phiRangeOK_cube {strs trees : List String} {lo hi : ℕ} (h : phiRangeOK strs trees lo hi = true) :
    termsOK (strs.map parseTerm) = true ∧ farOK (strs.map parseTerm) = true ∧
      ∀ i, lo ≤ i → i < hi →
        phiCubeOK (commonDen (strs.map parseTerm)) (denseA0 (strs.map parseTerm)) trees i = true := by
  simp only [phiRangeOK, phiHeadOK, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  exact ⟨h1, h2, fun i hlo hhi => h3 i (List.mem_range'_1.2 ⟨hlo, by omega⟩)⟩

end

end Grothe.UpperChaos
