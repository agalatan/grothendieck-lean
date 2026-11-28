import Grothe.Upper.Selector.Dyadic

set_option warningAsError true

/-!
# Executable integer Fourier moments

One common dyadic base supplies all grid phases. Both the rational denominator
factor and the geometric ratio are computed by integer polynomials in the
frequency. Every complex multiplication is followed by two Euclidean divisions.
The error estimate covers both components of each rounding.

Agent-ID: codex-a7c4
-/

namespace Grothe.Upper.Selector.FourierGrid

/-- Real and imaginary numerators with a common separately specified denominator. -/
structure Pair where
  re : Int
  im : Int
  deriving Inhabited, Repr

def scale : Int := 2 ^ 60

noncomputable def decode (z : Pair) (d : Int) : ℂ := ⟨(z.re : ℝ) / d, (z.im : ℝ) / d⟩

/-- Multiply one fixed-point value by a rational complex number, then floor each coordinate. -/
def mulDiv (z a : Pair) (d : Int) : Pair :=
  ⟨(z.re * a.re - z.im * a.im) / d, (z.re * a.im + z.im * a.re) / d⟩

/-- Euclidean division floors a signed real quotient with absolute error at most one. -/
theorem ediv_error (n : ℤ) {d : ℤ} (hd : 0 < d) :
    |(n : ℝ) / d - ((n / d : ℤ) : ℝ)| ≤ 1 := by
  have hp : (0 : ℝ) < d := by exact_mod_cast hd
  have h₁ : ((n / d : ℤ) : ℝ) * d ≤ n := by exact_mod_cast Int.ediv_mul_le n hd.ne'
  have h₂ : (n : ℝ) < (((n / d : ℤ) : ℝ) + 1) * d := by
    exact_mod_cast Int.lt_ediv_add_one_mul_self n hd
  rw [abs_of_nonneg (sub_nonneg.mpr ((le_div_iff₀ hp).mpr h₁))]
  linarith [(div_lt_iff₀ hp).mpr h₂]

/-- Two componentwise floors cost at most two units of the fixed-point scale in complex norm. -/
theorem mulDiv_error (z a : Pair) {d : Int} (hd : 0 < d) :
    ‖decode z scale * decode a d - decode (mulDiv z a d) scale‖ ≤ 2 / (scale : ℝ) := by
  have hs : (0 : ℝ) < scale := by norm_num [scale]
  have hcoord (n : ℤ) : |(n : ℝ)/d/scale - ((n/d : ℤ) : ℝ)/scale| ≤ 1/(scale : ℝ) := by
    rw [← sub_div, abs_div, abs_of_pos hs]
    exact div_le_div_of_nonneg_right (ediv_error n hd) hs.le
  have hre : (decode z scale * decode a d - decode (mulDiv z a d) scale).re =
      ((z.re*a.re-z.im*a.im : ℤ):ℝ)/d/scale - (((z.re*a.re-z.im*a.im)/d : ℤ):ℝ)/scale := by
    simp only [decode, mulDiv, Complex.sub_re, Complex.mul_re, Int.cast_sub, Int.cast_mul]
    ring
  have him : (decode z scale * decode a d - decode (mulDiv z a d) scale).im =
      ((z.re*a.im+z.im*a.re : ℤ):ℝ)/d/scale - (((z.re*a.im+z.im*a.re)/d : ℤ):ℝ)/scale := by
    simp only [decode, mulDiv, Complex.sub_im, Complex.mul_im, Int.cast_add, Int.cast_mul]
    ring
  refine (Complex.norm_le_abs_re_add_abs_im _).trans ?_
  rw [hre, him]
  exact (add_le_add (hcoord _) (hcoord _)).trans_eq (by ring)

def base : Pair := ⟨1086922127456065706, -384484440037949947⟩

theorem decode_base : decode base scale = phaseDyadic := by norm_num [base, decode, phaseDyadic, scale]

def phasePower : ℕ → Pair
  | 0 => ⟨scale, 0⟩
  | m+1 => mulDiv (phasePower m) base scale

theorem phasePower_error (m : ℕ) :
    ‖phaseDyadic ^ m - decode (phasePower m) scale‖ ≤ m * (2 / (scale : ℝ)) := by
  have hi : ‖(1:ℂ) - decode (phasePower 0) scale‖ ≤ 0 := by
    norm_num [phasePower, decode, scale, Complex.ext_iff]
  have hs (k : ℕ) : ‖decode (phasePower k) scale * phaseDyadic - decode (phasePower (k+1)) scale‖ ≤
      2 / (scale : ℝ) := by
    rw [← decode_base]
    exact mulDiv_error _ _ (by norm_num [scale])
  simpa using geometric_rounding_error norm_phaseDyadic_le_one _ hi hs m

/-- Imaginary coordinate of the integer denominator `100 - 17 m I`, with its sign reversed. -/
def freqNum (m : ℕ) : Int := 17 * (m : ℤ)

def denom (m : ℕ) : Int := (10000 + freqNum m ^ 2) ^ 2

def startNum (m : ℕ) : Pair :=
  ⟨10000 * (10000 - freqNum m ^ 2), 2000000 * freqNum m⟩

def ratioNum (m : ℕ) : Pair :=
  ⟨-(freqNum m ^ 2) * (10000 - freqNum m ^ 2), -200 * freqNum m ^ 3⟩

theorem denom_pos (m : ℕ) : 0 < denom m := by unfold denom; positivity

