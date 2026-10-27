import Grothe.UpperChaos.GeometricReciprocal
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Algebra.Order.Ring.Abs
import Mathlib.Tactic

/-!
A global polynomial approximation of the unit Gaussian slice, with an
explicit pointwise error. This module does not certify any Grothendieck bound.
Agent-ID: codex-e4b7.
-/

open Finset
namespace Grothe.UpperChaos

noncomputable def expTaylor14 (x : ℝ) : ℝ :=
  ∑ k ∈ range 15, x ^ k / (k.factorial : ℝ)

/-- Explicit order-15 remainder on the global Gaussian exponent interval. -/
theorem expTaylor14_error (x : ℝ) (hx : |x| ≤ 17 / 50) :
    |Real.exp x - expTaylor14 x| ≤
      (17 / 50 : ℝ) ^ 15 * ((16 : ℝ) / (15 * (Nat.factorial 15 : ℝ))) := by
  have hx1 : |x| ≤ 1 := by linarith
  have hp : |x| ^ 15 ≤ (17 / 50 : ℝ) ^ 15 :=
    pow_le_pow_left₀ (abs_nonneg x) hx 15
  have h := Real.exp_bound hx1 (n := 15) (by norm_num)
  calc
    |Real.exp x - expTaylor14 x| ≤
        |x| ^ 15 * ((16 : ℝ) / ((Nat.factorial 15 : ℝ) * 15)) := by
      simpa [expTaylor14] using h
    _ ≤ (17 / 50 : ℝ) ^ 15 * ((16 : ℝ) / ((Nat.factorial 15 : ℝ) * 15)) :=
      mul_le_mul_of_nonneg_right hp (by positivity)
    _ = _ := by norm_num [Nat.factorial]

/-- The exponential Taylor polynomial is uniformly bounded on the needed interval. -/
theorem expTaylor14_abs_le_two (x : ℝ) (hx : |x| ≤ 1 / 2) :
    |expTaylor14 x| ≤ 2 := by
  calc
    |expTaylor14 x| ≤ ∑ k ∈ range 15, |x ^ k / (k.factorial : ℝ)| := by
      exact Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ k ∈ range 15, (1 / 2 : ℝ) ^ k / (k.factorial : ℝ) := by
      apply Finset.sum_le_sum
      intro k hk
      rw [abs_div, abs_pow, abs_of_nonneg (by positivity : (0 : ℝ) ≤ k.factorial)]
      exact div_le_div_of_nonneg_right (pow_le_pow_left₀ (abs_nonneg x) hx k) (by positivity)
    _ ≤ 2 := by norm_num [Finset.sum_range_succ, Nat.factorial]

