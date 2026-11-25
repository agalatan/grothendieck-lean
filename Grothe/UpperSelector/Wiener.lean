import Grothe.UpperSelector.Gaussian
import Mathlib.Analysis.Normed.Ring.InfiniteSum
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

set_option warningAsError true

/-!
# Signed geometric rows for angular selectors

The real coefficients of each Fourier mode are real parts of a normalized complex
geometric sequence. Rounding down its frequency weight loses at most the missing
weight in the full Wiener norm. Truncating the retained part costs the exact
geometric tail of its complex majorant.

Agent-ID: codex-a7c4
-/

namespace Haagerup.AngularSelector

open Finset MeasureTheory

/-- The real coefficient at radial grade `n` of one Fourier mode. -/
noncomputable def geometricRow (c w : ℂ) (n : ℕ) : ℝ := (c * w ^ n).re

/-- The Fourier-mode power series agrees with its rational kernel on the closed real unit disk. -/
theorem geometricRow_hasSum (c w : ℂ) (hw : ‖w‖ < 1) {x : ℝ} (hx : |x| ≤ 1) :
    HasSum (fun n : ℕ => geometricRow c w n * x ^ n) (c / (1 - w * x)).re := by
  have h : ‖w * (x : ℂ)‖ < 1 := by
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
    exact (mul_le_of_le_one_right (norm_nonneg _) hx).trans_lt hw
  have hs := (hasSum_geometric_of_norm_lt_one h).mul_left c
  convert Complex.reCLM.hasSum hs using 1
  · funext n
    simp only [Complex.reCLM_apply, geometricRow, mul_pow, ← mul_assoc, ← Complex.ofReal_pow,
      Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, mul_zero, sub_zero]
  · rw [div_eq_mul_inv, Complex.reCLM_apply]

/-- The absolute complex coefficients from grade `J` on sum exactly to `‖w‖ ^ J`.
In particular each normalized row has total complex Wiener mass one. -/
theorem hasSum_norm_geometric_tail {c w : ℂ} (hw : ‖w‖ < 1) (hc : ‖c‖ = 1 - ‖w‖)
    (J : ℕ) : HasSum (fun n : ℕ => ‖c * w ^ (n + J)‖) (‖w‖ ^ J) := by
  have hp := (hasSum_geometric_of_lt_one (norm_nonneg w) hw).mul_left (‖c‖ * ‖w‖ ^ J)
  have hne := ne_of_gt (sub_pos.mpr hw)
  convert hp using 1
  · funext n
    rw [norm_mul, norm_pow, pow_add]
    ring
  · rw [hc]
    field_simp

/-- A finite mixture of real signed Fourier rows, indexed by frequency. -/
noncomputable def geometricMix {ι : Type*} [Fintype ι]
    (a : ι → ℝ) (c w : ι → ℂ) (n : ℕ) : ℝ := ∑ i, a i * geometricRow (c i) (w i) n

variable {ι : Type*} [Fintype ι] {c w : ι → ℂ}

/-- Bound the whole real Wiener tail of a nonnegative frequency mixture. -/
theorem geometricMix_tail {a : ι → ℝ} (ha : ∀ i, 0 ≤ a i)
    (hw : ∀ i, ‖w i‖ < 1) (hc : ∀ i, ‖c i‖ = 1 - ‖w i‖) (J : ℕ) :
    Summable (fun n : ℕ => |geometricMix a c w (n + J)|) ∧
      ∑' n : ℕ, |geometricMix a c w (n + J)| ≤ ∑ i, a i * ‖w i‖ ^ J := by
  have major : HasSum (fun n : ℕ => ∑ i, a i * ‖c i * w i ^ (n + J)‖)
      (∑ i, a i * ‖w i‖ ^ J) :=
    hasSum_sum fun i _ => (hasSum_norm_geometric_tail (hw i) (hc i) J).mul_left (a i)
  have hle (n : ℕ) : |geometricMix a c w (n + J)| ≤ ∑ i, a i * ‖c i * w i ^ (n + J)‖ := by
    refine (abs_sum_le_sum_abs _ _).trans (sum_le_sum fun i _ => ?_)
    rw [abs_mul, abs_of_nonneg (ha i)]
    exact mul_le_mul_of_nonneg_left (Complex.abs_re_le_norm _) (ha i)
  have hs := Summable.of_nonneg_of_le (fun n => abs_nonneg _) hle major.summable
  exact ⟨hs, (hs.tsum_le_tsum hle major.summable).trans_eq major.tsum_eq⟩

