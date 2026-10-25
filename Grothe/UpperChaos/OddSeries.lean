import Mathlib

/-!
# Analytic continuation of an odd power series (steps 1(c)–(d) of the `hardy` plan)

If `f` is holomorphic on the disc `‖z‖ < r` (`r > 1`) and agrees, for real `0 < t < 1`, with an odd
power series `∑ⱼ hⱼ t^{2j+1}` whose real coefficients are absolutely summable, then the series
converges to `f z` on the whole disc (`hasSum_odd_of_eqOn_real`). This is what turns holomorphy of the
continued kernel `t ↦ Hhol (Rt t)` beyond the unit disc into the Hardy-type statement about the kernel
coefficients.
-/

open Complex Metric Filter Topology FormalMultilinearSeries

namespace Grothe.UpperChaos

/-- The coefficients `bₙ = h_{(n−1)/2}` for odd `n`, `0` for even `n`. -/
noncomputable def oddCoeff (h : ℕ → ℝ) (n : ℕ) : ℂ := if Odd n then (h (n / 2) : ℂ) else 0

lemma oddCoeff_odd (h : ℕ → ℝ) (j : ℕ) : oddCoeff h (2 * j + 1) = h j := by
  simp [oddCoeff]; congr 2; omega

/-- Reindexing: the full series with odd coefficients is the odd series. -/
lemma hasSum_oddCoeff_iff (h : ℕ → ℝ) (z S : ℂ) :
    HasSum (fun n => oddCoeff h n • z ^ n) S ↔
      HasSum (fun j => (h j : ℂ) * z ^ (2 * j + 1)) S := by
  have hinj : Function.Injective fun j : ℕ => 2 * j + 1 := fun a b hab => by simpa using hab
  have hcomp : ((fun n => oddCoeff h n • z ^ n) ∘ fun j => 2 * j + 1) =
      fun j => (h j : ℂ) * z ^ (2 * j + 1) := by
    funext j; simp only [Function.comp, oddCoeff_odd, smul_eq_mul]
  rw [← hinj.hasSum_iff, hcomp]
  intro n hn
  have : ¬ Odd n := fun ho => hn ⟨n / 2, by obtain ⟨k, rfl⟩ := ho; simp only; omega⟩
  simp [oddCoeff, this]

/-- The formal series of the odd coefficients. -/
noncomputable def oddSeries (h : ℕ → ℝ) : FormalMultilinearSeries ℂ ℂ ℂ := ofScalars ℂ (oddCoeff h)