/-- The constant controlling differences of powers is a finite rational sum. -/
theorem expTaylor14_lipschitz (x y : ℝ) (hx : |x| ≤ 1 / 2) (hy : |y| ≤ 1 / 2) :
    |expTaylor14 x - expTaylor14 y| ≤ 2 * |x - y| := by
  have hmax : max |x| |y| ≤ (1 / 2 : ℝ) := max_le hx hy
  have hterm (k : ℕ) :
      |x ^ k / (k.factorial : ℝ) - y ^ k / (k.factorial : ℝ)| ≤
        |x - y| * ((k : ℝ) * (1 / 2 : ℝ) ^ (k - 1) / (k.factorial : ℝ)) := by
    rw [← sub_div, abs_div, abs_of_nonneg (by positivity : (0 : ℝ) ≤ k.factorial)]
    have hp := abs_pow_sub_pow_le (a := x) (b := y) (n := k)
    have hm : max |x| |y| ^ (k - 1) ≤ (1 / 2 : ℝ) ^ (k - 1) :=
      pow_le_pow_left₀ ((abs_nonneg x).trans (le_max_left _ _)) hmax _
    have hnum : |x ^ k - y ^ k| ≤ |x - y| * (k : ℝ) * (1 / 2 : ℝ) ^ (k - 1) := by
      exact hp.trans (mul_le_mul_of_nonneg_left hm (by positivity))
    calc
      |x ^ k - y ^ k| / (k.factorial : ℝ) ≤
          (|x - y| * (k : ℝ) * (1 / 2 : ℝ) ^ (k - 1)) / (k.factorial : ℝ) :=
        div_le_div_of_nonneg_right hnum (by positivity)
      _ = _ := by ring
  have hsum : (∑ k ∈ range 15, ((k : ℝ) * (1 / 2 : ℝ) ^ (k - 1) / (k.factorial : ℝ))) ≤ 2 := by
    norm_num [Finset.sum_range_succ, Nat.factorial]
  calc
    |expTaylor14 x - expTaylor14 y| =
        |∑ k ∈ range 15, (x ^ k / (k.factorial : ℝ) - y ^ k / (k.factorial : ℝ))| := by
      simp only [expTaylor14, Finset.sum_sub_distrib]
    _ ≤ ∑ k ∈ range 15, |x ^ k / (k.factorial : ℝ) - y ^ k / (k.factorial : ℝ)| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ k ∈ range 15, |x - y| * ((k : ℝ) * (1 / 2 : ℝ) ^ (k - 1) / (k.factorial : ℝ)) :=
      Finset.sum_le_sum (fun k _ => hterm k)
    _ = |x - y| * ∑ k ∈ range 15, ((k : ℝ) * (1 / 2 : ℝ) ^ (k - 1) / (k.factorial : ℝ)) := by
      rw [Finset.mul_sum]
    _ ≤ |x - y| * 2 := mul_le_mul_of_nonneg_left hsum (abs_nonneg _)
    _ = 2 * |x - y| := mul_comm _ _


/-- The common geometric variable on the entire Gaussian pilot interval. -/
noncomputable def globalGaussianT (u : ℝ) : ℝ := (1 - 2 * u ^ 2) / 3

/-- One globally valid degree-30 polynomial in the variable t. -/
noncomputable def globalGaussianV (u : ℝ) : ℝ :=
  (2 / 3 : ℝ) * ∑ k ∈ range 31, globalGaussianT u ^ k

/-- The single global reciprocal error, independent of numerical computation. -/
theorem globalGaussianV_error (u : ℝ) (hu0 : 0 ≤ u) (hu1 : u ≤ 1) :
    |(1 + u ^ 2)⁻¹ - globalGaussianV u| ≤ (1 / 3 : ℝ) ^ 31 := by
  let t : ℝ := globalGaussianT u
  have hu2 : 0 ≤ u ^ 2 ∧ u ^ 2 ≤ 1 := by
    constructor
    · positivity
    · nlinarith [mul_nonneg hu0 (sub_nonneg.mpr hu1)]
  have ht : |t| ≤ (1 / 3 : ℝ) := by
    dsimp [t, globalGaussianT]
    rw [abs_le]
    constructor <;> nlinarith [hu2.1, hu2.2]
  have hgeom := abs_inv_one_add_sub_geometric_le (-t) (1 / 3) 31
    (by norm_num) (by norm_num) (by simpa using ht)
  have hfactor : (1 + u ^ 2)⁻¹ = (2 / 3 : ℝ) * (1 + -t)⁻¹ := by
    have hid : 1 + u ^ 2 = (3 / 2 : ℝ) * (1 + -t) := by
      dsimp [t, globalGaussianT]
      ring
    rw [hid, mul_inv]
    norm_num
  rw [hfactor]
  change |(2 / 3 : ℝ) * (1 + -t)⁻¹ - (2 / 3 : ℝ) * ∑ k ∈ range 31, (-(-t)) ^ k| ≤ _
  rw [← mul_sub, abs_mul, abs_of_nonneg (show (0 : ℝ) ≤ 2 / 3 by norm_num)]
  calc
    (2 / 3 : ℝ) * |(1 + -t)⁻¹ - ∑ k ∈ range 31, (-(-t)) ^ k| ≤
        (2 / 3 : ℝ) * ((1 / 3 : ℝ) ^ 31 / (1 - 1 / 3)) :=
      mul_le_mul_of_nonneg_left hgeom (by norm_num)
    _ = (1 / 3 : ℝ) ^ 31 := by norm_num