private theorem den_ne (t : ℝ) : (1 - Complex.I * t : ℂ) ^ 2 ≠ 0 := by
  apply pow_ne_zero
  intro he
  have := congrArg Complex.re he
  simp at this

private theorem frequency_eq (m : ℕ) : (m : ℝ) * (17/100) = (freqNum m : ℝ) / 100 := by
  simp [freqNum]
  ring

theorem decode_start (m : ℕ) :
    decode (startNum m) (denom m) = ((1 - Complex.I * ((m * (17/100 : ℝ) : ℝ) : ℂ)) ^ 2)⁻¹ := by
  rw [← mul_eq_one_iff_eq_inv₀ (den_ne _), frequency_eq]
  apply Complex.ext <;>
    simp [decode, startNum, denom, pow_two, Complex.mul_re, Complex.mul_im] <;>
    field_simp <;> ring

theorem decode_ratio (m : ℕ) :
    decode (ratioNum m) (denom m) = geometricRatio (m * (17/100 : ℝ)) := by
  rw [geometricRatio, eq_div_iff (den_ne _), frequency_eq]
  apply Complex.ext <;>
    simp [decode, ratioNum, denom, pow_two, Complex.mul_re, Complex.mul_im] <;>
    field_simp <;> ring

def start (m : ℕ) : Pair := mulDiv (phasePower m) (startNum m) (denom m)

def moment (m : ℕ) : ℕ → Pair
  | 0 => start m
  | j+1 => mulDiv (moment m j) (ratioNum m) (denom m)

/-- Output at signed fixed-point precision `2^34`. -/
def output (m j : ℕ) : Int := (moment m j).re / (2^26)


private theorem norm_decode_start (m : ℕ) : ‖decode (startNum m) (denom m)‖ ≤ 1 := by
  rw [decode_start, norm_inv, inv_le_one₀ (norm_pos_iff.mpr (den_ne _)), norm_pow,
    ← Complex.normSq_eq_norm_sq]
  simp [Complex.normSq_apply, mul_self_nonneg]

private theorem start_error (m : ℕ) : ‖gridStart m - decode (start m) scale‖ ≤
    (2 * m + 2) / (scale : ℝ) := by
  have he : gridStart m = phaseDyadic ^ m * decode (startNum m) (denom m) := by
    rw [gridStart, decode_start, div_eq_mul_inv]
  rw [he]
  calc
    _ ≤ ‖phaseDyadic ^ m * decode (startNum m) (denom m) -
        decode (phasePower m) scale * decode (startNum m) (denom m)‖ +
        ‖decode (phasePower m) scale * decode (startNum m) (denom m) - decode (start m) scale‖ :=
      norm_sub_le_norm_sub_add_norm_sub _ _ _
    _ ≤ m * (2 / (scale : ℝ)) + 2 / (scale : ℝ) := by
      refine add_le_add ?_ (mulDiv_error _ _ (denom_pos m))
      rw [← sub_mul, norm_mul]
      exact (mul_le_of_le_one_right (norm_nonneg _) (norm_decode_start m)).trans (phasePower_error m)
    _ = _ := by ring

private theorem output_floor_error (m j : ℕ) :
    |(decode (moment m j) scale).re - (output m j : ℝ) / 2^34| ≤ 1 / 2^34 := by
  let n := (moment m j).re
  have h := ediv_error n (d := 2^26) (by norm_num)
  have he : (decode (moment m j) scale).re - (output m j : ℝ) / 2^34 =
      ((n : ℝ) / ((2^26 : ℤ) : ℝ) - ((n / 2^26 : ℤ) : ℝ)) / 2^34 := by
    simp only [decode, output, scale, n, Int.cast_pow, Int.cast_ofNat]
    ring
  rw [he, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 2^34)]
  exact div_le_div_of_nonneg_right h (by norm_num)

/-- Error of the computed integer for any frequency and any grade; all scales are exact. -/
theorem output_error (m j : ℕ) :
    |(geometricFirst (m * (17/100 : ℝ)) * geometricRatio (m * (17/100 : ℝ)) ^ j).re -
      (output m j : ℝ) / 2^34| ≤ (3 * (m : ℝ) + 2 + 2 * j) / 2^60 + 1 / 2^34 := by
  have hstep (n : ℕ) : ‖decode (moment m n) scale * geometricRatio (m * (17/100 : ℝ)) -
      decode (moment m (n+1)) scale‖ ≤ 2 / (scale : ℝ) := by
    rw [← decode_ratio]
    exact mulDiv_error _ _ (denom_pos m)
  have h := gridCoefficient_error m j (fun n => decode (moment m n) scale)
    ((output m j : ℝ)/2^34) (start_error m) hstep (output_floor_error m j)
  refine h.trans_eq ?_
  simp only [scale, Int.cast_pow, Int.cast_ofNat]
  ring

/-- In the 220-frequency, 1600-coefficient head, the fully computed integer output
gives the pointwise enclosure used by the signed-row truncation lemma. -/
theorem output_error_head {m j : ℕ} (hm : m ≤ 439) (hj : j < 1600) :
    |(geometricFirst (m * (17/100 : ℝ)) * geometricRatio (m * (17/100 : ℝ)) ^ j).re -
      (output m j : ℝ) / 2^34| ≤ 2 / 2^34 := by
  refine (output_error m j).trans ?_
  have hm' : (m : ℝ) ≤ 439 := by exact_mod_cast hm
  have hj' : (j : ℝ) ≤ 1599 := by exact_mod_cast (show j ≤ 1599 by omega)
  linarith

end Grothe.Upper.Selector.FourierGrid
