import HaagerupKernel.CellKernel
import Haagerup.ChaosRealise
import Mathlib.MeasureTheory.Function.Floor

set_option warningAsError true

/-!
# Parametric `64 × 64`, 36-mode cell rounding maps `cellFn` and unit-disk SOS soundness

Defines `cellFn creArr cimArr : ℂ × ℂ → ℂ` for any `36 × 64 × 64` integer Fourier table at dyadic
scale `2⁻²⁴` on `r₁, r₂ ∈ [0, 6)` cut into `64` bins of width `3 / 32` (shared by both `f_tig` and
`T_cell`). Proves:
* `measurable_cellFn : Measurable (cellFn creArr cimArr)`;
* `cellFn_rot2 : ‖c‖ = 1 → cellFn creArr cimArr (rot2 c u) = c * cellFn creArr cimArr u`;
* `norm_cellFn_le : sosAllOK creArr cimArr qreArr qimArr = true → ‖cellFn creArr cimArr u‖ ≤ 1`;
* `memLp_cellFn : sosAllOK creArr cimArr qreArr qimArr = true → MemLp (cellFn creArr cimArr) 2 mu2`.

Agent-ID: gemini-21d5
-/

namespace Haagerup

open MeasureTheory Finset Complex
open HaagerupKernel HaagerupKernel.Cell
open scoped ComplexConjugate

noncomputable section

/-- Radial bin `⌊(32/3) ‖z‖⌋₊` (`< 64` when `‖z‖ < 6`). -/
def radBin (z : ℂ) : ℕ := Nat.floor ((32 / 3 : ℝ) * ‖z‖)

/-- Flattened cell index `64 * radBin z₁ + radBin z₂` (`< 4096` when `‖z₁‖, ‖z₂‖ < 6`). -/
def cellIdx (z₁ z₂ : ℂ) : ℕ := 64 * radBin z₁ + radBin z₂

/-- Scaled complex Fourier coefficient `(cr + i ci) / 2²⁴`. -/
def cellCoeffC (creArr cimArr : Array Int) (k cell : ℕ) : ℂ :=
  (((getCoeff creArr k cell : ℝ) : ℂ) + ((getCoeff cimArr k cell : ℝ) : ℂ) * Complex.I) /
    (((2 : ℝ) ^ 24 : ℝ) : ℂ)

/-- Unscaled complex integer coefficient `cr + i ci`. -/
def cellIntC (cr ci : ℕ → ℤ) (k : ℕ) : ℂ :=
  ((cr k : ℝ) : ℂ) + ((ci k : ℝ) : ℂ) * Complex.I

/-- Parametric `64 × 64`, 36-mode charge-one rounding map `cellFn creArr cimArr : ℂ × ℂ → ℂ`. -/
def cellFn (creArr cimArr : Array Int) (u : ℂ × ℂ) : ℂ :=
  if u.1 = 0 ∨ u.2 = 0 ∨ 6 ≤ ‖u.1‖ ∨ 6 ≤ ‖u.2‖ then 0
  else
    let w := ph u.1 * conj (ph u.2)
    let cell := cellIdx u.1 u.2
    ph u.2 * conj w ^ 17 * ∑ k ∈ range 36, cellCoeffC creArr cimArr k cell * w ^ k

/-! ### 1. Measurability and Charge One -/

lemma measurable_radBin : Measurable radBin :=
  (measurable_const.mul continuous_norm.measurable).nat_floor

lemma measurable_cellIdx : Measurable fun u : ℂ × ℂ => cellIdx u.1 u.2 := by
  unfold cellIdx
  exact (measurable_const.mul (measurable_radBin.comp measurable_fst)).add
    (measurable_radBin.comp measurable_snd)