/-- Pure error propagation for the polynomial approximation of the phase slice. -/
theorem gaussian_global_poly_error
    (g G ε : ℝ) (hg0 : 1 / 2 ≤ g) (hg1 : g ≤ 1)
    (hε0 : 0 ≤ ε) (hε1 : ε ≤ 1 / 150) (hnear : |g - G| ≤ ε) :
    |2 * g ^ 2 * Real.exp (g - 2 / 3) - 2 * G ^ 2 * expTaylor14 (G - 2 / 3)| ≤
      2 * ((17 / 50 : ℝ) ^ 15 * ((16 : ℝ) / (15 * (Nat.factorial 15 : ℝ)))) + 16 * ε := by
  have hnear' := abs_le.mp hnear
  have hG0 : -1 ≤ G := by linarith
  have hG1 : G ≤ 2 := by linarith
  have hgabs : |g| ≤ 1 := by rw [abs_of_nonneg (by linarith : 0 ≤ g)]; exact hg1
  have harg : |g - 2 / 3| ≤ 17 / 50 :=  by rw [abs_le]; constructor <;> linarith
  have hGarg : |G - 2 / 3| ≤ 1 / 2 :=  by rw [abs_le]; constructor <;> linarith
  have hsum : |g + G| ≤ 3 := by rw [abs_le]; constructor <;> linarith
  have hsq : |g ^ 2| ≤ 1 := by
    rw [abs_pow]
    exact pow_le_one₀ (abs_nonneg g) hgabs
  have hsqdiff : |g ^ 2 - G ^ 2| ≤ 3 * ε := by
    calc
      |g ^ 2 - G ^ 2| = |g - G| * |g + G| := by
        rw [← abs_mul]
        congr 1
        ring
      _ ≤ ε * 3 := mul_le_mul hnear hsum (abs_nonneg _) hε0
      _ = 3 * ε := mul_comm _ _
  have hP := expTaylor14_abs_le_two (G - 2 / 3) hGarg
  have hLip := expTaylor14_lipschitz (g - 2 / 3) (G - 2 / 3)
    (le_trans harg (by norm_num)) hGarg
  have hL : |expTaylor14 (g - 2 / 3) - expTaylor14 (G - 2 / 3)| ≤ 2 * ε := by
    have : |(g - 2 / 3) - (G - 2 / 3)| ≤ ε := by convert hnear using 1 <;> ring
    exact hLip.trans (mul_le_mul_of_nonneg_left this (by norm_num))
  have hExp := expTaylor14_error (g - 2 / 3) harg
  have h1 : |2 * g ^ 2 * (Real.exp (g - 2 / 3) - expTaylor14 (g - 2 / 3))| ≤
      2 * ((17 / 50 : ℝ) ^ 15 * ((16 : ℝ) / (15 * (Nat.factorial 15 : ℝ)))) := by
    rw [abs_mul, abs_mul, abs_of_nonneg (show (0 : ℝ) ≤ 2 by norm_num)]
    calc
      2 * |g ^ 2| * |Real.exp (g - 2 / 3) - expTaylor14 (g - 2 / 3)| ≤
          2 * 1 * ((17 / 50 : ℝ) ^ 15 * ((16 : ℝ) / (15 * (Nat.factorial 15 : ℝ)))) := by gcongr
      _ = _ := by ring
  have h2 : |2 * g ^ 2 * (expTaylor14 (g - 2 / 3) - expTaylor14 (G - 2 / 3))| ≤ 4 * ε := by
    rw [abs_mul, abs_mul, abs_of_nonneg (show (0 : ℝ) ≤ 2 by norm_num)]
    calc
      2 * |g ^ 2| * |expTaylor14 (g - 2 / 3) - expTaylor14 (G - 2 / 3)| ≤ 2 * 1 * (2 * ε) := by gcongr
      _ = _ := by ring
  have h3 : |2 * (g ^ 2 - G ^ 2) * expTaylor14 (G - 2 / 3)| ≤ 12 * ε := by
    rw [abs_mul, abs_mul, abs_of_nonneg (show (0 : ℝ) ≤ 2 by norm_num)]
    calc
      2 * |g ^ 2 - G ^ 2| * |expTaylor14 (G - 2 / 3)| ≤ 2 * (3 * ε) * 2 := by gcongr
      _ = _ := by ring
  have heq :
      2 * g ^ 2 * Real.exp (g - 2 / 3) - 2 * G ^ 2 * expTaylor14 (G - 2 / 3) =
      2 * g ^ 2 * (Real.exp (g - 2 / 3) - expTaylor14 (g - 2 / 3)) +
      2 * g ^ 2 * (expTaylor14 (g - 2 / 3) - expTaylor14 (G - 2 / 3)) +
      2 * (g ^ 2 - G ^ 2) * expTaylor14 (G - 2 / 3) := by ring
  rw [heq]
  exact ((abs_add_le _ _).trans (add_le_add (abs_add_le _ _) le_rfl)).trans (by linarith)