/-- Full Wiener error of one signed angular row. The exact frequencies have weights `a`
summing to one. Their retained lower weights `b` may be zero on dropped frequencies.
The first `J` coefficients of the retained mixture have pointwise error at most `ε`.
The remaining frequency and geometric tails are charged once each. -/
theorem geometricMix_truncation {a b : ι → ℝ} (hb : ∀ i, 0 ≤ b i) (hba : ∀ i, b i ≤ a i)
    (ha : ∑ i, a i = 1) (hw : ∀ i, ‖w i‖ < 1) (hc : ∀ i, ‖c i‖ = 1 - ‖w i‖)
    (J : ℕ) (approx : ℕ → ℝ) {ε : ℝ}
    (hhead : ∀ n < J, |geometricMix b c w n - approx n| ≤ ε)
    (hzero : ∀ n, J ≤ n → approx n = 0) :
    Summable (fun n : ℕ => |geometricMix a c w n - approx n|) ∧
      ∑' n : ℕ, |geometricMix a c w n - approx n| ≤
        1 - ∑ i, b i + ∑ i, b i * ‖w i‖ ^ J + J * ε := by
  let d (i : ι) := a i - b i
  have hd (i : ι) : 0 ≤ d i := sub_nonneg.mpr (hba i)
  obtain ⟨hsd, hsumd⟩ := geometricMix_tail hd hw hc 0
  simp only [Nat.add_zero, pow_zero, mul_one] at hsd hsumd
  have hmass : ∑ i, d i = 1 - ∑ i, b i := by simp [d, Finset.sum_sub_distrib, ha]
  have decomp (n : ℕ) : geometricMix a c w n =
      geometricMix d c w n + geometricMix b c w n := by
    unfold geometricMix
    rw [← sum_add_distrib]
    exact sum_congr rfl fun i _ => by dsimp [d]; ring
  let err (n : ℕ) := |geometricMix b c w n - approx n|
  obtain ⟨hst, ht⟩ := geometricMix_tail hb hw hc J
  have her (n : ℕ) : err (n + J) = |geometricMix b c w (n + J)| := by
    simp [err, hzero _ (Nat.le_add_left J n)]
  have hes : Summable err := (summable_nat_add_iff J).mp (hst.congr fun n => (her n).symm)
  have herrsum : ∑' n, err n ≤ J * ε + ∑ i, b i * ‖w i‖ ^ J := by
    rw [← hes.sum_add_tsum_nat_add J]
    refine add_le_add ?_ ?_
    · simpa using (sum_le_sum (s := range J) fun n hn => hhead n (mem_range.mp hn))
    · simpa only [her] using ht
  have hp (n : ℕ) : |geometricMix a c w n - approx n| ≤ |geometricMix d c w n| + err n := by
    rw [decomp, add_sub_assoc]
    exact abs_add_le _ _
  have hsmajor := hsd.add hes
  have hs := Summable.of_nonneg_of_le (fun n => abs_nonneg _) hp hsmajor
  refine ⟨hs, (hs.tsum_le_tsum hp hsmajor).trans ?_⟩
  rw [hsd.tsum_add hes]
  linarith [hsumd.trans_eq hmass]


/-- The real part of the actual Gaussian characteristic has the geometric Fourier coefficients. -/
theorem selectorRow_hasSum {r : ℝ} (hrlo : -1 ≤ r) (hrhi : r ≤ 1) (t : ℝ) :
    HasSum (fun n => geometricRow (geometricFirst t) (geometricRatio t) n * (r ^ 2) ^ n)
      (∫ u : ℂ × ℂ, Complex.exp (Complex.I * t *
        ((Complex.normSq u.1 + Complex.normSq (mY (r : ℂ) u) - 2 : ℝ) : ℂ)) ∂mu2).re := by
  rw [selectorCharacteristic_geometric hrlo hrhi]
  have hr : |r ^ 2| ≤ 1 := by
    rw [abs_of_nonneg (sq_nonneg _)]
    nlinarith [mul_nonneg (show 0 ≤ 1 + r by linarith) (show 0 ≤ 1 - r by linarith)]
  simpa only [Complex.ofReal_pow] using
    geometricRow_hasSum (geometricFirst t) (geometricRatio t) (norm_geometricRatio_lt_one t) hr

