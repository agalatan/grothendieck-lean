import Mathlib

/-!
# Two conditioned charts for a coupled Gaussian phase

The original chart is safe when `4*R*c² ≤ s²`. Otherwise the centered
chart is invertible and can be chosen with bounded noncentrality. The cover
does not require isolating the zeros of the real profile `c`.

The affine polar integral below keeps the exact Gaussian density. It is an
identity for the actual shared coordinates, not a Gaussian comparison. To
express its left side with `LowerAnalytic.gaussC`, use the existing
`LowerAnalytic.integral_gaussC_eq_volume` for a measurable integrand.
No numerical integration enclosure or improved endpoint is asserted here.
-/

namespace Grothe.Upper.PhaseChart

open MeasureTheory Set

noncomputable section

set_option maxHeartbeats 1000000

/-- The tests overlap when `A` is at least `4*R`. At a zero of `c`, the
ordinary chart is always available. -/
theorem conditioned_cover (u c R A : ℝ) (hu : 0 ≤ u) (hRA : 4*R ≤ A) :
    4*R*c^2 ≤ u ∨ (c ≠ 0 ∧ u < A*c^2) := by
  by_cases h : 4*R*c^2 ≤ u
  · exact Or.inl h
  · right
    constructor
    · intro hc
      apply h
      simpa [hc] using hu
    · have hm := mul_le_mul_of_nonneg_right hRA (sq_nonneg c)
      exact (lt_of_not_ge h).trans_le hm

/-- The quadratic chart gate supplies a uniform lower bound for the actual
phase argument on the full second-coordinate disk. -/
theorem ordinary_gate (s c R : ℝ) (hs : 0 ≤ s) (w : ℂ)
    (hw : ‖w‖^2 ≤ R) (hgate : 4*R*c^2 ≤ s^2) :
    s/2 ≤ ‖(s : ℂ)+(c : ℂ)*w‖ := by
  have hm := mul_le_mul_of_nonneg_left hw (sq_nonneg c)
  have hsq : (|c| * ‖w‖)^2 ≤ (s/2)^2 := by
    rw [mul_pow, sq_abs]
    nlinarith
  have hsmall : |c| * ‖w‖ ≤ s/2 :=
    (sq_le_sq₀ (mul_nonneg (abs_nonneg c) (norm_nonneg w)) (by positivity)).mp hsq
  have ht := norm_sub_le ((s : ℂ)+(c : ℂ)*w) ((c : ℂ)*w)
  have he : ((s : ℂ)+(c : ℂ)*w)-((c : ℂ)*w) = (s : ℂ) := by ring
  rw [he, Complex.norm_of_nonneg hs, norm_mul, Complex.norm_real, Real.norm_eq_abs] at ht
  linarith

/-- The old second coordinate in terms of the phase argument's radius and
unit direction. The real scale may have either sign. -/
def centered (s c r : ℝ) (ζ : ℂ) : ℂ := ((r : ℂ)*ζ-(s : ℂ))/(c : ℂ)

