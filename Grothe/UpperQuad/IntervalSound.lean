import Mathlib
import GrotheQuadKernel.Basic

/-!
# Soundness of the floating dyadic interval kernel (obligation S1 of #303)

`mem x a` means `a.lo · 2^a.e ≤ x ≤ a.hi · 2^a.e`.  Every operation of `GrotheQuadKernel.Basic`
is shown to preserve membership (outward rounding), in the style of `Grothe/Upper/IntervalSound.lean`
for the fixed-point caps kernel.  The exponential's series tail is proved
(`exp_tail_bounds`); its validity flag `expPosValid` (the enclosure decides `x < N + 2`) is a
hypothesis of `mem_expPosI`, as the kernel returns the information-free interval otherwise.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad

/-- `x ∈ [a.lo · 2^a.e, a.hi · 2^a.e]`. -/
def mem (x : ℝ) (a : Ival) : Prop :=
  (a.lo : ℝ) * (2 : ℝ) ^ a.e ≤ x ∧ x ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e

lemma two_zpow_pos (e : ℤ) : (0 : ℝ) < (2 : ℝ) ^ e := zpow_pos (by norm_num) e

lemma pow2_cast (n : ℕ) : ((pow2 n : ℤ) : ℝ) = (2 : ℝ) ^ n := by
  unfold pow2
  rw [Nat.shiftLeft_eq, one_mul]
  push_cast
  rfl

lemma pow2_cast_zpow (n : ℕ) : ((pow2 n : ℤ) : ℝ) = (2 : ℝ) ^ (n : ℤ) := by
  rw [pow2_cast, zpow_natCast]

lemma pow2_pos (n : ℕ) : (0 : ℤ) < pow2 n := by
  unfold pow2
  rw [Nat.shiftLeft_eq, one_mul]
  positivity

/-- `shDown s x = ⌊x / 2^s⌋`. -/
lemma shDown_mul_le (s : ℕ) (x : ℤ) : ((shDown s x : ℤ) : ℝ) * (2 : ℝ) ^ s ≤ x := by
  unfold shDown
  rw [Int.shiftRight_eq_div_pow]
  have h := Int.ediv_mul_le x (show (2 : ℤ) ^ s ≠ 0 by positivity)
  have hc : (((x / (2 : ℤ) ^ s) * (2 : ℤ) ^ s : ℤ) : ℝ) ≤ x := by exact_mod_cast h
  push_cast at hc
  exact hc

/-- `shUp s x = ⌈x / 2^s⌉`. -/
lemma le_shUp_mul (s : ℕ) (x : ℤ) : (x : ℝ) ≤ ((shUp s x : ℤ) : ℝ) * (2 : ℝ) ^ s := by
  unfold shUp
  have h := shDown_mul_le s (-x)
  unfold shDown at h
  push_cast at h ⊢
  linarith

/-- Rounding the mantissas outward to a larger exponent preserves membership. -/
lemma mem_shiftI {x : ℝ} {a : Ival} (s : ℕ) (h : mem x a) : mem x (shiftI s a) := by
  obtain ⟨h1, h2⟩ := h
  unfold shiftI
  have hp : (2 : ℝ) ^ (a.e + (s : ℤ)) = (2 : ℝ) ^ a.e * (2 : ℝ) ^ s := by
    rw [zpow_add₀ (by norm_num), zpow_natCast]
  have he := two_zpow_pos a.e
  constructor
  · show ((shDown s a.lo : ℤ) : ℝ) * (2 : ℝ) ^ (a.e + (s : ℤ)) ≤ x
    rw [hp]
    calc ((shDown s a.lo : ℤ) : ℝ) * ((2 : ℝ) ^ a.e * (2 : ℝ) ^ s)
        = (((shDown s a.lo : ℤ) : ℝ) * (2 : ℝ) ^ s) * (2 : ℝ) ^ a.e := by ring
      _ ≤ (a.lo : ℝ) * (2 : ℝ) ^ a.e := mul_le_mul_of_nonneg_right (shDown_mul_le s a.lo) he.le
      _ ≤ x := h1
  · show x ≤ ((shUp s a.hi : ℤ) : ℝ) * (2 : ℝ) ^ (a.e + (s : ℤ))
    rw [hp]
    calc x ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e := h2
      _ ≤ (((shUp s a.hi : ℤ) : ℝ) * (2 : ℝ) ^ s) * (2 : ℝ) ^ a.e :=
          mul_le_mul_of_nonneg_right (le_shUp_mul s a.hi) he.le
      _ = _ := by ring

lemma mem_normAt {x : ℝ} {a : Ival} (b P : ℕ) (h : mem x a) : mem x (normAt b P a) := by
  unfold normAt
  split_ifs
  · exact h
  · exact mem_shiftI _ h

lemma mem_norm {x : ℝ} {a : Ival} (P : ℕ) (h : mem x a) : mem x (GrotheQuad.norm P a) :=
  mem_normAt _ P h

/-- Shifting the mantissas left is exact. -/
lemma mem_alignTo {x : ℝ} {a : Ival} {eNew : ℤ} (hE : eNew ≤ a.e) (h : mem x a) :
    mem x (alignTo eNew a) := by
  obtain ⟨h1, h2⟩ := h
  unfold alignTo
  have hs : ((a.e - eNew).toNat : ℤ) = a.e - eNew := Int.toNat_of_nonneg (by linarith)
  have hp : ((pow2 (a.e - eNew).toNat : ℤ) : ℝ) * (2 : ℝ) ^ eNew = (2 : ℝ) ^ a.e := by
    rw [pow2_cast_zpow, hs, ← zpow_add₀ (by norm_num)]
    congr 1
    ring
  constructor
  · show ((a.lo * pow2 (a.e - eNew).toNat : ℤ) : ℝ) * (2 : ℝ) ^ eNew ≤ x
    push_cast
    rw [mul_assoc, hp]
    exact h1
  · show x ≤ ((a.hi * pow2 (a.e - eNew).toNat : ℤ) : ℝ) * (2 : ℝ) ^ eNew
    push_cast
    rw [mul_assoc, hp]
    exact h2

lemma mem_zeroI_iff (x : ℝ) : mem x zeroI ↔ x = 0 := by
  simp [mem, zeroI, le_antisymm_iff, and_comm]

lemma isZero_eq {a : Ival} (h : isZero a = true) : a.lo = 0 ∧ a.hi = 0 := by
  unfold isZero at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  exact h

lemma eq_zero_of_isZero {x : ℝ} {a : Ival} (ha : isZero a = true) (h : mem x a) : x = 0 := by
  obtain ⟨h1, h2⟩ := isZero_eq ha
  obtain ⟨hl, hr⟩ := h
  rw [h1] at hl
  rw [h2] at hr
  simp at hl hr
  linarith

/-- The exact sum at the exponent of the first interval. -/
lemma mem_addAt {x y : ℝ} {a b : Ival} (P : ℕ) (hab : a.e ≤ b.e) (hx : mem x a) (hy : mem y b) :
    mem (x + y) (addAt P a b) := by
  obtain ⟨h1, h2⟩ := hx
  obtain ⟨h3, h4⟩ := mem_alignTo hab hy
  unfold addAt
  apply mem_norm
  constructor
  · show ((a.lo + (alignTo a.e b).lo : ℤ) : ℝ) * (2 : ℝ) ^ a.e ≤ x + y
    push_cast
    change ((alignTo a.e b).lo : ℝ) * (2 : ℝ) ^ a.e ≤ y at h3
    linarith
  · show x + y ≤ ((a.hi + (alignTo a.e b).hi : ℤ) : ℝ) * (2 : ℝ) ^ a.e
    push_cast
    change y ≤ ((alignTo a.e b).hi : ℝ) * (2 : ℝ) ^ a.e at h4
    linarith

