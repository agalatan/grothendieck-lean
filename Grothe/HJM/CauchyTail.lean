import Grothe.HJM.CauchyGate
import Grothe.UpperChaos.OddSeries
import Grothe.UpperChaos.OddParseval

/-!
# Cauchy tails of the scalar branches (HJM 6.25)

For a preprocessor `P` with `‖P‖_𝒜 ≤ 1` whose gate check passes on the disc of radius `R₁ > 1`, the continued
branch kernel `H(ζ) = h_Ω(ζ P(ζ²))` is holomorphic with `|H| ≤ 10` there (`CauchyKernel.lean`, `CauchyGate.lean`).
On `(0, 1)` it is the odd series `Σ k_n t^{2n+1}` of the branch coefficients `k_n = compCoeff haagCoeff P n`
(`hasSum_branch_real`), hence on the whole disc (`hasSum_odd_of_eqOn_real`). Parseval on the circle of
radius `R < R₁` (`sum_sq_le_of_mean_le`) gives `|k_n| R^{2n+1} ≤ 10` (`abs_coeff_le`), and the
geometric tail `Σ_{n≥N} |k_n| ≤ 10 R^{−(2N+1)}/(1 − R^{−2})` (`cauchy_tail`).
-/

namespace Grothe.HJM.Cauchy

open Grothe.Upper Grothe.UpperChaos Polynomial Metric Complex

noncomputable section

/-- The continued branch kernel. -/
def Hbr (pl : List ℚ) (ζ : ℂ) : ℂ := hOm (rhoC pl ζ)

variable {pl : List ℚ} {R₁ : ℚ}

lemma gate_of_check (hR : R₁ ^ 2 < 2) (h : gateCheck pl R₁ = true) {ζ : ℂ} (hζ : ζ ∈ ball (0 : ℂ) (R₁ : ℝ)) :
    Gate (rhoC pl ζ) :=
  gate_rhoC_of_check hR h (by simpa using hζ)

lemma differentiableOn_Hbr (hR : R₁ ^ 2 < 2) (h : gateCheck pl R₁ = true) :
    DifferentiableOn ℂ (Hbr pl) (ball (0 : ℂ) (R₁ : ℝ)) := by
  have hI := differentiableOn_Iom_comp (differentiable_rhoC pl) isOpen_ball
    fun z hz => good_of_gate (gate_of_check hR h hz)
  have hg : DifferentiableOn ℂ (fun z => rhoC pl z / 2) (ball (0 : ℂ) (R₁ : ℝ)) :=
    ((differentiable_rhoC pl).div_const 2).differentiableOn
  exact hg.mul hI

lemma norm_Hbr_le (hR : R₁ ^ 2 < 2) (h : gateCheck pl R₁ = true) {ζ : ℂ} (hζ : ζ ∈ ball (0 : ℂ) (R₁ : ℝ)) :
    ‖Hbr pl ζ‖ ≤ 10 :=
  norm_hOm_le_of_gate (gate_of_check hR h hζ)

