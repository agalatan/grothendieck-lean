import Grothe.UpperQuad.GaussRemainderDisk
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Basic
import Mathlib.RingTheory.Polynomial.Chebyshev
import Mathlib.Topology.Algebra.Polynomial

/-!
# The Gauss remainder of an analytic integrand on a Bernstein ellipse (generic)

`gauss_remainder_ellipse`: let an `n`-point rule on `[l, h]` have nodes in the panel, nonnegative
weights and be exact on the real polynomials of degree `< 2n`.  Let `ρ > 1` and let `f : ℂ → E`
(any complex Banach space) be complex differentiable at every point `ellipsePt l h w =
c + r (w + w⁻¹)/2` (`c = (l+h)/2`, `r = (h−l)/2`) with `ρ⁻¹ ≤ |w| ≤ ρ` (the closed Bernstein
ellipse `E_ρ` of the panel, parametrised by the Joukowski map), and `‖f‖ ≤ M` on its boundary
`|w| = ρ`.  Then
```
‖∫_l^h f(s) ds − Σ_i W_i f(x_i)‖ ≤ 2 (h − l) · 2 M ρ^{−2n} / (1 − ρ⁻¹).
```
Proof (no Laurent series): `g(w) = f(ellipsePt w)` is analytic on the closed annulus
`ρ⁻¹ ≤ |w| ≤ ρ`; the two-circle Cauchy formula (`two_circle_cauchy`, from Mathlib's annulus theorem
applied to `dslope g ζ`) and the finite geometric expansions of `(w − ζ)⁻¹` on both circles give a
Laurent polynomial `P` with `‖g(ζ) − P(ζ)‖ ≤ 2Mρ^{−N}/(1 − ρ⁻¹)` on `|ζ| = 1`; since
`g(ζ) = g(ζ⁻¹)` the symmetrisation of `P` at `ζ = e^{iθ}` is a Chebyshev sum `Σ T_k(cos θ) • e_k` of
degree `< N = 2n`, integrated exactly by the rule.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.Remainder

