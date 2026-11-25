import Haagerup.CellHermite
import Haagerup.SchurHardy
import Mathlib.Analysis.Calculus.Deriv.Polynomial

set_option warningAsError true
set_option maxRecDepth 2000
set_option exponentiation.threshold 2048

/-!
# Soundness of `lagTable1024`, `computeTigMu` and the smoothed row checker

Proves:
1. Soundness of 1024-bit integer interval arithmetic (`ivAddL`, `ivSubL`, `ivMulIntL`, `ivDivPosL`),
   `expNegSArr`, `f0AndBdy0`, `lagRecLoop`, and `lagTable1024`;
2. Soundness of `binomArr251`, `bTable1024`, `extractBMids`, `modeOverlapsAt`, and `dotMidErr`;
3. `mem_muTigOf`: `computeTigMu creArr cimArr = (true, tigMuList)` implies
   `∀ k < 251, mem (muTigOf creArr cimArr k) (tigMuList.getD k zeroI)`;
4. The ingredients of the smoothed row checker `computeSmoothedRows` (`flatIdx_ofFn_props`, `bTable1024_sound`,
   `extractBMids_sound`, `t1Cell_sound`, `dotT1_sound`), assembled in `SmoothedRows.lean` and `CellOverlap.lean`.

-/

namespace Haagerup

open Finset Polynomial Real
open HaagerupKernel HaagerupKernel.Cell

noncomputable section

private lemma array_getD_lt {α : Type*} (xs : Array α) (i : ℕ) (d : α) (h : i < xs.size) :
    xs.getD i d = xs[i] := by
  simp [Array.getD, h]

lemma array_ofFn_getD {α : Type*} {n : ℕ} (f : Fin n → α) (i : ℕ) (d : α) (h : i < n) :
    (Array.ofFn f).getD i d = f ⟨i, h⟩ := by
  rw [array_getD_lt (Array.ofFn f) i d (by rw [Array.size_ofFn]; exact h), Array.getElem_ofFn]

private lemma array_push_getD_lt {α : Type*} (xs : Array α) (x d : α) {i : ℕ} (h : i < xs.size) :
    (xs.push x).getD i d = xs.getD i d := by
  rw [array_getD_lt (xs.push x) i d (by rw [Array.size_push]; omega),
    Array.getElem_push_lt h, array_getD_lt xs i d h]

private lemma array_push_getD_eq {α : Type*} (xs : Array α) (x d : α) {i : ℕ} (h : xs.size = i) :
    (xs.push x).getD i d = x := by
  subst h
  rw [array_getD_lt (xs.push x) xs.size d (by rw [Array.size_push]; omega), Array.getElem_push_eq]

private lemma list_getD_lt {α : Type*} (xs : List α) (i : ℕ) (d : α) (h : i < xs.length) :
    xs.getD i d = xs[i] := by
  simp [List.getD, h]

private lemma list_ofFn_getD {α : Type*} {n : ℕ} (f : Fin n → α) (i : ℕ) (d : α) (h : i < n) :
    (List.ofFn f).getD i d = f ⟨i, h⟩ := by
  rw [list_getD_lt (List.ofFn f) i d (by rw [List.length_ofFn]; exact h), List.getElem_ofFn]

/-! ### 1. 1024-bit integer-interval soundness (`dLag = 2¹⁰²⁴`) -/

def memLag (x : ℝ) (iv : Int × Int) : Prop :=
  (iv.1 : ℝ) ≤ x * (dLag : ℝ) ∧ x * (dLag : ℝ) ≤ (iv.2 : ℝ)

lemma dLag_pos : (0 : ℝ) < (dLag : ℝ) := by unfold dLag; positivity

lemma dLag_pos_int : (0 : ℤ) < dLag := by unfold dLag; positivity

lemma ediv_le_of_mul {m d : ℤ} {r : ℝ} (hd : 0 < d) (h : (m : ℝ) ≤ r * (d : ℝ)) :
    ((m / d : ℤ) : ℝ) ≤ r := by
  have hdR : (0 : ℝ) < (d : ℝ) := by exact_mod_cast hd
  have h1 : ((m / d : ℤ) : ℝ) * (d : ℝ) ≤ (m : ℝ) := by exact_mod_cast Int.ediv_mul_le m hd.ne'
  exact le_of_mul_le_mul_right (h1.trans h) hdR

lemma le_neg_ediv_neg_of_mul {m d : ℤ} {r : ℝ} (hd : 0 < d) (h : r * (d : ℝ) ≤ (m : ℝ)) :
    r ≤ ((-((-m) / d) : ℤ) : ℝ) := by
  have hdR : (0 : ℝ) < (d : ℝ) := by exact_mod_cast hd
  have h1 : (((-m) / d : ℤ) : ℝ) * (d : ℝ) ≤ -(m : ℝ) := by
    exact_mod_cast Int.ediv_mul_le (-m) hd.ne'
  push_cast
  exact le_of_mul_le_mul_right (by linarith) hdR

lemma ivAddL_sound {x y : ℝ} {a b : Int × Int} (hx : memLag x a) (hy : memLag y b) :
    memLag (x + y) (ivAddL a b) := by
  unfold memLag ivAddL at *
  push_cast
  exact ⟨by linarith [hx.1, hy.1], by linarith [hx.2, hy.2]⟩

lemma ivSubL_sound {x y : ℝ} {a b : Int × Int} (hx : memLag x a) (hy : memLag y b) :
    memLag (x - y) (ivSubL a b) := by
  unfold memLag ivSubL at *
  push_cast
  exact ⟨by linarith [hx.1, hy.2], by linarith [hx.2, hy.1]⟩

lemma ivMulIntL_sound {x : ℝ} {a : Int × Int} (hx : memLag x a) (c : ℤ) :
    memLag (x * (c : ℝ)) (ivMulIntL a c) := by
  unfold memLag ivMulIntL at *
  split_ifs with hc
  · have hcR : (0 : ℝ) ≤ (c : ℝ) := by exact_mod_cast hc
    push_cast
    exact ⟨(mul_le_mul_of_nonneg_right hx.1 hcR).trans_eq (by ring),
      (le_of_eq (by ring)).trans (mul_le_mul_of_nonneg_right hx.2 hcR)⟩
  · have hcR : (c : ℝ) ≤ 0 := by exact_mod_cast (not_le.1 hc).le
    push_cast
    exact ⟨(mul_le_mul_of_nonpos_right hx.2 hcR).trans_eq (by ring),
      (le_of_eq (by ring)).trans (mul_le_mul_of_nonpos_right hx.1 hcR)⟩

lemma ivDivPosL_sound {x : ℝ} {a : Int × Int} (hx : memLag x a) {d : ℤ} (hd : 0 < d) :
    memLag (x / (d : ℝ)) (ivDivPosL a d) := by
  unfold memLag ivDivPosL at *
  have hdR : (0 : ℝ) < (d : ℝ) := by exact_mod_cast hd
  have heq : x / (d : ℝ) * (dLag : ℝ) * (d : ℝ) = x * (dLag : ℝ) := by field_simp
  exact ⟨ediv_le_of_mul hd (heq ▸ hx.1), le_neg_ediv_neg_of_mul hd (heq.symm ▸ hx.2)⟩

/-! ### 2. Soundness of `expNegS` (`exp(-9 i² / 1024)` for `i ≤ 64`) -/

private def expPartial (M : ℕ) (x : ℝ) : ℝ :=
  ∑ k ∈ range (M + 1), x ^ k / (k.factorial : ℝ)

private lemma hasDerivAt_expPartial : ∀ M : ℕ, ∀ x : ℝ,
    HasDerivAt (expPartial M) (∑ k ∈ range M, x ^ k / (k.factorial : ℝ)) x
  | 0, x => by
    have he : expPartial 0 = fun _ => (1 : ℝ) := by funext t; simp [expPartial]
    rw [he, sum_range_zero]
    exact hasDerivAt_const x 1
  | M + 1, x => by
    have he : expPartial (M + 1) =
        fun t => expPartial M t + t ^ (M + 1) / ((M + 1).factorial : ℝ) := by
      funext t; simp [expPartial, sum_range_succ]
    rw [he, sum_range_succ]
    refine (hasDerivAt_expPartial M x).add ?_
    refine ((hasDerivAt_pow (M + 1) x).div_const ((M + 1).factorial : ℝ)).congr_deriv ?_
    rw [Nat.factorial_succ]
    push_cast
    have hne : (M : ℝ) + 1 ≠ 0 := by positivity
    field_simp

private lemma expPartial_zero (M : ℕ) : expPartial M 0 = 1 := by
  rw [expPartial, sum_eq_single 0]
  · simp
  · intro k _ hk; simp [zero_pow hk]
  · simp

