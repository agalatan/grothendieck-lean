-- Grothe/Lower/ResponsePenalty.lean
import Grothe.RealOpaque
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Response penalties from a joint weighted Gram budget

The algebraic consumer of the weighted Gaussian Gram inequality in
`research/conjecture-K/MONOGRAPH.md`, §2.11. The Gram and row hypotheses are explicit:
this module does not assert their Gaussian instantiation or a new endpoint.
The first-chaos price is parameterized to prevent spending it twice in a retained row.

Agent-ID: codex-9b17. Refs #432.
-/

namespace Grothe.Lower.ResponsePenalty

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

private lemma norm_smul_sq (r : ℝ) (x : E) : ‖r • x‖ ^ 2 = r ^ 2 * ‖x‖ ^ 2 := by
  rw [norm_smul, mul_pow, Real.norm_eq_abs, sq_abs]

/-- Completing a square in a real Hilbert space, including complex spaces by restriction. -/
theorem complete_square (A B C : ℝ) (hA : 0 < A) (x y : E) :
    (C - B ^ 2 / A) * ‖y‖ ^ 2 ≤
      A * ‖x‖ ^ 2 + 2 * B * inner ℝ x y + C * ‖y‖ ^ 2 := by
  have h := mul_nonneg hA.le (sq_nonneg ‖x + (B / A) • y‖)
  rw [norm_add_sq_real, real_inner_smul_right, norm_smul_sq] at h
  have he : A * (‖x‖ ^ 2 + 2 * (B / A * inner ℝ x y) +
      (B / A) ^ 2 * ‖y‖ ^ 2) =
      A * ‖x‖ ^ 2 + 2 * B * inner ℝ x y + B ^ 2 / A * ‖y‖ ^ 2 := by
    field_simp
  rw [he] at h
  nlinarith

/-- Exact A-sector coefficient when `s` of the first-chaos square is available. -/
def aWeight (s l : ℝ) : ℝ := 2 * (2 * s + l) / (4 * s + 3 * l)

/-- Exact visible-cubic coefficient with the same first-chaos price. -/
def vWeight (s l : ℝ) : ℝ := 8 * (s + l) / (6 * s + 7 * l)

lemma a_block (s l : ℝ) (hs : 0 ≤ s) (hl : 0 < l) (p a : E) :
    l * aWeight s l * ‖a‖ ^ 2 ≤
      s * ‖p‖ ^ 2 + l * (‖p‖ ^ 2 / 2 + ‖a + (1 / 2 : ℝ) • p‖ ^ 2) := by
  have hA : 0 < s + 3 * l / 4 := by positivity
  have h := complete_square (s + 3 * l / 4) (l / 2) l hA p a
  rw [norm_add_sq_real, norm_smul_sq, real_inner_smul_right, real_inner_comm p a]
  have he : l - (l / 2) ^ 2 / (s + 3 * l / 4) = l * aWeight s l := by
    unfold aWeight
    have hd : 4 * s + 3 * l ≠ 0 := by positivity
    field_simp
    ring
  rw [he] at h
  nlinarith

/-- The visible cubic is scaled so that its energy is `2 * ‖v‖²`. -/
lemma v_block (s l : ℝ) (hs : 0 ≤ s) (hl : 0 < l) (p v : E) :
    l * vWeight s l * (2 * ‖v‖ ^ 2) ≤
      s * ‖p‖ ^ 2 + l * (‖p‖ ^ 2 + (8 / 3 : ℝ) * ‖v + (1 / 4 : ℝ) • p‖ ^ 2) := by
  have hA : 0 < s + 7 * l / 6 := by positivity
  have h := complete_square (s + 7 * l / 6) (2 * l / 3) (8 * l / 3) hA p v
  rw [norm_add_sq_real, norm_smul_sq, real_inner_smul_right, real_inner_comm p v]
  have he : 8 * l / 3 - (2 * l / 3) ^ 2 / (s + 7 * l / 6) = 2 * l * vWeight s l := by
    unfold vWeight
    have hd : 6 * s + 7 * l ≠ 0 := by positivity
    field_simp
    ring
  rw [he] at h
  nlinarith

/-- Visible h-slot mismatch, with `k` of its square still available. -/
lemma h_block (e b t k l : ℝ) (he : 0 < e) (hk : 0 ≤ k) (hl : 0 < l)
    (c z : E) (hz : ‖z‖ = 1) :
    k * e * l / (2 * (3 * k * e + 4 * l)) * (t - 4 * b / e) ^ 2 ≤
      2 * k * e * ‖c + (b / e) • z‖ ^ 2 +
        (8 * l / 3) * ‖c + (t / 4) • z‖ ^ 2 := by
  have hA : 0 < 2 * k * e + 8 * l / 3 := by positivity
  have h := complete_square (2 * k * e + 8 * l / 3) (2 * k * b + 2 * l * t / 3)
    (2 * k * b ^ 2 / e + l * t ^ 2 / 6) hA c z
  have hd : 3 * k * e + 4 * l ≠ 0 := by positivity
  have hid : 2 * k * b ^ 2 / e + l * t ^ 2 / 6 -
      (2 * k * b + 2 * l * t / 3) ^ 2 / (2 * k * e + 8 * l / 3) =
      k * e * l / (2 * (3 * k * e + 4 * l)) * (t - 4 * b / e) ^ 2 := by
    field_simp
    ring
  rw [hid, hz, one_pow, mul_one] at h
  simp only [norm_add_sq_real, real_inner_smul_right, norm_smul_sq, hz, one_pow, mul_one]
  convert h using 1
  field_simp
  ring

