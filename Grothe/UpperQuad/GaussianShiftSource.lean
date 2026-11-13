import Grothe.UpperQuad.PhasePolynomialComplex
import Grothe.UpperQuad.GaussianGrowth
import Grothe.Haagerup.Phase
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Gaussian source for simultaneous imaginary translation

The phase is continued in its first coordinate and in the real coordinate of the
auxiliary Gaussian variable. Its uniform complex bound controls the source in Gaussian
`L²`. The oscillatory exponential has norm one. The `L²` representative is defined for
every natural power, independently of the free envelope parameter.

Agent-ID: codex-2f3d. Refs #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

open MeasureTheory Complex Grothe.LowerAnalytic

noncomputable section

/-- The source left after moving the Gaussian contour in its real coordinate. -/
def source (j : ℕ) (r : ℂ) (a b : ℝ) (w : ℂ) : ℂ :=
  Haag.ph ((a : ℂ) + w) *
    (I * PhasePolynomialComplex.phaseComplex w.im r ((w.re : ℂ) - I * (b : ℂ))) ^ j *
    Complex.exp (2 * I * (b : ℂ) * (w.re : ℂ))

/-- The squared complex-phase envelope, uniform in the integration variable. -/
def phaseEnvelopeSq (j : ℕ) (τ : ℝ) (r : ℂ) (b : ℝ) : ℝ :=
  (τ ^ (35 * j))⁻¹ * ((1 - τ) ^ 2)⁻¹ *
    Real.exp (4 * ((j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)) / (1 - τ) *
      (r.im ^ 2 + b ^ 2))

theorem phaseEnvelopeSq_pos (j : ℕ) {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1)
    (r : ℂ) (b : ℝ) : 0 < phaseEnvelopeSq j τ r b := by
  unfold phaseEnvelopeSq
  positivity

/-- Continuity also holds when the real fixed-slice parameter varies. -/
theorem continuous_phaseComplex :
    Continuous (fun p : ℝ × ℂ × ℂ ↦ PhasePolynomialComplex.phaseComplex p.1 p.2.1 p.2.2) := by
  have hsum (l : List ((ℕ × ℕ × ℕ) × ℚ)) : Continuous (fun p : ℝ × ℂ × ℂ ↦
      (l.map fun t ↦ (t.2 : ℂ) * p.2.1 ^ (2 * t.1.1) *
        (p.2.2 ^ 2 + (p.1 : ℂ) ^ 2) ^ t.1.2.1 * (p.2.1 * p.2.2) ^ t.1.2.2).sum) := by
    induction l with
    | nil =>
      simpa only [List.map_nil, List.sum_nil] using
        (continuous_const : Continuous (fun _ : ℝ × ℂ × ℂ ↦ (0 : ℂ)))
    | cons t l ih =>
      simp only [List.map_cons, List.sum_cons]
      exact Continuous.add (by fun_prop) ih
  simp only [PhasePolynomialComplex.phaseComplex,
    PhasePolynomialComplex.eval_phasePolynomial_pair]
  have hs := hsum Grothe.UpperChaos.phaseTerms
  fun_prop

/-- The continued phase on the shifted integration slice is continuous. -/
theorem continuous_shiftedPhase (r : ℂ) (b : ℝ) :
    Continuous (fun w : ℂ ↦
      PhasePolynomialComplex.phaseComplex w.im r ((w.re : ℂ) - I * (b : ℂ))) := by
  have hmap : Continuous (fun w : ℂ ↦ (w.im, r, (w.re : ℂ) - I * (b : ℂ))) := by
    fun_prop
  have hslice := continuous_phaseComplex.comp hmap
  exact hslice

theorem measurable_source (j : ℕ) (r : ℂ) (a b : ℝ) :
    Measurable (source j r a b) := by
  have hp := Haag.measurable_ph.comp
    (measurable_const.add measurable_id : Measurable (fun w : ℂ ↦ (a : ℂ) + w))
  have hφ := (continuous_shiftedPhase r b).measurable
  unfold source
  exact (hp.mul ((measurable_const.mul hφ).pow_const j)).mul (by fun_prop)

/-- The contour oscillation has unit norm because its exponent is purely imaginary. -/
theorem norm_oscillation (b x : ℝ) :
    ‖Complex.exp (2 * I * (b : ℂ) * (x : ℂ))‖ = 1 := by
  rw [Complex.norm_exp]
  simp [Complex.mul_re, Complex.mul_im]

