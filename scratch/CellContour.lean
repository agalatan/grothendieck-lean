import Grothe.Upper.Rounding.SchurHardy
import Mathlib.Tactic

set_option warningAsError true

/-!
# The replacement cell channel's cubic covariance and Hardy tail

For r(z) = (93079 z - 6921 z³) / 100000 the squared real part and modulus
on the circle of radius 1197 / 1000 are polynomials in cos² θ. The first theorem
checks the scalar Schur bound there. The second turns the resulting circle
bound on an analytic odd kernel into a strict bound on its coefficient tail.

Agent-ID: codex-a7c4. Refs #589.
-/
noncomputable section

namespace Grothe.Research.CellContour

open MeasureTheory Complex

private abbrev a : ℝ := 93079 / 100000
private abbrev b : ℝ := 6921 / 100000
private abbrev ρ : ℝ := 1197 / 1000
private abbrev j : ℝ := 3 / 20

/-- Squared real part of the covariance at y = cos² θ. -/
def realSq (y : ℝ) : ℝ := y * (a * ρ + 3 * b * ρ ^ 3 - 4 * b * ρ ^ 3 * y) ^ 2

/-- Squared modulus of the covariance at y = cos² θ. -/
def modSq (y : ℝ) : ℝ := (a * ρ + b * ρ ^ 3) ^ 2 - 4 * a * b * ρ ^ 4 * y

private def Gate (q s : ℝ) : ℝ := q - j * (q + s)
private def A (q u s : ℝ) : ℝ := q - u - j * (q + s - 2 * u)
private def B (q u s : ℝ) : ℝ := (q + s - 2 * u) * q - j * ((q + s) ^ 2 - 4 * u * q)

private def Pos (q u s : ℝ) : Prop :=
  0 < Gate q s ∧ 0 < (Gate q s) ^ 2 - (1 - 2 * j) ^ 2 * u * q ∧
  0 < A q u s ∧ 0 < B q u s ∧ 0 < 48 * j * A q u s * (A q u s + s) - B q u s

/-- Subdivision of the unit interval into eight intervals. Homogenising avoids rounded coefficients. -/
private theorem cell_pos (i : ℕ) (hi : i < 8) (z : ℝ) (hz : 0 ≤ z) :
    let n : ℝ := i + (i + 1 : ℝ) * z
    let d := 8 * (1 + z)
    let u := n * ((a * ρ + 3 * b * ρ ^ 3) * d - 4 * b * ρ ^ 3 * n) ^ 2
    let s := d ^ 2 * ((a * ρ + b * ρ ^ 3) ^ 2 * d - 4 * a * b * ρ ^ 4 * n)
    Pos (d ^ 3) u s := by
  interval_cases i <;>
    dsimp [Pos, Gate, A, B, a, b, ρ, j] <;>
    repeat' apply And.intro
  all_goals (ring_nf; positivity)