/-- A single rational polynomial in the global variable, up to a common exponential factor. -/
noncomputable def globalGaussianPolynomial (u : ℝ) : ℝ :=
  let G := globalGaussianV u
  2 * G ^ 2 * expTaylor14 (G - 2 / 3)

/-- Pointwise approximation for the actual unit Gaussian slice on all of [0,1]. -/
theorem globalGaussianPolynomial_error (u : ℝ) (hu0 : 0 ≤ u) (hu1 : u ≤ 1) :
    |2 * ((1 + u ^ 2)⁻¹) ^ 2 * Real.exp ((1 + u ^ 2)⁻¹ - 1) -
        Real.exp (-1 / 3) * globalGaussianPolynomial u| ≤
      2 * ((17 / 50 : ℝ) ^ 15 * ((16 : ℝ) / (15 * (Nat.factorial 15 : ℝ)))) +
        16 * (1 / 3 : ℝ) ^ 31 := by
  let d : ℝ := 1 + u ^ 2
  have hd : 1 ≤ d := by dsimp [d]; nlinarith [sq_nonneg u]
  have hdpos : 0 < d := by linarith
  have hd2 : d ≤ 2 := by
    dsimp [d]
    nlinarith [mul_nonneg hu0 (sub_nonneg.mpr hu1)]
  have hg0 : (1 / 2 : ℝ) ≤ d⁻¹ := by
    simpa [one_div] using one_div_le_one_div_of_le hdpos hd2
  have hg1 : d⁻¹ ≤ 1 := (inv_le_one₀ hdpos).2 hd
  have hε0 : (0 : ℝ) ≤ (1 / 3 : ℝ) ^ 31 := by positivity
  have hε1 : (1 / 3 : ℝ) ^ 31 ≤ 1 / 150 := by norm_num
  have hnear := globalGaussianV_error u hu0 hu1
  have h := gaussian_global_poly_error d⁻¹ (globalGaussianV u) ((1 / 3 : ℝ) ^ 31)
    hg0 hg1 hε0 hε1 hnear
  have hexp : Real.exp (-1 / 3 : ℝ) ≤ 1 := Real.exp_le_one_iff.mpr (by norm_num)
  have hexp0 : 0 ≤ Real.exp (-1 / 3 : ℝ) := (Real.exp_pos _).le
  have hfactor : Real.exp (d⁻¹ - 1) = Real.exp (-1 / 3) * Real.exp (d⁻¹ - 2 / 3) := by
    rw [← Real.exp_add]
    congr 1
    ring
  rw [show 2 * d⁻¹ ^ 2 * Real.exp (d⁻¹ - 1) -
      Real.exp (-1 / 3) * globalGaussianPolynomial u =
      Real.exp (-1 / 3) *
        (2 * d⁻¹ ^ 2 * Real.exp (d⁻¹ - 2 / 3) - globalGaussianPolynomial u) by
      rw [hfactor]; ring]
  rw [abs_mul, abs_of_nonneg hexp0]
  exact (mul_le_of_le_one_left (abs_nonneg _) hexp).trans h

end Grothe.UpperChaos