/-- Each source value obeys the phase envelope, uniformly in the Gaussian variable. -/
theorem norm_source_sq_le (j : ℕ) (hj : 0 < j) {τ : ℝ}
    (hτ0 : 0 < τ) (hτ1 : τ < 1) (r : ℂ) (a b : ℝ) (w : ℂ) :
    ‖source j r a b w‖ ^ 2 ≤ phaseEnvelopeSq j τ r b := by
  have hph : ‖Haag.ph ((a : ℂ) + w)‖ ^ 2 ≤ 1 :=
    pow_le_one₀ (norm_nonneg _) (Haag.norm_ph_le _)
  calc
    ‖source j r a b w‖ ^ 2 = ‖Haag.ph ((a : ℂ) + w)‖ ^ 2 *
        ‖PhasePolynomialComplex.phaseComplex w.im r ((w.re : ℂ) - I * (b : ℂ)) ^ j‖ ^ 2 := by
      simp only [source, norm_mul, norm_pow, Complex.norm_I, one_pow, one_mul,
        norm_oscillation, mul_one, mul_pow]
    _ ≤ ‖PhasePolynomialComplex.phaseComplex w.im r
        ((w.re : ℂ) - I * (b : ℂ)) ^ j‖ ^ 2 := by
      simpa only [one_mul] using mul_le_mul_of_nonneg_right hph
        (sq_nonneg ‖PhasePolynomialComplex.phaseComplex w.im r
          ((w.re : ℂ) - I * (b : ℂ)) ^ j‖)
    _ ≤ phaseEnvelopeSq j τ r b := by
      simpa only [phaseEnvelopeSq, Complex.sub_im, Complex.ofReal_im, Complex.mul_im,
        Complex.I_re, Complex.I_im, Complex.ofReal_re, zero_mul, one_mul, zero_add,
        zero_sub, neg_sq] using
        PhasePolynomialComplex.norm_phaseComplex_pow_sq_le j hj w.im hτ0 hτ1 r
          ((w.re : ℂ) - I * (b : ℂ))

theorem norm_source_zero_le (r : ℂ) (a b : ℝ) (w : ℂ) :
    ‖source 0 r a b w‖ ≤ 1 := by
  simpa only [source, pow_zero, mul_one, norm_mul, norm_oscillation] using
    Haag.norm_ph_le ((a : ℂ) + w)

/-- Integrability uses one fixed envelope; the resulting representative has no
envelope parameter. -/
theorem source_memLp (j : ℕ) (r : ℂ) (a b : ℝ) : MemLp (source j r a b) 2 gaussC := by
  by_cases hj : j = 0
  · subst j
    exact MemLp.of_bound (measurable_source 0 r a b).aestronglyMeasurable 1
      (Filter.Eventually.of_forall (norm_source_zero_le r a b))
  · have hjpos : 0 < j := Nat.pos_of_ne_zero hj
    exact MemLp.of_bound (measurable_source j r a b).aestronglyMeasurable
      (Real.sqrt (phaseEnvelopeSq j (1 / 2) r b)) (Filter.Eventually.of_forall fun w ↦
        Real.le_sqrt_of_sq_le (norm_source_sq_le j hjpos (by norm_num) (by norm_num) r a b w))

/-- The actual shifted source as a Gaussian `L²` vector, for every natural power. -/
def sourceLp (j : ℕ) (r : ℂ) (a b : ℝ) : Lp ℂ 2 gaussC :=
  (source_memLp j r a b).toLp (source j r a b)

theorem coeFn_sourceLp (j : ℕ) (r : ℂ) (a b : ℝ) :
    (sourceLp j r a b : ℂ → ℂ) =ᵐ[gaussC] source j r a b :=
  (source_memLp j r a b).coeFn_toLp

/-- The normalized Gaussian has mass one, so the pointwise squared envelope is also
the squared `L²` bound. The free parameter may be chosen after constructing the source. -/
theorem norm_sourceLp_sq_le (j : ℕ) (hj : 0 < j) {τ : ℝ}
    (hτ0 : 0 < τ) (hτ1 : τ < 1) (r : ℂ) (a b : ℝ) :
    ‖sourceLp j r a b‖ ^ 2 ≤ phaseEnvelopeSq j τ r b := by
  rw [sourceLp, GaussianGrowth.norm_toLp_sq]
  calc
    (∫ w, ‖source j r a b w‖ ^ 2 ∂gaussC) ≤
        ∫ _ : ℂ, phaseEnvelopeSq j τ r b ∂gaussC :=
      integral_mono
        ((memLp_two_iff_integrable_sq_norm
          (source_memLp j r a b).aestronglyMeasurable).mp (source_memLp j r a b))
        (integrable_const _) (norm_source_sq_le j hj hτ0 hτ1 r a b)
    _ = phaseEnvelopeSq j τ r b := by simp

end

end Grothe.UpperQuad.GaussianShift

open Lean Elab Command
run_cmd do
  let inherited ← Lean.collectAxioms
    ``Grothe.UpperQuad.PhasePolynomialComplex.norm_phaseComplex_pow_sq_le
  for target in #[``Grothe.UpperQuad.GaussianShift.norm_source_sq_le,
      ``Grothe.UpperQuad.GaussianShift.source_memLp,
      ``Grothe.UpperQuad.GaussianShift.norm_sourceLp_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency ||
          inherited.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