theorem measurable_cellFn (creArr cimArr : Array Int) : Measurable (cellFn creArr cimArr) := by
  unfold cellFn
  have hS : MeasurableSet {u : ℂ × ℂ | u.1 = 0 ∨ u.2 = 0 ∨ 6 ≤ ‖u.1‖ ∨ 6 ≤ ‖u.2‖} := by
    have h1 : MeasurableSet {u : ℂ × ℂ | u.1 = 0} :=
      isClosed_eq continuous_fst continuous_const |>.measurableSet
    have h2 : MeasurableSet {u : ℂ × ℂ | u.2 = 0} :=
      isClosed_eq continuous_snd continuous_const |>.measurableSet
    have h3 : MeasurableSet {u : ℂ × ℂ | 6 ≤ ‖u.1‖} :=
      isClosed_le continuous_const (continuous_norm.comp continuous_fst) |>.measurableSet
    have h4 : MeasurableSet {u : ℂ × ℂ | 6 ≤ ‖u.2‖} :=
      isClosed_le continuous_const (continuous_norm.comp continuous_snd) |>.measurableSet
    exact h1.union (h2.union (h3.union h4))
  refine Measurable.ite hS measurable_const ?_
  have hph1 : Measurable fun u : ℂ × ℂ => ph u.1 := measurable_ph.comp measurable_fst
  have hph2 : Measurable fun u : ℂ × ℂ => ph u.2 := measurable_ph.comp measurable_snd
  have hw : Measurable fun u : ℂ × ℂ => ph u.1 * conj (ph u.2) :=
    hph1.mul (Complex.continuous_conj.measurable.comp hph2)
  have hsum : Measurable fun u : ℂ × ℂ =>
      ∑ k ∈ range 36, cellCoeffC creArr cimArr k (cellIdx u.1 u.2) *
        (ph u.1 * conj (ph u.2)) ^ k := by
    refine Finset.measurable_sum (range 36) fun k _ => ?_
    have hc : Measurable fun u : ℂ × ℂ => cellCoeffC creArr cimArr k (cellIdx u.1 u.2) :=
      (measurable_of_countable (cellCoeffC creArr cimArr k)).comp measurable_cellIdx
    exact hc.mul (hw.pow_const k)
  exact (hph2.mul ((Complex.continuous_conj.measurable.comp hw).pow_const 17)).mul hsum

theorem cellFn_rot2 (creArr cimArr : Array Int) {c : ℂ} (hc : ‖c‖ = 1) (u : ℂ × ℂ) :
    cellFn creArr cimArr (rot2 c u) = c * cellFn creArr cimArr u := by
  have hc0 : c ≠ 0 := fun h0 => by simp [h0] at hc
  have hcc : c * conj c = 1 := by
    rw [mul_comm, ← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]; simp
  have hcond : (c * u.1 = 0 ∨ c * u.2 = 0 ∨ 6 ≤ ‖c * u.1‖ ∨ 6 ≤ ‖c * u.2‖) ↔
      (u.1 = 0 ∨ u.2 = 0 ∨ 6 ≤ ‖u.1‖ ∨ 6 ≤ ‖u.2‖) := by
    simp [mul_eq_zero, hc0, hc]
  have hbin : ∀ z : ℂ, radBin (c * z) = radBin z := fun z => by
    simp [radBin, hc]
  have hcell : cellIdx (c * u.1) (c * u.2) = cellIdx u.1 u.2 := by
    simp [cellIdx, hbin]
  have hph : ∀ z : ℂ, ph (c * z) = c * ph z := fun z => by
    simp only [ph, norm_mul, hc, one_mul]; ring
  have hw : ph (c * u.1) * conj (ph (c * u.2)) = ph u.1 * conj (ph u.2) := by
    rw [hph, hph, map_mul]
    calc (c * ph u.1) * (conj c * conj (ph u.2))
        = (c * conj c) * (ph u.1 * conj (ph u.2)) := by ring
      _ = ph u.1 * conj (ph u.2) := by rw [hcc, one_mul]
  unfold cellFn rot2
  dsimp only
  by_cases h : u.1 = 0 ∨ u.2 = 0 ∨ 6 ≤ ‖u.1‖ ∨ 6 ≤ ‖u.2‖
  · rw [ite_eq_left (hcond.2 h), ite_eq_left h, mul_zero]
  · rw [ite_eq_right (mt hcond.1 h), ite_eq_right h, hcell, hw, hph u.2]
    ring

/-! ### 2. Fejér–Riesz Sum-of-Squares Identity on the Unit Circle -/

lemma sumInt_cast (n : ℕ) (f : ℕ → ℤ) :
    ((sumInt n f : ℤ) : ℝ) = ∑ k ∈ range n, ((f k : ℤ) : ℝ) := by
  induction n with
  | zero => simp [sumInt]
  | succ n ih => simp [sumInt, sum_range_succ, ih]