lemma one_le_radius_oddSeries {h : ℕ → ℝ} (hs : Summable fun j => |h j|) :
    1 ≤ (oddSeries h).radius := by
  have hb : ∀ n, ‖oddCoeff h n‖ ≤ ∑' j, |h j| := fun n => by
    unfold oddCoeff
    split_ifs
    · rw [Complex.norm_real, Real.norm_eq_abs]
      exact hs.le_tsum (n / 2) fun j _ => abs_nonneg _
    · simp only [norm_zero]; exact tsum_nonneg fun j => abs_nonneg _
  have : ((1 : NNReal) : ENNReal) ≤ (oddSeries h).radius := by
    refine (oddSeries h).le_radius_of_bound (C := ∑' j, |h j|) fun n => ?_
    simp only [NNReal.coe_one, one_pow, mul_one, oddSeries]
    refine le_trans ?_ (hb n)
    rw [ofScalars_norm]
  simpa using this

/-- **Analytic continuation of an odd power series.** -/
theorem hasSum_odd_of_eqOn_real {f : ℂ → ℂ} {r : ℝ} (hr : 1 < r)
    (hf : DifferentiableOn ℂ f (ball 0 r)) {h : ℕ → ℝ} (hs : Summable fun j => |h j|)
    (heq : ∀ t : ℝ, 0 < t → t < 1 → HasSum (fun j => (h j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (f t)) :
    ∀ z ∈ ball (0 : ℂ) r, HasSum (fun j => (h j : ℂ) * z ^ (2 * j + 1)) (f z) := by
  set p := oddSeries h with hp
  have hrad : (1 : ENNReal) ≤ p.radius := one_le_radius_oddSeries hs
  have hg : HasFPowerSeriesOnBall p.sum p 0 1 :=
    (p.hasFPowerSeriesOnBall (lt_of_lt_of_le zero_lt_one hrad)).mono zero_lt_one hrad
  -- `f = p.sum` on real points of `(0, 1)`
  have hreal : ∀ t : ℝ, 0 < t → t < 1 → f t = p.sum t := by
    intro t ht0 ht1
    have hmem : (t : ℂ) ∈ Metric.eball (0 : ℂ) 1 := by
      rw [Metric.mem_eball, edist_zero_right, ← ofReal_norm, ENNReal.ofReal_lt_one]
      rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos ht0]; exact ht1
    have h1 := hg.hasSum hmem
    simp only [zero_add, hp, oddSeries, ofScalars_apply_eq] at h1
    exact (heq t ht0 ht1).unique ((hasSum_oddCoeff_iff h _ _).1 h1)
  -- identity theorem on the unit disc
  have hfa : AnalyticOnNhd ℂ f (ball 0 1) :=
    (hf.mono (ball_subset_ball hr.le)).analyticOnNhd isOpen_ball
  have hga : AnalyticOnNhd ℂ p.sum (ball 0 1) := fun z hz =>
    hg.analyticAt_of_mem (by simpa [Metric.mem_eball, edist_dist, ← ENNReal.ofReal_one] using hz)
  have hfreq : ∃ᶠ z in 𝓝[≠] ((1 / 2 : ℝ) : ℂ), f z = p.sum z := by
    rw [Filter.frequently_iff]
    intro U hU
    obtain ⟨ε, hε, hεU⟩ := Metric.mem_nhdsWithin_iff.1 hU
    set d : ℝ := min (ε / 2) (1 / 4) with hd
    have hd0 : 0 < d := by positivity
    refine ⟨((1 / 2 + d : ℝ) : ℂ), hεU ⟨?_, ?_⟩, hreal _ (by positivity) ?_⟩
    · rw [mem_ball, dist_eq_norm, ← ofReal_sub, Complex.norm_real, Real.norm_eq_abs]
      rw [show (1 / 2 + d : ℝ) - 1 / 2 = d by ring, abs_of_pos hd0]
      exact lt_of_le_of_lt (min_le_left _ _) (half_lt_self hε)
    · simp only [Set.mem_compl_iff, Set.mem_singleton_iff, ofReal_inj]; linarith
    · linarith [min_le_right (ε / 2) (1 / 4 : ℝ)]
  have h12 : ((1 / 2 : ℝ) : ℂ) ∈ ball (0 : ℂ) 1 := by
    rw [mem_ball, dist_zero_right, Complex.norm_real, Real.norm_eq_abs]; norm_num
  have hEq : Set.EqOn f p.sum (ball 0 1) :=
    hfa.eqOn_of_preconnected_of_frequently_eq hga (convex_ball _ _).isPreconnected h12 hfreq
  -- the Taylor series of `f` at `0` is `p`, on every disc of radius `< r`
  intro z hz
  have hzr : ‖z‖ < r := by simpa using hz
  set r' : ℝ := max ((‖z‖ + r) / 2) ((1 + r) / 2) with hr'
  have hr'r : r' < r := max_lt (by linarith) (by linarith)
  have hzr' : ‖z‖ < r' := lt_of_lt_of_le (by linarith) (le_max_left _ _)
  have hr'0 : 0 < r' := lt_of_lt_of_le (by linarith) (le_max_right _ _)
  set R' : NNReal := ⟨r', hr'0.le⟩
  have hfc : HasFPowerSeriesOnBall f (cauchyPowerSeries f 0 R') 0 R' :=
    (hf.mono (closedBall_subset_ball hr'r)).hasFPowerSeriesOnBall (by exact_mod_cast hr'0)
  have hfp : HasFPowerSeriesAt f p 0 := by
    refine (hg.hasFPowerSeriesAt).congr ?_
    filter_upwards [isOpen_ball.mem_nhds (mem_ball_self zero_lt_one)] with w hw
    exact (hEq hw).symm
  have hpc : cauchyPowerSeries f 0 R' = p := hfc.hasFPowerSeriesAt.eq_formalMultilinearSeries hfp
  rw [hpc] at hfc
  have hmem : z ∈ Metric.eball (0 : ℂ) R' := by
    rw [Metric.mem_eball, edist_zero_right, enorm_eq_nnnorm, ENNReal.coe_lt_coe,
      ← NNReal.coe_lt_coe]
    exact hzr'
  have h1 := hfc.hasSum hmem
  simp only [zero_add, hp, oddSeries, ofScalars_apply_eq] at h1
  exact (hasSum_oddCoeff_iff h _ _).1 h1

/-- Inside the disc of convergence the odd series converges absolutely. -/
theorem summable_abs_of_hasSum_ball {f : ℂ → ℂ} {h : ℕ → ℝ} {r ρ : ℝ} (hρ0 : 0 ≤ ρ) (hρ : ρ < r)
    (hsum : ∀ z ∈ ball (0 : ℂ) r, HasSum (fun j => (h j : ℂ) * z ^ (2 * j + 1)) (f z)) :
    Summable fun j => |h j * ρ ^ (2 * j + 1)| := by
  set ρ' : ℝ := (ρ + r) / 2 with hρ'
  have hρ'0 : 0 < ρ' := by rw [hρ']; linarith
  have hρρ' : ρ < ρ' := by rw [hρ']; linarith
  have hmem : (ρ' : ℂ) ∈ ball (0 : ℂ) r := by
    rw [mem_ball, dist_zero_right, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hρ'0]
    rw [hρ']; linarith
  have ht := (hsum _ hmem).summable.tendsto_atTop_zero
  obtain ⟨C, hC⟩ := (Metric.isBounded_range_of_tendsto _ ht).exists_norm_le
  set q : ℝ := ρ / ρ' with hq
  have hq0 : 0 ≤ q := div_nonneg hρ0 hρ'0.le
  have hq1 : q < 1 := (div_lt_one hρ'0).2 hρρ'
  have hgeo : Summable fun j : ℕ => C * q * (q ^ 2) ^ j :=
    (summable_geometric_of_lt_one (by positivity) (by nlinarith)).mul_left _
  refine hgeo.of_nonneg_of_le (fun _ => abs_nonneg _) fun j => ?_
  have hb := hC _ ⟨j, rfl⟩
  simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs, norm_pow,
    abs_of_pos hρ'0] at hb
  rw [abs_mul, abs_pow, abs_of_nonneg hρ0]
  have hρeq : ρ = q * ρ' := by rw [hq]; field_simp
  rw [hρeq, mul_pow]
  calc |h j| * (q ^ (2 * j + 1) * ρ' ^ (2 * j + 1))
      = (|h j| * ρ' ^ (2 * j + 1)) * q ^ (2 * j + 1) := by ring
    _ ≤ C * q ^ (2 * j + 1) := by gcongr
    _ = C * q * (q ^ 2) ^ j := by ring

end Grothe.UpperChaos