lemma mem_addCore {x y : ℝ} {a b : Ival} (P : ℕ) (hab : a.e ≤ b.e) (hx : mem x a)
    (hy : mem y b) : mem (x + y) (addCore P a b) := by
  unfold addCore
  split_ifs with hgap
  · exact mem_addAt P hab hx hy
  · rw [not_le] at hgap
    have hs : ((addShift P a b : ℕ) : ℤ) = b.e - a.e - (P + 8 : ℕ) := by
      unfold addShift
      exact Int.toNat_of_nonneg (by linarith)
    have hE : (shiftI (addShift P a b) a).e ≤ b.e := by
      show a.e + ((addShift P a b : ℕ) : ℤ) ≤ b.e
      rw [hs]; linarith
    exact mem_addAt P hE (mem_shiftI _ hx) hy

lemma mem_addNorm {x y : ℝ} {a b : Ival} (P : ℕ) (hx : mem x a) (hy : mem y b) :
    mem (x + y) (addNorm P a b) := by
  unfold addNorm
  split_ifs with hle
  · exact mem_addCore P hle hx hy
  · rw [add_comm]
    exact mem_addCore P (not_le.mp hle).le hy hx

lemma mem_addI {x y : ℝ} {a b : Ival} (P : ℕ) (hx : mem x a) (hy : mem y b) :
    mem (x + y) (addI P a b) := by
  unfold addI
  split_ifs with hza hzb
  · rw [eq_zero_of_isZero hza hx, zero_add]
    exact mem_norm P hy
  · rw [eq_zero_of_isZero hzb hy, add_zero]
    exact mem_norm P hx
  · exact mem_addNorm P (mem_norm P hx) (mem_norm P hy)

lemma mem_negI {x : ℝ} {a : Ival} (h : mem x a) : mem (-x) (negI a) := by
  obtain ⟨h1, h2⟩ := h
  unfold negI
  constructor
  · show ((-a.hi : ℤ) : ℝ) * (2 : ℝ) ^ a.e ≤ -x
    push_cast
    linarith
  · show -x ≤ ((-a.lo : ℤ) : ℝ) * (2 : ℝ) ^ a.e
    push_cast
    linarith

lemma mem_subI {x y : ℝ} {a b : Ival} (P : ℕ) (hx : mem x a) (hy : mem y b) :
    mem (x - y) (subI P a b) := by
  unfold subI
  rw [sub_eq_add_neg]
  exact mem_addI P hx (mem_negI hy)

lemma mem_mulZ {x : ℝ} {a : Ival} (P : ℕ) (n : ℤ) (h : mem x a) :
    mem ((n : ℝ) * x) (mulZ P n a) := by
  obtain ⟨h1, h2⟩ := h
  unfold mulZ
  split_ifs with hn
  · apply mem_norm
    have hn' : (0 : ℝ) ≤ n := by exact_mod_cast hn
    constructor
    · show ((n * a.lo : ℤ) : ℝ) * (2 : ℝ) ^ a.e ≤ n * x
      push_cast
      nlinarith
    · show (n : ℝ) * x ≤ ((n * a.hi : ℤ) : ℝ) * (2 : ℝ) ^ a.e
      push_cast
      nlinarith
  · apply mem_norm
    have hn' : (n : ℝ) ≤ 0 := by exact_mod_cast (not_le.mp hn).le
    constructor
    · show ((n * a.hi : ℤ) : ℝ) * (2 : ℝ) ^ a.e ≤ n * x
      push_cast
      nlinarith
    · show (n : ℝ) * x ≤ ((n * a.lo : ℤ) : ℝ) * (2 : ℝ) ^ a.e
      push_cast
      nlinarith

lemma mem_mulN {x : ℝ} {a : Ival} (P : ℕ) (n : ℕ) (h : mem x a) :
    mem ((n : ℝ) * x) (mulN P n a) := by
  unfold mulN
  have := mem_mulZ P (n : ℤ) h
  simpa using this

/-- The product bounds of the caps kernel, restated. -/
lemma mul_bounds {x y a b c d : ℝ} (hx : a ≤ x ∧ x ≤ b) (hy : c ≤ y ∧ y ≤ d) :
    min (min (a * c) (a * d)) (min (b * c) (b * d)) ≤ x * y ∧
      x * y ≤ max (max (a * c) (a * d)) (max (b * c) (b * d)) := by
  have h1 : min (a * y) (b * y) ≤ x * y ∧ x * y ≤ max (a * y) (b * y) := by
    rcases le_total 0 y with hy0 | hy0
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_right hx.1 hy0),
        (mul_le_mul_of_nonneg_right hx.2 hy0).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_right hx.2 hy0),
        (mul_le_mul_of_nonpos_right hx.1 hy0).trans (le_max_left _ _)⟩
  have h2 : ∀ e : ℝ, min (e * c) (e * d) ≤ e * y ∧ e * y ≤ max (e * c) (e * d) := by
    intro e
    rcases le_total 0 e with he | he
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left hy.1 he),
        (mul_le_mul_of_nonneg_left hy.2 he).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left hy.2 he),
        (mul_le_mul_of_nonpos_left hy.1 he).trans (le_max_left _ _)⟩
  exact ⟨(min_le_min (h2 a).1 (h2 b).1).trans h1.1, h1.2.trans (max_le_max (h2 a).2 (h2 b).2)⟩

/-- The mantissa coordinate `x / 2^e`. -/
lemma mem_iff_mant {x : ℝ} {a : Ival} :
    mem x a ↔ (a.lo : ℝ) ≤ x / (2 : ℝ) ^ a.e ∧ x / (2 : ℝ) ^ a.e ≤ a.hi := by
  have he := two_zpow_pos a.e
  unfold mem
  rw [le_div_iff₀ he, div_le_iff₀ he]

lemma mul_mant_eq {x y : ℝ} (ea eb : ℤ) :
    x * y = (x / (2 : ℝ) ^ ea) * (y / (2 : ℝ) ^ eb) * (2 : ℝ) ^ (ea + eb) := by
  rw [zpow_add₀ (by norm_num)]
  field_simp

lemma mem_mulI {x y : ℝ} {a b : Ival} (P : ℕ) (hx : mem x a) (hy : mem y b) :
    mem (x * y) (mulI P a b) := by
  have hxy := mul_mant_eq (x := x) (y := y) a.e b.e
  have hx' := mem_iff_mant.mp hx
  have hy' := mem_iff_mant.mp hy
  have hp := two_zpow_pos (a.e + b.e)
  unfold mulI
  split_ifs with hthin
  · simp only [Bool.and_eq_true, beq_iff_eq] at hthin
    obtain ⟨ha, hb⟩ := hthin
    apply mem_norm
    have hxe : x / (2 : ℝ) ^ a.e = a.lo := le_antisymm (by rw [← ha] at hx'; exact hx'.2) hx'.1
    have hye : y / (2 : ℝ) ^ b.e = b.lo := le_antisymm (by rw [← hb] at hy'; exact hy'.2) hy'.1
    rw [hxy, hxe, hye]
    constructor <;> simp
  · apply mem_norm
    have hb := mul_bounds hx' hy'
    rw [hxy]
    constructor
    · show ((min (min (a.lo * b.lo) (a.lo * b.hi)) (min (a.hi * b.lo) (a.hi * b.hi)) : ℤ) : ℝ) *
        (2 : ℝ) ^ (a.e + b.e) ≤ _
      push_cast
      exact mul_le_mul_of_nonneg_right hb.1 hp.le
    · show _ ≤ ((max (max (a.lo * b.lo) (a.lo * b.hi)) (max (a.hi * b.lo) (a.hi * b.hi)) : ℤ) : ℝ) *
        (2 : ℝ) ^ (a.e + b.e)
      push_cast
      exact mul_le_mul_of_nonneg_right hb.2 hp.le