private lemma norm_sq_poly_pair_le_sos (cr ci qr qi : ℕ → ℤ) {w : ℂ} (hw : ‖w‖ = 1) :
    ‖∑ k ∈ range 36, cellIntC cr ci k * w ^ k‖ ^ 2 ≤
      ((sumInt 36 (fun k => cr k * cr k + ci k * ci k + qr k * qr k + qi k * qi k) +
        sumInt 35 (fun m0 =>
          let m := m0 + 1
          let re_m := sumInt (36 - m) fun d =>
            cr (d + m) * cr d + ci (d + m) * ci d + qr (d + m) * qr d + qi (d + m) * qi d
          let im_m := sumInt (36 - m) fun d =>
            ci (d + m) * cr d - cr (d + m) * ci d + qi (d + m) * qr d - qr (d + m) * qi d
          2 * (Int.ofNat re_m.natAbs + Int.ofNat im_m.natAbs)) : ℤ) : ℝ) := by
  set C := cellIntC cr ci
  set Q := cellIntC qr qi
  have hwc : w * conj w = 1 := by
    rw [mul_comm, ← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hw]; simp
  have hnorm_sum : ∀ F : ℕ → ℂ, ‖∑ k ∈ range 36, F k * w ^ k‖ ^ 2 =
      ∑ a ∈ range 36, ∑ b ∈ range 36, ((F a * conj (F b)) * (w ^ a * conj w ^ b)).re := fun F => by
    rw [← Complex.normSq_eq_norm_sq]
    have h1 : Complex.normSq (∑ k ∈ range 36, F k * w ^ k) =
        ((∑ k ∈ range 36, F k * w ^ k) * conj (∑ k ∈ range 36, F k * w ^ k)).re := by
      rw [mul_comm, ← Complex.normSq_eq_conj_mul_self, Complex.ofReal_re]
    rw [h1]
    have hmul : (∑ k ∈ range 36, F k * w ^ k) * conj (∑ k ∈ range 36, F k * w ^ k) =
        ∑ a ∈ range 36, ∑ b ∈ range 36, (F a * conj (F b)) * (w ^ a * conj w ^ b) := by
      rw [sum_mul]
      refine sum_congr rfl fun a _ => ?_
      rw [map_sum, mul_sum]
      refine sum_congr rfl fun b _ => ?_
      rw [map_mul, map_pow]; ring
    rw [hmul, Complex.re_sum]
    exact sum_congr rfl fun a _ => Complex.re_sum _ _
  have hpair : ‖∑ k ∈ range 36, C k * w ^ k‖ ^ 2 + ‖∑ k ∈ range 36, Q k * w ^ k‖ ^ 2 =
      ∑ a ∈ range 36, ∑ b ∈ range 36,
        ((C a * conj (C b) + Q a * conj (Q b)) * (w ^ a * conj w ^ b)).re := by
    rw [hnorm_sum C, hnorm_sum Q, ← sum_add_distrib]
    refine sum_congr rfl fun a _ => ?_
    rw [← sum_add_distrib]
    refine sum_congr rfl fun b _ => ?_
    rw [← Complex.add_re, add_mul]
  set term : ℕ → ℕ → ℝ := fun a b =>
    ((C a * conj (C b) + Q a * conj (Q b)) * (w ^ a * conj w ^ b)).re
  have hsymm : ∀ a b, term b a = term a b := fun a b => by
    dsimp only [term]
    rw [← Complex.conj_re]
    congr 1
    simp only [map_mul, map_add, map_pow, Complex.conj_conj]
    ring
  have hsplit : ∑ a ∈ range 36, ∑ b ∈ range 36, term a b =
      (∑ k ∈ range 36, term k k) +
        2 * ∑ m0 ∈ range 35, ∑ d ∈ range (36 - (m0 + 1)), term (d + (m0 + 1)) d := by
    have hgen : ∀ N : ℕ, ∑ a ∈ range N, ∑ b ∈ range N, term a b =
        (∑ k ∈ range N, term k k) +
          2 * ∑ m0 ∈ range (N - 1), ∑ d ∈ range (N - (m0 + 1)), term (d + (m0 + 1)) d := by
      intro N
      induction N with
      | zero => simp
      | succ N ih =>
        rcases Nat.eq_zero_or_pos N with rfl | hN
        · simp
        · rw [sum_range_succ]
          have hrow : ∑ a ∈ range N, ∑ b ∈ range (N + 1), term a b =
              (∑ a ∈ range N, ∑ b ∈ range N, term a b) + ∑ a ∈ range N, term a N := by
            rw [← sum_add_distrib]
            exact sum_congr rfl fun a _ => sum_range_succ _ N
          have hlast : ∑ b ∈ range (N + 1), term N b = (∑ b ∈ range N, term N b) + term N N :=
            sum_range_succ _ N
          have hlast_symm : ∑ a ∈ range N, term a N = ∑ b ∈ range N, term N b :=
            sum_congr rfl fun b _ => hsymm N b
          rw [hrow, hlast, hlast_symm, ih, sum_range_succ (fun k => term k k) N]
          obtain ⟨M, rfl⟩ := Nat.exists_eq_succ_of_ne_zero hN.ne'
          simp only [Nat.add_sub_cancel]
          rw [sum_range_succ (fun m0 => ∑ d ∈ range (M + 2 - (m0 + 1)), term (d + (m0 + 1)) d) M]
          have hM_last : ∑ d ∈ range (M + 2 - (M + 1)), term (d + (M + 1)) d = term (M + 1) 0 := by
            have : M + 2 - (M + 1) = 1 := by omega
            rw [this, sum_range_one, zero_add]
          have hM_prev : ∑ m0 ∈ range M, ∑ d ∈ range (M + 2 - (m0 + 1)), term (d + (m0 + 1)) d =
              (∑ m0 ∈ range M, ∑ d ∈ range (M + 1 - (m0 + 1)), term (d + (m0 + 1)) d) +
                ∑ m0 ∈ range M, term (M + 1) (M - m0) := by
            rw [← sum_add_distrib]
            refine sum_congr rfl fun m0 hm0 => ?_
            have hm0' := mem_range.1 hm0
            have hlen : M + 2 - (m0 + 1) = (M + 1 - (m0 + 1)) + 1 := by omega
            rw [hlen, sum_range_succ]
            congr 2 <;> omega
          have hrev : (∑ m0 ∈ range M, term (M + 1) (M - m0)) + term (M + 1) 0 =
              ∑ b ∈ range (M + 1), term (M + 1) b := by
            have h1 : ∑ m0 ∈ range M, term (M + 1) (M - m0) =
                ∑ k ∈ range M, term (M + 1) (k + 1) := by
              conv_lhs => rw [← sum_range_reflect]
              refine sum_congr rfl fun k hk => ?_
              have := mem_range.1 hk
              congr 1; omega
            rw [h1, ← sum_range_succ' (fun b => term (M + 1) b) M]
          simp only [Nat.succ_eq_add_one, Nat.add_sub_cancel] at ih hrow hlast hlast_symm ⊢
          rw [hM_last, hM_prev]
          linarith [hrev]
    exact hgen 36
  have hdiag : ∀ k, term k k =
      ((cr k * cr k + ci k * ci k + qr k * qr k + qi k * qi k : ℤ) : ℝ) := fun k => by
    dsimp only [term, C, Q, cellIntC]
    have hwp : w ^ k * conj w ^ k = 1 := by rw [← mul_pow, hwc, one_pow]
    rw [hwp, mul_one]
    simp only [map_add, map_mul, Complex.conj_ofReal, Complex.conj_I,
      Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
      Complex.ofReal_re, Complex.ofReal_im,
      Complex.I_re, Complex.I_im, Complex.neg_re, Complex.neg_im]
    push_cast; ring
  have hoff : ∀ m0 ∈ range 35,
      ∑ d ∈ range (36 - (m0 + 1)), term (d + (m0 + 1)) d ≤
        (((Int.ofNat (sumInt (36 - (m0 + 1)) fun d =>
            cr (d + (m0 + 1)) * cr d + ci (d + (m0 + 1)) * ci d +
              qr (d + (m0 + 1)) * qr d + qi (d + (m0 + 1)) * qi d).natAbs +
          Int.ofNat (sumInt (36 - (m0 + 1)) fun d =>
            ci (d + (m0 + 1)) * cr d - cr (d + (m0 + 1)) * ci d +
              qi (d + (m0 + 1)) * qr d - qr (d + (m0 + 1)) * qi d).natAbs) : ℤ) : ℝ) := by
    intro m0 _
    set m := m0 + 1
    have hpow : ∀ d, w ^ (d + m) * conj w ^ d = w ^ m := fun d => by
      rw [pow_add, mul_right_comm, ← mul_pow, hwc, one_pow, one_mul]
    have hterm_d : ∀ d, term (d + m) d =
        (((cr (d + m) * cr d + ci (d + m) * ci d + qr (d + m) * qr d + qi (d + m) * qi d : ℤ) : ℝ) *
          (w ^ m).re -
         ((ci (d + m) * cr d - cr (d + m) * ci d + qi (d + m) * qr d - qr (d + m) * qi d : ℤ) : ℝ) *
          (w ^ m).im) := fun d => by
      dsimp only [term, C, Q, cellIntC]
      rw [hpow d]
      simp only [map_add, map_mul, Complex.conj_ofReal, Complex.conj_I,
        Complex.mul_re, Complex.mul_im, Complex.add_re, Complex.add_im,
        Complex.ofReal_re, Complex.ofReal_im,
        Complex.I_re, Complex.I_im, Complex.neg_re, Complex.neg_im]
      push_cast; ring
    simp_rw [hterm_d]
    rw [sum_sub_distrib, ← sum_mul, ← sum_mul, ← sumInt_cast, ← sumInt_cast]
    set R_int := sumInt (36 - m) fun d =>
      cr (d + m) * cr d + ci (d + m) * ci d + qr (d + m) * qr d + qi (d + m) * qi d
    set I_int := sumInt (36 - m) fun d =>
      ci (d + m) * cr d - cr (d + m) * ci d + qi (d + m) * qr d - qr (d + m) * qi d
    have hwm : ‖w ^ m‖ = 1 := by rw [norm_pow, hw, one_pow]
    have hre1 : |(w ^ m).re| ≤ 1 := (Complex.abs_re_le_norm (w ^ m)).trans_eq hwm
    have him1 : |(w ^ m).im| ≤ 1 := (Complex.abs_im_le_norm (w ^ m)).trans_eq hwm
    have habsR : ((Int.ofNat R_int.natAbs : ℤ) : ℝ) = |(R_int : ℝ)| := by
      rw [Int.ofNat_eq_natCast, ← Int.abs_eq_natAbs, Int.cast_abs]
    have habsI : ((Int.ofNat I_int.natAbs : ℤ) : ℝ) = |(I_int : ℝ)| := by
      rw [Int.ofNat_eq_natCast, ← Int.abs_eq_natAbs, Int.cast_abs]
    push_cast
    rw [habsR, habsI]
    have b1 : (R_int : ℝ) * (w ^ m).re ≤ |(R_int : ℝ)| := by
      calc (R_int : ℝ) * (w ^ m).re ≤ |(R_int : ℝ) * (w ^ m).re| := le_abs_self _
        _ = |(R_int : ℝ)| * |(w ^ m).re| := abs_mul _ _
        _ ≤ |(R_int : ℝ)| * 1 := mul_le_mul_of_nonneg_left hre1 (abs_nonneg _)
        _ = |(R_int : ℝ)| := mul_one _
    have b2 : -((I_int : ℝ) * (w ^ m).im) ≤ |(I_int : ℝ)| := by
      calc -((I_int : ℝ) * (w ^ m).im) ≤ |(I_int : ℝ) * (w ^ m).im| := neg_le_abs _
        _ = |(I_int : ℝ)| * |(w ^ m).im| := abs_mul _ _
        _ ≤ |(I_int : ℝ)| * 1 := mul_le_mul_of_nonneg_left him1 (abs_nonneg _)
        _ = |(I_int : ℝ)| := mul_one _
    linarith
  have hQ_nn : 0 ≤ ‖∑ k ∈ range 36, Q k * w ^ k‖ ^ 2 := sq_nonneg _
  calc ‖∑ k ∈ range 36, C k * w ^ k‖ ^ 2
      ≤ ‖∑ k ∈ range 36, C k * w ^ k‖ ^ 2 + ‖∑ k ∈ range 36, Q k * w ^ k‖ ^ 2 := by linarith
    _ = (∑ k ∈ range 36, term k k) +
          2 * ∑ m0 ∈ range 35, ∑ d ∈ range (36 - (m0 + 1)), term (d + (m0 + 1)) d := by
        rw [hpair, hsplit]
    _ ≤ (∑ k ∈ range 36, ((cr k * cr k + ci k * ci k + qr k * qr k + qi k * qi k : ℤ) : ℝ)) +
          2 * ∑ m0 ∈ range 35,
            (((Int.ofNat (sumInt (36 - (m0 + 1)) fun d =>
                cr (d + (m0 + 1)) * cr d + ci (d + (m0 + 1)) * ci d +
                  qr (d + (m0 + 1)) * qr d + qi (d + (m0 + 1)) * qi d).natAbs +
              Int.ofNat (sumInt (36 - (m0 + 1)) fun d =>
                ci (d + (m0 + 1)) * cr d - cr (d + (m0 + 1)) * ci d +
                  qi (d + (m0 + 1)) * qr d - qr (d + (m0 + 1)) * qi d).natAbs) : ℤ) : ℝ) := by
        exact add_le_add (le_of_eq (sum_congr rfl fun k _ => hdiag k))
          (mul_le_mul_of_nonneg_left (sum_le_sum hoff) (by norm_num))
    _ = _ := by
        rw [Int.cast_add, sumInt_cast, sumInt_cast, mul_sum]
        congr 1
        exact sum_congr rfl fun m0 _ => by dsimp only; push_cast; ring

/-- **Unit-disk bound**: any `(creArr, cimArr)` passing `sosAllOK` has `‖cellFn creArr cimArr u‖ ≤ 1`. -/
theorem norm_cellFn_le {creArr cimArr qreArr qimArr : Array Int}
    (hsos_ok : sosAllOK creArr cimArr qreArr qimArr = true) (u : ℂ × ℂ) :
    ‖cellFn creArr cimArr u‖ ≤ 1 := by
  unfold cellFn
  split_ifs with h
  · simp
  · push Not at h
    obtain ⟨hu1, hu2, hr1, hr2⟩ := h
    have hph1 : ‖ph u.1‖ = 1 := by
      simp [ph, div_self (norm_ne_zero_iff.2 hu1)]
    have hph2 : ‖ph u.2‖ = 1 := by
      simp [ph, div_self (norm_ne_zero_iff.2 hu2)]
    set w := ph u.1 * conj (ph u.2)
    have hw : ‖w‖ = 1 := by rw [norm_mul, Complex.norm_conj, hph1, hph2, mul_one]
    have hb1 : radBin u.1 < 64 := by
      unfold radBin
      exact (Nat.floor_lt (by positivity)).2 (by linarith)
    have hb2 : radBin u.2 < 64 := by
      unfold radBin
      exact (Nat.floor_lt (by positivity)).2 (by linarith)
    set cell := cellIdx u.1 u.2
    have hcell : cell < 4096 := by dsimp only [cell, cellIdx]; omega
    have hsos : sosCellTot creArr cimArr qreArr qimArr cell ≤ sosCap := by
      have hall := hsos_ok
      simp only [sosAllOK, List.all_eq_true, List.mem_range, decide_eq_true_eq] at hall
      exact hall cell hcell
    have hsosR : ((sosCellTot creArr cimArr qreArr qimArr cell : ℤ) : ℝ) ≤
        ((2 : ℝ) ^ 24) ^ 2 := by
      have h1 : ((sosCellTot creArr cimArr qreArr qimArr cell : ℤ) : ℝ) ≤
          (sosCap : ℝ) := by exact_mod_cast hsos
      refine h1.trans_eq ?_
      norm_num [sosCap]
    have hscale : ∑ k ∈ range 36, cellCoeffC creArr cimArr k cell * w ^ k =
        (∑ k ∈ range 36, cellIntC (fun k => getCoeff creArr k cell)
          (fun k => getCoeff cimArr k cell) k * w ^ k) / (((2 : ℝ) ^ 24 : ℝ) : ℂ) := by
      rw [div_eq_mul_inv, Finset.sum_mul]
      refine sum_congr rfl fun k _ => ?_
      simp only [cellCoeffC, cellIntC, div_eq_mul_inv]; ring
    rw [norm_mul, norm_mul, norm_pow, Complex.norm_conj, hph2, hw, one_pow, mul_one, one_mul,
      hscale, norm_div, Complex.norm_of_nonneg (by positivity)]
    rw [div_le_one (by positivity)]
    have hsq := (norm_sq_poly_pair_le_sos
      (fun k => getCoeff creArr k cell) (fun k => getCoeff cimArr k cell)
      (fun k => getCoeff qreArr k cell) (fun k => getCoeff qimArr k cell) hw).trans hsosR
    exact (pow_le_pow_iff_left₀ (norm_nonneg _) (by positivity) (by norm_num : 2 ≠ 0)).1 hsq

theorem memLp_cellFn {creArr cimArr qreArr qimArr : Array Int}
    (hsos_ok : sosAllOK creArr cimArr qreArr qimArr = true) :
    MemLp (cellFn creArr cimArr) 2 mu2 :=
  MemLp.of_bound (measurable_cellFn creArr cimArr).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_cellFn_le hsos_ok))

end

end Haagerup