theorem centered_reconstruction (s c r : ℝ) (ζ : ℂ) (hc : c ≠ 0) :
    (s : ℂ)+(c : ℂ)*centered s c r ζ = (r : ℂ)*ζ := by
  have hc' : (c : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hc
  unfold centered
  field_simp [hc']
  ring

/-- Normalizing the phase argument in centered coordinates gives exactly the
unit direction. The excluded radius zero is a polar measure-zero boundary. -/
theorem centered_phase (s c r : ℝ) (ζ : ℂ) (hc : c ≠ 0) (hr : 0 < r)
    (hζ : ‖ζ‖ = 1) :
    ((s : ℂ)+(c : ℂ)*centered s c r ζ) /
      (‖(s : ℂ)+(c : ℂ)*centered s c r ζ‖ : ℂ) = ζ := by
  rw [centered_reconstruction s c r ζ hc, norm_mul,
    Complex.norm_of_nonneg hr.le, hζ, mul_one]
  have hr' : (r : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hr.ne'
  field_simp

/-- The exponent of the transformed Gaussian density, including its angular
dependence. This is valid for a real scale of either sign. -/
theorem centered_norm_sq (s c r : ℝ) (ζ : ℂ) (hζ : ‖ζ‖ = 1) :
    ‖centered s c r ζ‖^2 = (r^2+s^2-2*r*s*ζ.re)/c^2 := by
  have hz : ζ.re^2+ζ.im^2 = 1 := by
    calc
      _ = Complex.normSq ζ := by rw [Complex.normSq_apply]; ring
      _ = 1 := by rw [Complex.normSq_eq_norm_sq, hζ]; norm_num
  have hn : ‖(r : ℂ)*ζ-(s : ℂ)‖^2 = r^2+s^2-2*r*s*ζ.re := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    simp only [Complex.sub_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, Complex.sub_im, Complex.mul_im, zero_mul,
      sub_zero, add_zero]
    calc
      _ = r^2*(ζ.re^2+ζ.im^2)+s^2-2*r*s*ζ.re := by ring
      _ = _ := by rw [hz]; ring
  rw [centered, norm_div, div_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs, hn]

theorem centered_noncentrality (s c A : ℝ) (hc : c ≠ 0)
    (h : s^2 ≤ A*c^2) : (s/c)^2 ≤ A := by
  rw [div_pow]
  exact (div_le_iff₀ (sq_pos_of_ne_zero hc)).mpr h

/-- A directed bound on each regularized phase field: no division by the
unregularized phase modulus occurs. -/
theorem radial_regularizer_bound (r k : ℝ) (hk : 0 < k) :
    r/(r^2+k^2) ≤ 1/(2*k) := by
  have hd : 0 < r^2+k^2 := by positivity
  apply (div_le_div_iff₀ hd (by positivity : 0 < 2*k)).mpr
  nlinarith [sq_nonneg (r-k)]

/-- Translation and real dilation, with the dimension-two Jacobian. -/
theorem integral_affine (F : ℂ → ℝ) (s c : ℝ) :
    (∫ z : ℂ, F ((z-(s : ℂ))/(c : ℂ))) = c^2*(∫ w : ℂ, F w) := by
  calc
    _ = ∫ z : ℂ, F (z/(c : ℂ)) :=
      integral_sub_right_eq_self (fun z : ℂ => F (z/(c : ℂ))) (s : ℂ)
    _ = c^2*(∫ w : ℂ, F w) := by
      have h := Measure.integral_comp_inv_smul (μ := (volume : Measure ℂ)) F c
      simpa [Complex.finrank_real_complex, Complex.real_smul, div_eq_mul_inv,
        abs_of_nonneg (sq_nonneg c), smul_eq_mul, mul_comm] using h

/-- The affine polar chart includes its exact Jacobian and all shared
coordinates. It is the integral identity used by the centered cubature. -/
theorem integral_centered (F : ℂ → ℝ) (s c : ℝ) (hc : c ≠ 0) :
    (∫ w : ℂ, F w) = ∫ p in polarCoord.target,
      (p.1/c^2)*F ((Complex.polarCoord.symm p-(s : ℂ))/(c : ℂ)) := by
  have ha := integral_affine F s c
  have hp := Complex.integral_comp_polarCoord_symm
    (fun z : ℂ => F ((z-(s : ℂ))/(c : ℂ)))
  simp only [smul_eq_mul] at hp
  calc
    _ = (c^2)⁻¹*(∫ z : ℂ, F ((z-(s : ℂ))/(c : ℂ))) := by
      rw [ha, ← mul_assoc, inv_mul_cancel₀ (pow_ne_zero 2 hc), one_mul]
    _ = (c^2)⁻¹*(∫ p in polarCoord.target,
        p.1*F ((Complex.polarCoord.symm p-(s : ℂ))/(c : ℂ))) := by rw [hp]
    _ = _ := by
      rw [← integral_const_mul]
      congr 1
      funext p
      ring

/-- The exact standard complex Gaussian weight in centered coordinates.
No Gaussian independence or comparison hypothesis is added. -/
theorem gaussian_weight_centered (F : ℂ → ℝ) (s c : ℝ) (hc : c ≠ 0) :
    (∫ w : ℂ, (Real.pi⁻¹*Real.exp (-Complex.normSq w))*F w) =
      ∫ p in polarCoord.target,
        (p.1/(Real.pi*c^2))*Real.exp
          (-Complex.normSq ((Complex.polarCoord.symm p-(s : ℂ))/(c : ℂ))) *
          F ((Complex.polarCoord.symm p-(s : ℂ))/(c : ℂ)) := by
  rw [integral_centered (fun w : ℂ =>
    (Real.pi⁻¹*Real.exp (-Complex.normSq w))*F w) s c hc]
  congr 1
  funext p
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

/-- A Bernstein range enclosure removes the dependency loss of interval
Horner evaluation. The coefficients may be arbitrary real numbers. -/
theorem bernstein_range (n : ℕ) (b : Fin (n+1) → ℝ) (t : Set.Icc (0 : ℝ) 1)
    (L U : ℝ) (hL : ∀ i, L ≤ b i) (hU : ∀ i, b i ≤ U) :
    L ≤ ∑ i, b i*bernstein n i t ∧ ∑ i, b i*bernstein n i t ≤ U := by
  constructor
  · calc
      L = ∑ i : Fin (n+1), L*bernstein n i t := by
        rw [← Finset.mul_sum, bernstein.probability, mul_one]
      _ ≤ _ := Finset.sum_le_sum fun i _ =>
        mul_le_mul_of_nonneg_right (hL i) bernstein_nonneg
  · calc
      _ ≤ ∑ i : Fin (n+1), U*bernstein n i t :=
        Finset.sum_le_sum fun i _ => mul_le_mul_of_nonneg_right (hU i) bernstein_nonneg
      _ = U := by rw [← Finset.mul_sum, bernstein.probability, mul_one]

/-- Cutting a disk-valued response to a measurable set costs at most the
probability of the omitted set in squared `L²` distance. Integrability is
included explicitly, so the conclusion does not rely on the zero convention
for an undefined Bochner integral. -/
theorem cutoff_squared_error {α : Type*} [MeasurableSpace α]
    (μ : Measure α) [IsFiniteMeasure μ] (S : Set α) (hS : MeasurableSet S)
    (F : α → ℂ) (hF : Measurable F) (hdisk : ∀ x, ‖F x‖ ≤ 1) :
    Integrable (fun x => ‖F x-S.indicator F x‖^2) μ ∧
      (∫ x, ‖F x-S.indicator F x‖^2 ∂μ) ≤ μ.real Sᶜ := by
  have hpoint : ∀ x, ‖F x-S.indicator F x‖^2 ≤
      Sᶜ.indicator (fun _ => (1 : ℝ)) x := by
    intro x
    by_cases hx : x ∈ S
    · simp [hx]
    · simp only [Set.indicator_of_notMem hx, sub_zero,
        Set.indicator_of_mem (Set.mem_compl hx)]
      nlinarith [hdisk x, norm_nonneg (F x)]
  have hi : Integrable (Sᶜ.indicator (fun _ : α => (1 : ℝ))) μ :=
    (integrable_const 1).indicator hS.compl
  have hm : Measurable (fun x => ‖F x-S.indicator F x‖^2) :=
    (hF.sub (hF.indicator hS)).norm.pow_const 2
  have hf : Integrable (fun x => ‖F x-S.indicator F x‖^2) μ :=
    hi.mono' hm.aestronglyMeasurable (Filter.Eventually.of_forall fun x => by
      rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg (‖F x-S.indicator F x‖))]
      exact hpoint x)
  exact ⟨hf, (integral_mono hf hi hpoint).trans_eq (integral_indicator_one hS.compl)⟩