/-- A dual lower bound for the amount of the two row squares allocated to this cut.
The inputs `a2`, `v2`, `rest` are normalized by `ε²`; `v2 = 2‖v‖²` below. -/
def penalty (e b t R2 rest a2 v2 s k l : ℝ) : ℝ :=
  l * (rest + aWeight s l * a2 + vWeight s l * v2 + t ^ 2 - R2) +
    k * e * l / (2 * (3 * k * e + 4 * l)) * (t - 4 * b / e) ^ 2

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]

/-- Algebraic consequence of the joint weighted Gram inequality. Its Gaussian
instantiation is a separate obligation, not an implicit hypothesis of `main_bounds`. -/
theorem penalty_le (e b t R2 rest s k l S : ℝ)
    (he : 0 < e) (hs : 0 ≤ s) (hk : 0 ≤ k) (hl : 0 < l)
    (p a : E) (c z alpha v : F) (hz : ‖z‖ = 1)
    (hgram : t ^ 2 + (8 / 3 : ℝ) * ‖c + (t / 4) • z‖ ^ 2 +
      ‖p‖ ^ 2 / 2 + ‖a + (1 / 2 : ℝ) • p‖ ^ 2 +
      ‖alpha‖ ^ 2 + (8 / 3 : ℝ) * ‖v + (1 / 4 : ℝ) • alpha‖ ^ 2 + rest ≤ R2)
    (hsquares : s * (‖p‖ ^ 2 + ‖alpha‖ ^ 2) +
      2 * k * e * ‖c + (b / e) • z‖ ^ 2 ≤ S) :
    penalty e b t R2 rest (‖a‖ ^ 2) (2 * ‖v‖ ^ 2) s k l ≤ S := by
  have ha := a_block s l hs hl p a
  have hv := v_block s l hs hl alpha v
  have hh := h_block e b t k l he hk hl c z hz
  have hg := mul_le_mul_of_nonneg_left hgram hl.le
  unfold penalty
  nlinarith

/-- A row may subtract the nonnegative part of any proved lower bound for its
remaining square budget. A negative multiplier value never weakens the old row. -/
theorem row_bound (V base S J : ℝ) (hrow : V ≤ base - S) (hS : 0 ≤ S) (hJ : J ≤ S) :
    V ≤ base - max 0 J := by
  exact hrow.trans (sub_le_sub_left (max_le hS hJ) base)

/-- Safe combination with a retained dual: the dual pays only for the complementary
fractions of the two squares. This makes the prohibition on double spending explicit. -/
theorem row_bound_of_split (V raw dual pk qh s k J : ℝ)
    (hpk : 0 ≤ pk) (hqh : 0 ≤ qh) (hs : 0 ≤ s) (hk : 0 ≤ k)
    (hrow : V ≤ raw - pk - qh)
    (hdual : raw - (1 - s) * pk - (1 - k) * qh ≤ dual)
    (hJ : J ≤ s * pk + k * qh) :
    V ≤ dual - max 0 J := by
  apply row_bound V dual (s * pk + k * qh) J
  · nlinarith
  · positivity
  · exact hJ

/-- The h-only consumer is compatible with a dual already spending the entire
first-chaos square. The coefficients revert to the ordinary response ellipsoid. -/
theorem penalty_h_only (e b t R2 rest a2 v2 l : ℝ) (hl : 0 < l) :
    penalty e b t R2 rest a2 v2 0 1 l =
      l * (rest + (2 / 3) * a2 + (8 / 7) * v2 + t ^ 2 - R2) +
        e * l / (2 * (3 * e + 4 * l)) * (t - 4 * b / e) ^ 2 := by
  simp only [penalty, aWeight, vWeight, zero_add, one_mul]
  field_simp
  ring

/-- A complete half-space certificate at the peak profile. Here `d` is the ordinary
six-sector weighted energy divided by `ε²`; only the h-square is spent. -/
theorem peak_h_only_region (t d : ℝ) (ht : 1057 / 1250 ≤ t)
    (hd : (1 / 25) / (1891 / 2500 : ℝ) ^ 2 ≤ d) :
    (1 / 10000 : ℝ) <
      (1 / 4) * (d + t ^ 2 - Real.pi / 4) +
        ((1891 / 2500) * (1 / 4) / (2 * (3 * (1891 / 2500) + 1))) *
          (t - 4 * (179 / 1250) / (1891 / 2500)) ^ 2 := by
  have ht0 : (0 : ℝ) ≤ t - 1057 / 1250 := by linarith
  have ht1 : (0 : ℝ) ≤ t + 1057 / 1250 := by linarith
  have ht2 : (0 : ℝ) ≤ t + 1057 / 1250 - 2 * (4 * (179 / 1250) / (1891 / 2500)) := by
    linarith
  have hsq := mul_nonneg ht0 ht1
  have hshift := mul_nonneg ht0 ht2
  have hpi := Real.pi_lt_d20
  norm_num at hd ht2 hshift ⊢
  nlinarith

end

end Grothe.Lower.ResponsePenalty