/-- **On `(0, 1)` the continued kernel is the branch series.** -/
lemma hasSum_branch_real (hP : l1 (ofListQ pl) ≤ 1) {t : ℝ} (ht0 : 0 < t) (ht1 : t < 1) :
    HasSum (fun j => (compCoeff haagCoeff (ofListQ pl) j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (Hbr pl t) := by
  set P := ofListQ pl
  set x := t ^ 2 with hx
  have hx0 : 0 ≤ x := sq_nonneg t
  have hx1 : x ≤ 1 := by rw [hx]; nlinarith
  set w : ℝ := t * P.eval x with hw
  have hwP : |P.eval x| ≤ 1 := (abs_eval_le_l1 P hx0 hx1).trans hP
  have hw1 : ‖(w : ℂ)‖ < 1 := by
    rw [Complex.norm_real, Real.norm_eq_abs, hw, abs_mul, abs_of_pos ht0]
    calc t * |P.eval x| ≤ t * 1 := mul_le_mul_of_nonneg_left hwP ht0.le
      _ < 1 := by linarith
  -- Haagerup's series at `w = ρ(t)`
  have hH := hasSum_hOm hw1
  have hrho : rhoC pl t = (w : ℂ) := by rw [rhoC_ofReal]
  rw [Hbr, hrho]
  -- the branch series is summable, and its sum is Haagerup's series at `w`
  have hs := summable_abs_compCoeff summable_haagCoeff hP
  have hsum : Summable fun j => compCoeff haagCoeff P j * t ^ (2 * j + 1) := by
    refine Summable.of_norm_bounded hs fun j => ?_
    rw [Real.norm_eq_abs, abs_mul, abs_pow, abs_of_pos ht0]
    exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ ht0.le ht1.le)
  have hval : ∑' j, compCoeff haagCoeff P j * t ^ (2 * j + 1) = ∑' k, haagCoeff k * w ^ (2 * k + 1) := by
    have e1 : (fun j => compCoeff haagCoeff P j * t ^ (2 * j + 1)) = fun j => t * (compCoeff haagCoeff P j * x ^ j) := by
      ext j; rw [hx, ← pow_mul, pow_succ]; ring
    rw [e1, tsum_mul_left, tsum_compCoeff_mul_pow summable_haagCoeff hP hx0 hx1, ← tsum_mul_left]
    refine tsum_congr fun k => ?_
    rw [hw, hx, mul_pow, ← pow_mul]; ring
  have hHr : HasSum (fun k => haagCoeff k * w ^ (2 * k + 1)) (∑' k, haagCoeff k * w ^ (2 * k + 1)) := by
    refine (Summable.of_norm_bounded summable_haagCoeff fun k => ?_).hasSum
    rw [Real.norm_eq_abs, abs_mul, abs_pow]
    have : |w| ≤ 1 := by simpa [Complex.norm_real] using hw1.le
    exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ (abs_nonneg _) this)
  have hcast := (hHr.mapL Complex.ofRealCLM)
  simp only [Complex.ofRealCLM_apply] at hcast
  have hval' : hOm (w : ℂ) = ((∑' k, haagCoeff k * w ^ (2 * k + 1) : ℝ) : ℂ) := by
    refine hH.unique ?_
    convert hcast using 1
    ext k; push_cast; ring
  rw [hval', ← hval]
  have := (hsum.hasSum.mapL Complex.ofRealCLM)
  simp only [Complex.ofRealCLM_apply] at this
  convert this using 1
  ext j; push_cast; ring

/-- **The branch series on the whole disc.** -/
lemma hasSum_branch (hP : l1 (ofListQ pl) ≤ 1) (h1 : 1 < R₁) (hR : R₁ ^ 2 < 2) (h : gateCheck pl R₁ = true)
    {z : ℂ} (hz : z ∈ ball (0 : ℂ) (R₁ : ℝ)) :
    HasSum (fun j => (compCoeff haagCoeff (ofListQ pl) j : ℂ) * z ^ (2 * j + 1)) (Hbr pl z) :=
  hasSum_odd_of_eqOn_real (by exact_mod_cast h1) (differentiableOn_Hbr hR h)
    (summable_abs_compCoeff summable_haagCoeff hP) (fun t ht0 ht1 => hasSum_branch_real hP ht0 ht1) z hz

/-- **The Cauchy estimate**: `|k_n| R^{2n+1} ≤ 10` for `0 < R < R₁`. -/
theorem abs_coeff_le (hP : l1 (ofListQ pl) ≤ 1) (h1 : 1 < R₁) (hR : R₁ ^ 2 < 2) (h : gateCheck pl R₁ = true)
    {R : ℝ} (hR0 : 0 < R) (hRR : R < R₁) (n : ℕ) :
    |compCoeff haagCoeff (ofListQ pl) n| * R ^ (2 * n + 1) ≤ 10 := by
  set k := compCoeff haagCoeff (ofListQ pl)
  have hin : ∀ θ : ℝ, (R : ℂ) * Complex.exp (θ * I) ∈ ball (0 : ℂ) (R₁ : ℝ) := fun θ => by
    rw [mem_ball, dist_zero_right, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hR0,
      Complex.norm_exp_ofReal_mul_I, mul_one]
    exact hRR
  have hsum := fun θ : ℝ => hasSum_branch hP h1 hR h (hin θ)
  have habs := summable_abs_of_hasSum_ball hR0.le hRR
    (fun z hz => hasSum_branch hP h1 hR h hz)
  have hcont : Continuous fun θ : ℝ => Hbr pl ((R : ℂ) * Complex.exp (θ * I)) :=
    (differentiableOn_Hbr hR h).continuousOn.comp_continuous (by fun_prop) hin
  have hmean : (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi, ‖Hbr pl ((R : ℂ) * Complex.exp (θ * I))‖ ^ 2
      ≤ 100 := by
    have hpi : 0 < 2 * Real.pi := by positivity
    have hle : ∫ θ in (0 : ℝ)..2 * Real.pi, ‖Hbr pl ((R : ℂ) * Complex.exp (θ * I))‖ ^ 2 ≤
        ∫ _ in (0 : ℝ)..2 * Real.pi, (100 : ℝ) := by
      refine intervalIntegral.integral_mono_on hpi.le ((hcont.norm.pow 2).intervalIntegrable _ _)
        intervalIntegrable_const fun θ _ => ?_
      have := norm_Hbr_le hR h (hin θ)
      nlinarith [norm_nonneg (Hbr pl ((R : ℂ) * Complex.exp (θ * I)))]
    rw [intervalIntegral.integral_const, smul_eq_mul, sub_zero] at hle
    calc (2 * Real.pi)⁻¹ * _ ≤ (2 * Real.pi)⁻¹ * (2 * Real.pi * 100) :=
          mul_le_mul_of_nonneg_left hle (inv_nonneg.2 hpi.le)
      _ = 100 := by field_simp
  have hJ := sum_sq_le_of_mean_le hsum habs hmean (n + 1)
  have hone : k n ^ 2 * R ^ (2 * (2 * n + 1)) ≤ 100 := by
    refine le_trans ?_ hJ
    exact Finset.single_le_sum (f := fun j => k j ^ 2 * R ^ (2 * (2 * j + 1)))
      (fun j _ => by positivity) (Finset.self_mem_range_succ n)
  have hsq : (|k n| * R ^ (2 * n + 1)) ^ 2 ≤ 10 ^ 2 := by
    rw [mul_pow, sq_abs, ← pow_mul, mul_comm (2 * n + 1) 2]; linarith
  exact (abs_le_of_sq_le_sq' hsq (by norm_num)).2

/-- **The Cauchy tail**: `Σ_{n≥N} |k_n| ≤ 10 R^{−(2N+1)} / (1 − R^{−2})` for `1 < R < R₁`. -/
theorem cauchy_tail (hP : l1 (ofListQ pl) ≤ 1) (h1 : 1 < R₁) (hR : R₁ ^ 2 < 2) (h : gateCheck pl R₁ = true)
    {R : ℝ} (hR1 : 1 < R) (hRR : R < R₁) (N : ℕ) :
    ∑' n, |compCoeff haagCoeff (ofListQ pl) (n + N)| ≤ 10 * (R⁻¹) ^ (2 * N + 1) / (1 - (R⁻¹) ^ 2) := by
  have hR0 : 0 < R := by linarith
  set q := R⁻¹ ^ 2 with hq
  have hq0 : 0 ≤ q := by positivity
  have hq1 : q < 1 := by
    rw [hq]; exact pow_lt_one₀ (by positivity) (inv_lt_one_of_one_lt₀ hR1) two_ne_zero
  have hb : ∀ n, |compCoeff haagCoeff (ofListQ pl) (n + N)| ≤ 10 * R⁻¹ ^ (2 * N + 1) * q ^ n := fun n => by
    have := abs_coeff_le hP h1 hR h hR0 hRR (n + N)
    have hpos : 0 < R ^ (2 * (n + N) + 1) := by positivity
    rw [← le_div_iff₀ hpos] at this
    refine this.trans (le_of_eq ?_)
    rw [hq, div_eq_mul_inv, ← inv_pow, ← pow_mul, mul_assoc, ← pow_add]
    congr 2; ring
  have hg : Summable fun n => 10 * R⁻¹ ^ (2 * N + 1) * q ^ n :=
    (summable_geometric_of_lt_one hq0 hq1).mul_left _
  calc ∑' n, |compCoeff haagCoeff (ofListQ pl) (n + N)|
      ≤ ∑' n, 10 * R⁻¹ ^ (2 * N + 1) * q ^ n :=
        Summable.tsum_le_tsum hb ((summable_nat_add_iff N).2
          (summable_abs_compCoeff summable_haagCoeff hP)) hg
    _ = 10 * R⁻¹ ^ (2 * N + 1) / (1 - q) := by
        rw [tsum_mul_left, tsum_geometric_of_lt_one hq0 hq1, div_eq_mul_inv]

end

end Grothe.HJM.Cauchy