private lemma exp_taylor_480_bounds {s : ℝ} (hs0 : 0 ≤ s) (hs36 : s ≤ 36) :
    expPartial 480 s ≤ Real.exp s ∧
      Real.exp s ≤ expPartial 480 s + 2 * (s ^ 481 / ((481 : ℕ).factorial : ℝ)) := by
  have hd_neg_exp : ∀ x : ℝ, HasDerivAt (fun t => Real.exp (-t)) (-Real.exp (-x)) x := fun x =>
    ((Real.hasDerivAt_exp (-x)).comp x (hasDerivAt_id x).neg).congr_deriv (by ring)
  set h1 : ℝ → ℝ := fun x => Real.exp (-x) * expPartial 480 x
  set h1' : ℝ → ℝ := fun x => -Real.exp (-x) * (x ^ 480 / ((480 : ℕ).factorial : ℝ))
  have hd1 : ∀ x : ℝ, HasDerivAt h1 (h1' x) x := fun x => by
    refine ((hd_neg_exp x).mul (hasDerivAt_expPartial 480 x)).congr_deriv ?_
    dsimp only [expPartial, h1']
    rw [sum_range_succ]
    generalize ((480 : ℕ).factorial : ℝ) = f480
    generalize (∑ k ∈ range 480, x ^ k / (k.factorial : ℝ)) = s480
    ring
  have hint1 : IntervalIntegrable h1' MeasureTheory.volume 0 s :=
    (by unfold h1'; fun_prop : Continuous h1').intervalIntegrable 0 s
  have hftc1 := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun x _ => hd1 x) hint1
  have hle1 : ∫ x in (0 : ℝ)..s, h1' x ≤ 0 := by
    have hnn : 0 ≤ ∫ x in (0 : ℝ)..s, -h1' x := by
      refine intervalIntegral.integral_nonneg hs0 fun x hx => ?_
      dsimp only [h1']
      have hx0 := hx.1
      have := Nat.factorial_pos 480
      rw [neg_mul, neg_neg]
      positivity
    rw [intervalIntegral.integral_neg] at hnn
    linarith
  have hh1_0 : h1 0 = 1 := by simp [h1, expPartial_zero]
  have hlow : expPartial 480 s ≤ Real.exp s := by
    have hle : Real.exp (-s) * expPartial 480 s ≤ 1 := by dsimp only [h1] at hftc1; linarith
    have hm := mul_le_mul_of_nonneg_left hle (Real.exp_pos s).le
    rwa [← mul_assoc, ← Real.exp_add, add_neg_cancel, Real.exp_zero, one_mul, mul_one] at hm
  set h2 : ℝ → ℝ := fun x =>
    Real.exp (-x) * (expPartial 480 x + 2 * (x ^ 481 / ((481 : ℕ).factorial : ℝ)))
  set h2' : ℝ → ℝ := fun x =>
    Real.exp (-x) * (x ^ 480 / ((480 : ℕ).factorial : ℝ)) * (1 - 2 * x / 481)
  have hd2 : ∀ x : ℝ, HasDerivAt h2 (h2' x) x := fun x => by
    have hd_last : HasDerivAt (fun t : ℝ => 2 * (t ^ 481 / ((481 : ℕ).factorial : ℝ)))
        (2 * (x ^ 480 / ((480 : ℕ).factorial : ℝ))) x := by
      refine (((hasDerivAt_pow 481 x).div_const ((481 : ℕ).factorial : ℝ)).const_mul 2).congr_deriv ?_
      rw [show (481 : ℕ) = 480 + 1 from rfl, Nat.factorial_succ]
      generalize hfac_eq : (480 : ℕ).factorial = f480
      have hf_pos : 0 < f480 := hfac_eq ▸ Nat.factorial_pos 480
      have hf_ne : (f480 : ℝ) ≠ 0 := by exact_mod_cast hf_pos.ne'
      push_cast; field_simp
    refine ((hd_neg_exp x).mul ((hasDerivAt_expPartial 480 x).add hd_last)).congr_deriv ?_
    dsimp only [Pi.add_apply, expPartial, h2']
    rw [sum_range_succ _ 480, show (481 : ℕ) = 480 + 1 from rfl, Nat.factorial_succ, pow_succ]
    generalize hfac_eq : (480 : ℕ).factorial = f480
    have hf_pos : 0 < f480 := hfac_eq ▸ Nat.factorial_pos 480
    have hf_ne : (f480 : ℝ) ≠ 0 := by exact_mod_cast hf_pos.ne'
    generalize (∑ k ∈ range 480, x ^ k / (k.factorial : ℝ)) = s480
    push_cast
    field_simp
    ring
  have hint2 : IntervalIntegrable h2' MeasureTheory.volume 0 s :=
    (by unfold h2'; fun_prop : Continuous h2').intervalIntegrable 0 s
  have hftc2 := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun x _ => hd2 x) hint2
  have hge2 : 0 ≤ ∫ x in (0 : ℝ)..s, h2' x := by
    refine intervalIntegral.integral_nonneg hs0 fun x hx => ?_
    dsimp only [h2']
    have hx0 := hx.1
    have hxs : x ≤ 36 := hx.2.trans hs36
    have h1x : 0 ≤ 1 - 2 * x / 481 := by linarith
    have hf_pos := Nat.factorial_pos 480
    generalize (480 : ℕ).factorial = f480 at hf_pos ⊢
    positivity
  have hh2_0 : h2 0 = 1 := by simp [h2, expPartial_zero, zero_pow (by omega : (481 : ℕ) ≠ 0)]
  have hhigh : Real.exp s ≤ expPartial 480 s + 2 * (s ^ 481 / ((481 : ℕ).factorial : ℝ)) := by
    have hge : 1 ≤ h2 s := by linarith
    have hm := mul_le_mul_of_nonneg_left hge (Real.exp_pos s).le
    dsimp only [h2] at hm
    rwa [← mul_assoc, ← Real.exp_add, add_neg_cancel, Real.exp_zero, one_mul, mul_one] at hm
  exact ⟨hlow, hhigh⟩

private lemma expPosLoop_sound {i : ℕ} (sNum : ℤ) (hsNum : sNum = Int.ofNat (9 * i * i)) :
    ∀ (rem k : ℕ) (term acc : Int × Int),
      1 ≤ k →
      memLag (((9 * (i : ℝ) ^ 2 / 1024) ^ (k - 1)) / ((k - 1).factorial : ℝ)) term →
      memLag (∑ j ∈ range k, ((9 * (i : ℝ) ^ 2 / 1024) ^ j) / (j.factorial : ℝ)) acc →
      let res := expPosLoop sNum rem k term acc
      memLag (((9 * (i : ℝ) ^ 2 / 1024) ^ (k - 1 + rem)) / ((k - 1 + rem).factorial : ℝ)) res.1 ∧
        memLag (∑ j ∈ range (k + rem), ((9 * (i : ℝ) ^ 2 / 1024) ^ j) / (j.factorial : ℝ)) res.2
  | 0, k, term, acc, _, hterm, hacc => by
    simp only [expPosLoop, add_zero]
    exact ⟨hterm, hacc⟩
  | rem + 1, k, term, acc, hk1, hterm, hacc => by
    simp only [expPosLoop]
    set s : ℝ := 9 * (i : ℝ) ^ 2 / 1024
    have hsNumR : (sNum : ℝ) = 9 * (i : ℝ) ^ 2 := by
      rw [hsNum]; push_cast [Int.ofNat_eq_natCast]; ring
    have hden_pos : (0 : ℤ) < Int.ofNat (1024 * k) := by
      simp only [Int.ofNat_eq_natCast]; omega
    have hmul : memLag ((s ^ (k - 1) / ((k - 1).factorial : ℝ)) * (sNum : ℝ))
        (term.1 * sNum, term.2 * sNum) := by
      have hm := ivMulIntL_sound hterm sNum
      have hs0 : 0 ≤ sNum := by rw [hsNum]; simp only [Int.ofNat_eq_natCast]; positivity
      simpa [ivMulIntL, hs0] using hm
    have hdiv := ivDivPosL_sound hmul hden_pos
    have hval : (s ^ (k - 1) / ((k - 1).factorial : ℝ)) * (sNum : ℝ) /
        ((Int.ofNat (1024 * k) : ℤ) : ℝ) = s ^ k / (k.factorial : ℝ) := by
      rcases k with _ | m
      · omega
      rw [Nat.add_sub_cancel, Nat.factorial_succ]
      have hs1024 : 9 * (i : ℝ) ^ 2 = s * 1024 := by dsimp only [s]; ring
      rw [hsNumR, hs1024, pow_succ s m]
      push_cast [Int.ofNat_eq_natCast]
      have hmfac : (m.factorial : ℝ) ≠ 0 := by exact_mod_cast (Nat.factorial_pos m).ne'
      have hm1 : (m : ℝ) + 1 ≠ 0 := by positivity
      field_simp
    rw [hval] at hdiv
    have hacc' : memLag (∑ j ∈ range (k + 1), s ^ j / (j.factorial : ℝ))
        (ivAddL acc (ivDivPosL (term.1 * sNum, term.2 * sNum) (Int.ofNat (1024 * k)))) := by
      rw [sum_range_succ]
      exact ivAddL_sound hacc hdiv
    have ih := expPosLoop_sound sNum hsNum rem (k + 1) _ _ (by omega)
      (by simpa using hdiv) hacc'
    simpa [show k + (rem + 1) = k + 1 + rem by omega,
      show k - 1 + (rem + 1) = k + rem by omega] using ih

theorem expNegS_sound {i : ℕ} (hi : i ≤ 64) :
    memLag (Real.exp (-(3 * (i : ℝ) / 32) ^ 2)) (expNegS i) := by
  unfold expNegS
  rcases Nat.eq_zero_or_pos i with rfl | hi_pos
  · simp [memLag]
  · have hib : (i == 0) = false := beq_false_of_ne hi_pos.ne'
    rw [hib]
    dsimp only
    set s : ℝ := 9 * (i : ℝ) ^ 2 / 1024
    have hs_eq : (3 * (i : ℝ) / 32) ^ 2 = s := by dsimp only [s]; ring
    rw [hs_eq]
    have hs0 : 0 ≤ s := by dsimp only [s]; positivity
    have hs36 : s ≤ 36 := by
      dsimp only [s]
      have hiR : (i : ℝ) ≤ 64 := by exact_mod_cast hi
      nlinarith [show (0 : ℝ) ≤ i by positivity]
    have hd1 : memLag (s ^ 0 / ((0 : ℕ).factorial : ℝ)) (dLag, dLag) := by simp [memLag]
    have hd2 : memLag (∑ j ∈ range 1, s ^ j / (j.factorial : ℝ)) (dLag, dLag) := by simp [memLag]
    obtain ⟨hterm, hacc⟩ := expPosLoop_sound (i := i) (Int.ofNat (9 * i * i)) rfl 480 1
      (dLag, dLag) (dLag, dLag) le_rfl hd1 hd2
    set termLast := (expPosLoop (Int.ofNat (9 * i * i)) 480 1 (dLag, dLag) (dLag, dLag)).1
    set acc := (expPosLoop (Int.ofNat (9 * i * i)) 480 1 (dLag, dLag) (dLag, dLag)).2
    change memLag (s ^ 480 / ((480 : ℕ).factorial : ℝ)) termLast at hterm
    obtain ⟨hexp_lo, hexp_hi⟩ := exp_taylor_480_bounds hs0 hs36
    have hacc1_ge : dLag ≤ acc.1 := by
      have hloop_ge : ∀ (rem k : ℕ) (t a : Int × Int), 0 ≤ t.1 → dLag ≤ a.1 →
          dLag ≤ (expPosLoop (Int.ofNat (9 * i * i)) rem k t a).2.1 := by
        intro rem
        induction rem with
        | zero => intro _ _ a _ ha; exact ha
        | succ rem ih =>
          intro k t a ht ha
          simp only [expPosLoop]
          have hmul0 : 0 ≤ t.1 * Int.ofNat (9 * i * i) :=
            mul_nonneg ht (by simp only [Int.ofNat_eq_natCast]; positivity)
          have hdiv0 : 0 ≤ (ivDivPosL (t.1 * Int.ofNat (9 * i * i), t.2 * Int.ofNat (9 * i * i))
              (Int.ofNat (1024 * k))).1 :=
            Int.ediv_nonneg hmul0 (by simp only [Int.ofNat_eq_natCast]; positivity)
          exact ih (k + 1) _ _ hdiv0 (by simp only [ivAddL]; omega)
      exact hloop_ge 480 1 (dLag, dLag) (dLag, dLag) dLag_pos_int.le le_rfl
    have hacc1_pos : 0 < acc.1 := dLag_pos_int.trans_le hacc1_ge
    set sNum : ℤ := Int.ofNat (9 * i * i)
    set remHi : ℤ := 2 * (-((-termLast.2 * sNum) / Int.ofNat (1024 * 481)))
    have hrem_le : 2 * (s ^ 481 / ((481 : ℕ).factorial : ℝ)) * (dLag : ℝ) ≤ (remHi : ℝ) := by
      have hden_pos : (0 : ℤ) < Int.ofNat (1024 * 481) := by
        simp only [Int.ofNat_eq_natCast]; positivity
      have hsNum_nonneg : (0 : ℝ) ≤ (sNum : ℝ) := by
        dsimp only [sNum]; simp only [Int.ofNat_eq_natCast]; positivity
      have ht_hi : (s ^ 480 / ((480 : ℕ).factorial : ℝ)) * (sNum : ℝ) * (dLag : ℝ) ≤
          ((termLast.2 * sNum : ℤ) : ℝ) := by
        push_cast
        have := mul_le_mul_of_nonneg_right hterm.2 hsNum_nonneg
        linarith [show (s ^ 480 / ((480 : ℕ).factorial : ℝ)) * (dLag : ℝ) * (sNum : ℝ) =
          (s ^ 480 / ((480 : ℕ).factorial : ℝ)) * (sNum : ℝ) * (dLag : ℝ) by ring]
      have hval481 : (s ^ 481 / ((481 : ℕ).factorial : ℝ)) * (dLag : ℝ) *
          ((Int.ofNat (1024 * 481) : ℤ) : ℝ) =
          (s ^ 480 / ((480 : ℕ).factorial : ℝ)) * (sNum : ℝ) * (dLag : ℝ) := by
        have hsNumR : (sNum : ℝ) = s * 1024 := by
          dsimp only [sNum, s]; push_cast [Int.ofNat_eq_natCast]; ring
        rw [show (481 : ℕ) = 480 + 1 from rfl, Nat.factorial_succ, pow_succ s 480, hsNumR]
        generalize hfac_eq : (480 : ℕ).factorial = f480
        have hf_pos : 0 < f480 := hfac_eq ▸ Nat.factorial_pos 480
        have hf_ne : (f480 : ℝ) ≠ 0 := by exact_mod_cast hf_pos.ne'
        generalize s ^ 480 = sp480
        push_cast [Int.ofNat_eq_natCast]
        field_simp
        ring
      have hceil := le_neg_ediv_neg_of_mul hden_pos (hval481.trans_le ht_hi)
      dsimp only [remHi]
      rw [show -termLast.2 * sNum = -(termLast.2 * sNum) by ring]
      push_cast at hceil ⊢
      linarith
    set accHi : ℤ := acc.2 + remHi
    have hexp_s_hi : Real.exp s * (dLag : ℝ) ≤ (accHi : ℝ) := by
      have h1 : expPartial 480 s * (dLag : ℝ) ≤ (acc.2 : ℝ) := hacc.2
      have h2 := mul_le_mul_of_nonneg_right hexp_hi dLag_pos.le
      rw [add_mul] at h2
      dsimp only [accHi]; push_cast; linarith
    have hexp_s_lo : (acc.1 : ℝ) ≤ Real.exp s * (dLag : ℝ) :=
      hacc.1.trans (mul_le_mul_of_nonneg_right hexp_lo dLag_pos.le)
    have haccHi_pos : 0 < accHi := by
      have hposR : (0 : ℝ) < (accHi : ℝ) := (mul_pos (Real.exp_pos s) dLag_pos).trans_le hexp_s_hi
      exact_mod_cast hposR
    rw [Real.exp_neg]
    refine ⟨ediv_le_of_mul haccHi_pos ?_, le_neg_ediv_neg_of_mul hacc1_pos ?_⟩
    · have hm := mul_le_mul_of_nonneg_left hexp_s_hi
        (mul_nonneg (inv_nonneg.2 (Real.exp_pos s).le) dLag_pos.le)
      push_cast
      calc ((dLag : ℝ) * dLag)
          = (Real.exp s)⁻¹ * (dLag : ℝ) * (Real.exp s * (dLag : ℝ)) := by
            field_simp [(Real.exp_pos s).ne']
        _ ≤ (Real.exp s)⁻¹ * (dLag : ℝ) * (accHi : ℝ) := hm
    · have hm := mul_le_mul_of_nonneg_left hexp_s_lo
        (mul_nonneg (inv_nonneg.2 (Real.exp_pos s).le) dLag_pos.le)
      push_cast
      calc (Real.exp s)⁻¹ * (dLag : ℝ) * (acc.1 : ℝ)
          ≤ (Real.exp s)⁻¹ * (dLag : ℝ) * (Real.exp s * (dLag : ℝ)) := hm
        _ = (dLag : ℝ) * dLag := by field_simp [(Real.exp_pos s).ne']

lemma expNegSArr_sound {i : ℕ} (hi : i ≤ 64) :
    memLag (Real.exp (-(3 * (i : ℝ) / 32) ^ 2)) (expNegSArr.getD i (0, 0)) := by
  unfold expNegSArr
  rw [array_ofFn_getD _ i (0, 0) (by omega)]
  exact expNegS_sound hi

/-! ### 3. Soundness of `f0AndBdy0`, `lagRecLoop`, and `lagTable1024` -/

def F0Val (a : ℕ) (r : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..r, 2 * t ^ (a + 1) * Real.exp (-t ^ 2)

def bdyVal (a n : ℕ) (r : ℝ) : ℝ :=
  r ^ (a + 2) * Real.exp (-r ^ 2) * (rTilde n a).eval (r ^ 2)

private def gamCoeff (a : ℕ) : ℕ → ℝ
  | 0 => 2 / (a + 2 : ℝ)
  | k + 1 => gamCoeff a k * (2 / (a + 2 + 2 * (k + 1) : ℝ))

private lemma gamCoeff_pos (a : ℕ) : ∀ k : ℕ, 0 < gamCoeff a k
  | 0 => by unfold gamCoeff; positivity
  | k + 1 => by unfold gamCoeff; have := gamCoeff_pos a k; positivity

private def gamTerm (a k : ℕ) (r : ℝ) : ℝ :=
  gamCoeff a k * r ^ (a + 2 + 2 * k) * Real.exp (-r ^ 2)

private lemma hasDerivAt_gamTerm (a k : ℕ) (r : ℝ) :
    HasDerivAt (gamTerm a k)
      (((a + 2 + 2 * k : ℝ) * gamCoeff a k * r ^ (a + 1 + 2 * k) -
        2 * gamCoeff a k * r ^ (a + 3 + 2 * k)) * Real.exp (-r ^ 2)) r := by
  unfold gamTerm
  have hd_pow : HasDerivAt (fun t : ℝ => gamCoeff a k * t ^ (a + 2 + 2 * k))
      (gamCoeff a k * ((a + 2 + 2 * k : ℕ) : ℝ) * r ^ (a + 1 + 2 * k)) r := by
    refine ((hasDerivAt_pow (a + 2 + 2 * k) r).const_mul (gamCoeff a k)).congr_deriv ?_
    rw [show a + 2 + 2 * k - 1 = a + 1 + 2 * k by omega]
    ring
  have hd_exp : HasDerivAt (fun t : ℝ => Real.exp (-t ^ 2)) (-2 * r * Real.exp (-r ^ 2)) r := by
    refine ((Real.hasDerivAt_exp (-r ^ 2)).comp r (hasDerivAt_pow 2 r).neg).congr_deriv ?_
    ring
  refine (hd_pow.mul hd_exp).congr_deriv ?_
  have hpow : r ^ (a + 2 + 2 * k) * r = r ^ (a + 3 + 2 * k) := by
    rw [← pow_succ, show a + 2 + 2 * k + 1 = a + 3 + 2 * k by omega]
  push_cast
  linear_combination (-2 * gamCoeff a k * Real.exp (-r ^ 2)) * hpow

private lemma hasDerivAt_gamPartial (a : ℕ) : ∀ M : ℕ, ∀ r : ℝ,
    HasDerivAt (fun t => ∑ k ∈ range (M + 1), gamTerm a k t)
      ((2 * r ^ (a + 1) - 2 * gamCoeff a M * r ^ (a + 3 + 2 * M)) * Real.exp (-r ^ 2)) r
  | 0, r => by
    have he : (fun t => ∑ k ∈ range 1, gamTerm a k t) = gamTerm a 0 := by funext t; simp
    rw [he]
    refine (hasDerivAt_gamTerm a 0 r).congr_deriv ?_
    simp only [gamCoeff, Nat.cast_zero, mul_zero, add_zero]
    have hne : (a : ℝ) + 2 ≠ 0 := by positivity
    rw [mul_div_cancel₀ 2 hne]
  | M + 1, r => by
    have he : (fun t => ∑ k ∈ range (M + 2), gamTerm a k t) =
        fun t => (∑ k ∈ range (M + 1), gamTerm a k t) + gamTerm a (M + 1) t := by
      funext t; exact sum_range_succ _ (M + 1)
    rw [he]
    refine ((hasDerivAt_gamPartial a M r).add (hasDerivAt_gamTerm a (M + 1) r)).congr_deriv ?_
    have hc : (a + 2 + 2 * (M + 1 : ℕ) : ℝ) * gamCoeff a (M + 1) = 2 * gamCoeff a M := by
      conv_lhs => rw [gamCoeff]
      have hne : (a : ℝ) + 2 + 2 * ((M : ℝ) + 1) ≠ 0 := by positivity
      push_cast; field_simp
    have h1 : a + 1 + 2 * (M + 1) = a + 3 + 2 * M := by omega
    rw [h1]
    linear_combination (r ^ (a + 3 + 2 * M) * Real.exp (-r ^ 2)) * hc

private lemma F0Val_series_480_bounds (a : ℕ) {r : ℝ} (hr0 : 0 ≤ r) (hr6 : r ≤ 6) :
    (∑ k ∈ range 481, gamTerm a k r) ≤ F0Val a r ∧
      F0Val a r ≤ (∑ k ∈ range 481, gamTerm a k r) + 2 * gamTerm a 481 r := by
  set S : ℝ → ℝ := fun t => ∑ k ∈ range 481, gamTerm a k t
  set S' : ℝ → ℝ := fun t =>
    (2 * t ^ (a + 1) - 2 * gamCoeff a 480 * t ^ (a + 3 + 2 * 480)) * Real.exp (-t ^ 2)
  have hS0 : S 0 = 0 := sum_eq_zero fun k _ => by
    simp [gamTerm, zero_pow (by omega : a + 2 + 2 * k ≠ 0)]
  have hintS : IntervalIntegrable S' MeasureTheory.volume 0 r :=
    (by unfold S'; fun_prop : Continuous S').intervalIntegrable 0 r
  have hintF : IntervalIntegrable (fun t : ℝ => 2 * t ^ (a + 1) * Real.exp (-t ^ 2))
      MeasureTheory.volume 0 r :=
    (by fun_prop : Continuous fun t : ℝ => 2 * t ^ (a + 1) * Real.exp (-t ^ 2)).intervalIntegrable 0 r
  have hftcS := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (fun t _ => hasDerivAt_gamPartial a 480 t) hintS
  have hlow : S r ≤ F0Val a r := by
    have hle := intervalIntegral.integral_mono_on hr0 hintS hintF fun t ht => by
      dsimp only [S']
      have ht0 := ht.1
      have hpos : 0 ≤ 2 * gamCoeff a 480 * t ^ (a + 3 + 2 * 480) * Real.exp (-t ^ 2) := by
        have hg := gamCoeff_pos a 480
        generalize gamCoeff a 480 = g480 at hg ⊢
        positivity
      linarith
    unfold F0Val
    linarith
  set U : ℝ → ℝ := fun t => S t + 2 * gamTerm a 481 t
  set U' : ℝ → ℝ := fun t =>
    (2 * t ^ (a + 1) +
      gamCoeff a 481 * ((a + 964 : ℝ) - 4 * t ^ 2) * t ^ (a + 963)) * Real.exp (-t ^ 2)
  have hdU : ∀ t : ℝ, HasDerivAt U (U' t) t := fun t => by
    refine ((hasDerivAt_gamPartial a 480 t).add ((hasDerivAt_gamTerm a 481 t).const_mul 2)).congr_deriv ?_
    dsimp only [U']
    have hc : (a + 2 + 2 * (481 : ℕ) : ℝ) * gamCoeff a 481 = 2 * gamCoeff a 480 := by
      rw [show (481 : ℕ) = 480 + 1 from rfl]
      conv_lhs => rw [gamCoeff]
      generalize gamCoeff a 480 = g480
      have hne : (a : ℝ) + 2 + 2 * ((480 : ℝ) + 1) ≠ 0 := by positivity
      push_cast; field_simp; ring
    have hpow : t ^ (a + 3 + 2 * 481) = t ^ 2 * t ^ (a + 963) := by
      rw [← pow_add, show a + 3 + 2 * 481 = 2 + (a + 963) by omega]
    have h1 : a + 3 + 2 * 480 = a + 963 := by omega
    have h2 : a + 1 + 2 * 481 = a + 963 := by omega
    rw [h1, h2, hpow]
    push_cast at hc
    generalize gamCoeff a 480 = g480 at hc ⊢
    generalize gamCoeff a 481 = g481 at hc ⊢
    linear_combination (t ^ (a + 963) * Real.exp (-t ^ 2)) * hc
  have hintU : IntervalIntegrable U' MeasureTheory.volume 0 r :=
    (by unfold U'; fun_prop : Continuous U').intervalIntegrable 0 r
  have hftcU := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun t _ => hdU t) hintU
  have hU0 : U 0 = 0 := by
    simp [U, hS0, gamTerm, zero_pow (by omega : a + 2 + 2 * 481 ≠ 0)]
  have hhigh : F0Val a r ≤ U r := by
    have hle := intervalIntegral.integral_mono_on hr0 hintF hintU fun t ht => by
      dsimp only [U']
      have ht0 := ht.1
      have htr : t ≤ 6 := ht.2.trans hr6
      have hcoef : 0 ≤ (a + 964 : ℝ) - 4 * t ^ 2 := by nlinarith
      have hpos : 0 ≤ gamCoeff a 481 * ((a + 964 : ℝ) - 4 * t ^ 2) *
          t ^ (a + 963) * Real.exp (-t ^ 2) := by
        have hg := gamCoeff_pos a 481
        generalize gamCoeff a 481 = g481 at hg ⊢
        positivity
      linarith
    unfold F0Val
    linarith
  exact ⟨hlow, hhigh⟩

private lemma gamSeriesLoop_sound {a i : ℕ} (sNum9 : ℤ) (hs : sNum9 = Int.ofNat (9 * i * i)) :
    ∀ (rem k : ℕ) (t s : Int × Int),
      1 ≤ k →
      memLag (gamTerm a (k - 1) (3 * (i : ℝ) / 32)) t →
      memLag (∑ j ∈ range k, gamTerm a j (3 * (i : ℝ) / 32)) s →
      let res := gamSeriesLoop sNum9 a rem k t s
      memLag (gamTerm a (k - 1 + rem) (3 * (i : ℝ) / 32)) res.1 ∧
        memLag (∑ j ∈ range (k + rem), gamTerm a j (3 * (i : ℝ) / 32)) res.2
  | 0, k, t, s, _, ht, hsAcc => by
    simp only [gamSeriesLoop, add_zero]
    exact ⟨ht, hsAcc⟩
  | rem + 1, k, t, s, hk1, ht, hsAcc => by
    simp only [gamSeriesLoop]
    set r : ℝ := 3 * (i : ℝ) / 32
    have hden_pos : (0 : ℤ) < Int.ofNat (512 * (a + 2 + 2 * k)) := by
      simp only [Int.ofNat_eq_natCast]; positivity
    have hmul : memLag (gamTerm a (k - 1) r * (sNum9 : ℝ)) (t.1 * sNum9, t.2 * sNum9) := by
      have hm := ivMulIntL_sound ht sNum9
      have hs0 : 0 ≤ sNum9 := by rw [hs]; simp only [Int.ofNat_eq_natCast]; positivity
      simpa [ivMulIntL, hs0] using hm
    have hdiv := ivDivPosL_sound hmul hden_pos
    have hval : gamTerm a (k - 1) r * (sNum9 : ℝ) /
        ((Int.ofNat (512 * (a + 2 + 2 * k)) : ℤ) : ℝ) = gamTerm a k r := by
      rcases k with _ | m
      · omega
      rw [Nat.add_sub_cancel]
      unfold gamTerm
      conv_rhs => rw [gamCoeff]
      rw [hs]
      generalize gamCoeff a m = gm
      have hpow : r ^ (a + 2 + 2 * (m + 1)) = r ^ (a + 2 + 2 * m) * r ^ 2 := by
        rw [← pow_add, show a + 2 + 2 * (m + 1) = a + 2 + 2 * m + 2 by omega]
      have hr2 : r ^ 2 = 9 * (i : ℝ) ^ 2 / 1024 := by dsimp only [r]; ring
      rw [hpow, hr2]
      generalize r ^ (a + 2 + 2 * m) = rp
      push_cast [Int.ofNat_eq_natCast]
      have hne : (a : ℝ) + 2 + 2 * ((m : ℝ) + 1) ≠ 0 := by positivity
      field_simp
      ring
    rw [hval] at hdiv
    have hsAcc' : memLag (∑ j ∈ range (k + 1), gamTerm a j r)
        (ivAddL s (ivDivPosL (t.1 * sNum9, t.2 * sNum9) (Int.ofNat (512 * (a + 2 + 2 * k))))) := by
      rw [sum_range_succ]
      exact ivAddL_sound hsAcc hdiv
    have ih := gamSeriesLoop_sound sNum9 hs rem (k + 1) _ _ (by omega)
      (by simpa using hdiv) hsAcc'
    simpa [show k + (rem + 1) = k + 1 + rem by omega,
      show k - 1 + (rem + 1) = k + rem by omega] using ih

theorem f0AndBdy0_sound (a : ℕ) {i : ℕ} (hi : i ≤ 64) :
    let res := f0AndBdy0 expNegSArr a i
    memLag (F0Val a (3 * (i : ℝ) / 32)) res.1 ∧
      memLag (bdyVal a 0 (3 * (i : ℝ) / 32)) res.2 := by
  dsimp only
  unfold f0AndBdy0
  rcases Nat.eq_zero_or_pos i with rfl | hi_pos
  · simp [F0Val, bdyVal, rTilde, memLag, zero_pow (by omega : a + 2 ≠ 0)]
  · have hib : (i == 0) = false := beq_false_of_ne hi_pos.ne'
    rw [hib]
    dsimp only
    set r : ℝ := 3 * (i : ℝ) / 32
    have hr0 : 0 ≤ r := by dsimp only [r]; positivity
    have hr6 : r ≤ 6 := by
      dsimp only [r]
      have hiR : (i : ℝ) ≤ 64 := by exact_mod_cast hi
      linarith
    have hexp := expNegSArr_sound hi
    set rPowNum : ℤ := Int.ofNat ((3 * i) ^ (a + 2))
    set rPowDen : ℤ := (2 : ℤ) ^ (5 * (a + 2))
    set e := expNegSArr.getD i (0, 0)
    set pref := ivDivPosL (e.1 * rPowNum, e.2 * rPowNum) rPowDen
    have hpref : memLag (bdyVal a 0 r) pref := by
      have hm := ivMulIntL_sound hexp rPowNum
      have hn0 : 0 ≤ rPowNum := by
        dsimp only [rPowNum]; simp only [Int.ofNat_eq_natCast]; positivity
      have hm' : memLag (Real.exp (-r ^ 2) * (rPowNum : ℝ)) (e.1 * rPowNum, e.2 * rPowNum) := by
        simpa [ivMulIntL, hn0] using hm
      have hd_pos : 0 < rPowDen := by dsimp only [rPowDen]; positivity
      have hdiv := ivDivPosL_sound hm' hd_pos
      have hbdy_eq : Real.exp (-r ^ 2) * (rPowNum : ℝ) / (rPowDen : ℝ) = bdyVal a 0 r := by
        have hrpow : r ^ (a + 2) = (rPowNum : ℝ) / (rPowDen : ℝ) := by
          dsimp only [r, rPowNum, rPowDen]
          push_cast [Int.ofNat_eq_natCast]
          rw [div_pow, show (32 : ℝ) = 2 ^ 5 by norm_num, ← pow_mul]
        unfold bdyVal rTilde
        simp only [eval_one, mul_one, hrpow]
        ring
      rwa [hbdy_eq] at hdiv
    set t0 := ivDivPosL (pref.1 * 2, pref.2 * 2) (Int.ofNat (a + 2))
    have ht0 : memLag (gamTerm a 0 r) t0 := by
      have hm := ivMulIntL_sound hpref 2
      have hm' : memLag (bdyVal a 0 r * 2) (pref.1 * 2, pref.2 * 2) := by
        simpa [ivMulIntL] using hm
      have hdiv := ivDivPosL_sound hm'
        (by simp only [Int.ofNat_eq_natCast]; positivity : (0 : ℤ) < Int.ofNat (a + 2))
      have heq : bdyVal a 0 r * 2 / ((Int.ofNat (a + 2) : ℤ) : ℝ) = gamTerm a 0 r := by
        unfold bdyVal gamTerm gamCoeff rTilde
        simp only [eval_one, mul_one, mul_zero, add_zero]
        push_cast [Int.ofNat_eq_natCast]; ring
      rwa [heq] at hdiv
    have hs0 : memLag (∑ j ∈ range 1, gamTerm a j r) t0 := by simpa using ht0
    set sNum9 : ℤ := Int.ofNat (9 * i * i)
    obtain ⟨htLast, hsAcc⟩ := gamSeriesLoop_sound (a := a) (i := i) sNum9 rfl 480 1 t0 t0
      le_rfl ht0 hs0
    change memLag (gamTerm a 480 r) (gamSeriesLoop sNum9 a 480 1 t0 t0).1 at htLast
    change memLag (∑ j ∈ range 481, gamTerm a j r) (gamSeriesLoop sNum9 a 480 1 t0 t0).2 at hsAcc
    generalize gamSeriesLoop sNum9 a 480 1 t0 t0 = gs at htLast hsAcc ⊢
    rcases gs with ⟨tLast, sAcc⟩
    dsimp only at htLast hsAcc ⊢
    obtain ⟨hF_lo, hF_hi⟩ := F0Val_series_480_bounds a hr0 hr6
    set rem : ℤ := 2 * (-((-tLast.2 * sNum9) / Int.ofNat (512 * (a + 2 + 2 * 481))))
    have hrem : 2 * gamTerm a 481 r * (dLag : ℝ) ≤ (rem : ℝ) := by
      have hden_pos : (0 : ℤ) < Int.ofNat (512 * (a + 2 + 2 * 481)) := by
        simp only [Int.ofNat_eq_natCast]; positivity
      have hs9_nonneg : (0 : ℝ) ≤ (sNum9 : ℝ) := by
        dsimp only [sNum9]; simp only [Int.ofNat_eq_natCast]; positivity
      have ht_hi : gamTerm a 480 r * (sNum9 : ℝ) * (dLag : ℝ) ≤ ((tLast.2 * sNum9 : ℤ) : ℝ) := by
        push_cast
        have := mul_le_mul_of_nonneg_right htLast.2 hs9_nonneg
        linarith [show gamTerm a 480 r * (dLag : ℝ) * (sNum9 : ℝ) =
          gamTerm a 480 r * (sNum9 : ℝ) * (dLag : ℝ) by ring]
      have hval481 : gamTerm a 481 r * (dLag : ℝ) *
          ((Int.ofNat (512 * (a + 2 + 2 * 481)) : ℤ) : ℝ) =
          gamTerm a 480 r * (sNum9 : ℝ) * (dLag : ℝ) := by
        rw [show (481 : ℕ) = 480 + 1 from rfl]
        unfold gamTerm
        conv_lhs => rw [gamCoeff]
        generalize gamCoeff a 480 = g480
        have hpow : r ^ (a + 2 + 2 * (480 + 1)) = r ^ (a + 2 + 2 * 480) * r ^ 2 := by
          rw [← pow_add, show a + 2 + 2 * (480 + 1) = a + 2 + 2 * 480 + 2 by omega]
        have hr2 : r ^ 2 = 9 * (i : ℝ) ^ 2 / 1024 := by dsimp only [r]; ring
        have hs9R : (sNum9 : ℝ) = 9 * (i : ℝ) ^ 2 := by
          dsimp only [sNum9]; push_cast [Int.ofNat_eq_natCast]; ring
        rw [hpow, hr2, hs9R]
        generalize r ^ (a + 2 + 2 * 480) = rp
        generalize Real.exp (-(9 * (i : ℝ) ^ 2 / 1024)) = ex
        push_cast [Int.ofNat_eq_natCast]
        have hne : (a : ℝ) + 2 + 2 * ((480 : ℝ) + 1) ≠ 0 := by
          linarith [Nat.cast_nonneg (α := ℝ) a]
        field_simp
        ring
      have hceil := le_neg_ediv_neg_of_mul hden_pos (hval481.trans_le ht_hi)
      dsimp only [rem]
      rw [show -tLast.2 * sNum9 = -(tLast.2 * sNum9) by ring]
      push_cast at hceil ⊢; linarith
    refine ⟨⟨hsAcc.1.trans (mul_le_mul_of_nonneg_right hF_lo dLag_pos.le), ?_⟩, hpref⟩
    have h2 := mul_le_mul_of_nonneg_right hF_hi dLag_pos.le
    rw [add_mul] at h2
    push_cast
    linarith [hsAcc.2]

private lemma cellLagInt_zero (a i : ℕ) :
    cellLagInt a 0 i =
      F0Val a (3 * ((i + 1 : ℕ) : ℝ) / 32) - F0Val a (3 * (i : ℝ) / 32) := by
  unfold cellLagInt F0Val
  simp only [rTilde, eval_one, mul_one]
  have hint : ∀ u v : ℝ, IntervalIntegrable
      (fun t : ℝ => 2 * t ^ (a + 1) * Real.exp (-t ^ 2)) MeasureTheory.volume u v :=
    fun u v => (by fun_prop : Continuous fun t : ℝ => 2 * t ^ (a + 1) * Real.exp (-t ^ 2)).intervalIntegrable u v
  exact (intervalIntegral.integral_interval_sub_left (hint _ _) (hint _ _)).symm

private lemma hasDerivAt_neg_bdyVal (a n : ℕ) (r : ℝ) :
    HasDerivAt (fun t => -bdyVal a n t)
      ((n + 1 : ℝ) * (2 * r ^ (a + 1) * Real.exp (-r ^ 2) * (rTilde (n + 1) a).eval (r ^ 2)) +
        ((2 * n + a : ℝ) / 2) * (2 * r ^ (a + 1) * Real.exp (-r ^ 2) * (rTilde n a).eval (r ^ 2))) r := by
  have hd_pow : HasDerivAt (fun t : ℝ => t ^ (a + 2)) (((a + 2 : ℕ) : ℝ) * r ^ (a + 1)) r := by
    simpa using hasDerivAt_pow (a + 2) r
  have hd_exp : HasDerivAt (fun t : ℝ => Real.exp (-t ^ 2)) (-2 * r * Real.exp (-r ^ 2)) r := by
    refine ((Real.hasDerivAt_exp (-r ^ 2)).comp r (hasDerivAt_pow 2 r).neg).congr_deriv ?_
    ring
  have hd_poly : HasDerivAt (fun t : ℝ => (rTilde n a).eval (t ^ 2))
      ((rTilde n a).derivative.eval (r ^ 2) * (2 * r)) r := by
    have heq : (fun t : ℝ => (rTilde n a).eval (t ^ 2)) =
        fun t => ((rTilde n a).comp (X * X)).eval t := by funext t; simp [sq]
    rw [heq]
    refine (((rTilde n a).comp (X * X)).hasDerivAt r).congr_deriv ?_
    rw [derivative_comp, derivative_mul, derivative_X]
    simp [sq]
    ring
  have hd_bdy := ((hd_pow.mul hd_exp).mul hd_poly).neg
  refine hd_bdy.congr_deriv ?_
  dsimp only [Pi.mul_apply]
  have h1 := congrArg (Polynomial.eval (r ^ 2)) (rTilde_sub_deriv n a)
  simp only [eval_sub] at h1
  have h2 := congrArg (Polynomial.eval (r ^ 2)) (X_mul_rTilde_succ_a n a)
  simp only [eval_mul, eval_X, eval_add, eval_C] at h2
  have hderiv_eval : (rTilde n a).derivative.eval (r ^ 2) =
      (rTilde n a).eval (r ^ 2) - (rTilde n (a + 1)).eval (r ^ 2) := by linarith
  have hpow : r ^ (a + 2) * r = r ^ (a + 1) * r ^ 2 := by rw [pow_succ]; ring
  rw [hderiv_eval]
  push_cast
  linear_combination
    (2 * (rTilde n a).eval (r ^ 2) * Real.exp (-r ^ 2) -
      2 * ((rTilde n a).eval (r ^ 2) - (rTilde n (a + 1)).eval (r ^ 2)) * Real.exp (-r ^ 2)) * hpow +
    (2 * r ^ (a + 1) * Real.exp (-r ^ 2)) * h2

private lemma cellLagInt_succ (a n i : ℕ) :
    cellLagInt a (n + 1) i =
      ((cellLagInt a n i * (-(2 * (n : ℝ) + a)) +
        (bdyVal a n (3 * ((i + 1 : ℕ) : ℝ) / 32) - bdyVal a n (3 * (i : ℝ) / 32)) * (-2)) /
        (2 * ((n : ℝ) + 1))) := by
  set ra := 3 * (i : ℝ) / 32
  set rb := 3 * ((i + 1 : ℕ) : ℝ) / 32
  set g1 : ℝ → ℝ := fun r => 2 * r ^ (a + 1) * Real.exp (-r ^ 2) * (rTilde (n + 1) a).eval (r ^ 2)
  set g0 : ℝ → ℝ := fun r => 2 * r ^ (a + 1) * Real.exp (-r ^ 2) * (rTilde n a).eval (r ^ 2)
  have hg1 : IntervalIntegrable g1 MeasureTheory.volume ra rb :=
    (by unfold g1; fun_prop : Continuous g1).intervalIntegrable ra rb
  have hg0 : IntervalIntegrable g0 MeasureTheory.volume ra rb :=
    (by unfold g0; fun_prop : Continuous g0).intervalIntegrable ra rb
  have hcomb : IntervalIntegrable
      (fun r => (n + 1 : ℝ) * g1 r + ((2 * n + a : ℝ) / 2) * g0 r) MeasureTheory.volume ra rb :=
    (hg1.const_mul _).add (hg0.const_mul _)
  have hftc := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (fun r _ => hasDerivAt_neg_bdyVal a n r) hcomb
  rw [intervalIntegral.integral_add (hg1.const_mul _) (hg0.const_mul _),
    intervalIntegral.integral_const_mul, intervalIntegral.integral_const_mul] at hftc
  change (n + 1 : ℝ) * cellLagInt a (n + 1) i + ((2 * n + a : ℝ) / 2) * cellLagInt a n i =
    -bdyVal a n rb - -bdyVal a n ra at hftc
  have hne : 2 * ((n : ℝ) + 1) ≠ 0 := by positivity
  rw [eq_div_iff hne]
  linarith

private lemma bdyVal_succ (a n : ℕ) {i : ℕ} :
    bdyVal a (n + 1) (3 * (i : ℝ) / 32) =
      if i = 0 then 0
      else
        ((bdyVal a n (3 * (i : ℝ) / 32) *
            ((9 * (i : ℝ) ^ 2 - 1024 * (2 * (n : ℝ) + 1 + a)) / 1024)) +
          (if n = 0 then 0 else bdyVal a (n - 1) (3 * (i : ℝ) / 32)) * (-(n + a : ℝ))) /
          ((n : ℝ) + 1) := by
  by_cases hi0 : i = 0
  · subst hi0; simp [bdyVal, zero_pow (by omega : a + 2 ≠ 0)]
  · rw [ite_eq_right hi0]
    set r : ℝ := 3 * (i : ℝ) / 32
    have hr2 : (9 * (i : ℝ) ^ 2 - 1024 * (2 * (n : ℝ) + 1 + a)) / 1024 =
        r ^ 2 - (2 * (n : ℝ) + 1 + a) := by dsimp only [r]; ring
    rw [hr2]
    have hne : ((n : ℝ) + 1) ≠ 0 := by positivity
    rw [eq_div_iff hne]
    cases n with
    | zero =>
      simp only [↓reduceIte, zero_mul, add_zero, Nat.cast_zero]
      unfold bdyVal
      simp only [rTilde, eval_sub, eval_X, eval_C, eval_one, mul_one]
      ring
    | succ m =>
      simp only [Nat.add_eq_zero_iff, one_ne_zero, and_false, ↓reduceIte, Nat.add_sub_cancel]
      have hrec := congrArg (Polynomial.eval (r ^ 2)) (rTilde_rec_succ m a)
      simp only [eval_mul, eval_sub, eval_X, eval_C] at hrec
      unfold bdyVal
      push_cast at hrec ⊢
      linear_combination (r ^ (a + 2) * Real.exp (-r ^ 2)) * hrec

private lemma lagRecLoop_sound (a : ℕ) :
    ∀ (rem n : ℕ) (jc bdym1 bdy0 : Array (Int × Int)) (acc : Array (Array (Int × Int))),
      acc.size = n + 1 →
      (∀ k ≤ n, ∀ i < 64, memLag (cellLagInt a k i) ((acc.getD k #[]).getD i (0, 0))) →
      (∀ i < 64, memLag (cellLagInt a n i) (jc.getD i (0, 0))) →
      (∀ (i : ℕ), i ≤ 64 → memLag (if n = 0 then 0 else bdyVal a (n - 1) (3 * (i : ℝ) / 32))
        (bdym1.getD i (0, 0))) →
      (∀ (i : ℕ), i ≤ 64 → memLag (bdyVal a n (3 * (i : ℝ) / 32)) (bdy0.getD i (0, 0))) →
      let out := lagRecLoop a rem n jc bdym1 bdy0 acc
      out.size = n + 1 + rem ∧
        ∀ k ≤ n + rem, ∀ i < 64, memLag (cellLagInt a k i) ((out.getD k #[]).getD i (0, 0))
  | 0, n, _, _, _, acc, hsize, hacc, _, _, _ => by
    simp only [lagRecLoop, add_zero]
    exact ⟨hsize, hacc⟩
  | rem + 1, n, jc, bdym1, bdy0, acc, hsize, hacc, hjc, hbm1, hb0 => by
    simp only [lagRecLoop]
    set jn : Array (Int × Int) := Array.ofFn fun (idx : Fin 64) =>
      let i := idx.val
      let t1 := ivMulIntL (jc.getD i (0, 0)) (-(Int.ofNat (2 * n + a)))
      let t2 := ivMulIntL (ivSubL (bdy0.getD (i + 1) (0, 0)) (bdy0.getD i (0, 0))) (-2)
      ivDivPosL (ivAddL t1 t2) (Int.ofNat (2 * (n + 1)))
    set bdyNext : Array (Int × Int) := Array.ofFn fun (idx : Fin 65) =>
      let i := idx.val
      if i == 0 then (0, 0)
      else
        let numS : Int := Int.ofNat (9 * i * i) - Int.ofNat (1024 * (2 * n + 1 + a))
        let p1 := ivDivPosL (ivMulIntL (bdy0.getD i (0, 0)) numS) 1024
        let p2 := ivMulIntL (bdym1.getD i (0, 0)) (-(Int.ofNat (n + a)))
        ivDivPosL (ivAddL p1 p2) (Int.ofNat (n + 1))
    have hjn : ∀ i < 64, memLag (cellLagInt a (n + 1) i) (jn.getD i (0, 0)) := by
      intro i hi
      rw [array_ofFn_getD _ i (0, 0) hi]
      dsimp only
      have ht1 := ivMulIntL_sound (hjc i hi) (-(Int.ofNat (2 * n + a)))
      have ht2 := ivMulIntL_sound (ivSubL_sound (hb0 (i + 1) (by omega)) (hb0 i (by omega))) (-2)
      have hdiv := ivDivPosL_sound (ivAddL_sound ht1 ht2)
        (by simp only [Int.ofNat_eq_natCast]; positivity : (0 : ℤ) < Int.ofNat (2 * (n + 1)))
      rw [cellLagInt_succ]
      convert hdiv using 2 <;> (push_cast [Int.ofNat_eq_natCast]; ring)
    have hbNext : ∀ (i : ℕ), i ≤ 64 → memLag (bdyVal a (n + 1) (3 * (i : ℝ) / 32))
        (bdyNext.getD i (0, 0)) := by
      intro i hi
      rw [array_ofFn_getD _ i (0, 0) (by omega)]
      dsimp only
      rw [bdyVal_succ]
      rcases Nat.eq_zero_or_pos i with rfl | hi_pos
      · simp [memLag]
      · rw [ite_eq_right hi_pos.ne', show (i == 0) = false from beq_false_of_ne hi_pos.ne',
          ite_eq_right Bool.false_ne_true]
        set numS : ℤ := Int.ofNat (9 * i * i) - Int.ofNat (1024 * (2 * n + 1 + a))
        have hp1 := ivDivPosL_sound (ivMulIntL_sound (hb0 i hi) numS) (by norm_num : (0 : ℤ) < 1024)
        have hp2 := ivMulIntL_sound (hbm1 i hi) (-(Int.ofNat (n + a)))
        have hdiv := ivDivPosL_sound (ivAddL_sound hp1 hp2)
          (by simp only [Int.ofNat_eq_natCast]; positivity : (0 : ℤ) < Int.ofNat (n + 1))
        dsimp only [numS] at hdiv
        convert hdiv using 2 <;> (push_cast [Int.ofNat_eq_natCast]; ring)
    have hacc_push : ∀ k ≤ n + 1, ∀ i < 64,
        memLag (cellLagInt a k i) (((acc.push jn).getD k #[]).getD i (0, 0)) := by
      intro k hk i hi
      rcases Nat.of_le_succ hk with hle | rfl
      · rw [array_push_getD_lt acc jn #[] (by omega)]
        exact hacc k hle i hi
      · rw [array_push_getD_eq acc jn #[] hsize]
        exact hjn i hi
    have ih := lagRecLoop_sound a rem (n + 1) jn bdy0 bdyNext (acc.push jn)
      (by simp [hsize]) hacc_push hjn
      (fun i hi => by simp only [Nat.add_eq_zero_iff, one_ne_zero, and_false, ↓reduceIte,
        Nat.add_sub_cancel]; exact hb0 i hi)
      hbNext
    simpa [show n + 1 + rem = n + (rem + 1) by omega,
      show n + 1 + 1 + rem = n + 1 + (rem + 1) by omega] using ih

theorem lagTable1024_sound {a n i : ℕ} (ha : a < 19) (hn : n ≤ 250) (hi : i < 64) :
    memLag (cellLagInt a n i)
      (((lagTable1024.getD a #[]).getD n #[]).getD i (0, 0)) := by
  unfold lagTable1024
  rw [array_ofFn_getD _ a #[] ha]
  dsimp only
  set fb := Array.ofFn fun (iIdx : Fin 65) => f0AndBdy0 expNegSArr a iIdx.val
  set j0 := Array.ofFn fun (iIdx : Fin 64) =>
    ivSubL (fb.getD (iIdx.val + 1) ((0, 0), (0, 0))).1 (fb.getD iIdx.val ((0, 0), (0, 0))).1
  set bdy0 := Array.ofFn fun (iIdx : Fin 65) => (fb.getD iIdx.val ((0, 0), (0, 0))).2
  set bdym1 := Array.replicate 65 ((0 : ℤ), (0 : ℤ))
  have hfb : ∀ (m : ℕ), m ≤ 64 →
      memLag (F0Val a (3 * (m : ℝ) / 32)) (fb.getD m ((0, 0), (0, 0))).1 ∧
        memLag (bdyVal a 0 (3 * (m : ℝ) / 32)) (fb.getD m ((0, 0), (0, 0))).2 := by
    intro m hm
    rw [array_ofFn_getD _ m ((0, 0), (0, 0)) (by omega)]
    exact f0AndBdy0_sound a hm
  have hj0 : ∀ m < 64, memLag (cellLagInt a 0 m) (j0.getD m (0, 0)) := by
    intro m hm
    rw [array_ofFn_getD _ m (0, 0) hm, cellLagInt_zero]
    exact ivSubL_sound (hfb (m + 1) (by omega)).1 (hfb m (by omega)).1
  have hb0 : ∀ (m : ℕ), m ≤ 64 → memLag (bdyVal a 0 (3 * (m : ℝ) / 32)) (bdy0.getD m (0, 0)) := by
    intro m hm
    rw [array_ofFn_getD _ m (0, 0) (by omega)]
    exact (hfb m hm).2
  have hbm1 : ∀ (m : ℕ), m ≤ 64 → memLag (0 : ℝ) (bdym1.getD m (0, 0)) := by
    intro m hm
    rw [array_getD_lt bdym1 m (0, 0) (by simp [bdym1]; omega)]
    simp [bdym1, memLag]
  have hacc0 : ∀ k ≤ 0, ∀ m < 64, memLag (cellLagInt a k m) ((#[j0].getD k #[]).getD m (0, 0)) := by
    intro k hk m hm
    obtain rfl := Nat.le_zero.1 hk
    exact hj0 m hm
  have hout := lagRecLoop_sound a 250 0 j0 bdym1 bdy0 #[j0] rfl hacc0 hj0
    (fun m hm => by simpa using hbm1 m hm) hb0
  exact hout.2 n (by omega) i hi

/-! ### 4. Midpoint, Dot-Product, Binomial, and `modeOverlapsAt` Soundness -/

set_option maxRecDepth 2000

@[simp] lemma mulSkipZero_eq (g b : ℤ) : mulSkipZero g b = g * b := by
  unfold mulSkipZero
  by_cases h : g = 0
  · subst h; simp
  · rw [beq_false_of_ne h]; rfl

lemma sqIntIval_sound {x : ℝ} {lo hi : ℤ} (hlo : (lo : ℝ) ≤ x) (hhi : x ≤ (hi : ℝ)) :
    ((sqIntIval lo hi).1 : ℝ) ≤ x ^ 2 ∧ x ^ 2 ≤ ((sqIntIval lo hi).2 : ℝ) := by
  unfold sqIntIval
  dsimp only
  constructor
  · split_ifs with h1 h2
    · have : (0 : ℝ) ≤ (lo : ℝ) := by exact_mod_cast h1
      push_cast; nlinarith
    · have : (hi : ℝ) ≤ 0 := by exact_mod_cast h2
      push_cast; nlinarith
    · push_cast; exact sq_nonneg x
  · rw [Int.cast_max]
    rcases le_or_gt 0 x with hx0 | hx0
    · refine le_trans ?_ (le_max_right _ _)
      push_cast; nlinarith
    · refine le_trans ?_ (le_max_left _ _)
      push_cast; nlinarith

lemma mem_sumIval (n : ℕ) (x : ℕ → ℝ) (f : ℕ → Ival)
    (h : ∀ k < n, mem (x k) (f k)) :
    mem (∑ k ∈ range n, x k) (sumIval n f) := by
  induction n with
  | zero => simp [sumIval, mem_zero]
  | succ n ih =>
    rw [sum_range_succ, sumIval]
    exact mem_add (ih fun k hk => h k (Nat.lt_succ_of_lt hk)) (h n (Nat.lt_succ_self n))

private lemma maxAbsInt_ge (n : ℕ) (f : ℕ → ℤ) :
    ∀ k < n, |(f k : ℝ)| ≤ ((maxAbsInt n f : ℤ) : ℝ) := by
  induction n with
  | zero => intro _ hk; omega
  | succ n ih =>
    intro k hk
    simp only [maxAbsInt, Int.cast_max]
    rcases Nat.eq_or_lt_of_le (Nat.lt_succ_iff.1 hk) with rfl | hlt
    · refine le_trans ?_ (le_max_right _ _)
      rw [Int.ofNat_eq_natCast, ← Int.abs_eq_natAbs, Int.cast_abs]
    · exact (ih k hlt).trans (le_max_left _ _)

lemma midpoint_err_le_one {x : ℝ} {lo hi : ℤ}
    (hlo : (lo : ℝ) ≤ x) (hhi : x ≤ (hi : ℝ)) (hw : hi - lo ≤ 2) :
    |x - (((lo + hi) / 2 : ℤ) : ℝ)| ≤ 1 := by
  have hle : lo ≤ hi := by exact_mod_cast (hlo.trans hhi)
  have hm1 : (lo + hi) / 2 - 1 ≤ lo := by omega
  have hm2 : hi ≤ (lo + hi) / 2 + 1 := by omega
  have hm1R : (((lo + hi) / 2 : ℤ) : ℝ) - 1 ≤ (lo : ℝ) := by exact_mod_cast hm1
  have hm2R : (hi : ℝ) ≤ (((lo + hi) / 2 : ℤ) : ℝ) + 1 := by exact_mod_cast hm2
  rw [abs_le]
  exact ⟨by linarith, by linarith⟩

lemma toMid_sound_lag {x : ℝ} {iv : Int × Int} {bOut : ℕ} (hb : bOut ≤ 1024)
    {sh : ℤ} (hsh : sh = (2 : ℤ) ^ (1024 - bOut))
    (hx : memLag x iv) (hok : (toMid iv sh).1 = true) :
    |x * (2 : ℝ) ^ bOut - (((toMid iv sh).2 : ℤ) : ℝ)| ≤ 1 := by
  subst hsh
  unfold toMid at hok ⊢
  dsimp only at hok ⊢
  rw [decide_eq_true_eq] at hok
  have hsh_pos : (0 : ℤ) < (2 : ℤ) ^ (1024 - bOut) := by positivity
  have hbp := ivDivPosL_sound hx hsh_pos
  have hsc : x / (((2 : ℤ) ^ (1024 - bOut) : ℤ) : ℝ) * (dLag : ℝ) = x * (2 : ℝ) ^ bOut := by
    unfold dLag
    have hp : (2 : ℝ) ^ bOut * (2 : ℝ) ^ (1024 - bOut) = (2 : ℝ) ^ 1024 := by
      rw [← pow_add]; congr 1; omega
    push_cast
    have h2ne : ((2 : ℝ) ^ (1024 - bOut)) ≠ 0 := by positivity
    rw [div_mul_eq_mul_div, div_eq_iff h2ne]
    linear_combination x * hp.symm
  rw [memLag, hsc] at hbp
  exact midpoint_err_le_one hbp.1 hbp.2 hok

lemma dotMidErr (L : ℕ) (x y : ℕ → ℝ) (a b : ℕ → ℤ)
    (hx : ∀ i < L, |x i - (a i : ℝ)| ≤ 1)
    (hy : ∀ i < L, |y i - (b i : ℝ)| ≤ 1) :
    |∑ i ∈ range L, x i * y i - ((sumInt L fun i => a i * b i : ℤ) : ℝ)| ≤
      (((sumInt L fun i => Int.ofNat (a i).natAbs) +
        (sumInt L fun i => Int.ofNat (b i).natAbs) + Int.ofNat L : ℤ) : ℝ) := by
  rw [sumInt_cast]
  simp_rw [Int.cast_mul]
  rw [← sum_sub_distrib]
  have habs_int : ∀ z : ℤ, ((Int.ofNat z.natAbs : ℤ) : ℝ) = |(z : ℝ)| := fun z => by
    rw [Int.ofNat_eq_natCast, ← Int.abs_eq_natAbs, Int.cast_abs]
  have hterm : ∀ i ∈ range L, |x i * y i - (a i : ℝ) * (b i : ℝ)| ≤
      |(a i : ℝ)| + |(b i : ℝ)| + 1 := fun i hi => by
    have hxi := hx i (mem_range.1 hi)
    have hyi := hy i (mem_range.1 hi)
    have hid : x i * y i - (a i : ℝ) * (b i : ℝ) =
        (a i : ℝ) * (y i - (b i : ℝ)) + (x i - (a i : ℝ)) * (b i : ℝ) +
          (x i - (a i : ℝ)) * (y i - (b i : ℝ)) := by ring
    rw [hid]
    have h1 : |(a i : ℝ) * (y i - (b i : ℝ)) + (x i - (a i : ℝ)) * (b i : ℝ) +
        (x i - (a i : ℝ)) * (y i - (b i : ℝ))| ≤
        |(a i : ℝ) * (y i - (b i : ℝ))| + |(x i - (a i : ℝ)) * (b i : ℝ)| +
          |(x i - (a i : ℝ)) * (y i - (b i : ℝ))| :=
      (abs_add_le _ _).trans (add_le_add (abs_add_le _ _) le_rfl)
    rw [abs_mul, abs_mul, abs_mul] at h1
    have hxy : |x i - (a i : ℝ)| * |y i - (b i : ℝ)| ≤ 1 :=
      (mul_le_mul hxi hyi (abs_nonneg _) zero_le_one).trans_eq (one_mul 1)
    have hay : |(a i : ℝ)| * |y i - (b i : ℝ)| ≤ |(a i : ℝ)| :=
      mul_le_of_le_one_right (abs_nonneg _) hyi
    have hxb : |x i - (a i : ℝ)| * |(b i : ℝ)| ≤ |(b i : ℝ)| :=
      mul_le_of_le_one_left (abs_nonneg _) hxi
    linarith
  calc |∑ i ∈ range L, (x i * y i - (a i : ℝ) * (b i : ℝ))|
      ≤ ∑ i ∈ range L, (|(a i : ℝ)| + |(b i : ℝ)| + 1) :=
        (abs_sum_le_sum_abs _ _).trans (sum_le_sum hterm)
    _ = _ := by
        simp only [sum_add_distrib, sum_const, card_range, nsmul_eq_mul, mul_one]
        push_cast [Int.ofNat_eq_natCast, sumInt_cast, habs_int]
        ring

private lemma bilinear_midpoint_error
    (x y : ℕ → ℝ) (ma mb : ℕ → ℤ) (c : ℕ → ℤ)
    (hx : ∀ i < 64, |x i - (ma i : ℝ)| ≤ 1)
    (hy : ∀ j < 64, |y j - (mb j : ℝ)| ≤ 1) :
    |∑ i ∈ range 64, ∑ j ∈ range 64, (c (64 * i + j) : ℝ) * x i * y j -
      ((sumInt 64 fun j =>
        (sumInt 64 fun i => ma i * c (64 * i + j)) * mb j : ℤ) : ℝ)| ≤
      (((maxAbsInt 4096 c) *
        (64 * (sumInt 64 fun i => Int.ofNat (ma i).natAbs) +
         64 * (sumInt 64 fun j => Int.ofNat (mb j).natAbs)) +
        (sumInt 4096 fun cell => Int.ofNat (c cell).natAbs) : ℤ) : ℝ) := by
  have hmat : ((sumInt 64 fun j =>
      (sumInt 64 fun i => ma i * c (64 * i + j)) * mb j : ℤ) : ℝ) =
      ∑ i ∈ range 64, ∑ j ∈ range 64, (c (64 * i + j) : ℝ) * (ma i : ℝ) * (mb j : ℝ) := by
    rw [sumInt_cast]
    simp_rw [Int.cast_mul, sumInt_cast, sum_mul]
    rw [sum_comm]
    refine sum_congr rfl fun i _ => sum_congr rfl fun j _ => ?_
    push_cast; ring
  rw [hmat, ← sum_sub_distrib]
  have hrow_diff : ∀ i ∈ range 64,
      (∑ j ∈ range 64, (c (64 * i + j) : ℝ) * x i * y j -
       ∑ j ∈ range 64, (c (64 * i + j) : ℝ) * (ma i : ℝ) * (mb j : ℝ)) =
      ∑ j ∈ range 64, (c (64 * i + j) : ℝ) *
        ((ma i : ℝ) * (y j - (mb j : ℝ)) +
         (x i - (ma i : ℝ)) * (mb j : ℝ) +
         (x i - (ma i : ℝ)) * (y j - (mb j : ℝ))) := fun i _ => by
    rw [← sum_sub_distrib]
    exact sum_congr rfl fun j _ => by ring
  rw [sum_congr rfl hrow_diff]
  set M := ((maxAbsInt 4096 c : ℤ) : ℝ)
  have hc_le : ∀ i < 64, ∀ j < 64, |(c (64 * i + j) : ℝ)| ≤ M := fun i hi j hj =>
    maxAbsInt_ge 4096 c (64 * i + j) (by omega)
  have habs_int : ∀ z : ℤ, ((Int.ofNat z.natAbs : ℤ) : ℝ) = |(z : ℝ)| := fun z => by
    rw [Int.ofNat_eq_natCast, ← Int.abs_eq_natAbs, Int.cast_abs]
  calc |∑ i ∈ range 64, ∑ j ∈ range 64, (c (64 * i + j) : ℝ) *
          ((ma i : ℝ) * (y j - (mb j : ℝ)) +
           (x i - (ma i : ℝ)) * (mb j : ℝ) +
           (x i - (ma i : ℝ)) * (y j - (mb j : ℝ)))|
      ≤ ∑ i ∈ range 64, ∑ j ∈ range 64,
          |(c (64 * i + j) : ℝ)| * (|(ma i : ℝ)| + |(mb j : ℝ)| + 1) := by
        refine (abs_sum_le_sum_abs _ _).trans (sum_le_sum fun i hi => ?_)
        refine (abs_sum_le_sum_abs _ _).trans (sum_le_sum fun j hj => ?_)
        rw [abs_mul]
        refine mul_le_mul_of_nonneg_left ?_ (abs_nonneg _)
        have h1 : |(ma i : ℝ) * (y j - (mb j : ℝ)) + (x i - (ma i : ℝ)) * (mb j : ℝ) +
            (x i - (ma i : ℝ)) * (y j - (mb j : ℝ))| ≤
            |(ma i : ℝ) * (y j - (mb j : ℝ))| + |(x i - (ma i : ℝ)) * (mb j : ℝ)| +
              |(x i - (ma i : ℝ)) * (y j - (mb j : ℝ))| :=
          (abs_add_le _ _).trans (add_le_add (abs_add_le _ _) le_rfl)
        rw [abs_mul, abs_mul, abs_mul] at h1
        have hyj := hy j (mem_range.1 hj)
        have hxi := hx i (mem_range.1 hi)
        have hxy : |x i - (ma i : ℝ)| * |y j - (mb j : ℝ)| ≤ 1 :=
          (mul_le_mul hxi hyj (abs_nonneg _) zero_le_one).trans_eq (one_mul 1)
        have hmy : |(ma i : ℝ)| * |y j - (mb j : ℝ)| ≤ |(ma i : ℝ)| :=
          mul_le_of_le_one_right (abs_nonneg _) hyj
        have hxm : |x i - (ma i : ℝ)| * |(mb j : ℝ)| ≤ |(mb j : ℝ)| :=
          mul_le_of_le_one_left (abs_nonneg _) hxi
        linarith
    _ = (∑ i ∈ range 64, ∑ j ∈ range 64, |(c (64 * i + j) : ℝ)| * |(ma i : ℝ)|) +
        (∑ i ∈ range 64, ∑ j ∈ range 64, |(c (64 * i + j) : ℝ)| * |(mb j : ℝ)|) +
        (∑ i ∈ range 64, ∑ j ∈ range 64, |(c (64 * i + j) : ℝ)|) := by
        simp_rw [mul_add, mul_one, sum_add_distrib]
    _ ≤ M * (64 * ∑ i ∈ range 64, |(ma i : ℝ)|) +
        M * (64 * ∑ j ∈ range 64, |(mb j : ℝ)|) +
        ∑ cell ∈ range 4096, |(c cell : ℝ)| := by
        have ht1 : ∑ i ∈ range 64, ∑ j ∈ range 64, |(c (64 * i + j) : ℝ)| * |(ma i : ℝ)| ≤
            M * (64 * ∑ i ∈ range 64, |(ma i : ℝ)|) := by
          calc _ ≤ ∑ i ∈ range 64, ∑ _j ∈ range 64, M * |(ma i : ℝ)| :=
                sum_le_sum fun i hi => sum_le_sum fun j hj =>
                  mul_le_mul_of_nonneg_right (hc_le i (mem_range.1 hi) j (mem_range.1 hj)) (abs_nonneg _)
            _ = _ := by simp [sum_const, nsmul_eq_mul, ← mul_sum]; ring
        have ht2 : ∑ i ∈ range 64, ∑ j ∈ range 64, |(c (64 * i + j) : ℝ)| * |(mb j : ℝ)| ≤
            M * (64 * ∑ j ∈ range 64, |(mb j : ℝ)|) := by
          calc _ ≤ ∑ i ∈ range 64, ∑ j ∈ range 64, M * |(mb j : ℝ)| :=
                sum_le_sum fun i hi => sum_le_sum fun j hj =>
                  mul_le_mul_of_nonneg_right (hc_le i (mem_range.1 hi) j (mem_range.1 hj)) (abs_nonneg _)
            _ = _ := by rw [sum_comm]; simp [sum_const, nsmul_eq_mul, ← mul_sum]; ring
        have ht3 : (∑ i ∈ range 64, ∑ j ∈ range 64, |(c (64 * i + j) : ℝ)|) =
            ∑ cell ∈ range 4096, |(c cell : ℝ)| := by
          rw [← sum_product']
          refine sum_nbij' (fun p => 64 * p.1 + p.2) (fun cell => (cell / 64, cell % 64))
            (fun p hp => by simp only [mem_product, mem_range] at hp ⊢; omega)
            (fun cell hc => by simp only [mem_product, mem_range] at hc ⊢; omega)
            (fun p hp => by simp only [mem_product, mem_range] at hp; ext <;> dsimp only <;> omega)
            (fun _ _ => by omega)
            (fun _ _ => rfl)
        linarith
    _ = _ := by
        push_cast
        simp only [sumInt_cast, habs_int, M]
        ring

private lemma binomRowsLoop_sound :
    ∀ (rem n : ℕ) (cur : Array ℕ) (acc : Array (Array ℕ)),
      acc.size = n + 1 →
      cur.size = n + 1 →
      (∀ m ≤ n, ∀ k ≤ m, (acc.getD m #[]).getD k 0 = m.choose k) →
      (∀ k ≤ n, cur.getD k 0 = n.choose k) →
      let out := binomRowsLoop rem cur acc
      out.size = n + 1 + rem ∧
        ∀ m ≤ n + rem, ∀ k ≤ m, (out.getD m #[]).getD k 0 = m.choose k
  | 0, n, _, acc, hsize, _, hacc, _ => by
    simp only [binomRowsLoop, add_zero]
    exact ⟨hsize, hacc⟩
  | rem + 1, n, cur, acc, hsize, hcur_sz, hacc, hcur => by
    simp only [binomRowsLoop]
    set nxt := binomNextRow cur
    have hnxt_sz : nxt.size = n + 2 := by simp [nxt, binomNextRow, hcur_sz]
    have hnxt : ∀ k ≤ n + 1, nxt.getD k 0 = (n + 1).choose k := by
      intro k hk
      dsimp only [nxt]
      rw [binomNextRow, array_ofFn_getD _ k 0 (by omega)]
      dsimp only
      simp only [hcur_sz]
      rcases Nat.eq_zero_or_pos k with rfl | hk_pos
      · simp
      · rw [show (k == 0) = false from beq_false_of_ne hk_pos.ne']
        by_cases hkn : k = n + 1
        · subst hkn; simp
        · rw [show (k == n + 1) = false from beq_false_of_ne hkn]
          obtain ⟨j, rfl⟩ := Nat.exists_eq_succ_of_ne_zero hk_pos.ne'
          change cur.getD j 0 + cur.getD (j + 1) 0 = (n + 1).choose (j + 1)
          rw [hcur j (by omega), hcur (j + 1) (by omega), Nat.choose_succ_succ]
    have hacc' : ∀ m ≤ n + 1, ∀ k ≤ m, ((acc.push nxt).getD m #[]).getD k 0 = m.choose k := by
      intro m hm k hk
      rcases Nat.of_le_succ hm with hle | rfl
      · rw [array_push_getD_lt acc nxt #[] (by omega)]
        exact hacc m hle k hk
      · rw [array_push_getD_eq acc nxt #[] hsize]
        exact hnxt k hk
    have ih := binomRowsLoop_sound rem (n + 1) nxt (acc.push nxt) (by simp [hsize]) hnxt_sz hacc' hnxt
    simpa [show n + 1 + rem = n + (rem + 1) by omega,
      show n + 1 + 1 + rem = n + 1 + (rem + 1) by omega] using ih

lemma getBinom_binomArr251 {n k : ℕ} (hn : n ≤ 251) (hk : k ≤ n) :
    getBinom binomArr251 n k = n.choose k := by
  have h0 : ∀ m ≤ 0, ∀ j ≤ m, (#[#[1]].getD m #[]).getD j 0 = m.choose j := by
    intro m hm j hj; obtain rfl := Nat.le_zero.1 hm; obtain rfl := Nat.le_zero.1 hj; rfl
  have hc0 : ∀ j ≤ 0, (#[1] : Array ℕ).getD j 0 = (0 : ℕ).choose j := by
    intro j hj; obtain rfl := Nat.le_zero.1 hj; rfl
  have hb := (binomRowsLoop_sound 251 0 #[1] #[#[1]] rfl rfl h0 hc0).2 n (by omega) k hk
  unfold getBinom binomArr251
  generalize binomRowsLoop 251 #[1] #[#[1]] = tbl at hb ⊢
  exact hb

private theorem sumInt_congr_lt {n : ℕ} {f g : ℕ → ℤ} (h : ∀ i < n, f i = g i) :
    sumInt n f = sumInt n g := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [sumInt, sumInt, ih (fun i hi => h i (by omega)), h n (by omega)]

section
attribute [local irreducible] Array.ofFn sumInt maxAbsInt

set_option maxHeartbeats 800000 in
/-- Shared soundness theorem for `modeOverlapsAt`. -/
theorem modeOverlapsAt_sound {bLag : ℕ} (hbLag : bLag ≤ 1024)
    {shLag shDot : ℤ} (hshLag : shLag = (2 : ℤ) ^ (1024 - bLag)) (hshDot : 0 < shDot)
    {tbl : Array (Array (Array (Int × Int)))}
    (htbl : ∀ a < 19, ∀ n ≤ 250, ∀ i < 64,
      memLag (cellLagInt a n i) (((tbl.getD a #[]).getD n #[]).getD i (0, 0)))
    (creArr cimArr : Array Int)
    {ov : Array (Array (Array ((Int × Int) × (Int × Int))))}
    (hcomp : modeOverlapsAt shLag shDot creArr cimArr tbl = (true, ov))
    {idxM : ℕ} (hM : idxM < 36) :
    let mSigned : ℤ := (idxM : ℤ) - 17
    let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    ∀ n1 ≤ 250 - k0, ∀ n2 ≤ 250 - k0 - n1,
      let p := ((ov.getD idxM #[]).getD n1 #[]).getD n2 ((0, 0), (0, 0))
      let scale : ℝ := (2 : ℝ) ^ (2 * bLag + 24) / (shDot : ℝ)
      (p.1.1 : ℝ) ≤ (modeOverlap creArr cimArr idxM n1 n2).re * scale ∧
        (modeOverlap creArr cimArr idxM n1 n2).re * scale ≤ (p.1.2 : ℝ) ∧
        (p.2.1 : ℝ) ≤ (modeOverlap creArr cimArr idxM n1 n2).im * scale ∧
        (modeOverlap creArr cimArr idxM n1 n2).im * scale ≤ (p.2.2 : ℝ) := by
  dsimp only
  let mAndOk : Array (Array (Bool × Array Int × Int)) :=
    Array.ofFn fun (aIdx : Fin 19) =>
      let ta := tbl.getD aIdx.val #[]
      Array.ofFn fun (nIdx : Fin 251) =>
        let row := ta.getD nIdx.val #[]
        let mRow : Array (Bool × Int) := Array.ofFn fun (iIdx : Fin 64) =>
          toMid (row.getD iIdx.val (0, 0)) shLag
        let okRow := (List.range 64).all fun i => (mRow.getD i (false, 0)).1
        let ints := Array.ofFn fun (iIdx : Fin 64) => (mRow.getD iIdx.val (false, 0)).2
        let sAbs := sumInt 64 fun i => Int.ofNat (ints.getD i 0).natAbs
        (okRow, ints, sAbs)
  have hwidth : (List.range 19).all (fun a =>
      (List.range 251).all fun n => ((mAndOk.getD a #[]).getD n (false, #[], 0)).1) = true :=
    congrArg Prod.fst hcomp
  have hov := congrArg Prod.snd hcomp
  change (modeOverlapsAt shLag shDot creArr cimArr tbl).2 = ov at hov
  have hm_mid : ∀ a < 19, ∀ n < 251, ∀ i < 64,
      |cellLagInt a n i * (2 : ℝ) ^ bLag -
        ((((mAndOk.getD a #[]).getD n (false, #[], 0)).2.1.getD i 0 : ℤ) : ℝ)| ≤ 1 := by
    intro a ha n hn i hi
    simp only [List.all_eq_true, List.mem_range] at hwidth
    have hokRow := hwidth a ha n hn
    rw [array_ofFn_getD _ a #[] ha, array_ofFn_getD _ n (false, #[], 0) hn] at hokRow ⊢
    dsimp only at hokRow ⊢
    have hi_ok := (List.all_eq_true.1 hokRow) i (List.mem_range.2 hi)
    rw [array_ofFn_getD _ i (false, 0) hi] at hi_ok
    rw [array_ofFn_getD _ i 0 hi, array_ofFn_getD _ i (false, 0) hi]
    exact toMid_sound_lag hbLag hshLag (htbl a ha n (by omega) i hi) hi_ok
  have hm_sAbs : ∀ a < 19, ∀ n < 251,
      ((mAndOk.getD a #[]).getD n (false, #[], 0)).2.2 =
        sumInt 64 fun i =>
          Int.ofNat (((mAndOk.getD a #[]).getD n (false, #[], 0)).2.1.getD i 0).natAbs := by
    intro a ha n hn
    rw [array_ofFn_getD _ a #[] ha, array_ofFn_getD _ n (false, #[], 0) hn]
  set mSigned : ℤ := (idxM : ℤ) - 17
  set a := mSigned.natAbs
  set b := (1 - mSigned).natAbs
  set k0 := (a + b - 1) / 2
  have ha19 : a < 19 := by omega
  have hb19 : b < 19 := by omega
  intro n1 hn1 n2 hn2
  have hn1_251 : n1 < 251 := by omega
  have hn2_251 : n2 < 251 := by omega
  rw [← hov]
  unfold modeOverlapsAt
  rw [array_ofFn_getD _ idxM #[] hM]
  dsimp only
  simp only [Int.ofNat_eq_natCast, show (idxM : ℤ) - 17 = mSigned from rfl]
  simp only [show mSigned.natAbs = a from rfl, show (1 - mSigned).natAbs = b from rfl]
  rw [array_ofFn_getD _ n1 #[] (show n1 < 250 - k0 + 1 by omega),
    array_ofFn_getD _ n2 ((0, 0), (0, 0)) (show n2 < 250 - k0 + 1 - n1 by omega)]
  dsimp only
  set ma := ((mAndOk.getD a #[]).getD n1 (false, #[], 0)).2.1
  set mb := ((mAndOk.getD b #[]).getD n2 (false, #[], 0)).2.1
  have hpre_eq : ∀ arr : Array Int,
      (sumInt 64 fun j =>
        (((Array.ofFn fun (n1Idx : Fin (250 - k0 + 1)) =>
          let ma0 := ((mAndOk.getD a #[]).getD n1Idx.val (false, #[], 0)).2.1
          Array.ofFn fun (jIdx : Fin 64) =>
            sumInt 64 fun i => ma0.getD i 0 * getCoeff arr idxM (64 * i + jIdx.val)).getD n1 #[]).getD j 0) *
          mb.getD j 0) =
      sumInt 64 fun j => (sumInt 64 fun i => ma.getD i 0 * getCoeff arr idxM (64 * i + j)) * mb.getD j 0 := by
    intro arr
    apply sumInt_congr_lt
    intro j hj
    rw [array_ofFn_getD _ n1 #[] (show n1 < 250 - k0 + 1 by omega), array_ofFn_getD _ j 0 hj]
  simp only [ma, mb, mAndOk, k0, Int.ofNat_eq_natCast] at hpre_eq
  erw [hpre_eq creArr, hpre_eq cimArr]
  have hover_re : (modeOverlap creArr cimArr idxM n1 n2).re * (2 : ℝ) ^ (2 * bLag + 24) =
      ∑ i ∈ range 64, ∑ j ∈ range 64,
        (getCoeff creArr idxM (64 * i + j) : ℝ) *
          (cellLagInt a n1 i * (2 : ℝ) ^ bLag) * (cellLagInt b n2 j * (2 : ℝ) ^ bLag) := by
    unfold modeOverlap cellCoeffC
    dsimp only [mSigned, a, b]
    rw [Complex.re_sum, sum_mul]
    refine sum_congr rfl fun i _ => ?_
    rw [Complex.re_sum, sum_mul]
    refine sum_congr rfl fun j _ => ?_
    rw [Complex.re_mul_ofReal, Complex.div_ofReal_re, Complex.add_re,
      Complex.re_ofReal_mul, Complex.ofReal_re, Complex.I_re, mul_zero, add_zero]
    have hp : (2 : ℝ) ^ (2 * bLag + 24) = (2 : ℝ) ^ bLag * (2 : ℝ) ^ bLag * (2 : ℝ) ^ 24 := by
      rw [← pow_add, ← pow_add]; congr 1; omega
    rw [hp]
    field_simp
  have hover_im : (modeOverlap creArr cimArr idxM n1 n2).im * (2 : ℝ) ^ (2 * bLag + 24) =
      ∑ i ∈ range 64, ∑ j ∈ range 64,
        (getCoeff cimArr idxM (64 * i + j) : ℝ) *
          (cellLagInt a n1 i * (2 : ℝ) ^ bLag) * (cellLagInt b n2 j * (2 : ℝ) ^ bLag) := by
    unfold modeOverlap cellCoeffC
    dsimp only [mSigned, a, b]
    rw [Complex.im_sum, sum_mul]
    refine sum_congr rfl fun i _ => ?_
    rw [Complex.im_sum, sum_mul]
    refine sum_congr rfl fun j _ => ?_
    rw [Complex.im_mul_ofReal, Complex.div_ofReal_im, Complex.add_im,
      Complex.im_ofReal_mul, Complex.ofReal_im, Complex.I_im, mul_one, zero_add]
    have hp : (2 : ℝ) ^ (2 * bLag + 24) = (2 : ℝ) ^ bLag * (2 : ℝ) ^ bLag * (2 : ℝ) ^ 24 := by
      rw [← pow_add, ← pow_add]; congr 1; omega
    rw [hp]
    field_simp
  have herr_re := bilinear_midpoint_error
    (fun i => cellLagInt a n1 i * (2 : ℝ) ^ bLag)
    (fun j => cellLagInt b n2 j * (2 : ℝ) ^ bLag)
    (fun i => ma.getD i 0) (fun j => mb.getD j 0)
    (getCoeff creArr idxM) (hm_mid a ha19 n1 hn1_251) (hm_mid b hb19 n2 hn2_251)
  have herr_im := bilinear_midpoint_error
    (fun i => cellLagInt a n1 i * (2 : ℝ) ^ bLag)
    (fun j => cellLagInt b n2 j * (2 : ℝ) ^ bLag)
    (fun i => ma.getD i 0) (fun j => mb.getD j 0)
    (getCoeff cimArr idxM) (hm_mid a ha19 n1 hn1_251) (hm_mid b hb19 n2 hn2_251)
  dsimp only [ma, mb] at herr_re herr_im
  rw [← hover_re, ← hm_sAbs a ha19 n1 hn1_251, ← hm_sAbs b hb19 n2 hn2_251, abs_le] at herr_re
  rw [← hover_im, ← hm_sAbs a ha19 n1 hn1_251, ← hm_sAbs b hb19 n2 hn2_251, abs_le] at herr_im
  have hshR : (shDot : ℝ) ≠ 0 := by exact_mod_cast hshDot.ne'
  have hsc_re : (modeOverlap creArr cimArr idxM n1 n2).re *
      ((2 : ℝ) ^ (2 * bLag + 24) / (shDot : ℝ)) * (shDot : ℝ) =
      (modeOverlap creArr cimArr idxM n1 n2).re * (2 : ℝ) ^ (2 * bLag + 24) := by field_simp
  have hsc_im : (modeOverlap creArr cimArr idxM n1 n2).im *
      ((2 : ℝ) ^ (2 * bLag + 24) / (shDot : ℝ)) * (shDot : ℝ) =
      (modeOverlap creArr cimArr idxM n1 n2).im * (2 : ℝ) ^ (2 * bLag + 24) := by field_simp
  have interval {x y : ℝ} {c r : ℤ} (hscale : y * (shDot : ℝ) = x)
      (h : -(r : ℝ) ≤ x - (c : ℝ) ∧ x - (c : ℝ) ≤ (r : ℝ)) :
      (((ivDivPosL (c - r, c + r) shDot).1 : ℤ) : ℝ) ≤ y ∧
        y ≤ (((ivDivPosL (c - r, c + r) shDot).2 : ℤ) : ℝ) := by
    exact ⟨ediv_le_of_mul hshDot (by rw [hscale, Int.cast_sub]; linarith only [h.1]),
      le_neg_ediv_neg_of_mul hshDot (by rw [hscale, Int.cast_add]; linarith only [h.2])⟩
  have hre := interval hsc_re herr_re
  have him := interval hsc_im herr_im
  exact ⟨hre.1, hre.2, him.1, him.2⟩

end

/-! ### 5. Soundness of `computeTigMu` (`mem_muTigOf`) -/

theorem mem_muTigOf {creArr cimArr : Array Int} {tigMuList : List Ival}
    (hcheck : tigMuCheck creArr cimArr tigMuList = true) {k : ℕ} (hk : k < 251) :
    mem (muTigOf creArr cimArr k) (tigMuList.getD k zeroI) := by
  have hcomp := (tigMuCheck_iff creArr cimArr tigMuList).1 hcheck
  unfold computeTigMu at hcomp
  have hlag_s : ∀ a < 19, ∀ n ≤ 250, ∀ i < 64,
      memLag (cellLagInt a n i) (((lagTable1024.getD a #[]).getD n #[]).getD i (0, 0)) :=
    fun _ ha _ hn _ hi => lagTable1024_sound ha hn hi
  generalize lagTable1024 = lagTbl at hcomp hlag_s
  cases hov_eq : modeOverlapsAt sh832 sh216 creArr cimArr lagTbl with
  | mk widthOK ov =>
    rw [hov_eq] at hcomp
    simp only [Prod.mk.injEq] at hcomp
    obtain ⟨hw_ok, hlist⟩ := hcomp
    subst hw_ok
    rw [← hlist, list_ofFn_getD _ k zeroI hk]
    unfold muTigOf
    refine mem_sumIval 36 _ _ fun idxM hM => ?_
    dsimp only
    simp only [Int.ofNat_eq_natCast]
    set mSigned : ℤ := (idxM : ℤ) - 17
    set a := mSigned.natAbs
    set b := (1 - mSigned).natAbs
    set k0 := (a + b - 1) / 2
    by_cases hlt : k < k0
    · change k < (((idxM : ℤ) - 17).natAbs + (1 - ((idxM : ℤ) - 17)).natAbs - 1) / 2 at hlt
      simp only [ite_eq_left hlt]
      exact mem_zero
    · change ¬k < (((idxM : ℤ) - 17).natAbs + (1 - ((idxM : ℤ) - 17)).natAbs - 1) / 2 at hlt
      simp only [ite_eq_right hlt]
      refine mem_sumIval (k - k0 + 1) _ _ fun n1 hn1 => ?_
      set n2 := k - k0 - n1
      have hov_s := modeOverlapsAt_sound (bLag := 192) (by omega)
        (by unfold sh832; rfl) (by unfold sh216; positivity) hlag_s creArr cimArr hov_eq hM
        n1 (by omega) n2 (by omega)
      dsimp only at hov_s
      have hsc192 : (2 : ℝ) ^ (2 * 192 + 24) / (sh216 : ℝ) = (2 : ℝ) ^ 192 := by
        unfold sh216; push_cast; ring
      rw [hsc192] at hov_s
      let pair := ((ov.getD idxM #[]).getD n1 #[]).getD n2 ((0, 0), (0, 0))
      let reIv := pair.1
      let imIv := pair.2
      have hsr := sqIntIval_sound hov_s.1 hov_s.2.1
      have hsi := sqIntIval_sound hov_s.2.2.1 hov_s.2.2.2
      have hnorm_sq : ‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 * (2 : ℝ) ^ 384 =
          ((modeOverlap creArr cimArr idxM n1 n2).re * (2 : ℝ) ^ 192) ^ 2 +
            ((modeOverlap creArr cimArr idxM n1 n2).im * (2 : ℝ) ^ 192) ^ 2 := by
        rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
      set na : ℤ := (risingFact n1 a : ℤ)
      set nb : ℤ := (risingFact n2 b : ℤ)
      have hden_pos : (0 : ℤ) < sh256 * na * nb := by
        unfold sh256; dsimp only [na, nb]
        have := risingFact_pos n1 a; have := risingFact_pos n2 b; positivity
      set sr := sqIntIval reIv.1 reIv.2
      set si := sqIntIval imIv.1 imIv.2
      set vIv := ivDivPosL (sr.1 + si.1, sr.2 + si.2) (sh256 * na * nb)
      have hvIv : (vIv.1 : ℝ) ≤ (‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 /
            ((risingFact n1 a * risingFact n2 b : ℕ) : ℝ)) * (D : ℝ) ∧
          (‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 /
            ((risingFact n1 a * risingFact n2 b : ℕ) : ℝ)) * (D : ℝ) ≤ (vIv.2 : ℝ) := by
        have hsc : (‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 /
              ((risingFact n1 a * risingFact n2 b : ℕ) : ℝ)) * (D : ℝ) *
              ((sh256 * na * nb : ℤ) : ℝ) =
            ‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 * (2 : ℝ) ^ 384 := by
          unfold D K sh256
          dsimp only [na, nb]
          have hna : (risingFact n1 a : ℝ) ≠ 0 := by exact_mod_cast (risingFact_pos n1 a).ne'
          have hnb : (risingFact n2 b : ℝ) ≠ 0 := by exact_mod_cast (risingFact_pos n2 b).ne'
          push_cast
          field_simp [hna, hnb]
          ring
        exact ⟨ediv_le_of_mul hden_pos (by rw [hsc, hnorm_sq]; push_cast; linarith [hsr.1, hsi.1]),
          le_neg_ediv_neg_of_mul hden_pos (by rw [hsc, hnorm_sq]; push_cast; linarith [hsr.2, hsi.2])⟩
      change mem ((if mSigned % 2 = 0 then (1 : ℝ) else -1) *
          (‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 / ((risingFact n1 a * risingFact n2 b : ℕ) : ℝ)))
        (if decide ((mSigned % 2 == 0) = true) then ⟨vIv.1, vIv.2⟩ else ⟨-vIv.2, -vIv.1⟩)
      by_cases hev : mSigned % 2 = 0
      · have hb_ev : decide ((mSigned % 2 == 0) = true) = true := by simp [hev]
        rw [ite_eq_left hev, hb_ev, ite_eq_left rfl, one_mul]
        exact hvIv
      · have hb_ev : decide ((mSigned % 2 == 0) = true) = false := by simp [hev]
        rw [ite_eq_right hev, hb_ev]
        simp only [Bool.false_eq_true, ↓reduceIte, neg_one_mul, mem, Int.cast_neg]
        exact ⟨by linarith [hvIv.2], by linarith [hvIv.1]⟩

lemma flatIdx_ofFn_props {M : ℕ} (hM : M = 168) {entryFn : (m : Fin M) → Fin ((501 - 3 * m.val - (1 - m.val % 2)) / 2 + 1) → ℕ × Ival}
    {rows : List RowI}
    (hrows : (List.ofFn fun (mIdx : Fin M) =>
      let d2 := mIdx.val
      let nStart := 1 - d2 % 2
      let nCount := (501 - 3 * d2 - nStart) / 2 + 1
      (d2, List.ofFn fun (tIdx : Fin nCount) => entryFn mIdx tIdx)) = rows)
    (h1 : ∀ d2 t, (entryFn d2 t).1 = 1 - d2.val % 2 + 2 * t.val) :
    (flatIdx rows).Nodup ∧
      (∀ p : ℕ × ℕ, p ∈ flatIdx rows ↔ (p.1 + p.2) % 2 = 1 ∧ p ∈ headIdx 501) ∧
      ∀ r ∈ rows, r.1 ≤ 167 ∧ ∀ e ∈ r.2, e.1 ≤ 501 ∧
        ∃ (m : Fin M) (t : Fin ((501 - 3 * m.val - (1 - m.val % 2)) / 2 + 1)),
          r.1 = m.val ∧ e = entryFn m t := by
  subst hrows
  set rows : List RowI := List.ofFn fun (mIdx : Fin M) =>
    let d2 := mIdx.val
    let nStart := 1 - d2 % 2
    let nCount := (501 - 3 * d2 - nStart) / 2 + 1
    (d2, List.ofFn fun (tIdx : Fin nCount) => entryFn mIdx tIdx)
  have hflat_eq : flatIdx rows =
      (List.ofFn fun (mIdx : Fin M) =>
        let d2 := mIdx.val
        let nStart := 1 - d2 % 2
        let nCount := (501 - 3 * d2 - nStart) / 2 + 1
        List.ofFn fun (tIdx : Fin nCount) => (nStart + 2 * tIdx.val, d2)).flatten := by
    dsimp only [rows]
    unfold flatIdx
    rw [List.flatMap_def, List.map_ofFn]
    apply congrArg List.flatten
    apply congrArg List.ofFn
    funext mIdx
    simp only [Function.comp_apply, List.map_ofFn]
    apply congrArg List.ofFn
    funext tIdx
    simp only [Function.comp_apply, h1]
  refine ⟨?_, ?_, ?_⟩
  · rw [hflat_eq, List.nodup_flatten]
    refine ⟨?_, ?_⟩
    · intro l hl
      rw [List.mem_ofFn] at hl
      obtain ⟨mIdx, rfl⟩ := hl
      exact List.nodup_ofFn.2 fun i j hij => Fin.ext (by injection hij; omega)
    · rw [List.pairwise_ofFn]
      intro i j hij p hp1 hp2
      rw [List.mem_ofFn] at hp1 hp2
      obtain ⟨ti, rfl⟩ := hp1
      obtain ⟨tj, heq⟩ := hp2
      injection heq with _ hm
      exact absurd (Fin.ext hm.symm) hij.ne
  · rintro ⟨d1, d2⟩
    rw [hflat_eq, List.mem_flatten, mem_headIdx]
    dsimp only
    constructor
    · rintro ⟨l, hl, hp⟩
      rw [List.mem_ofFn] at hl
      obtain ⟨mIdx, rfl⟩ := hl
      rw [List.mem_ofFn] at hp
      obtain ⟨tIdx, heq⟩ := hp
      injection heq with hd1 hd2
      have hm := mIdx.isLt; have ht := tIdx.isLt
      omega
    · rintro ⟨hodd, hbound⟩
      have hd2_lt : d2 < M := by omega
      set nStart := 1 - d2 % 2
      set nCount := (501 - 3 * d2 - nStart) / 2 + 1
      set t := (d1 - nStart) / 2
      have ht_lt : t < nCount := by dsimp only [t, nStart, nCount]; omega
      refine ⟨_, List.mem_ofFn.2 ⟨⟨d2, hd2_lt⟩, rfl⟩, List.mem_ofFn.2 ⟨⟨t, ht_lt⟩, ?_⟩⟩
      exact Prod.ext (by dsimp only [t, nStart]; omega) rfl
  · intro r hr
    dsimp only [rows] at hr
    rw [List.mem_ofFn] at hr
    obtain ⟨mIdx, rfl⟩ := hr
    have hm := mIdx.isLt
    refine ⟨by omega, fun e he_mem => ?_⟩
    dsimp only at he_mem
    rw [List.mem_ofFn] at he_mem
    obtain ⟨tIdx, rfl⟩ := he_mem
    have ht := tIdx.isLt
    exact ⟨by rw [h1]; omega, mIdx, tIdx, rfl, rfl⟩

private lemma bStepRow_sound {c0N c1N denM : ℤ} (hden : 0 < denM)
    {d : ℕ} {prev : Array (Int × Int)} (hsz : prev.size = d + 1)
    {f : ℕ → ℝ} (hf0 : ∀ j, d < j → f j = 0)
    (hprev : ∀ j ≤ d, memLag (f j) (prev.getD j (0, 0))) :
    let nxt := bStepRow c0N c1N denM prev
    nxt.size = d + 2 ∧
      ∀ j ≤ d + 1,
        memLag (((c0N : ℝ) / (denM : ℝ)) * (if j = 0 then 0 else f (j - 1)) +
          ((c1N : ℝ) / (denM : ℝ)) * f j) (nxt.getD j (0, 0)) := by
  dsimp only
  have hsz_out : (bStepRow c0N c1N denM prev).size = d + 2 := by simp [bStepRow, hsz]
  refine ⟨hsz_out, fun j hj => ?_⟩
  unfold bStepRow
  rw [array_ofFn_getD _ j (0, 0) (by omega)]
  dsimp only
  simp only [hsz, Nat.add_sub_cancel]
  have ht0 : memLag ((if j = 0 then 0 else f (j - 1)) * (c0N : ℝ))
      (if j == 0 then (0, 0) else ivMulIntL (prev.getD (j - 1) (0, 0)) c0N) := by
    rcases Nat.eq_zero_or_pos j with rfl | hj_pos
    · simp [memLag]
    · rw [ite_eq_right hj_pos.ne', show (j == 0) = false from beq_false_of_ne hj_pos.ne',
        ite_eq_right Bool.false_ne_true]
      exact ivMulIntL_sound (hprev (j - 1) (by omega)) c0N
  have ht1 : memLag (f j * (c1N : ℝ))
      (if d < j then (0, 0) else ivMulIntL (prev.getD j (0, 0)) c1N) := by
    by_cases hgt : d < j
    · rw [ite_eq_left hgt, hf0 j hgt]; simp [memLag]
    · rw [ite_eq_right hgt]; exact ivMulIntL_sound (hprev j (by omega)) c1N
  have hdiv := ivDivPosL_sound (ivAddL_sound ht0 ht1) hden
  have hdenR : (denM : ℝ) ≠ 0 := by exact_mod_cast hden.ne'
  convert hdiv using 1
  field_simp

private lemma bRowsLoop_sound {c0N c1N denM : ℤ} (hden : 0 < denM)
    (F : ℕ → ℕ → ℝ) (d0 : ℕ)
    (hF_gt : ∀ s j, d0 + s < j → F s j = 0)
    (hF_step : ∀ s j, j ≤ d0 + s + 1 →
      F (s + 1) j = ((c0N : ℝ) / (denM : ℝ)) * (if j = 0 then 0 else F s (j - 1)) +
        ((c1N : ℝ) / (denM : ℝ)) * F s j) :
    ∀ (rem s : ℕ) (cur : Array (Int × Int)) (acc : Array (Array (Int × Int))),
      acc.size = s + 1 →
      cur.size = d0 + s + 1 →
      (∀ t ≤ s, ∀ j ≤ d0 + t, memLag (F t j) ((acc.getD t #[]).getD j (0, 0))) →
      (∀ j ≤ d0 + s, memLag (F s j) (cur.getD j (0, 0))) →
      let out := bRowsLoop c0N c1N denM rem cur acc
      out.size = s + 1 + rem ∧
        ∀ t ≤ s + rem, ∀ j ≤ d0 + t, memLag (F t j) ((out.getD t #[]).getD j (0, 0))
  | 0, s, _, acc, hsa, _, hacc, _ => by
    simp only [bRowsLoop, add_zero]; exact ⟨hsa, hacc⟩
  | rem + 1, s, cur, acc, hsa, hcur_sz, hacc, hcur => by
    simp only [bRowsLoop]
    obtain ⟨hnxt_sz, hnxt0⟩ := bStepRow_sound hden hcur_sz (hF_gt s) hcur
    have hnxt : ∀ j ≤ d0 + (s + 1), memLag (F (s + 1) j) ((bStepRow c0N c1N denM cur).getD j (0, 0)) := by
      intro j hj
      rw [hF_step s j (by omega)]
      exact hnxt0 j (by omega)
    have hacc' : ∀ t ≤ s + 1, ∀ j ≤ d0 + t,
        memLag (F t j) (((acc.push (bStepRow c0N c1N denM cur)).getD t #[]).getD j (0, 0)) := by
      intro t ht j hj
      rcases Nat.of_le_succ ht with hle | rfl
      · rw [array_push_getD_lt acc _ #[] (by omega)]
        exact hacc t hle j hj
      · rw [array_push_getD_eq acc _ #[] hsa]
        exact hnxt j hj
    have ih := bRowsLoop_sound hden F d0 hF_gt hF_step rem (s + 1) _ _
      (by simp [hsa]) (by omega) hacc' hnxt
    simpa [show s + 1 + rem = s + (rem + 1) by omega,
      show s + 1 + 1 + rem = s + 1 + (rem + 1) by omega] using ih

theorem bTable1024_sound {u0N u1N v0N v1N denM : ℤ} (hden : 0 < denM)
    {b a j : ℕ} (hb : b ≤ 167) (ha : a ≤ 251 - b) (hj : j ≤ a + b) :
    memLag (bCoeff ((u0N : ℝ) / denM) ((u1N : ℝ) / denM) ((v0N : ℝ) / denM) ((v1N : ℝ) / denM) a b j)
      ((((bTable1024 u0N u1N v0N v1N denM).getD b #[]).getD a #[]).getD j (0, 0)) := by
  set u0 := (u0N : ℝ) / denM; set u1 := (u1N : ℝ) / denM
  set v0 := (v0N : ℝ) / denM; set v1 := (v1N : ℝ) / denM
  have hrow0s := bRowsLoop_sound (c0N := v0N) (c1N := v1N) hden
    (fun s k => bCoeff u0 u1 v0 v1 0 s k) 0
    (fun s k hk => bCoeff_eq_zero_of_gt u0 u1 v0 v1 0 s k (by omega))
    (fun _ k _ => by simp only [bCoeff, v0, v1])
    167 0 #[(dLag, dLag)] #[#[(dLag, dLag)]] rfl rfl
    (fun t ht k hk => by obtain rfl := Nat.le_zero.1 ht; obtain rfl := Nat.le_zero.1 hk; simp [bCoeff, memLag])
    (fun k hk => by obtain rfl := Nat.le_zero.1 hk; simp [bCoeff, memLag])
  have hb_sz_loop : ∀ rem s (cur : Array (Int × Int)) (acc : Array (Array (Int × Int))),
      acc.size = s + 1 → cur.size = s + 1 →
      (∀ t ≤ s, (acc.getD t #[]).size = t + 1) →
      ∀ t ≤ s + rem, ((bRowsLoop v0N v1N denM rem cur acc).getD t #[]).size = t + 1 := by
    intro rem; induction rem with
    | zero => intro s _ acc _ _ hacc t ht; exact hacc t ht
    | succ rem ih =>
      intro s cur acc hsa hcs hacc t ht
      simp only [bRowsLoop]
      have hnxt : (bStepRow v0N v1N denM cur).size = s + 2 := by simp [bStepRow, hcs]
      refine ih (s + 1) _ _ (by simp [hsa]) hnxt (fun r hr => ?_) t (by omega)
      rcases Nat.of_le_succ hr with hle | rfl
      · rw [array_push_getD_lt acc _ #[] (by omega)]
        exact hacc r hle
      · rw [array_push_getD_eq acc _ #[] hsa]
        exact hnxt
  have hbase_sz : ((bRowsLoop v0N v1N denM 167 #[(dLag, dLag)] #[#[(dLag, dLag)]]).getD b #[]).size = b + 1 :=
    hb_sz_loop 167 0 #[(dLag, dLag)] #[#[(dLag, dLag)]] rfl rfl
      (fun t ht => by obtain rfl := Nat.le_zero.1 ht; rfl) b (by omega)
  have hbase_mem : ∀ k ≤ b, memLag (bCoeff u0 u1 v0 v1 0 b k)
      (((bRowsLoop v0N v1N denM 167 #[(dLag, dLag)] #[#[(dLag, dLag)]]).getD b #[]).getD k (0, 0)) :=
    fun k hk => hrow0s.2 b (by omega) k (by omega)
  unfold bTable1024
  generalize bRowsLoop v0N v1N denM 167 #[(dLag, dLag)] #[#[(dLag, dLag)]] = r0s at hbase_sz hbase_mem ⊢
  dsimp only
  rw [array_ofFn_getD _ b #[] (by omega)]
  dsimp only
  have ha_loop := bRowsLoop_sound (c0N := u0N) (c1N := u1N) hden
    (fun s k => bCoeff u0 u1 v0 v1 s b k) b
    (fun s k hk => bCoeff_eq_zero_of_gt u0 u1 v0 v1 s b k (by omega))
    (fun _ k _ => by simp only [bCoeff, u0, u1])
    (251 - b) 0 (r0s.getD b #[]) #[r0s.getD b #[]] rfl (by omega)
    (fun t ht k hk => by obtain rfl := Nat.le_zero.1 ht; exact hbase_mem k (by omega))
    (fun k hk => hbase_mem k (by omega))
  exact ha_loop.2 a (by omega) j (by omega)

lemma extractBMids_sound {u0N u1N v0N v1N denM : ℤ} (hden : 0 < denM)
    {m512 m400 : Array (Array (Array Int × Int))}
    (hext : extractBMids (bTable1024 u0N u1N v0N v1N denM) = (true, m512, m400))
    {b a : ℕ} (hb : b ≤ 167) (ha : a ≤ 251 - b) :
    let u0 := (u0N : ℝ) / denM; let u1 := (u1N : ℝ) / denM
    let v0 := (v0N : ℝ) / denM; let v1 := (v1N : ℝ) / denM
    let p512 := (m512.getD b #[]).getD a (#[], 0)
    let p400 := (m400.getD b #[]).getD a (#[], 0)
    (∀ j ≤ a + b, |bCoeff u0 u1 v0 v1 a b j * (2 : ℝ) ^ 512 - ((p512.1.getD j 0 : ℤ) : ℝ)| ≤ 1) ∧
      p512.2 = (sumInt (a + b + 1) fun j => Int.ofNat (p512.1.getD j 0).natAbs) ∧
      (∀ j ≤ a + b, |bCoeff u0 u1 v0 v1 a b j * (2 : ℝ) ^ 400 - ((p400.1.getD j 0 : ℤ) : ℝ)| ≤ 1) ∧
      p400.2 = (sumInt (a + b + 1) fun j => Int.ofNat (p400.1.getD j 0).natAbs) := by
  dsimp only
  have hbt : ∀ {j : ℕ}, j ≤ a + b →
      memLag (bCoeff ((u0N : ℝ) / denM) ((u1N : ℝ) / denM) ((v0N : ℝ) / denM) ((v1N : ℝ) / denM) a b j)
        ((((bTable1024 u0N u1N v0N v1N denM).getD b #[]).getD a #[]).getD j (0, 0)) :=
    fun hj => bTable1024_sound hden hb ha hj
  generalize bTable1024 u0N u1N v0N v1N denM = bt at hext hbt
  unfold extractBMids at hext
  simp only [Prod.mk.injEq] at hext
  obtain ⟨hok, hm1, hm2⟩ := hext
  rw [Bool.and_eq_true] at hok
  obtain ⟨hok512, hok400⟩ := hok
  rw [← hm1, ← hm2]
  have h1a := (List.all_eq_true.1 hok512) b (List.mem_range.2 (by omega))
  have h1 := (List.all_eq_true.1 h1a) a (List.mem_range.2 (by omega))
  rw [array_ofFn_getD _ b #[] (by omega)] at h1
  dsimp only at h1
  rw [array_ofFn_getD _ a (false, #[], 0) (by omega)] at h1
  dsimp only at h1
  have h2a := (List.all_eq_true.1 hok400) b (List.mem_range.2 (by omega))
  have h2 := (List.all_eq_true.1 h2a) a (List.mem_range.2 (by omega))
  rw [array_ofFn_getD _ b #[] (by omega)] at h2
  dsimp only at h2
  rw [array_ofFn_getD _ a (false, #[], 0) (by omega)] at h2
  dsimp only at h2
  rw [array_ofFn_getD _ b #[] (by omega)]
  dsimp only
  rw [array_ofFn_getD _ a (#[], 0) (by omega)]
  dsimp only
  rw [array_ofFn_getD _ b #[] (by omega)]
  dsimp only
  rw [array_ofFn_getD _ a (false, #[], 0) (by omega)]
  dsimp only
  rw [array_ofFn_getD _ b #[] (by omega)]
  dsimp only
  rw [array_ofFn_getD _ a (#[], 0) (by omega)]
  dsimp only
  rw [array_ofFn_getD _ b #[] (by omega)]
  dsimp only
  rw [array_ofFn_getD _ a (false, #[], 0) (by omega)]
  dsimp only
  refine ⟨fun j hj => ?_, rfl, fun j hj => ?_, rfl⟩
  · have hj_ok := (List.all_eq_true.1 h1) j (List.mem_range.2 (by omega))
    rw [array_ofFn_getD _ j (false, 0) (by omega)] at hj_ok
    rw [array_ofFn_getD _ j 0 (by omega), array_ofFn_getD _ j (false, 0) (by omega)]
    exact toMid_sound_lag (by omega) (by unfold sh512; rfl) (hbt hj) hj_ok
  · have hj_ok := (List.all_eq_true.1 h2) j (List.mem_range.2 (by omega))
    rw [array_ofFn_getD _ j (false, 0) (by omega)] at hj_ok
    rw [array_ofFn_getD _ j 0 (by omega), array_ofFn_getD _ j (false, 0) (by omega)]
    exact toMid_sound_lag (by omega) (by unfold sh624; rfl) (hbt hj) hj_ok

lemma gLookup704_sound_of_mid {creArr cimArr : Array Int}
    {gMid : Array (Array (Array (Int × Int)))}
    (hmid : ∀ (idxM : ℕ), idxM < 36 →
      let mSigned : ℤ := (idxM : ℤ) - 17
      let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
      ∀ n1 ≤ 250 - k0, ∀ n2 ≤ 250 - k0 - n1,
        let denGNat := (n1 + n2).choose n1 * risingFact (n1 + n2) k0
        let gm := ((gMid.getD idxM #[]).getD n1 #[]).getD n2 (0, 0)
        |((modeOverlap creArr cimArr idxM n1 n2).re / (denGNat : ℝ)) * (2 : ℝ) ^ 512 - (gm.1 : ℝ)| ≤ 1 ∧
        |((modeOverlap creArr cimArr idxM n1 n2).im / (denGNat : ℝ)) * (2 : ℝ) ^ 512 - (gm.2 : ℝ)| ≤ 1)
    {k j1 j2 : ℕ} (hk : k ≤ 250) (hj1 : j1 ≤ k + 1) (hj2 : j2 ≤ k) :
    |(gScaled creArr cimArr k j1 j2).re * (2 : ℝ) ^ 512 - ((gLookup704 gMid k j1 j2).1 : ℝ)| ≤ 1 ∧
    |(gScaled creArr cimArr k j1 j2).im * (2 : ℝ) ^ 512 - ((gLookup704 gMid k j1 j2).2 : ℝ)| ≤ 1 := by
  unfold gScaled gLookup704
  dsimp only
  simp only [Int.ofNat_eq_natCast]
  set mSigned : ℤ := (j1 : ℤ) - j2
  by_cases hrange : -17 ≤ mSigned ∧ mSigned ≤ 18
  · rw [ite_eq_left hrange, ite_eq_left (decide_eq_true hrange)]
    set idxM := (mSigned + 17).toNat
    set n1 := min j1 j2
    set n2 := min (k + 1 - j1) (k - j2)
    set k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    have hM : idxM < 36 := by omega
    have hms_eq : (idxM : ℤ) - 17 = mSigned := by omega
    have hsum_k : n1 + n2 + k0 = k := by dsimp only [n1, n2, k0, mSigned]; omega
    have hn1_le : n1 ≤ 250 - k0 := by omega
    have hn2_le : n2 ≤ 250 - k0 - n1 := by omega
    have hm := hmid idxM hM
    dsimp only at hm
    have hm' := hm n1 (by rw [hms_eq]; exact hn1_le) n2 (by rw [hms_eq]; exact hn2_le)
    rw [hms_eq] at hm'
    set denGNat := (n1 + n2).choose n1 * risingFact (n1 + n2) k0
    have hre_div : ∀ z : ℂ, (z / ((denGNat : ℝ) : ℂ)).re = z.re / (denGNat : ℝ) := fun z => by
      rw [div_eq_mul_inv, ← Complex.ofReal_inv, mul_comm, Complex.re_ofReal_mul, div_eq_mul_inv, mul_comm]
    have him_div : ∀ z : ℂ, (z / ((denGNat : ℝ) : ℂ)).im = z.im / (denGNat : ℝ) := fun z => by
      rw [div_eq_mul_inv, ← Complex.ofReal_inv, mul_comm, Complex.im_ofReal_mul, div_eq_mul_inv, mul_comm]
    rw [show (((n1 + n2).choose n1 * risingFact (n1 + n2) k0 : ℕ) : ℂ) = ((denGNat : ℝ) : ℂ) by
      dsimp only [denGNat]; push_cast; rfl, hre_div, him_div]
    exact hm'
  · rw [ite_eq_right hrange, ite_eq_right (mt of_decide_eq_true hrange)]
    simp

lemma t1Cell_sound {creArr cimArr : Array Int}
    {gMid : Array (Array (Array (Int × Int)))}
    {ct st seR : ℝ} {k q1 q2 j1 : ℕ} {b2Row : Array Int} {sb2 : ℤ}
    (hgL : ∀ j2 < k + 1,
      |(gScaled creArr cimArr k j1 j2).re * (2 : ℝ) ^ 512 - ((gLookup704 gMid k j1 j2).1 : ℝ)| ≤ 1 ∧
      |(gScaled creArr cimArr k j1 j2).im * (2 : ℝ) ^ 512 - ((gLookup704 gMid k j1 j2).2 : ℝ)| ≤ 1)
    (hb2 : ∀ j2 ≤ k,
      |bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 * (2 : ℝ) ^ 512 - ((b2Row.getD j2 0 : ℤ) : ℝ)| ≤ 1)
    (hsb2 : sb2 = sumInt (k + 1) fun j2 => Int.ofNat (b2Row.getD j2 0).natAbs)
    (hok : ((toMid
        ((sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).1 (b2Row.getD j2 0)) -
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).1.natAbs) + sb2 + Int.ofNat (k + 1)),
         (sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).1 (b2Row.getD j2 0)) +
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).1.natAbs) + sb2 + Int.ofNat (k + 1))) sh624).1 &&
      (toMid
        ((sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).2 (b2Row.getD j2 0)) -
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).2.natAbs) + sb2 + Int.ofNat (k + 1)),
         (sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).2 (b2Row.getD j2 0)) +
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).2.natAbs) + sb2 + Int.ofNat (k + 1))) sh624).1) = true) :
    |(∑ j2 ∈ range (k + 1),
        gScaled creArr cimArr k j1 j2 *
          ((bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 : ℝ) : ℂ)).re * (2 : ℝ) ^ 400 -
      (((toMid
        ((sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).1 (b2Row.getD j2 0)) -
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).1.natAbs) + sb2 + Int.ofNat (k + 1)),
         (sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).1 (b2Row.getD j2 0)) +
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).1.natAbs) + sb2 + Int.ofNat (k + 1))) sh624).2 : ℤ) : ℝ)| ≤ 1 ∧
    |(∑ j2 ∈ range (k + 1),
        gScaled creArr cimArr k j1 j2 *
          ((bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 : ℝ) : ℂ)).im * (2 : ℝ) ^ 400 -
      (((toMid
        ((sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).2 (b2Row.getD j2 0)) -
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).2.natAbs) + sb2 + Int.ofNat (k + 1)),
         (sumInt (k + 1) fun j2 => mulSkipZero (gLookup704 gMid k j1 j2).2 (b2Row.getD j2 0)) +
          ((sumInt (k + 1) fun j2 => Int.ofNat (gLookup704 gMid k j1 j2).2.natAbs) + sb2 + Int.ofNat (k + 1))) sh624).2 : ℤ) : ℝ)| ≤ 1 := by
  simp only [mulSkipZero_eq, Bool.and_eq_true] at hok ⊢
  have hd_re := dotMidErr (k + 1)
    (fun j2 => (gScaled creArr cimArr k j1 j2).re * (2 : ℝ) ^ 512)
    (fun j2 => bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 * (2 : ℝ) ^ 512)
    (fun j2 => (gLookup704 gMid k j1 j2).1) (fun j2 => b2Row.getD j2 0)
    (fun j2 hj2 => (hgL j2 hj2).1)
    (fun j2 hj2 => hb2 j2 (by omega))
  have hd_im := dotMidErr (k + 1)
    (fun j2 => (gScaled creArr cimArr k j1 j2).im * (2 : ℝ) ^ 512)
    (fun j2 => bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 * (2 : ℝ) ^ 512)
    (fun j2 => (gLookup704 gMid k j1 j2).2) (fun j2 => b2Row.getD j2 0)
    (fun j2 hj2 => (hgL j2 hj2).2)
    (fun j2 hj2 => hb2 j2 (by omega))
  rw [← hsb2, abs_le] at hd_re hd_im
  have hre_sum : (∑ j2 ∈ range (k + 1),
      gScaled creArr cimArr k j1 j2 *
        ((bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 : ℝ) : ℂ)).re * (2 : ℝ) ^ 1024 =
      ∑ j2 ∈ range (k + 1), ((gScaled creArr cimArr k j1 j2).re * (2 : ℝ) ^ 512) *
        (bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 * (2 : ℝ) ^ 512) := by
    rw [Complex.re_sum, sum_mul]
    refine sum_congr rfl fun j2 _ => ?_
    simp only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, mul_zero, sub_zero]
    ring
  have him_sum : (∑ j2 ∈ range (k + 1),
      gScaled creArr cimArr k j1 j2 *
        ((bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 : ℝ) : ℂ)).im * (2 : ℝ) ^ 1024 =
      ∑ j2 ∈ range (k + 1), ((gScaled creArr cimArr k j1 j2).im * (2 : ℝ) ^ 512) *
        (bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 * (2 : ℝ) ^ 512) := by
    rw [Complex.im_sum, sum_mul]
    refine sum_congr rfl fun j2 _ => ?_
    simp only [Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, mul_zero]
    ring
  rw [← hre_sum] at hd_re
  rw [← him_sum] at hd_im
  have hsh624_pos : (0 : ℤ) < sh624 := by unfold sh624; positivity
  unfold toMid at hok ⊢
  dsimp only at hok ⊢
  rw [decide_eq_true_eq, decide_eq_true_eq] at hok
  set S_val := ∑ j2 ∈ range (k + 1),
    gScaled creArr cimArr k j1 j2 *
      ((bCoeff ct (-(seR * st)) st (seR * ct) q1 q2 j2 : ℝ) : ℂ)
  have hsc_re : S_val.re * (2 : ℝ) ^ 400 * (sh624 : ℝ) = S_val.re * (2 : ℝ) ^ 1024 := by
    unfold sh624; push_cast; ring
  have hsc_im : S_val.im * (2 : ℝ) ^ 400 * (sh624 : ℝ) = S_val.im * (2 : ℝ) ^ 1024 := by
    unfold sh624; push_cast; ring
  exact ⟨midpoint_err_le_one
      (ediv_le_of_mul hsh624_pos (by rw [hsc_re, Int.cast_sub]; linarith [hd_re.1]))
      (le_neg_ediv_neg_of_mul hsh624_pos (by rw [hsc_re, Int.cast_add]; linarith [hd_re.2])) hok.1,
    midpoint_err_le_one
      (ediv_le_of_mul hsh624_pos (by rw [hsc_im, Int.cast_sub]; linarith [hd_im.1]))
      (le_neg_ediv_neg_of_mul hsh624_pos (by rw [hsc_im, Int.cast_add]; linarith [hd_im.2])) hok.2⟩

lemma dotT1_sound {k : ℕ} {b1F : ℕ → ℝ} {innerF : ℕ → ℂ}
    {b1Row : Array Int} {sb1 : ℤ} {t1Cells : Array (Bool × Int × Int)}
    (hb1 : ∀ j1 < k + 2, |b1F j1 - ((b1Row.getD j1 0 : ℤ) : ℝ)| ≤ 1)
    (hsb1 : sb1 = sumInt (k + 2) fun j1 => Int.ofNat (b1Row.getD j1 0).natAbs)
    (hok : ((List.range (k + 2)).all fun j1 => (t1Cells.getD j1 (false, 0, 0)).1) = true)
    (hcell : ∀ j1 < k + 2, (t1Cells.getD j1 (false, 0, 0)).1 = true →
      |(innerF j1).re * (2 : ℝ) ^ 400 - (((t1Cells.getD j1 (false, 0, 0)).2.1 : ℤ) : ℝ)| ≤ 1 ∧
      |(innerF j1).im * (2 : ℝ) ^ 400 - (((t1Cells.getD j1 (false, 0, 0)).2.2 : ℤ) : ℝ)| ≤ 1) :
    let rArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.1
    let iArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.2
    let dotRe := sumInt (k + 2) fun j1 => b1Row.getD j1 0 * rArr.getD j1 0
    let dotIm := sumInt (k + 2) fun j1 => b1Row.getD j1 0 * iArr.getD j1 0
    let errRe := sb1 + (sumInt (k + 2) fun j1 => Int.ofNat (rArr.getD j1 0).natAbs) + Int.ofNat (k + 2)
    let errIm := sb1 + (sumInt (k + 2) fun j1 => Int.ofNat (iArr.getD j1 0).natAbs) + Int.ofNat (k + 2)
    |(∑ j1 ∈ range (k + 2), b1F j1 * ((innerF j1).re * (2 : ℝ) ^ 400)) - (dotRe : ℝ)| ≤ (errRe : ℝ) ∧
    |(∑ j1 ∈ range (k + 2), b1F j1 * ((innerF j1).im * (2 : ℝ) ^ 400)) - (dotIm : ℝ)| ≤ (errIm : ℝ) := by
  dsimp only
  set rArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.1
  set iArr := Array.ofFn fun (j1Idx : Fin (k + 2)) => (t1Cells.getD j1Idx.val (false, 0, 0)).2.2
  have hpt : ∀ j1 < k + 2,
      |(innerF j1).re * (2 : ℝ) ^ 400 - ((rArr.getD j1 0 : ℤ) : ℝ)| ≤ 1 ∧
      |(innerF j1).im * (2 : ℝ) ^ 400 - ((iArr.getD j1 0 : ℤ) : ℝ)| ≤ 1 := by
    intro j1 hj1
    dsimp only [rArr, iArr]
    rw [array_ofFn_getD _ j1 0 hj1, array_ofFn_getD _ j1 0 hj1]
    exact hcell j1 hj1 ((List.all_eq_true.1 hok) j1 (List.mem_range.2 hj1))
  have hd_re := dotMidErr (k + 2) b1F (fun j1 => (innerF j1).re * (2 : ℝ) ^ 400)
    (fun j1 => b1Row.getD j1 0) (fun j1 => rArr.getD j1 0) hb1 (fun j1 hj1 => (hpt j1 hj1).1)
  have hd_im := dotMidErr (k + 2) b1F (fun j1 => (innerF j1).im * (2 : ℝ) ^ 400)
    (fun j1 => b1Row.getD j1 0) (fun j1 => iArr.getD j1 0) hb1 (fun j1 hj1 => (hpt j1 hj1).2)
  rw [← hsb1] at hd_re hd_im
  exact ⟨hd_re, hd_im⟩

end
end Haagerup