private theorem unit_pos (y : ℝ) (hy₀ : 0 ≤ y) (hy₁ : y ≤ 1) :
    Pos 1 (realSq y) (modSq y) := by
  rcases eq_or_lt_of_le hy₁ with rfl | hlt
  · norm_num [Pos, Gate, A, B, realSq, modSq, a, b, ρ, j]
  let i := ⌊8 * y⌋₊
  have hlo : (i : ℝ) ≤ 8 * y := Nat.floor_le (by positivity)
  have hhi : 8 * y < (i : ℝ) + 1 := Nat.lt_floor_add_one _
  have hi : i < 8 := by exact_mod_cast (show (i : ℝ) < 8 by linarith)
  let z := (8 * y - i) / ((i : ℝ) + 1 - 8 * y)
  have hden : 0 < (i : ℝ) + 1 - 8 * y := by linarith
  have hz : 0 ≤ z := div_nonneg (by linarith) hden.le
  let d := 8 * (1 + z)
  let n : ℝ := i + (i + 1 : ℝ) * z
  have hd : 0 < d := by dsimp [d]; positivity
  have hn : n = y * d := by
    dsimp [d, n, z]
    field_simp [ne_of_gt hden]
    ring
  have hc := cell_pos i hi z hz
  change Pos (d ^ 3) (n * ((a * ρ + 3 * b * ρ ^ 3) * d - 4 * b * ρ ^ 3 * n) ^ 2)
    (d ^ 2 * ((a * ρ + b * ρ ^ 3) ^ 2 * d - 4 * a * b * ρ ^ 4 * n)) at hc
  rw [hn] at hc
  have hu : (y * d) * ((a * ρ + 3 * b * ρ ^ 3) * d - 4 * b * ρ ^ 3 * (y * d)) ^ 2 =
      d ^ 3 * realSq y := by unfold realSq; ring
  have hs : d ^ 2 * ((a * ρ + b * ρ ^ 3) ^ 2 * d - 4 * a * b * ρ ^ 4 * (y * d)) =
      d ^ 3 * modSq y := by unfold modSq; ring
  rw [hu, hs] at hc
  let q := d ^ 3
  have hq : 0 < q := pow_pos hd _
  have trans (U S : ℝ) (hh : Pos q (q * U) (q * S)) : Pos 1 U S := by
    rcases hh with ⟨g, g₂, x, v, p⟩
    dsimp [Pos, Gate, A, B] at g g₂ x v p ⊢
    constructor
    · exact (mul_pos_iff_of_pos_left hq).1 (by convert g using 1; ring)
    constructor
    · exact (mul_pos_iff_of_pos_left (sq_pos_of_pos hq)).1 (by convert g₂ using 1; ring)
    constructor
    · exact (mul_pos_iff_of_pos_left hq).1 (by convert x using 1; ring)
    constructor
    · exact (mul_pos_iff_of_pos_left (sq_pos_of_pos hq)).1 (by convert v using 1; ring)
    · exact (mul_pos_iff_of_pos_left (sq_pos_of_pos hq)).1 (by convert p using 1; ring)
  exact trans _ _ hc

/-- The scalar Schur denominator bound for every angle, where y = cos(θ)^2. -/
theorem schur_bound (y : ℝ) (hy₀ : 0 ≤ y) (hy₁ : y ≤ 1) :
    let u := realSq y
    let s := modSq y
    let g := 1 - (3 / 20) * (1 + s)
    let v := 1 - u - (3 / 20) * (1 + s - 2 * u)
    let b₀ := 1 + s - 2 * u - (3 / 20) * ((1 + s) ^ 2 - 4 * u)
    0 < g ∧ (1 - 2 * (3 / 20)) ^ 2 * u < g ^ 2 ∧
    (b₀ / (4 * (3 / 20) * v * (v + s))) ^ 2 ≤ 144 := by
  dsimp only
  have ⟨hg, hg₂, ha, hb, hc⟩ := unit_pos y hy₀ hy₁
  suffices result : 0 < Gate 1 (modSq y) ∧
      (1 - 2 * j) ^ 2 * realSq y < (Gate 1 (modSq y)) ^ 2 ∧
      (B 1 (realSq y) (modSq y) /
        (4 * j * A 1 (realSq y) (modSq y) * (A 1 (realSq y) (modSq y) + modSq y))) ^ 2 ≤ 144 by
    simpa only [Gate, A, B, j, mul_one] using result
  refine ⟨hg, by simpa only [mul_one, sub_pos] using hg₂, ?_⟩
  have hs : 0 ≤ modSq y := by
    have hid : modSq y = (a * ρ - b * ρ ^ 3) ^ 2 + (4 * a * b * ρ ^ 4) * (1 - y) := by
      unfold modSq
      ring
    rw [hid]
    exact add_nonneg (sq_nonneg _) (mul_nonneg (by norm_num [a, b, ρ]) (sub_nonneg.mpr hy₁))
  set x := A 1 (realSq y) (modSq y)
  set v := B 1 (realSq y) (modSq y)
  have hd : 0 < 4 * j * x * (x + modSq y) :=
    mul_pos (mul_pos (by norm_num [j]) ha) (add_pos_of_pos_of_nonneg ha hs)
  have hlt : v / (4 * j * x * (x + modSq y)) < 12 := (div_lt_iff₀ hd).2 (by linarith only [hc])
  have hn := (div_pos hb hd).le
  nlinarith [mul_nonneg (sub_nonneg.mpr hlt.le)
    (show 0 ≤ 12 + v / (4 * j * x * (x + modSq y)) by linarith)]