/-- A symmetry-invariant cutoff preserves both the disk bound and the
equivariance of the actual response. This applies in particular to charge-one
rounding and a radial chart union. -/
theorem cutoff_admissible {α : Type*} (S : Set α) (F : α → ℂ)
    (g : α → α) (ζ : ℂ) (hdisk : ∀ x, ‖F x‖ ≤ 1)
    (hS : ∀ x, g x ∈ S ↔ x ∈ S) (hF : ∀ x, F (g x) = ζ*F x) :
    (∀ x, ‖S.indicator F x‖ ≤ 1) ∧
      ∀ x, S.indicator F (g x) = ζ*S.indicator F x := by
  constructor
  · intro x
    by_cases hx : x ∈ S
    · simpa [hx] using hdisk x
    · simp [hx]
  · intro x
    by_cases hx : x ∈ S
    · simpa [hx, (hS x).mpr hx] using hF x
    · simp [hx, (hS x).not.mpr hx]

/-- A rational phase update. For real input its denominator is the conjugate
of its numerator, which never vanishes. -/
def cayleyPhase (t : ℝ) : ℂ :=
  (1+Complex.I*(t : ℂ)/2)/star (1+Complex.I*(t : ℂ)/2)

/-- The rational update is exactly unit modulus for every real phase field;
no smallness or uniform bound on that field is required. -/
theorem cayley_phase_unit (t : ℝ) : ‖cayleyPhase t‖ = 1 := by
  have hn : (1+Complex.I*(t : ℂ)/2 : ℂ) ≠ 0 := by
    intro h
    have hr := congrArg Complex.re h
    norm_num at hr
  simp only [cayleyPhase, norm_div, norm_star]
  exact div_self (norm_ne_zero_iff.mpr hn)

/-- A cancellation-free formula for the actual response increment. -/
theorem cayley_phase_increment (t : ℝ) :
    cayleyPhase t-1 = Complex.I*(t : ℂ)/star (1+Complex.I*(t : ℂ)/2) := by
  have hn : (1+Complex.I*(t : ℂ)/2 : ℂ) ≠ 0 := by
    intro h
    have hr := congrArg Complex.re h
    norm_num at hr
  have he : (1+Complex.I*(t : ℂ)/2)-star (1+Complex.I*(t : ℂ)/2) =
      Complex.I*(t : ℂ) := by
    apply Complex.ext <;> simp
    ring
  unfold cayleyPhase
  rw [div_sub_one (star_ne_zero.mpr hn), he]

/-- The exact polynomial recurrence behind the circular-profile reduction.
The components may be complex: this is also the identity for holomorphic
continuations, not an instruction to conjugate complex quadrature arguments. -/
theorem circular_profile_step (x y a b R J : ℂ) (h : x^2+y^2 = 1) :
    ((a*x+b)+Complex.I*a*y)*(R+Complex.I*y*J) =
      ((a*x+b)*R-a*(1-x^2)*J)+
        Complex.I*y*(a*R+(a*x+b)*J) := by
  have hy : y^2 = 1-x^2 := by linear_combination h
  calc
    _ = (a*x+b)*R+Complex.I*y*(a*R+(a*x+b)*J)+
        Complex.I^2*a*y^2*J := by ring
    _ = _ := by rw [Complex.I_sq, hy]; ring

end
end Grothe.Upper.PhaseChart