/-- For physical frequencies the retained Fourier tail has the explicit ratio
`t²/(1+t²)`, including the constant mode at zero. -/
theorem selectorMix_truncation (t : ι → ℝ) {a b : ι → ℝ}
    (hb : ∀ i, 0 ≤ b i) (hba : ∀ i, b i ≤ a i) (ha : ∑ i, a i = 1)
    (J : ℕ) (approx : ℕ → ℝ) {ε : ℝ}
    (hhead : ∀ n < J, |geometricMix b (geometricFirst ∘ t) (geometricRatio ∘ t) n - approx n| ≤ ε)
    (hzero : ∀ n, J ≤ n → approx n = 0) :
    Summable (fun n : ℕ => |geometricMix a (geometricFirst ∘ t) (geometricRatio ∘ t) n - approx n|) ∧
      ∑' n : ℕ, |geometricMix a (geometricFirst ∘ t) (geometricRatio ∘ t) n - approx n| ≤
        1 - ∑ i, b i + ∑ i, b i * (t i ^ 2 / (1 + t i ^ 2)) ^ J + J * ε := by
  simp only [Function.comp_def, ← norm_geometricRatio] at *
  exact geometricMix_truncation hb hba ha
    (fun i => norm_geometricRatio_lt_one (t i)) (fun i => norm_geometricFirst_eq (t i))
    J approx hhead hzero

/-- A coefficient sequence is absolutely summable with total Wiener norm at most `B`. -/
def WienerBound (f : ℕ → ℝ) (B : ℝ) : Prop := Summable (fun n => |f n|) ∧ ∑' n, |f n| ≤ B

/-- Coefficients of the product of two radial generating series. -/
noncomputable def wienerConv (f g : ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ k ∈ range (n + 1), f k * g (n - k)

theorem WienerBound.add {f g : ℕ → ℝ} {a b : ℝ} (hf : WienerBound f a) (hg : WienerBound g b) :
    WienerBound (fun n => f n + g n) (a + b) := by
  have hle (n : ℕ) := abs_add_le (f n) (g n)
  have hm := hf.1.add hg.1
  have hs := Summable.of_nonneg_of_le (fun n => abs_nonneg _) hle hm
  refine ⟨hs, (hs.tsum_le_tsum hle hm).trans ?_⟩
  rw [hf.1.tsum_add hg.1]
  exact add_le_add hf.2 hg.2

/-- Absolute convergence and submultiplicativity for preprocessing a radial kernel. -/
theorem WienerBound.convolution {f g : ℕ → ℝ} {a b : ℝ} (hf : WienerBound f a)
    (hg : WienerBound g b) : WienerBound (wienerConv f g) (a * b) := by
  have hf' : Summable (fun n => ‖|f n|‖) := by simpa using hf.1
  have hg' : Summable (fun n => ‖|g n|‖) := by simpa using hg.1
  have hm := hasSum_sum_range_mul_of_summable_norm hf' hg'
  have hle (n : ℕ) : |wienerConv f g n| ≤ ∑ k ∈ range (n + 1), |f k| * |g (n - k)| := by
    simpa only [wienerConv, abs_mul] using
      (abs_sum_le_sum_abs (fun k => f k * g (n - k)) (range (n + 1)))
  have hs := Summable.of_nonneg_of_le (fun n => abs_nonneg _) hle hm.summable
  refine ⟨hs, ((hs.tsum_le_tsum hle hm.summable).trans_eq hm.tsum_eq).trans ?_⟩
  exact mul_le_mul hf.2 hg.2 (tsum_nonneg fun k => abs_nonneg _) ((tsum_nonneg fun k => abs_nonneg _).trans hf.2)

/-- For a unit Wiener row and a retained preprocessor of Wiener norm at most one,
preprocessing adds the raw-row and preprocessing errors, including their complete tails. -/
theorem wienerConv_approximation {f f₀ g g₀ : ℕ → ℝ} {a b : ℝ}
    (hf : WienerBound f 1) (hg₀ : WienerBound g₀ 1)
    (herrf : WienerBound (fun n => f n - f₀ n) a)
    (herrg : WienerBound (fun n => g n - g₀ n) b) :
    WienerBound (fun n => wienerConv f g n - wienerConv f₀ g₀ n) (a + b) := by
  have h := (herrf.convolution hg₀).add (hf.convolution herrg)
  have heq (n : ℕ) : wienerConv f g n - wienerConv f₀ g₀ n =
      wienerConv (fun k => f k - f₀ k) g₀ n + wienerConv f (fun k => g k - g₀ k) n := by
    unfold wienerConv
    rw [← sum_sub_distrib, ← sum_add_distrib]
    exact sum_congr rfl fun i _ => by ring
  simpa only [heq, mul_one, one_mul] using h

end Haagerup.AngularSelector