/-- A rational comparison with room for a strict final inequality. -/
private theorem tail_arithmetic :
    (144 : ℚ) * (1000 / 1197) ^ 506 <
      (293 / 10 ^ 21) ^ 2 * (1 - (1000 / 1197) ^ 4) := by decide +kernel

/-- The complete tail beginning at index 126 for an odd kernel. The hypotheses identify its
coefficients on the real diameter, give its disk of holomorphy, and bound it on the circle. -/
theorem tail_of_circle {f : ℂ → ℂ} {h : ℕ → ℝ}
    (hf : DifferentiableOn ℂ f (Metric.ball 0 (6 / 5)))
    (hs : Summable fun k => |h k|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun k => (h k : ℂ) * (t : ℂ) ^ (2 * k + 1)) (f t))
    (hcircle : ∀ z : ℂ, ‖z‖ = 1197 / 1000 → ‖f z‖ ^ 2 ≤ 144) :
    ∑' k, |h (k + 126)| < 3 / 10 ^ 19 := by
  let ρ : ℝ := 1197 / 1000
  let z : ℝ → ℂ := fun θ => (ρ : ℂ) * Complex.exp ((θ : ℂ) * I)
  have hz (θ : ℝ) : ‖z θ‖ = ρ := by
    simp [z, Complex.norm_exp_ofReal_mul_I, ρ]
  have hmem (θ : ℝ) : z θ ∈ Metric.ball (0 : ℂ) (6 / 5) := by
    rw [Metric.mem_ball, dist_zero_right, hz]
    norm_num [ρ]
  have hzcont : Continuous z := by dsimp [z]; fun_prop
  have hcont : Continuous (fun θ => ‖f (z θ)‖ ^ 2) :=
    (hf.continuousOn.comp_continuous hzcont hmem).norm.pow 2
  have hsum := Grothe.Upper.hasSum_odd_of_eqOn_real (by norm_num : (1 : ℝ) < 6 / 5) hf hs hreal
  have habs := Grothe.Upper.summable_abs_of_hasSum_ball (by norm_num [ρ] : 0 ≤ ρ)
    (by norm_num [ρ] : ρ < 6 / 5) hsum
  have hpi := Real.pi_pos
  have hle := intervalIntegral.integral_mono_on (μ := MeasureTheory.volume)
    (by positivity : (0 : ℝ) ≤ 2 * Real.pi)
    (hcont.intervalIntegrable 0 (2 * Real.pi)) intervalIntegrable_const
    (fun θ _ => hcircle (z θ) (hz θ))
  rw [intervalIntegral.integral_const, sub_zero, smul_eq_mul] at hle
  have hmean : (2 * Real.pi)⁻¹ * (∫ θ in (0 : ℝ)..2 * Real.pi, ‖f (z θ)‖ ^ 2) ≤ 144 := by
    rw [← div_eq_inv_mul, div_le_iff₀ (by positivity)]
    linarith only [hle]
  have hb := Grothe.Upper.sum_sq_le_of_mean_le (fun θ => hsum _ (hmem θ)) habs hmean
  have hcmp : (144 : ℝ) * (1000 / 1197) ^ 506 <
      (293 / 10 ^ 21) ^ 2 * (1 - (1000 / 1197) ^ 4) := by
    simpa only [Rat.cast_mul, Rat.cast_pow, Rat.cast_div, Rat.cast_ofNat, Rat.cast_sub,
      Rat.cast_one] using (Rat.cast_lt (K := ℝ)).2 tail_arithmetic
  have he : ρ⁻¹ = 1000 / 1197 := by norm_num [ρ]
  have htail := Grothe.Upper.hardy_tail h ρ (by norm_num [ρ]) 144 hb 126 (293 / 10 ^ 21)
    (by positivity) (by rw [he]; exact hcmp.le)
  exact htail.trans_lt (by norm_num)

#print axioms schur_bound
#print axioms tail_of_circle

end Grothe.Research.CellContour