/-! ### Squares, division, constants -/

lemma mem_sqI {x : ℝ} {a : Ival} (P : ℕ) (hx : mem x a) : mem (x * x) (sqI P a) := by
  have hx' := mem_iff_mant.mp hx
  have hxx : x * x = (x / (2 : ℝ) ^ a.e) * (x / (2 : ℝ) ^ a.e) * (2 : ℝ) ^ (2 * a.e) := by
    rw [show (2 : ℤ) * a.e = a.e + a.e by ring]
    exact mul_mant_eq a.e a.e
  set m := x / (2 : ℝ) ^ a.e with hm
  have hp := two_zpow_pos (2 * a.e)
  unfold sqI
  split_ifs with h1 h2
  · apply mem_norm
    have hl : (0 : ℝ) ≤ a.lo := by exact_mod_cast h1
    rw [hxx]
    constructor
    · show ((a.lo * a.lo : ℤ) : ℝ) * (2 : ℝ) ^ (2 * a.e) ≤ _
      push_cast
      exact mul_le_mul_of_nonneg_right (mul_le_mul hx'.1 hx'.1 hl (by linarith)) hp.le
    · show _ ≤ ((a.hi * a.hi : ℤ) : ℝ) * (2 : ℝ) ^ (2 * a.e)
      push_cast
      exact mul_le_mul_of_nonneg_right
        (mul_le_mul hx'.2 hx'.2 (by linarith) (by linarith [hx'.1])) hp.le
  · apply mem_norm
    have hh : (a.hi : ℝ) ≤ 0 := by exact_mod_cast h2
    rw [hxx]
    constructor
    · show ((a.hi * a.hi : ℤ) : ℝ) * (2 : ℝ) ^ (2 * a.e) ≤ _
      push_cast
      exact mul_le_mul_of_nonneg_right (by nlinarith [hx'.1, hx'.2]) hp.le
    · show _ ≤ ((a.lo * a.lo : ℤ) : ℝ) * (2 : ℝ) ^ (2 * a.e)
      push_cast
      exact mul_le_mul_of_nonneg_right (by nlinarith [hx'.1, hx'.2]) hp.le
  · apply mem_norm
    rw [hxx]
    constructor
    · show ((0 : ℤ) : ℝ) * (2 : ℝ) ^ (2 * a.e) ≤ _
      push_cast
      nlinarith [mul_self_nonneg m, hp]
    · show _ ≤ ((max (a.lo * a.lo) (a.hi * a.hi) : ℤ) : ℝ) * (2 : ℝ) ^ (2 * a.e)
      push_cast
      apply mul_le_mul_of_nonneg_right _ hp.le
      rcases le_total 0 m with hm0 | hm0
      · exact (mul_le_mul hx'.2 hx'.2 hm0 (by linarith [hx'.1, hx'.2])).trans (le_max_right _ _)
      · exact (by nlinarith [hx'.1, hx'.2] : m * m ≤ (a.lo : ℝ) * a.lo).trans (le_max_left _ _)

lemma fdiv_mul_le (x y : ℤ) (hy : 0 < y) : ((fdiv x y : ℤ) : ℝ) * y ≤ x := by
  unfold fdiv
  exact_mod_cast Int.ediv_mul_le x hy.ne'

lemma le_cdiv_mul (x y : ℤ) (hy : 0 < y) : (x : ℝ) ≤ ((cdiv x y : ℤ) : ℝ) * y := by
  unfold cdiv
  have h := fdiv_mul_le (-x) y hy
  unfold fdiv at h
  push_cast at h ⊢
  linarith

lemma mem_divAt {x y : ℝ} {a b : Ival} (P t : ℕ) (hx : mem x a) (hy : mem y b) (hb : 0 < b.lo) :
    mem (x / y) (divAt P t a b) := by
  have hx' := mem_iff_mant.mp hx
  have hy' := mem_iff_mant.mp hy
  set X := x / (2 : ℝ) ^ a.e with hX
  set Y := y / (2 : ℝ) ^ b.e with hY
  have hbl : (0 : ℝ) < b.lo := by exact_mod_cast hb
  have hYpos : 0 < Y := lt_of_lt_of_le hbl hy'.1
  have hbh : (0 : ℝ) < b.hi := lt_of_lt_of_le hbl (by linarith [hy'.1, hy'.2])
  have hbhZ : 0 < b.hi := by exact_mod_cast hbh
  have hp2 : ((pow2 t : ℤ) : ℝ) = (2 : ℝ) ^ t := pow2_cast t
  have hpt : (0 : ℝ) < (2 : ℝ) ^ t := pow_pos (by norm_num) t
  have hxy : x / y = X / Y * (2 : ℝ) ^ (a.e - b.e) := by
    rw [zpow_sub₀ (by norm_num), hX, hY]
    field_simp
  have hsplit : (2 : ℝ) ^ (a.e - b.e - (t : ℤ)) * (2 : ℝ) ^ t = (2 : ℝ) ^ (a.e - b.e) := by
    rw [← zpow_natCast, ← zpow_add₀ (by norm_num)]
    congr 1
    ring
  have hpe := two_zpow_pos (a.e - b.e - (t : ℤ))
  have hX2 : X * (2 : ℝ) ^ t / Y * (2 : ℝ) ^ (a.e - b.e - (t : ℤ)) = X / Y * (2 : ℝ) ^ (a.e - b.e) := by
    rw [← hsplit]; ring
  unfold divAt
  apply mem_norm
  constructor
  · show (((if a.lo ≥ 0 then fdiv (a.lo * pow2 t) b.hi else fdiv (a.lo * pow2 t) b.lo) : ℤ) : ℝ) *
      (2 : ℝ) ^ (a.e - b.e - (t : ℤ)) ≤ x / y
    rw [hxy, ← hX2]
    apply mul_le_mul_of_nonneg_right _ hpe.le
    split_ifs with hal
    · have h1 := fdiv_mul_le (a.lo * pow2 t) b.hi hbhZ
      push_cast at h1
      rw [hp2] at h1
      have hal' : (0 : ℝ) ≤ a.lo := by exact_mod_cast hal
      have h2 : ((fdiv (a.lo * pow2 t) b.hi : ℤ) : ℝ) ≤ (a.lo : ℝ) * (2 : ℝ) ^ t / b.hi :=
        (le_div_iff₀ hbh).2 h1
      have h3 : (a.lo : ℝ) * (2 : ℝ) ^ t / b.hi ≤ X * (2 : ℝ) ^ t / Y :=
        div_le_div₀ (mul_nonneg (hal'.trans hx'.1) hpt.le)
          (mul_le_mul_of_nonneg_right hx'.1 hpt.le) hYpos hy'.2
      exact h2.trans h3
    · have h1 := fdiv_mul_le (a.lo * pow2 t) b.lo hb
      push_cast at h1
      rw [hp2] at h1
      have hal' : (a.lo : ℝ) < 0 := by exact_mod_cast not_le.mp hal
      have h2 : ((fdiv (a.lo * pow2 t) b.lo : ℤ) : ℝ) ≤ (a.lo : ℝ) * (2 : ℝ) ^ t / b.lo :=
        (le_div_iff₀ hbl).2 h1
      have hneg : (a.lo : ℝ) * (2 : ℝ) ^ t ≤ 0 := mul_nonpos_of_nonpos_of_nonneg hal'.le hpt.le
      have h3 : (a.lo : ℝ) * (2 : ℝ) ^ t / b.lo ≤ (a.lo : ℝ) * (2 : ℝ) ^ t / Y := by
        rw [div_le_div_iff₀ hbl hYpos]
        nlinarith [hy'.1]
      have h4 : (a.lo : ℝ) * (2 : ℝ) ^ t / Y ≤ X * (2 : ℝ) ^ t / Y :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_right hx'.1 hpt.le) hYpos.le
      exact (h2.trans h3).trans h4
  · show x / y ≤ (((if a.hi ≥ 0 then cdiv (a.hi * pow2 t) b.lo else cdiv (a.hi * pow2 t) b.hi) : ℤ) : ℝ) *
      (2 : ℝ) ^ (a.e - b.e - (t : ℤ))
    rw [hxy, ← hX2]
    apply mul_le_mul_of_nonneg_right _ hpe.le
    split_ifs with hah
    · have h1 := le_cdiv_mul (a.hi * pow2 t) b.lo hb
      push_cast at h1
      rw [hp2] at h1
      have h2 : (a.hi : ℝ) * (2 : ℝ) ^ t / b.lo ≤ ((cdiv (a.hi * pow2 t) b.lo : ℤ) : ℝ) :=
        (div_le_iff₀ hbl).2 h1
      have hah' : (0 : ℝ) ≤ a.hi := by exact_mod_cast hah
      have h3 : X * (2 : ℝ) ^ t / Y ≤ (a.hi : ℝ) * (2 : ℝ) ^ t / b.lo :=
        div_le_div₀ (mul_nonneg hah' hpt.le) (mul_le_mul_of_nonneg_right hx'.2 hpt.le) hbl hy'.1
      exact h3.trans h2
    · have h1 := le_cdiv_mul (a.hi * pow2 t) b.hi hbhZ
      push_cast at h1
      rw [hp2] at h1
      have hah' : (a.hi : ℝ) < 0 := by exact_mod_cast not_le.mp hah
      have h2 : (a.hi : ℝ) * (2 : ℝ) ^ t / b.hi ≤ ((cdiv (a.hi * pow2 t) b.hi : ℤ) : ℝ) :=
        (div_le_iff₀ hbh).2 h1
      have h3 : X * (2 : ℝ) ^ t / Y ≤ (a.hi : ℝ) * (2 : ℝ) ^ t / Y :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_right hx'.2 hpt.le) hYpos.le
      have hneg : (a.hi : ℝ) * (2 : ℝ) ^ t ≤ 0 := mul_nonpos_of_nonpos_of_nonneg hah'.le hpt.le
      have h4 : (a.hi : ℝ) * (2 : ℝ) ^ t / Y ≤ (a.hi : ℝ) * (2 : ℝ) ^ t / b.hi := by
        rw [div_le_div_iff₀ hYpos hbh]
        nlinarith [hy'.2]
      exact (h3.trans h4).trans h2

lemma mem_divI {x y : ℝ} {a b : Ival} (P : ℕ) (hx : mem x a) (hy : mem y b) (hb : 0 < b.lo) :
    mem (x / y) (divI P a b) := by
  unfold divI
  split_ifs with h
  · omega
  · exact mem_divAt P _ hx hy hb

lemma mem_ofInt (P : ℕ) (n : ℤ) : mem (n : ℝ) (ofInt P n) := by
  unfold ofInt
  apply mem_norm
  exact ⟨by simp, by simp⟩

lemma mem_ofNat (P : ℕ) (n : ℕ) : mem (n : ℝ) (ofNat P n) := by
  unfold ofNat
  exact_mod_cast mem_ofInt P n

lemma mem_one (P : ℕ) : mem (1 : ℝ) (ofInt P 1) := by simpa using mem_ofInt P 1

lemma mem_ofDyadic (P : ℕ) (m e : ℤ) : mem ((m : ℝ) * (2 : ℝ) ^ e) (ofDyadic P m e) := by
  unfold ofDyadic
  apply mem_norm
  exact ⟨le_refl _, le_refl _⟩

lemma bitsOf_natCast (n : ℕ) (hn : 0 < n) : bitsOf (n : ℤ) = Nat.log2 n + 1 := by
  unfold bitsOf
  simp [Int.natAbs_natCast, hn.ne']

lemma ofNat_lo_pos (P : ℕ) (hP : 1 ≤ P) {n : ℕ} (hn : 0 < n) : 0 < (ofNat P n).lo := by
  unfold ofNat ofInt GrotheQuad.norm normAt
  simp only [max_self]
  split_ifs with hb
  · show (0 : ℤ) < (n : ℤ)
    exact_mod_cast hn
  · simp only [shiftI, shDown]
    rw [Int.shiftRight_eq_div_pow]
    have hs : bitsOf (n : ℤ) - P ≤ Nat.log2 n := by rw [bitsOf_natCast n hn]; omega
    have h2n : 2 ^ (bitsOf (n : ℤ) - P) ≤ n :=
      (Nat.pow_le_pow_right (by norm_num) hs).trans (Nat.log2_self_le hn.ne')
    have h2 : ((2 ^ (bitsOf (n : ℤ) - P) : ℕ) : ℤ) ≤ (n : ℤ) := by exact_mod_cast h2n
    have hpos : (0 : ℤ) < ((2 ^ (bitsOf (n : ℤ) - P) : ℕ) : ℤ) := by positivity
    rw [Int.lt_iff_add_one_le, zero_add, Int.le_ediv_iff_mul_le hpos, one_mul]
    exact h2

lemma mem_divN {x : ℝ} {a : Ival} (P : ℕ) (hP : 1 ≤ P) {n : ℕ} (hn : 0 < n) (hx : mem x a) :
    mem (x / n) (divN P n a) := by
  unfold divN
  exact mem_divI P hx (mem_ofNat P n) (ofNat_lo_pos P hP hn)

lemma mem_invI {x : ℝ} {a : Ival} (P : ℕ) (hx : mem x a) (ha : 0 < a.lo) :
    mem (1 / x) (invI P a) := by
  unfold invI
  exact mem_divI P (mem_one P) hx ha

lemma mem_ratI (P : ℕ) (hP : 1 ≤ P) (n : ℤ) {d : ℕ} (hd : 0 < d) :
    mem ((n : ℝ) / d) (ratI P n d) := by
  unfold ratI
  exact mem_divN P hP hd (mem_ofInt P n)

/-! ### Square roots -/

lemma isqrtDown_le (n : ℕ) : ((isqrtDown n : ℕ) : ℝ) ≤ Real.sqrt n := by
  unfold isqrtDown
  rw [Real.le_sqrt (by positivity) (by positivity)]
  exact_mod_cast Nat.sqrt_le' n

lemma le_isqrtUp (n : ℕ) : Real.sqrt n ≤ ((isqrtUp n : ℕ) : ℝ) := by
  unfold isqrtUp
  rw [Real.sqrt_le_left (by positivity)]
  split_ifs with h
  · have h' : Nat.sqrt n * Nat.sqrt n = n := by simpa using h
    rw [sq]
    exact_mod_cast h'.ge
  · rw [sq]
    exact_mod_cast (Nat.lt_succ_sqrt n).le

lemma sqrtShift_parity (P : ℕ) (a : Ival) : (a.e - (sqrtShift P a : ℤ)) % 2 = 0 := by
  unfold sqrtShift
  split_ifs with h
  · simpa using h
  · simp only [beq_iff_eq] at h
    have := Int.emod_two_eq_zero_or_one (a.e - ((2 * P - bitsOf (max a.hi 0) : ℕ) : ℤ))
    push_cast
    omega

lemma mem_sqrtAt {x : ℝ} {a : Ival} (P t : ℕ) (hpar : (a.e - (t : ℤ)) % 2 = 0) (hx0 : 0 ≤ x)
    (hx : mem x a) : mem (Real.sqrt x) (sqrtAt P t a) := by
  obtain ⟨h1, h2⟩ := hx
  have hhalf : (2 : ℝ) ^ ((a.e - (t : ℤ)) / 2) * (2 : ℝ) ^ ((a.e - (t : ℤ)) / 2) =
      (2 : ℝ) ^ (a.e - (t : ℤ)) := by
    rw [← zpow_add₀ (by norm_num)]
    congr 1
    omega
  have hpt : ((pow2 t : ℤ) : ℝ) = (2 : ℝ) ^ (t : ℤ) := pow2_cast_zpow t
  have he := two_zpow_pos a.e
  have hh := two_zpow_pos ((a.e - (t : ℤ)) / 2)
  have hsq : Real.sqrt ((2 : ℝ) ^ (a.e - (t : ℤ))) = (2 : ℝ) ^ ((a.e - (t : ℤ)) / 2) := by
    rw [← hhalf, Real.sqrt_mul_self hh.le]
  have hpow : (2 : ℝ) ^ a.e = (2 : ℝ) ^ (t : ℤ) * (2 : ℝ) ^ (a.e - (t : ℤ)) := by
    rw [← zpow_add₀ (by norm_num)]
    congr 1
    ring
  have hp2 := pow2_pos t
  unfold sqrtAt
  apply mem_norm
  constructor
  · show (((isqrtDown ((max a.lo 0 * pow2 t).toNat) : ℕ) : ℤ) : ℝ) * (2 : ℝ) ^ ((a.e - (t : ℤ)) / 2) ≤
      Real.sqrt x
    have hm : (0 : ℤ) ≤ max a.lo 0 * pow2 t := mul_nonneg (le_max_right _ _) hp2.le
    have hnat : (((max a.lo 0 * pow2 t).toNat : ℕ) : ℝ) = ((max a.lo 0 : ℤ) : ℝ) * (2 : ℝ) ^ (t : ℤ) := by
      rw [← hpt]
      have := Int.toNat_of_nonneg hm
      exact_mod_cast this
    have hlx : ((max a.lo 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e ≤ x := by
      rcases le_or_gt 0 a.lo with hl | hl
      · rw [max_eq_left hl]; exact h1
      · rw [max_eq_right hl.le]; simpa using hx0
    have hnn : (0 : ℝ) ≤ ((max a.lo 0 : ℤ) : ℝ) * (2 : ℝ) ^ (t : ℤ) := by
      apply mul_nonneg _ (two_zpow_pos _).le
      exact_mod_cast le_max_right _ _
    calc (((isqrtDown ((max a.lo 0 * pow2 t).toNat) : ℕ) : ℤ) : ℝ) * (2 : ℝ) ^ ((a.e - (t : ℤ)) / 2)
        ≤ Real.sqrt (((max a.lo 0 * pow2 t).toNat : ℕ) : ℝ) * Real.sqrt ((2 : ℝ) ^ (a.e - (t : ℤ))) := by
          rw [hsq]
          push_cast
          exact mul_le_mul_of_nonneg_right (isqrtDown_le _) hh.le
      _ = Real.sqrt (((max a.lo 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e) := by
          rw [hnat, ← Real.sqrt_mul hnn, hpow, mul_assoc]
      _ ≤ Real.sqrt x := Real.sqrt_le_sqrt hlx
  · show Real.sqrt x ≤ (((isqrtUp ((max a.hi 0 * pow2 t).toNat) : ℕ) : ℤ) : ℝ) * (2 : ℝ) ^ ((a.e - (t : ℤ)) / 2)
    have hm : (0 : ℤ) ≤ max a.hi 0 * pow2 t := mul_nonneg (le_max_right _ _) hp2.le
    have hnat : (((max a.hi 0 * pow2 t).toNat : ℕ) : ℝ) = ((max a.hi 0 : ℤ) : ℝ) * (2 : ℝ) ^ (t : ℤ) := by
      rw [← hpt]
      have := Int.toNat_of_nonneg hm
      exact_mod_cast this
    have hxh : x ≤ ((max a.hi 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e := by
      calc x ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e := h2
        _ ≤ ((max a.hi 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e := by
          apply mul_le_mul_of_nonneg_right _ he.le
          exact_mod_cast le_max_left _ _
    have hnn : (0 : ℝ) ≤ ((max a.hi 0 : ℤ) : ℝ) * (2 : ℝ) ^ (t : ℤ) := by
      apply mul_nonneg _ (two_zpow_pos _).le
      exact_mod_cast le_max_right _ _
    calc Real.sqrt x ≤ Real.sqrt (((max a.hi 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e) := Real.sqrt_le_sqrt hxh
      _ = Real.sqrt (((max a.hi 0 * pow2 t).toNat : ℕ) : ℝ) * Real.sqrt ((2 : ℝ) ^ (a.e - (t : ℤ))) := by
          rw [hnat, ← Real.sqrt_mul hnn, hpow, mul_assoc]
      _ ≤ _ := by
          rw [hsq]
          push_cast
          exact mul_le_mul_of_nonneg_right (le_isqrtUp _) hh.le

lemma mem_sqrtI {x : ℝ} {a : Ival} (P : ℕ) (hx0 : 0 ≤ x) (hx : mem x a) :
    mem (Real.sqrt x) (sqrtI P a) :=
  mem_sqrtAt P _ (sqrtShift_parity P a) hx0 hx

/-! ### Bounds, widening, powers, comparisons -/

/-- The value of a thin nonnegative bound. -/
noncomputable def bval (r : Ival) : ℝ := ((max (max (-r.lo) r.hi) 0 : ℤ) : ℝ) * (2 : ℝ) ^ r.e

lemma bval_nonneg (r : Ival) : 0 ≤ bval r := by
  unfold bval
  apply mul_nonneg _ (two_zpow_pos _).le
  exact_mod_cast le_max_right _ _

/-- `|x| ≤ bval a` for `x ∈ a`. -/
lemma abs_le_bval {x : ℝ} {a : Ival} (hx : mem x a) : |x| ≤ bval a := by
  obtain ⟨h1, h2⟩ := hx
  unfold bval
  have he := two_zpow_pos a.e
  push_cast
  rw [abs_le]
  constructor
  · have : (-(a.lo : ℝ)) * (2 : ℝ) ^ a.e ≤ (max (max (-(a.lo : ℝ)) a.hi) 0) * (2 : ℝ) ^ a.e :=
      mul_le_mul_of_nonneg_right ((le_max_left _ _).trans (le_max_left _ _)) he.le
    linarith
  · have : (a.hi : ℝ) * (2 : ℝ) ^ a.e ≤ (max (max (-(a.lo : ℝ)) a.hi) 0) * (2 : ℝ) ^ a.e :=
      mul_le_mul_of_nonneg_right ((le_max_right _ _).trans (le_max_left _ _)) he.le
    linarith

/-- `absUpper a` is the thin interval of `bval a`. -/
lemma mem_absUpper (a : Ival) : mem (bval a) (absUpper a) := by
  unfold absUpper bval
  exact ⟨le_refl _, le_refl _⟩

lemma mem_symmI_of_abs_le {y : ℝ} {r : Ival} (hy : |y| ≤ bval r) : mem y (symmI r) := by
  unfold symmI bval at *
  rw [abs_le] at hy
  constructor
  · show ((-(max (max (-r.lo) r.hi) 0) : ℤ) : ℝ) * (2 : ℝ) ^ r.e ≤ y
    push_cast at hy ⊢
    linarith [hy.1]
  · show y ≤ ((max (max (-r.lo) r.hi) 0 : ℤ) : ℝ) * (2 : ℝ) ^ r.e
    push_cast at hy ⊢
    exact hy.2

lemma mem_widen {x y : ℝ} {a r : Ival} (P : ℕ) (hx : mem x a) (hy : |y| ≤ bval r) :
    mem (x + y) (widen P a r) := by
  unfold widen
  exact mem_addI P hx (mem_symmI_of_abs_le hy)

lemma mem_powI {x : ℝ} {a : Ival} (P : ℕ) (hx : mem x a) (n : ℕ) : mem (x ^ n) (powI P a n) := by
  induction n with
  | zero =>
    show mem (x ^ 0) (ofInt P 1)
    simpa using mem_ofInt P 1
  | succ n ih =>
    rw [pow_succ]
    exact mem_mulI P ih hx

lemma lt_of_mantLtInt {x : ℝ} {m : ℤ} {e : ℤ} {n : ℤ} (h : mantLtInt m e n = true)
    (hx : x ≤ (m : ℝ) * (2 : ℝ) ^ e) : x < n := by
  unfold mantLtInt at h
  split_ifs at h with he
  · have h' : m * pow2 e.toNat < n := by simpa using h
    have hc : ((m * pow2 e.toNat : ℤ) : ℝ) < n := by exact_mod_cast h'
    push_cast at hc
    rw [pow2_cast_zpow, Int.toNat_of_nonneg he] at hc
    linarith
  · have h' : m < n * pow2 (-e).toNat := by simpa using h
    have hc : (m : ℝ) < ((n * pow2 (-e).toNat : ℤ) : ℝ) := by exact_mod_cast h'
    push_cast at hc
    rw [pow2_cast_zpow, Int.toNat_of_nonneg (by linarith)] at hc
    have hp := two_zpow_pos e
    have hne : (2 : ℝ) ^ (-e) * (2 : ℝ) ^ e = 1 := by
      rw [← zpow_add₀ (by norm_num)]; simp
    calc x ≤ (m : ℝ) * (2 : ℝ) ^ e := hx
      _ < (n : ℝ) * (2 : ℝ) ^ (-e) * (2 : ℝ) ^ e := mul_lt_mul_of_pos_right hc hp
      _ = n := by rw [mul_assoc, hne, mul_one]

lemma lt_of_ltNat {x : ℝ} {a : Ival} {n : ℕ} (h : ltNat a n = true) (hx : mem x a) : x < n := by
  unfold ltNat at h
  have := lt_of_mantLtInt h hx.2
  exact_mod_cast this

lemma gt_of_gtNat {x : ℝ} {a : Ival} {n : ℕ} (h : gtNat a n = true) (hx : mem x a) :
    (n : ℝ) < x := by
  unfold gtNat at h
  have h' := lt_of_mantLtInt (x := -x) h (by
    have := hx.1
    push_cast
    linarith)
  push_cast at h'
  linarith

lemma pos_of_isPos {x : ℝ} {a : Ival} (h : isPos a = true) (hx : mem x a) : 0 < x := by
  unfold isPos at h
  have h' : (0 : ℝ) < a.lo := by exact_mod_cast (by simpa using h : 0 < a.lo)
  exact lt_of_lt_of_le (mul_pos h' (two_zpow_pos a.e)) hx.1

lemma neg_of_isNeg {x : ℝ} {a : Ival} (h : isNeg a = true) (hx : mem x a) : x < 0 := by
  unfold isNeg at h
  have h' : (a.hi : ℝ) < 0 := by exact_mod_cast (by simpa using h : a.hi < 0)
  have := two_zpow_pos a.e
  nlinarith [hx.2]

lemma lo_pos_of_isPos {a : Ival} (h : isPos a = true) : 0 < a.lo := by
  unfold isPos at h
  simpa using h

/-! ### Fixed-point export -/

lemma toFixedLo_le {x : ℝ} {a : Ival} (K : ℕ) (hx : mem x a) :
    ((toFixedLo K a : ℤ) : ℝ) ≤ x * (2 : ℝ) ^ K := by
  unfold toFixedLo
  have h1 := hx.1
  have hK : (2 : ℝ) ^ K = (2 : ℝ) ^ (K : ℤ) := (zpow_natCast _ _).symm
  split_ifs with hs
  · push_cast
    rw [pow2_cast_zpow, Int.toNat_of_nonneg hs, hK]
    calc (a.lo : ℝ) * (2 : ℝ) ^ (a.e + (K : ℤ)) = (a.lo : ℝ) * (2 : ℝ) ^ a.e * (2 : ℝ) ^ (K : ℤ) := by
          rw [zpow_add₀ (by norm_num)]; ring
      _ ≤ x * (2 : ℝ) ^ (K : ℤ) := mul_le_mul_of_nonneg_right h1 (two_zpow_pos _).le
  · rw [not_le] at hs
    have h := shDown_mul_le (-(a.e + (K : ℤ))).toNat a.lo
    rw [← zpow_natCast, Int.toNat_of_nonneg (by linarith)] at h
    have hp := two_zpow_pos (a.e + (K : ℤ))
    have hne : (2 : ℝ) ^ (-(a.e + (K : ℤ))) * (2 : ℝ) ^ (a.e + (K : ℤ)) = 1 := by
      rw [← zpow_add₀ (by norm_num)]; simp
    calc ((shDown (-(a.e + (K : ℤ))).toNat a.lo : ℤ) : ℝ)
        = ((shDown (-(a.e + (K : ℤ))).toNat a.lo : ℤ) : ℝ) * (2 : ℝ) ^ (-(a.e + (K : ℤ))) *
            (2 : ℝ) ^ (a.e + (K : ℤ)) := by rw [mul_assoc, hne, mul_one]
      _ ≤ (a.lo : ℝ) * (2 : ℝ) ^ (a.e + (K : ℤ)) := mul_le_mul_of_nonneg_right h hp.le
      _ = (a.lo : ℝ) * (2 : ℝ) ^ a.e * (2 : ℝ) ^ (K : ℤ) := by rw [zpow_add₀ (by norm_num)]; ring
      _ ≤ x * (2 : ℝ) ^ K := by rw [hK]; exact mul_le_mul_of_nonneg_right h1 (two_zpow_pos _).le

lemma le_toFixedHi {x : ℝ} {a : Ival} (K : ℕ) (hx : mem x a) :
    x * (2 : ℝ) ^ K ≤ ((toFixedHi K a : ℤ) : ℝ) := by
  unfold toFixedHi
  have h2 := hx.2
  have hK : (2 : ℝ) ^ K = (2 : ℝ) ^ (K : ℤ) := (zpow_natCast _ _).symm
  split_ifs with hs
  · push_cast
    rw [pow2_cast_zpow, Int.toNat_of_nonneg hs, hK]
    calc x * (2 : ℝ) ^ (K : ℤ) ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e * (2 : ℝ) ^ (K : ℤ) :=
          mul_le_mul_of_nonneg_right h2 (two_zpow_pos _).le
      _ = (a.hi : ℝ) * (2 : ℝ) ^ (a.e + (K : ℤ)) := by rw [zpow_add₀ (by norm_num)]; ring
  · rw [not_le] at hs
    have h := le_shUp_mul (-(a.e + (K : ℤ))).toNat a.hi
    rw [← zpow_natCast, Int.toNat_of_nonneg (by linarith)] at h
    have hp := two_zpow_pos (a.e + (K : ℤ))
    have hne : (2 : ℝ) ^ (-(a.e + (K : ℤ))) * (2 : ℝ) ^ (a.e + (K : ℤ)) = 1 := by
      rw [← zpow_add₀ (by norm_num)]; simp
    calc x * (2 : ℝ) ^ K = x * (2 : ℝ) ^ (K : ℤ) := by rw [hK]
      _ ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e * (2 : ℝ) ^ (K : ℤ) :=
          mul_le_mul_of_nonneg_right h2 (two_zpow_pos _).le
      _ = (a.hi : ℝ) * (2 : ℝ) ^ (a.e + (K : ℤ)) := by rw [zpow_add₀ (by norm_num)]; ring
      _ ≤ ((shUp (-(a.e + (K : ℤ))).toNat a.hi : ℤ) : ℝ) * (2 : ℝ) ^ (-(a.e + (K : ℤ))) *
            (2 : ℝ) ^ (a.e + (K : ℤ)) := mul_le_mul_of_nonneg_right h hp.le
      _ = _ := by rw [mul_assoc, hne, mul_one]

lemma mem_ofFixed {x : ℝ} {lo hi : ℤ} (K : ℕ) (h1 : (lo : ℝ) ≤ x * (2 : ℝ) ^ K)
    (h2 : x * (2 : ℝ) ^ K ≤ hi) : mem x (ofFixed K lo hi) := by
  unfold ofFixed
  have hp : (0 : ℝ) < (2 : ℝ) ^ K := by positivity
  have hinv : (2 : ℝ) ^ (-(K : ℤ)) = ((2 : ℝ) ^ K)⁻¹ := by
    rw [zpow_neg, zpow_natCast]
  constructor
  · show (lo : ℝ) * (2 : ℝ) ^ (-(K : ℤ)) ≤ x
    rw [hinv, ← div_eq_mul_inv, div_le_iff₀ hp]; exact h1
  · show x ≤ (hi : ℝ) * (2 : ℝ) ^ (-(K : ℤ))
    rw [hinv, ← div_eq_mul_inv, le_div_iff₀ hp]; exact h2

/-! ### The exponential -/

/-- `(k+N+1)! ≥ (N+1)! · (N+2)^k`. -/
lemma factorial_lower (N k : ℕ) :
    ((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k ≤ ((k + N + 1).factorial : ℝ) := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [show k + 1 + N + 1 = (k + N + 1) + 1 by ring, Nat.factorial_succ (k + N + 1), pow_succ]
    push_cast
    have h1 : (N : ℝ) + 2 ≤ ((k : ℝ) + N + 1) + 1 := by linarith [(Nat.cast_nonneg k : (0 : ℝ) ≤ k)]
    calc ((N + 1).factorial : ℝ) * (((N : ℝ) + 2) ^ k * ((N : ℝ) + 2))
        = ((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k * ((N : ℝ) + 2) := by ring
      _ ≤ ((k + N + 1).factorial : ℝ) * (((k : ℝ) + N + 1) + 1) :=
          mul_le_mul ih h1 (by positivity) (by positivity)
      _ = _ := by ring

/-- The tail of the exponential series: for `0 ≤ x < N + 2`,
`0 ≤ exp x − Σ_{n ≤ N} x^n/n! ≤ x^{N+1}/(N+1)! · (N+2)/(N+2−x)`. -/
lemma exp_tail_bounds {x : ℝ} (N : ℕ) (hx0 : 0 ≤ x) (hxN : x < N + 2) :
    0 ≤ Real.exp x - ∑ n ∈ Finset.range (N + 1), x ^ n / n.factorial ∧
    Real.exp x - ∑ n ∈ Finset.range (N + 1), x ^ n / n.factorial ≤
      x ^ (N + 1) / (N + 1).factorial * ((N + 2) / (N + 2 - x)) := by
  have hsum := Real.summable_pow_div_factorial x
  have hexp : Real.exp x = ∑' n, x ^ n / n.factorial := by
    rw [Real.exp_eq_exp_ℝ, NormedSpace.exp_eq_tsum_div]
  have hsplit := (hsum.sum_add_tsum_nat_add (N + 1)).symm
  have htail : Real.exp x - ∑ n ∈ Finset.range (N + 1), x ^ n / n.factorial =
      ∑' k, x ^ (k + (N + 1)) / (k + (N + 1)).factorial := by
    rw [hexp, hsplit]; ring
  rw [htail]
  have hsum' : Summable fun k => x ^ (k + (N + 1)) / ((k + (N + 1)).factorial : ℝ) :=
    (summable_nat_add_iff (N + 1)).mpr hsum
  constructor
  · exact tsum_nonneg fun k => by positivity
  · set r : ℝ := x / (N + 2) with hr
    have hN2 : (0 : ℝ) < N + 2 := by positivity
    have hr0 : 0 ≤ r := by positivity
    have hr1 : r < 1 := by rw [hr, div_lt_one hN2]; exact hxN
    have hgeom : Summable fun k => x ^ (N + 1) / (N + 1).factorial * r ^ k :=
      (summable_geometric_of_lt_one hr0 hr1).mul_left _
    have hterm : ∀ k, x ^ (k + (N + 1)) / ((k + (N + 1)).factorial : ℝ) ≤
        x ^ (N + 1) / (N + 1).factorial * r ^ k := by
      intro k
      have hf : ((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k ≤ ((k + (N + 1)).factorial : ℝ) := by
        simpa [show k + (N + 1) = k + N + 1 by ring] using factorial_lower N k
      have hfpos : (0 : ℝ) < ((k + (N + 1)).factorial : ℝ) := by positivity
      have hden : (0 : ℝ) < ((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k := by positivity
      rw [pow_add, hr, div_pow, div_le_iff₀ hfpos]
      have key : x ^ (N + 1) * x ^ k * (((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k) ≤
          x ^ (N + 1) * x ^ k * ((k + (N + 1)).factorial : ℝ) :=
        mul_le_mul_of_nonneg_left hf (by positivity)
      calc x ^ k * x ^ (N + 1) = x ^ (N + 1) * x ^ k := by ring
        _ = x ^ (N + 1) * x ^ k * (((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k) /
              (((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k) := by field_simp
        _ ≤ x ^ (N + 1) * x ^ k * ((k + (N + 1)).factorial : ℝ) /
              (((N + 1).factorial : ℝ) * ((N : ℝ) + 2) ^ k) :=
            div_le_div_of_nonneg_right key hden.le
        _ = x ^ (N + 1) / (N + 1).factorial * (x ^ k / ((N : ℝ) + 2) ^ k) *
              ((k + (N + 1)).factorial : ℝ) := by field_simp
    calc ∑' k, x ^ (k + (N + 1)) / ((k + (N + 1)).factorial : ℝ)
        ≤ ∑' k, x ^ (N + 1) / (N + 1).factorial * r ^ k := Summable.tsum_le_tsum hterm hsum' hgeom
      _ = x ^ (N + 1) / (N + 1).factorial * (1 - r)⁻¹ := by
          rw [tsum_mul_left, tsum_geometric_of_lt_one hr0 hr1]
      _ = x ^ (N + 1) / (N + 1).factorial * ((N + 2) / (N + 2 - x)) := by
          rw [hr]
          congr 1
          field_simp

lemma expLoop_sound (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {xI : Ival} (hx : mem x xI) :
    ∀ (fuel i : ℕ) (t s : Ival), mem (x ^ i / i.factorial) t →
      mem (∑ n ∈ Finset.range (i + 1), x ^ n / n.factorial) s →
      mem (∑ n ∈ Finset.range (i + fuel + 1), x ^ n / n.factorial) (expLoop P xI fuel i t s).1 ∧
      mem (x ^ (i + fuel) / (i + fuel).factorial) (expLoop P xI fuel i t s).2 := by
  intro fuel
  induction fuel with
  | zero =>
    intro i t s ht hs
    simpa [expLoop] using ⟨hs, ht⟩
  | succ fuel ih =>
    intro i t s ht hs
    have ht' : mem (x ^ (i + 1) / (i + 1).factorial) (divN P (i + 1) (mulI P t xI)) := by
      have h := mem_divN P hP (Nat.succ_pos i) (mem_mulI P ht hx)
      convert h using 1
      rw [Nat.factorial_succ, pow_succ]
      push_cast
      field_simp
    have hs' : mem (∑ n ∈ Finset.range (i + 1 + 1), x ^ n / n.factorial)
        (addI P s (divN P (i + 1) (mulI P t xI))) := by
      rw [Finset.sum_range_succ]
      exact mem_addI P hs ht'
    have := ih (i + 1) _ _ ht' hs'
    rw [show i + 1 + fuel = i + (fuel + 1) by ring] at this
    simpa [expLoop] using this

lemma mem_clampI {x : ℝ} {a : Ival} (hx0 : 0 ≤ x) (hx : mem x a) : mem x (clampI a) := by
  obtain ⟨h1, h2⟩ := hx
  have he := two_zpow_pos a.e
  unfold clampI
  constructor
  · show ((max a.lo 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e ≤ x
    rcases le_or_gt 0 a.lo with hl | hl
    · rw [max_eq_left hl]; exact h1
    · rw [max_eq_right hl.le]; simpa using hx0
  · show x ≤ ((max a.hi 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e
    calc x ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e := h2
      _ ≤ ((max a.hi 0 : ℤ) : ℝ) * (2 : ℝ) ^ a.e := by
        apply mul_le_mul_of_nonneg_right _ he.le
        exact_mod_cast le_max_left _ _

lemma mem_expNext {x : ℝ} {a : Ival} (P : ℕ) (hP : 1 ≤ P) (N : ℕ) (hx0 : 0 ≤ x) (hx : mem x a) :
    mem (x ^ (N + 1) / (N + 1).factorial) (expNext P N a) := by
  have hxm := mem_clampI hx0 hx
  have h1 : mem (x ^ 0 / (0 : ℕ).factorial) (ofInt P 1) := by simpa using mem_ofInt P 1
  have h2 : mem (∑ n ∈ Finset.range (0 + 1), x ^ n / n.factorial) (ofInt P 1) := by
    simpa using mem_ofInt P 1
  obtain ⟨-, ht⟩ := expLoop_sound P hP hxm N 0 _ _ h1 h2
  simp only [zero_add] at ht
  unfold expNext
  have h := mem_divN P hP (Nat.succ_pos N) (mem_mulI P ht hxm)
  convert h using 1
  rw [Nat.factorial_succ, pow_succ]
  push_cast
  field_simp

lemma mem_expDen {x : ℝ} {a : Ival} (P N : ℕ) (hx0 : 0 ≤ x) (hx : mem x a) :
    mem ((N : ℝ) + 2 - x) (expDen P N a) := by
  unfold expDen
  have h := mem_subI P (mem_ofNat P (N + 2)) (mem_clampI hx0 hx)
  push_cast at h
  exact h

lemma mem_expPosI {x : ℝ} {a : Ival} (P : ℕ) (hP : 1 ≤ P) (N : ℕ) (hx0 : 0 ≤ x) (hx : mem x a)
    (hv : expPosValid P N a = true) : mem (Real.exp x) (expPosI P N a) := by
  have hxm := mem_clampI hx0 hx
  have hden := mem_expDen P N hx0 hx
  have hpos : (0 : ℝ) < (N : ℝ) + 2 - x := pos_of_isPos hv hden
  have hxN : x < N + 2 := by linarith
  obtain ⟨htail0, htail⟩ := exp_tail_bounds N hx0 hxN
  have h1 : mem (x ^ 0 / (0 : ℕ).factorial) (ofInt P 1) := by simpa using mem_ofInt P 1
  have h2 : mem (∑ n ∈ Finset.range (0 + 1), x ^ n / n.factorial) (ofInt P 1) := by
    simpa using mem_ofInt P 1
  obtain ⟨hs, -⟩ := expLoop_sound P hP hxm N 0 _ _ h1 h2
  simp only [zero_add] at hs
  have hnext := mem_expNext P hP N hx0 hx
  -- the tail bound value T = (N+2)·bval(tNext)/(N+2−x) lies in the tail interval
  have hU : mem ((N + 2 : ℕ) * bval (expNext P N a)) (mulN P (N + 2) (absUpper (expNext P N a))) :=
    mem_mulN P (N + 2) (mem_absUpper _)
  have hT := mem_divI P hU hden (lo_pos_of_isPos hv)
  unfold expPosI
  simp only [hv, ↓reduceIte]
  -- exp x = S_N + (exp x − S_N), with |exp x − S_N| ≤ bval (tail interval)
  have hy : |Real.exp x - ∑ n ∈ Finset.range (N + 1), x ^ n / n.factorial| ≤
      bval (divI P (mulN P (N + 2) (absUpper (expNext P N a))) (expDen P N a)) := by
    rw [abs_of_nonneg htail0]
    have hb := abs_le_bval hT
    have htn : x ^ (N + 1) / (N + 1).factorial ≤ bval (expNext P N a) :=
      (le_abs_self _).trans (abs_le_bval hnext)
    have hTv : x ^ (N + 1) / (N + 1).factorial * ((N + 2) / (N + 2 - x)) ≤
        (N + 2 : ℕ) * bval (expNext P N a) / ((N : ℝ) + 2 - x) := by
      push_cast
      rw [mul_div_assoc', div_le_div_iff_of_pos_right hpos]
      nlinarith [bval_nonneg (expNext P N a), (by positivity : (0 : ℝ) ≤ x ^ (N + 1) / (N + 1).factorial)]
    calc _ ≤ _ := htail
      _ ≤ (N + 2 : ℕ) * bval (expNext P N a) / ((N : ℝ) + 2 - x) := hTv
      _ ≤ |(N + 2 : ℕ) * bval (expNext P N a) / ((N : ℝ) + 2 - x)| := le_abs_self _
      _ ≤ _ := hb
  have := mem_widen P hs hy
  simpa using this

lemma mem_expNegI {x : ℝ} {a : Ival} (P : ℕ) (hP : 1 ≤ P) (N : ℕ) (hx0 : 0 ≤ x) (hx : mem x a)
    (hv : expPosValid P N a = true) (hp : isPos (expPosI P N a) = true) :
    mem (Real.exp (-x)) (expNegI P N a) := by
  unfold expNegI
  have h := mem_invI P (mem_expPosI P hP N hx0 hx hv) (lo_pos_of_isPos hp)
  rw [Real.exp_neg, one_div] at *
  exact h

/-! ### Finite sums, factorials and binomials (shared by the soundness modules) -/

lemma foldl_range_succ {α : Type*} (f : α → ℕ → α) (z : α) (n : ℕ) :
    (List.range (n + 1)).foldl f z = f ((List.range n).foldl f z) n := by
  rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]

lemma mem_sumRangeI (P : ℕ) {f : ℕ → ℝ} {g : ℕ → Ival} (n : ℕ) (h : ∀ k, k < n → mem (f k) (g k)) :
    mem (∑ k ∈ Finset.range n, f k) (sumRangeI P n g) := by
  induction n with
  | zero => simp [sumRangeI]; exact (mem_zeroI_iff 0).2 rfl
  | succ n ih =>
    unfold sumRangeI at ih ⊢
    rw [foldl_range_succ, Finset.sum_range_succ]
    exact mem_addI P (ih fun k hk => h k (by omega)) (h n (by omega))

lemma factNat_eq (n : ℕ) : factNat n = n.factorial := by
  induction n with
  | zero => rfl
  | succ n ih =>
    unfold factNat at ih ⊢
    rw [foldl_range_succ, ih, Nat.factorial_succ]
    ring

lemma natChoose_eq (n k : ℕ) : natChoose n k = Nat.choose n k := by
  unfold natChoose
  split_ifs with h
  · exact (Nat.choose_eq_zero_of_lt h).symm
  · rw [not_lt] at h
    suffices H : ∀ j, j ≤ n → (List.range j).foldl (fun acc i => acc * (n - i) / (i + 1)) 1 = Nat.choose n j
      from H k h
    intro j
    induction j with
    | zero => intro _; simp
    | succ j ih =>
      intro hj
      rw [foldl_range_succ, ih (by omega)]
      have := Nat.choose_succ_right_eq n j
      rw [← this, Nat.mul_div_cancel _ (by omega)]

lemma foldl_add_eq_sum (f : ℕ → ℕ) (n : ℕ) :
    (List.range n).foldl (fun acc i => acc + f i) 0 = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => simp
  | succ n ih => rw [foldl_range_succ, ih, Finset.sum_range_succ]

end Grothe.UpperQuad