open MeasureTheory Metric Complex
open scoped Real

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- **The two-circle Cauchy formula** on the annulus `ρ⁻¹ ≤ |w| ≤ ρ`, at a point of the unit
circle. -/
theorem two_circle_cauchy (g : ℂ → E) {ρ : ℝ} (hρ : 1 < ρ)
    (hg : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ → DifferentiableAt ℂ g w) {ζ : ℂ} (hζ : ‖ζ‖ = 1) :
    (2 * π * I : ℂ) • g ζ =
      (∮ w in C(0, ρ), (w - ζ)⁻¹ • g w) - ∮ w in C(0, ρ⁻¹), (w - ζ)⁻¹ • g w := by
  have hρ0 : 0 < ρ := by linarith
  have hρi : ρ⁻¹ < 1 := inv_lt_one_of_one_lt₀ hρ
  have hρi0 : 0 < ρ⁻¹ := inv_pos.mpr hρ0
  have hle : ρ⁻¹ ≤ ρ := by linarith
  set F : ℂ → E := fun w => w • dslope g ζ w with hF
  have hgζ : DifferentiableAt ℂ g ζ := hg ζ (by rw [hζ]; exact hρi.le) (by rw [hζ]; exact hρ.le)
  have hnhd : closedBall (0 : ℂ) ρ \ ball 0 ρ⁻¹ ∈ nhds ζ := by
    have : {w : ℂ | ρ⁻¹ < ‖w‖ ∧ ‖w‖ < ρ} ⊆ closedBall (0 : ℂ) ρ \ ball 0 ρ⁻¹ := by
      intro w hw
      simp only [Set.mem_sdiff, mem_closedBall, dist_zero_right, mem_ball, not_lt]
      exact ⟨hw.2.le, hw.1.le⟩
    apply Filter.mem_of_superset _ this
    apply IsOpen.mem_nhds
    · exact (isOpen_lt continuous_const continuous_norm).inter
        (isOpen_lt continuous_norm continuous_const)
    · simp only [Set.mem_ofPred_eq, hζ]; exact ⟨hρi, hρ⟩
  have hgcont : ContinuousOn g (closedBall (0 : ℂ) ρ \ ball 0 ρ⁻¹) := by
    intro w hw
    simp only [Set.mem_sdiff, mem_closedBall, dist_zero_right, mem_ball, not_lt] at hw
    exact (hg w hw.2 hw.1).continuousAt.continuousWithinAt
  have hcF : ContinuousOn F (closedBall (0 : ℂ) ρ \ ball 0 ρ⁻¹) := by
    apply continuousOn_id.smul
    exact (continuousOn_dslope hnhd).mpr ⟨hgcont, hgζ⟩
  have hdF : ∀ z ∈ (ball (0 : ℂ) ρ \ closedBall 0 ρ⁻¹) \ {ζ}, DifferentiableAt ℂ F z := by
    intro z hz
    simp only [Set.mem_sdiff, mem_ball, dist_zero_right, mem_closedBall, not_le,
      Set.mem_singleton_iff] at hz
    apply differentiableAt_id.smul
    exact (differentiableAt_dslope_of_ne hz.2).mpr (hg z hz.1.2.le hz.1.1.le)
  have hann := circleIntegral_sub_center_inv_smul_eq_of_differentiable_on_annulus_off_countable
    hρi0 hle (Set.countable_singleton ζ) hcF hdF
  -- on both circles, `w⁻¹ • F w = (w − ζ)⁻¹ • g w − (w − ζ)⁻¹ • g ζ`
  have hpt : ∀ R : ℝ, 0 < R → R ≠ 1 → Set.EqOn (fun w => (w - 0)⁻¹ • F w)
      (fun w => (w - ζ)⁻¹ • g w - (w - ζ)⁻¹ • g ζ) (sphere (0 : ℂ) R) := by
    intro R hR hR1 w hw
    rw [mem_sphere, dist_zero_right] at hw
    have hw0 : w ≠ 0 := by rintro rfl; simp at hw; linarith
    have hwζ : w ≠ ζ := by rintro rfl; exact hR1 (hw ▸ hζ)
    simp only [hF, sub_zero, smul_smul, inv_mul_cancel₀ hw0, one_smul]
    rw [dslope_of_ne _ hwζ, slope_def_module, smul_sub]
  rw [circleIntegral.integral_congr hρ0.le (hpt ρ hρ0 hρ.ne'),
    circleIntegral.integral_congr hρi0.le (hpt ρ⁻¹ hρi0 hρi.ne)] at hann
  have hinvc : ∀ R : ℝ, R ≠ 1 → ContinuousOn (fun w : ℂ => (w - ζ)⁻¹) (sphere 0 R) := by
    intro R hR1
    apply (continuousOn_id.sub continuousOn_const).inv₀
    intro w hw hwζ
    rw [mem_sphere, dist_zero_right] at hw
    have : w = ζ := sub_eq_zero.mp hwζ
    rw [this, hζ] at hw
    exact hR1 hw.symm
  have hint : ∀ R : ℝ, 0 < R → R ≠ 1 → ρ⁻¹ ≤ R → R ≤ ρ →
      CircleIntegrable (fun w => (w - ζ)⁻¹ • g w) 0 R := by
    intro R hR hR1 hR2 hR3
    apply ContinuousOn.circleIntegrable hR.le
    apply (hinvc R hR1).smul
    intro w hw
    rw [mem_sphere, dist_zero_right] at hw
    exact (hg w (hw ▸ hR2) (hw ▸ hR3)).continuousAt.continuousWithinAt
  have hint2 : ∀ R : ℝ, 0 < R → R ≠ 1 → CircleIntegrable (fun w => (w - ζ)⁻¹ • g ζ) 0 R := by
    intro R hR hR1
    exact ContinuousOn.circleIntegrable hR.le ((hinvc R hR1).smul continuousOn_const)
  rw [circleIntegral.integral_sub (hint ρ hρ0 hρ.ne' hle le_rfl) (hint2 ρ hρ0 hρ.ne'),
    circleIntegral.integral_sub (hint ρ⁻¹ hρi0 hρi.ne le_rfl hle) (hint2 ρ⁻¹ hρi0 hρi.ne),
    circleIntegral.integral_smul_const, circleIntegral.integral_smul_const,
    circleIntegral.integral_sub_inv_of_mem_ball (by simp [hζ, hρ])] at hann
  have h0 : (∮ w in C(0, ρ⁻¹), (w - ζ)⁻¹) = 0 := by
    have hne : ∀ w ∈ closedBall (0 : ℂ) ρ⁻¹, w - ζ ≠ 0 := by
      intro w hw hwζ
      rw [mem_closedBall, dist_zero_right] at hw
      rw [sub_eq_zero.mp hwζ, hζ] at hw
      linarith
    apply circleIntegral_eq_zero_of_differentiable_on_off_countable hρi0.le Set.countable_empty
    · exact (continuousOn_id.sub continuousOn_const).inv₀ hne
    · intro z hz
      exact (differentiableAt_id.sub (differentiableAt_const _)).inv
        (hne z (ball_subset_closedBall hz.1))
  rw [h0, zero_smul, sub_zero] at hann
  rw [← hann]
  abel

/-- The outer geometric expansion: `(w − ζ)⁻¹ = Σ_{k<N} ζ^k w^{−k−1} + (ζ/w)^N (w − ζ)⁻¹`. -/
lemma inv_sub_outer {w ζ : ℂ} (hw : w ≠ 0) (hwζ : w ≠ ζ) (N : ℕ) :
    (w - ζ)⁻¹ = ∑ k ∈ Finset.range N, ζ ^ k * (w ^ (k + 1))⁻¹ + (ζ / w) ^ N * (w - ζ)⁻¹ := by
  have hx : ζ / w ≠ 1 := by
    intro h; apply hwζ; rw [div_eq_one_iff_eq hw] at h; exact h.symm
  have hsum : ∑ k ∈ Finset.range N, ζ ^ k * (w ^ (k + 1))⁻¹ =
      w⁻¹ * ∑ k ∈ Finset.range N, (ζ / w) ^ k := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro k _
    rw [div_pow, pow_succ]
    field_simp
  rw [hsum, geom_sum_eq hx]
  have hsub : w - ζ ≠ 0 := sub_ne_zero.mpr hwζ
  have hx1 : ζ / w - 1 ≠ 0 := sub_ne_zero.mpr hx
  field_simp
  ring

/-- The inner geometric expansion: `(w − ζ)⁻¹ = −Σ_{k<N} w^k ζ^{−k−1} + (w/ζ)^N (w − ζ)⁻¹`. -/
lemma inv_sub_inner {w ζ : ℂ} (hζ : ζ ≠ 0) (hwζ : w ≠ ζ) (N : ℕ) :
    (w - ζ)⁻¹ = -∑ k ∈ Finset.range N, w ^ k * (ζ ^ (k + 1))⁻¹ + (w / ζ) ^ N * (w - ζ)⁻¹ := by
  have hy : w / ζ ≠ 1 := by
    intro h; apply hwζ; rw [div_eq_one_iff_eq hζ] at h; exact h
  have hsum : ∑ k ∈ Finset.range N, w ^ k * (ζ ^ (k + 1))⁻¹ =
      ζ⁻¹ * ∑ k ∈ Finset.range N, (w / ζ) ^ k := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro k _
    rw [div_pow, pow_succ]
    field_simp
  rw [hsum, geom_sum_eq hy]
  have hsub : w - ζ ≠ 0 := sub_ne_zero.mpr hwζ
  have hy1 : w / ζ - 1 ≠ 0 := sub_ne_zero.mpr hy
  have : w / ζ - 1 = (w - ζ) / ζ := by field_simp
  rw [this]
  field_simp
  ring

/-- The outer Laurent coefficients `a_k = (2πi)⁻¹ ∮_{|w|=ρ} w^{−k−1} g(w) dw`. -/
def outerCoeff (g : ℂ → E) (ρ : ℝ) (k : ℕ) : E :=
  (2 * π * I : ℂ)⁻¹ • ∮ w in C(0, ρ), (w ^ (k + 1))⁻¹ • g w

/-- The inner Laurent coefficients `b_k = (2πi)⁻¹ ∮_{|w|=ρ⁻¹} w^k g(w) dw`. -/
def innerCoeff (g : ℂ → E) (ρ : ℝ) (k : ℕ) : E :=
  (2 * π * I : ℂ)⁻¹ • ∮ w in C(0, ρ⁻¹), w ^ k • g w

/-- The truncated Laurent polynomial, `Σ_{k<N} ζ^k a_k + Σ_{k<N−1} ζ^{−k−1} b_k`. -/
def laurentTrunc (g : ℂ → E) (ρ : ℝ) (N : ℕ) (ζ : ℂ) : E :=
  ∑ k ∈ Finset.range N, ζ ^ k • outerCoeff g ρ k +
    ∑ k ∈ Finset.range (N - 1), (ζ ^ (k + 1))⁻¹ • innerCoeff g ρ k

/-- **The Laurent truncation on the unit circle**: `‖g(ζ) − P(ζ)‖ ≤ 2Mρ^{−N}/(1 − ρ⁻¹)`. -/
theorem norm_sub_laurentTrunc_le (g : ℂ → E) {ρ : ℝ} (hρ : 1 < ρ)
    (hg : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ → DifferentiableAt ℂ g w) {M : ℝ}
    (hM : ∀ w : ℂ, ‖w‖ = ρ ∨ ‖w‖ = ρ⁻¹ → ‖g w‖ ≤ M) {N : ℕ} (hN : 1 ≤ N)
    {ζ : ℂ} (hζ : ‖ζ‖ = 1) :
    ‖g ζ - laurentTrunc g ρ N ζ‖ ≤ 2 * M * (ρ⁻¹) ^ N / (1 - ρ⁻¹) := by
  have hρ0 : 0 < ρ := by linarith
  have hρi : ρ⁻¹ < 1 := inv_lt_one_of_one_lt₀ hρ
  have hρi0 : 0 < ρ⁻¹ := inv_pos.mpr hρ0
  have hle : ρ⁻¹ ≤ ρ := by linarith
  have hζ0 : ζ ≠ 0 := by rintro rfl; simp at hζ
  have hcau := two_circle_cauchy g hρ hg hζ
  have hgc : ∀ R : ℝ, (R = ρ ∨ R = ρ⁻¹) → ContinuousOn g (sphere (0 : ℂ) R) := by
    intro R hR w hw
    rw [mem_sphere, dist_zero_right] at hw
    rcases hR with rfl | rfl
    · exact (hg w (hw ▸ hle) hw.le).continuousAt.continuousWithinAt
    · exact (hg w hw.ge (hw ▸ hle)).continuousAt.continuousWithinAt
  have hne0 : ∀ R : ℝ, 0 < R → ∀ w ∈ sphere (0 : ℂ) R, w ≠ 0 := by
    intro R hR w hw h0
    rw [h0, mem_sphere, dist_self] at hw
    linarith
  have hneζ : ∀ R : ℝ, R ≠ 1 → ∀ w ∈ sphere (0 : ℂ) R, w - ζ ≠ 0 := by
    intro R hR1 w hw hwζ
    rw [mem_sphere, dist_zero_right, sub_eq_zero.mp hwζ, hζ] at hw
    exact hR1 hw.symm
  -- outer circle
  set Iout := ∮ w in C(0, ρ), ((ζ / w) ^ N * (w - ζ)⁻¹) • g w with hIout
  set Sout := ∑ k ∈ Finset.range N, ζ ^ k • ∮ w in C(0, ρ), (w ^ (k + 1))⁻¹ • g w with hSout
  have hOut : (∮ w in C(0, ρ), (w - ζ)⁻¹ • g w) = Sout + Iout := by
    have hpt : Set.EqOn (fun w => (w - ζ)⁻¹ • g w)
        (fun w => (∑ k ∈ Finset.range N, ζ ^ k • ((w ^ (k + 1))⁻¹ • g w)) +
          ((ζ / w) ^ N * (w - ζ)⁻¹) • g w) (sphere (0 : ℂ) ρ) := by
      intro w hw
      have h1 := inv_sub_outer (hne0 ρ hρ0 w hw) (sub_ne_zero.mp (hneζ ρ hρ.ne' w hw)) N
      refine (congrArg (fun t : ℂ => t • g w) h1).trans ?_
      simp only
      rw [add_smul, Finset.sum_smul]
      simp_rw [smul_smul]
    rw [circleIntegral.integral_congr hρ0.le hpt]
    have hk : ∀ k ∈ Finset.range N, CircleIntegrable (fun w => ζ ^ k • ((w ^ (k + 1))⁻¹ • g w))
        0 ρ := by
      intro k _
      apply ContinuousOn.circleIntegrable hρ0.le
      apply continuousOn_const.smul
      apply ContinuousOn.smul _ (hgc ρ (Or.inl rfl))
      exact (continuousOn_id.pow _).inv₀ (fun w hw => pow_ne_zero _ (hne0 ρ hρ0 w hw))
    have hr : CircleIntegrable (fun w => ((ζ / w) ^ N * (w - ζ)⁻¹) • g w) 0 ρ := by
      apply ContinuousOn.circleIntegrable hρ0.le
      apply ContinuousOn.smul _ (hgc ρ (Or.inl rfl))
      apply ContinuousOn.mul
      · exact (continuousOn_const.div continuousOn_id (hne0 ρ hρ0)).pow _
      · exact (continuousOn_id.sub continuousOn_const).inv₀ (hneζ ρ hρ.ne')
    rw [circleIntegral.integral_add _ hr, circleIntegral.integral_fun_sum hk]
    · simp_rw [circleIntegral.integral_smul]
      rfl
    · apply ContinuousOn.circleIntegrable hρ0.le
      apply continuousOn_finsetSum
      intro k hk'
      apply continuousOn_const.smul
      apply ContinuousOn.smul _ (hgc ρ (Or.inl rfl))
      exact (continuousOn_id.pow _).inv₀ (fun w hw => pow_ne_zero _ (hne0 ρ hρ0 w hw))
  -- inner circle
  set Iin := ∮ w in C(0, ρ⁻¹), ((w / ζ) ^ (N - 1) * (w - ζ)⁻¹) • g w with hIin
  set Sin := ∑ k ∈ Finset.range (N - 1), (ζ ^ (k + 1))⁻¹ • ∮ w in C(0, ρ⁻¹), w ^ k • g w
    with hSin
  have hIn : (∮ w in C(0, ρ⁻¹), (w - ζ)⁻¹ • g w) = Iin - Sin := by
    have hpt : Set.EqOn (fun w => (w - ζ)⁻¹ • g w)
        (fun w => ((w / ζ) ^ (N - 1) * (w - ζ)⁻¹) • g w -
          (∑ k ∈ Finset.range (N - 1), (ζ ^ (k + 1))⁻¹ • (w ^ k • g w)))
        (sphere (0 : ℂ) ρ⁻¹) := by
      intro w hw
      have h1 := inv_sub_inner hζ0 (sub_ne_zero.mp (hneζ ρ⁻¹ hρi.ne w hw)) (N - 1)
      refine (congrArg (fun t : ℂ => t • g w) h1).trans ?_
      simp only
      rw [add_smul, neg_smul, Finset.sum_smul]
      simp_rw [smul_smul, mul_comm (w ^ _) _]
      abel
    rw [circleIntegral.integral_congr hρi0.le hpt]
    have hk : ∀ k ∈ Finset.range (N - 1),
        CircleIntegrable (fun w => (ζ ^ (k + 1))⁻¹ • (w ^ k • g w)) 0 ρ⁻¹ := by
      intro k _
      apply ContinuousOn.circleIntegrable hρi0.le
      exact continuousOn_const.smul ((continuousOn_id.pow _).smul (hgc ρ⁻¹ (Or.inr rfl)))
    have hr : CircleIntegrable (fun w => ((w / ζ) ^ (N - 1) * (w - ζ)⁻¹) • g w) 0 ρ⁻¹ := by
      apply ContinuousOn.circleIntegrable hρi0.le
      apply ContinuousOn.smul _ (hgc ρ⁻¹ (Or.inr rfl))
      apply ContinuousOn.mul
      · exact (continuousOn_id.div continuousOn_const (fun _ _ => hζ0)).pow _
      · exact (continuousOn_id.sub continuousOn_const).inv₀ (hneζ ρ⁻¹ hρi.ne)
    rw [circleIntegral.integral_sub hr, circleIntegral.integral_fun_sum hk]
    · simp_rw [circleIntegral.integral_smul]
      rfl
    · apply ContinuousOn.circleIntegrable hρi0.le
      apply continuousOn_finsetSum
      intro k _
      exact continuousOn_const.smul ((continuousOn_id.pow _).smul (hgc ρ⁻¹ (Or.inr rfl)))
  -- the truncation
  have h2pi : (2 * π * I : ℂ) ≠ 0 := by simp [Real.pi_ne_zero, I_ne_zero]
  have hP : (2 * π * I : ℂ) • laurentTrunc g ρ N ζ = Sout + Sin := by
    unfold laurentTrunc outerCoeff innerCoeff
    rw [smul_add, Finset.smul_sum, Finset.smul_sum]
    congr 1
    · apply Finset.sum_congr rfl
      intro k _
      rw [smul_comm, smul_inv_smul₀ h2pi]
    · apply Finset.sum_congr rfl
      intro k _
      rw [smul_comm, smul_inv_smul₀ h2pi]
  have hdiff : g ζ - laurentTrunc g ρ N ζ = (2 * π * I : ℂ)⁻¹ • (Iout - Iin) := by
    apply (smul_right_injective E h2pi)
    simp only
    rw [smul_sub, hP, hcau, hOut, hIn, smul_inv_smul₀ h2pi]
    abel
  rw [hdiff]
  -- the bounds
  have hM0 : 0 ≤ M := (norm_nonneg _).trans (hM (ρ : ℂ) (Or.inl (by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos hρ0])))
  have hbout : ‖Iout‖ ≤ 2 * π * ρ * ((ρ⁻¹) ^ N * (ρ - 1)⁻¹ * M) := by
    apply circleIntegral.norm_integral_le_of_norm_le_const hρ0.le
    intro w hw
    have hw' : ‖w‖ = ρ := by rw [mem_sphere, dist_zero_right] at hw; exact hw
    have hd : ρ - 1 ≤ ‖w - ζ‖ := by
      have := norm_sub_norm_le w ζ
      rw [hw', hζ] at this; exact this
    rw [norm_smul, norm_mul, norm_pow, norm_div, hζ, hw', norm_inv, one_div]
    apply mul_le_mul _ (hM w (Or.inl hw')) (norm_nonneg _) (by positivity)
    apply mul_le_mul_of_nonneg_left _ (by positivity)
    exact inv_anti₀ (by linarith) hd
  have hbin : ‖Iin‖ ≤ 2 * π * ρ⁻¹ * ((ρ⁻¹) ^ (N - 1) * (1 - ρ⁻¹)⁻¹ * M) := by
    apply circleIntegral.norm_integral_le_of_norm_le_const hρi0.le
    intro w hw
    have hw' : ‖w‖ = ρ⁻¹ := by rw [mem_sphere, dist_zero_right] at hw; exact hw
    have hd : 1 - ρ⁻¹ ≤ ‖w - ζ‖ := by
      have := norm_sub_norm_le ζ w
      rw [hw', hζ, norm_sub_rev] at this; exact this
    rw [norm_smul, norm_mul, norm_pow, norm_div, hζ, hw', norm_inv, div_one]
    apply mul_le_mul _ (hM w (Or.inr hw')) (norm_nonneg _) (by positivity)
    apply mul_le_mul_of_nonneg_left _ (by positivity)
    exact inv_anti₀ (by linarith) hd
  have hpi : (0 : ℝ) < 2 * π := by positivity
  have hnorm2 : ‖(2 * π * I : ℂ)⁻¹‖ = (2 * π)⁻¹ := by
    rw [norm_inv, norm_mul, norm_mul, Complex.norm_I, mul_one, Complex.norm_ofNat,
      Complex.norm_real, Real.norm_eq_abs, abs_of_pos Real.pi_pos]
  rw [norm_smul, hnorm2]
  have hsub := norm_sub_le Iout Iin
  have e1 : (2 * π)⁻¹ * (2 * π * ρ * ((ρ⁻¹) ^ N * (ρ - 1)⁻¹ * M)) =
      M * (ρ⁻¹) ^ N / (1 - ρ⁻¹) := by
    have : ρ - 1 ≠ 0 := by linarith
    have : 1 - ρ⁻¹ ≠ 0 := by linarith
    field_simp
  have e2 : (2 * π)⁻¹ * (2 * π * ρ⁻¹ * ((ρ⁻¹) ^ (N - 1) * (1 - ρ⁻¹)⁻¹ * M)) =
      M * (ρ⁻¹) ^ N / (1 - ρ⁻¹) := by
    have : 1 - ρ⁻¹ ≠ 0 := by linarith
    obtain ⟨m, rfl⟩ : ∃ m, N = m + 1 := ⟨N - 1, by omega⟩
    simp only [Nat.add_sub_cancel, pow_succ]
    field_simp
  calc (2 * π)⁻¹ * ‖Iout - Iin‖ ≤ (2 * π)⁻¹ * (‖Iout‖ + ‖Iin‖) :=
        mul_le_mul_of_nonneg_left hsub (by positivity)
    _ ≤ (2 * π)⁻¹ * (2 * π * ρ * ((ρ⁻¹) ^ N * (ρ - 1)⁻¹ * M) +
          2 * π * ρ⁻¹ * ((ρ⁻¹) ^ (N - 1) * (1 - ρ⁻¹)⁻¹ * M)) :=
        mul_le_mul_of_nonneg_left (add_le_add hbout hbin) (by positivity)
    _ = 2 * M * (ρ⁻¹) ^ N / (1 - ρ⁻¹) := by rw [mul_add, e1, e2]; ring

/-- The Joukowski parametrisation of the Bernstein ellipses of the panel `[l, h]`:
`ellipsePt l h w = (l+h)/2 + ((h−l)/2) (w + w⁻¹)/2`. -/
def ellipsePt (l h : ℝ) (w : ℂ) : ℂ :=
  (((l + h) / 2 : ℝ) : ℂ) + (((h - l) / 2 : ℝ) : ℂ) * ((w + w⁻¹) / 2)

lemma ellipsePt_inv (l h : ℝ) (w : ℂ) : ellipsePt l h w⁻¹ = ellipsePt l h w := by
  unfold ellipsePt; rw [inv_inv, add_comm w⁻¹]

/-- The Chebyshev approximant on `[−1, 1]` built from the Laurent coefficients. -/
def chebApprox (g : ℂ → E) (ρ : ℝ) (N : ℕ) (x : ℝ) : E :=
  ∑ k ∈ Finset.range N, (((Polynomial.Chebyshev.T ℝ k).eval x : ℝ) : ℂ) • outerCoeff g ρ k +
    ∑ k ∈ Finset.range (N - 1),
      (((Polynomial.Chebyshev.T ℝ ((k + 1 : ℕ) : ℤ)).eval x : ℝ) : ℂ) • innerCoeff g ρ k

omit [CompleteSpace E] in
/-- At `ζ = e^{iθ}`, `x = cos θ`, the Chebyshev approximant is the symmetrised Laurent
truncation. -/
lemma chebApprox_eq (g : ℂ → E) (ρ : ℝ) (N : ℕ) (θ : ℝ) :
    chebApprox g ρ N (Real.cos θ) =
      (1 / 2 : ℂ) • (laurentTrunc g ρ N (exp (θ * I)) + laurentTrunc g ρ N (exp (θ * I))⁻¹) := by
  have hcos : ∀ m : ℕ, ((((Polynomial.Chebyshev.T ℝ (m : ℤ)).eval (Real.cos θ)) : ℝ) : ℂ) =
      (1 / 2 : ℂ) * (exp (θ * I) ^ m + (exp (θ * I))⁻¹ ^ m) := by
    intro m
    rw [Polynomial.Chebyshev.T_real_cos, ← exp_neg, ← Complex.exp_nat_mul, ← Complex.exp_nat_mul]
    push_cast
    rw [Complex.cos]
    ring_nf
  unfold chebApprox laurentTrunc
  simp only [smul_add, Finset.smul_sum]
  rw [add_add_add_comm, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  congr 1
  · apply Finset.sum_congr rfl
    intro k _
    rw [show ((k : ℕ) : ℤ) = (k : ℤ) from rfl, hcos k, smul_smul, smul_smul, ← add_smul]
    congr 1
    ring
  · apply Finset.sum_congr rfl
    intro k _
    rw [hcos (k + 1), smul_smul, smul_smul, ← add_smul, inv_pow, inv_inv]
    congr 1
    rw [← inv_pow]
    ring

/-- A rule exact on real polynomials of degree `< 2n` integrates `s ↦ p(s) • e` exactly. -/
lemma integral_poly_smul_eq {n : ℕ} (l h : ℝ) (node weight : Fin n → ℝ)
    (hexact : ∀ p : Polynomial ℝ, p.natDegree < 2 * n →
      ∫ s in l..h, p.eval s = ∑ i, weight i * p.eval (node i))
    (p : Polynomial ℝ) (hp : p.natDegree < 2 * n) (e : E) :
    ∫ s in l..h, ((p.eval s : ℝ) : ℂ) • e =
      ∑ i, (weight i : ℂ) • (((p.eval (node i) : ℝ) : ℂ) • e) := by
  rw [intervalIntegral.integral_smul_const, intervalIntegral.integral_ofReal, hexact p hp,
    Complex.ofReal_sum, Finset.sum_smul]
  apply Finset.sum_congr rfl
  intro i _
  rw [smul_smul]
  push_cast
  rfl

/-- The affine pull-back `p((s − c)/r)` of a real polynomial. -/
def affPoly (p : Polynomial ℝ) (c r : ℝ) : Polynomial ℝ :=
  p.comp (Polynomial.C r⁻¹ * (Polynomial.X - Polynomial.C c))

lemma affPoly_eval (p : Polynomial ℝ) (c r s : ℝ) :
    (affPoly p c r).eval s = p.eval ((s - c) / r) := by
  simp [affPoly, Polynomial.eval_comp, div_eq_inv_mul]

lemma affPoly_natDegree_le (p : Polynomial ℝ) (c r : ℝ) :
    (affPoly p c r).natDegree ≤ p.natDegree := by
  unfold affPoly
  calc _ ≤ p.natDegree * (Polynomial.C r⁻¹ * (Polynomial.X - Polynomial.C c)).natDegree :=
        Polynomial.natDegree_comp_le
    _ ≤ p.natDegree * 1 := by
        apply Nat.mul_le_mul_left
        exact (Polynomial.natDegree_C_mul_le _ _).trans (by rw [Polynomial.natDegree_X_sub_C])
    _ = p.natDegree := mul_one _

lemma natDegree_chebyshevT_nat (k : ℕ) : (Polynomial.Chebyshev.T ℝ (k : ℤ)).natDegree = k := by
  rw [Polynomial.Chebyshev.natDegree_T]; simp

/-- Every point of the panel is the image of a point of the unit circle. -/
lemma ellipsePt_arccos {l h : ℝ} (hlh : l < h) {s : ℝ} (hs : s ∈ Set.Icc l h) :
    ‖exp ((Real.arccos ((s - (l + h) / 2) / ((h - l) / 2)) : ℂ) * I)‖ = 1 ∧
      ellipsePt l h (exp ((Real.arccos ((s - (l + h) / 2) / ((h - l) / 2)) : ℂ) * I)) = s ∧
      Real.cos (Real.arccos ((s - (l + h) / 2) / ((h - l) / 2))) = (s - (l + h) / 2) / ((h - l) / 2)
    := by
  have hr0 : 0 < (h - l) / 2 := by linarith
  set x := (s - (l + h) / 2) / ((h - l) / 2) with hx
  have hx1 : -1 ≤ x ∧ x ≤ 1 := by
    rw [hx, le_div_iff₀ hr0, div_le_iff₀ hr0]
    constructor <;> linarith [hs.1, hs.2]
  have hcosθ : Real.cos (Real.arccos x) = x := Real.cos_arccos hx1.1 hx1.2
  refine ⟨Complex.norm_exp_ofReal_mul_I _, ?_, hcosθ⟩
  set θ := Real.arccos x
  have hsum : exp (θ * I) + (exp (θ * I))⁻¹ = 2 * (Real.cos θ : ℂ) := by
    rw [← exp_neg, Complex.ofReal_cos, Complex.cos]
    ring_nf
  unfold ellipsePt
  rw [hsum, hcosθ, hx]
  have hne : (h : ℂ) - (l : ℂ) ≠ 0 := by
    rw [← Complex.ofReal_sub]; exact_mod_cast (show h - l ≠ 0 by linarith)
  push_cast
  field_simp
  ring

/-- **The Gauss remainder on a Bernstein ellipse** (generic in the integrand and the rule). -/
theorem gauss_remainder_ellipse {n : ℕ} (hn : 0 < n) (l h : ℝ) (hlh : l < h)
    (node weight : Fin n → ℝ) (hnode : ∀ i, node i ∈ Set.Icc l h) (hweight : ∀ i, 0 ≤ weight i)
    (hexact : ∀ p : Polynomial ℝ, p.natDegree < 2 * n →
      ∫ s in l..h, p.eval s = ∑ i, weight i * p.eval (node i))
    (f : ℂ → E) {ρ : ℝ} (hρ : 1 < ρ)
    (hf : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ → DifferentiableAt ℂ f (ellipsePt l h w)) {M : ℝ}
    (hM : ∀ w : ℂ, ‖w‖ = ρ → ‖f (ellipsePt l h w)‖ ≤ M) :
    ‖(∫ s in l..h, f s) - ∑ i, (weight i : ℂ) • f (node i)‖ ≤
      2 * (h - l) * (2 * M * (ρ⁻¹) ^ (2 * n) / (1 - ρ⁻¹)) := by
  set c₀ : ℝ := (l + h) / 2 with hc₀
  set r : ℝ := (h - l) / 2 with hr
  have hr0 : 0 < r := by rw [hr]; linarith
  have hρ0 : 0 < ρ := by linarith
  have hρi0 : 0 < ρ⁻¹ := inv_pos.mpr hρ0
  set N := 2 * n with hN
  have hN1 : 1 ≤ N := by omega
  set g : ℂ → E := fun w => f (ellipsePt l h w) with hgdef
  have hg : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ → DifferentiableAt ℂ g w := by
    intro w h1 h2
    have hw0 : w ≠ 0 := by rintro rfl; simp at h1; linarith
    apply DifferentiableAt.comp w (hf w h1 h2)
    unfold ellipsePt
    fun_prop (disch := exact hw0)
  have hMg : ∀ w : ℂ, ‖w‖ = ρ ∨ ‖w‖ = ρ⁻¹ → ‖g w‖ ≤ M := by
    intro w hw
    rcases hw with hw | hw
    · exact hM w hw
    · have : ‖w⁻¹‖ = ρ := by rw [norm_inv, hw, inv_inv]
      have h := hM w⁻¹ this
      simp only [hgdef]
      rwa [ellipsePt_inv] at h
  set ε : ℝ := 2 * M * (ρ⁻¹) ^ N / (1 - ρ⁻¹) with hε
  set Q : ℝ → E := fun s => chebApprox g ρ N ((s - c₀) / r) with hQ
  have happrox : ∀ s ∈ Set.Icc l h, ‖f s - Q s‖ ≤ ε := by
    intro s hs
    obtain ⟨hζ1, hpt, hcosθ⟩ := ellipsePt_arccos hlh hs
    set ζ := exp ((Real.arccos ((s - (l + h) / 2) / ((h - l) / 2)) : ℂ) * I) with hζ
    have hζ1' : ‖ζ⁻¹‖ = 1 := by rw [norm_inv, hζ1, inv_one]
    have hgζ : g ζ = f s := by simp only [hgdef, hpt]
    have hgζ' : g ζ⁻¹ = f s := by simp only [hgdef, ellipsePt_inv, hpt]
    have hQs : Q s = (1 / 2 : ℂ) • (laurentTrunc g ρ N ζ + laurentTrunc g ρ N ζ⁻¹) := by
      simp only [hQ]
      rw [← hcosθ, chebApprox_eq]
    have hsplit : f s - Q s = (1 / 2 : ℂ) • (g ζ - laurentTrunc g ρ N ζ) +
        (1 / 2 : ℂ) • (g ζ⁻¹ - laurentTrunc g ρ N ζ⁻¹) := by
      rw [hQs, hgζ, hgζ']
      module
    rw [hsplit]
    have h1 := norm_sub_laurentTrunc_le g hρ hg hMg hN1 hζ1
    have h2 := norm_sub_laurentTrunc_le g hρ hg hMg hN1 hζ1'
    have hhalf : ‖(1 / 2 : ℂ)‖ = 1 / 2 := by norm_num
    calc _ ≤ ‖(1 / 2 : ℂ) • (g ζ - laurentTrunc g ρ N ζ)‖ +
          ‖(1 / 2 : ℂ) • (g ζ⁻¹ - laurentTrunc g ρ N ζ⁻¹)‖ := norm_add_le _ _
      _ ≤ 1 / 2 * ε + 1 / 2 * ε := by
          rw [norm_smul, norm_smul, hhalf]
          exact add_le_add (mul_le_mul_of_nonneg_left h1 (by norm_num))
            (mul_le_mul_of_nonneg_left h2 (by norm_num))
      _ = ε := by ring
  have hε0 : 0 ≤ ε := (norm_nonneg _).trans (happrox l ⟨le_rfl, hlh.le⟩)
  have hsum : ∑ i, weight i = h - l := by
    have h1 := hexact (Polynomial.C 1) (by rw [Polynomial.natDegree_C]; omega)
    simp only [Polynomial.eval_C, mul_one] at h1
    rw [intervalIntegral.integral_const, smul_eq_mul, mul_one] at h1
    linarith
  -- the approximant is a sum of polynomial terms, integrated exactly
  have hQsum : ∀ s : ℝ, Q s =
      (∑ k ∈ Finset.range N, (((affPoly (Polynomial.Chebyshev.T ℝ k) c₀ r).eval s : ℝ) : ℂ) •
          outerCoeff g ρ k) +
        ∑ k ∈ Finset.range (N - 1),
          (((affPoly (Polynomial.Chebyshev.T ℝ ((k + 1 : ℕ) : ℤ)) c₀ r).eval s : ℝ) : ℂ) •
            innerCoeff g ρ k := by
    intro s
    simp only [hQ, chebApprox, affPoly_eval]
  have hdeg1 : ∀ k ∈ Finset.range N,
      (affPoly (Polynomial.Chebyshev.T ℝ k) c₀ r).natDegree < 2 * n := by
    intro k hk
    exact (affPoly_natDegree_le _ _ _).trans_lt (by
      rw [natDegree_chebyshevT_nat]; exact Finset.mem_range.mp hk)
  have hdeg2 : ∀ k ∈ Finset.range (N - 1),
      (affPoly (Polynomial.Chebyshev.T ℝ ((k + 1 : ℕ) : ℤ)) c₀ r).natDegree < 2 * n := by
    intro k hk
    exact (affPoly_natDegree_le _ _ _).trans_lt (by
      rw [natDegree_chebyshevT_nat]; have := Finset.mem_range.mp hk; omega)
  have hpolyint : ∀ (p : Polynomial ℝ) (e : E),
      IntervalIntegrable (fun s : ℝ => ((p.eval s : ℝ) : ℂ) • e) volume l h := by
    intro p e
    apply Continuous.intervalIntegrable
    exact (Complex.continuous_ofReal.comp (Polynomial.continuous p)).smul continuous_const
  have hsumint : ∀ (S : Finset ℕ) (p : ℕ → Polynomial ℝ) (e : ℕ → E),
      IntervalIntegrable (fun s : ℝ => ∑ k ∈ S, (((p k).eval s : ℝ) : ℂ) • e k) volume l h := by
    intro S p e
    have := IntervalIntegrable.sum S (fun k _ => hpolyint (p k) (e k))
    simpa only [Finset.sum_fn] using this
  have hexQ : ∫ s in l..h, Q s = ∑ i, (weight i : ℂ) • Q (node i) := by
    simp_rw [hQsum]
    rw [intervalIntegral.integral_add, intervalIntegral.integral_finsetSum,
      intervalIntegral.integral_finsetSum]
    · simp_rw [smul_add, Finset.smul_sum]
      rw [Finset.sum_add_distrib, Finset.sum_comm, Finset.sum_comm (s := Finset.univ)]
      congr 1
      · apply Finset.sum_congr rfl
        intro k hk
        exact integral_poly_smul_eq l h node weight hexact _ (hdeg1 k hk) _
      · apply Finset.sum_congr rfl
        intro k hk
        exact integral_poly_smul_eq l h node weight hexact _ (hdeg2 k hk) _
    · intro k _; exact hpolyint _ _
    · intro k _; exact hpolyint _ _
    · exact hsumint _ _ _
    · exact hsumint _ _ _
  have hball : ∀ s ∈ Set.Icc l h, DifferentiableAt ℂ f (s : ℂ) := by
    intro s hs
    obtain ⟨hζ1, hpt, -⟩ := ellipsePt_arccos hlh hs
    have := hf _ (by rw [hζ1]; exact (inv_lt_one_of_one_lt₀ hρ).le) (by rw [hζ1]; exact hρ.le)
    rwa [hpt] at this
  have hfint : IntervalIntegrable (fun s : ℝ => f s) volume l h := by
    apply ContinuousOn.intervalIntegrable
    rw [Set.uIcc_of_le hlh.le]
    intro s hs
    exact ((hball s hs).continuousAt.comp Complex.continuous_ofReal.continuousAt).continuousWithinAt
  have hQint : IntervalIntegrable Q volume l h := by
    have : Q = fun s => (∑ k ∈ Finset.range N,
        (((affPoly (Polynomial.Chebyshev.T ℝ k) c₀ r).eval s : ℝ) : ℂ) • outerCoeff g ρ k) +
        ∑ k ∈ Finset.range (N - 1),
          (((affPoly (Polynomial.Chebyshev.T ℝ ((k + 1 : ℕ) : ℤ)) c₀ r).eval s : ℝ) : ℂ) •
            innerCoeff g ρ k := funext hQsum
    rw [this]
    exact (hsumint _ _ _).add (hsumint _ _ _)
  have hdiff : (∫ s in l..h, f s) - ∑ i, (weight i : ℂ) • f (node i) =
      (∫ s in l..h, (f s - Q s)) + ∑ i, (weight i : ℂ) • (Q (node i) - f (node i)) := by
    rw [intervalIntegral.integral_sub hfint hQint, hexQ]
    simp only [smul_sub, Finset.sum_sub_distrib]
    abel
  rw [hdiff]
  have hI : ‖∫ s in l..h, (f s - Q s)‖ ≤ ε * (h - l) := by
    have := intervalIntegral.norm_integral_le_of_norm_le_const (a := l) (b := h) (C := ε)
      (f := fun s : ℝ => f s - Q s) (fun s hs => by
        have hs' : s ∈ Set.Icc l h := by
          rw [← Set.uIcc_of_le hlh.le]; exact Set.uIoc_subset_uIcc hs
        exact happrox s hs')
    rwa [abs_of_nonneg (sub_nonneg.mpr hlh.le)] at this
  have hS : ‖∑ i, (weight i : ℂ) • (Q (node i) - f (node i))‖ ≤ ε * (h - l) := by
    calc ‖∑ i, (weight i : ℂ) • (Q (node i) - f (node i))‖
        ≤ ∑ i, ‖(weight i : ℂ) • (Q (node i) - f (node i))‖ := norm_sum_le _ _
      _ ≤ ∑ i, weight i * ε := by
          apply Finset.sum_le_sum
          intro i _
          rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (hweight i),
            norm_sub_rev]
          exact mul_le_mul_of_nonneg_left (happrox _ (hnode i)) (hweight i)
      _ = ε * (h - l) := by rw [← Finset.sum_mul, hsum, mul_comm]
  calc _ ≤ ‖∫ s in l..h, (f s - Q s)‖ + ‖∑ i, (weight i : ℂ) • (Q (node i) - f (node i))‖ :=
        norm_add_le _ _
    _ ≤ ε * (h - l) + ε * (h - l) := add_le_add hI hS
    _ = 2 * (h - l) * ε := by ring

end

end Grothe.UpperQuad.Remainder
