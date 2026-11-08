import Grothe.UpperQuad.GaussianShiftSource
import Grothe.UpperChaos.HermiteTranslationBessel

/-!
# A coupled bound for the shifted Gaussian coefficient vector

The translated Hermite synthesis estimate controls every finite coefficient vector at once.
Multiplying by the explicit Gaussian prefactor and using the production phase envelope gives
the complex-shift bound without a factor for the number of selected modes.

Agent-ID: codex-2f3d. Refs #334.
-/

namespace Grothe.UpperQuad.GaussianShift

open MeasureTheory Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.UpperChaos.HermiteTranslation Grothe.UpperChaos.HermiteTranslationBessel
open scoped InnerProductSpace ComplexConjugate

noncomputable section

/-- The Gaussian coefficient after translating the real coordinate into the complex plane.
The first inner-product vector uses `+I*b`, so conjugation supplies the shift `-I*b`. -/
def coefficient (j : ℕ) (r : ℂ) (a b : ℝ) (i : ℕ × ℕ) : ℂ :=
  (Real.exp (b ^ 2) : ℂ) *
    ⟪evalL2 (simultaneousShift (Complex.I * (b : ℂ)) (normalizedPolynomial i)),
      sourceLp j r a b⟫_ℂ

/-- With zero imaginary shift, the first vector is the original production Hermite mode. -/
theorem coefficient_zero (j : ℕ) (r : ℂ) (a : ℝ) (i : ℕ × ℕ) :
    coefficient j r a 0 i = ⟪hvec i, sourceLp j r a 0⟫_ℂ := by
  simp [coefficient, evalL2_normalizedPolynomial]

/-- The coefficient is the actual Gaussian integral of the formally translated polynomial. -/
theorem coefficient_eq_integral (j : ℕ) (r : ℂ) (a b : ℝ) (i : ℕ × ℕ) :
    coefficient j r a b i = (Real.exp (b ^ 2) : ℂ) *
      ∫ w, conj (ev w (simultaneousShift (Complex.I * (b : ℂ)) (normalizedPolynomial i))) *
        source j r a b w ∂gaussC := by
  exact congrArg (fun z : ℂ ↦ (Real.exp (b ^ 2) : ℂ) * z)
    (inner_toLp
      (memLp_ev (simultaneousShift (Complex.I * (b : ℂ)) (normalizedPolynomial i)))
      (source_memLp j r a b))

/-- The source at real parameters and zero contour shift uses the production phase. -/
theorem source_real_zero (j : ℕ) (r a : ℝ) (w : ℂ) :
    source j (r : ℂ) a 0 w =
      Haag.ph ((a : ℂ) + w) * (Complex.I * (phiT ((r : ℂ), w) : ℂ)) ^ j := by
  have hw : (w.re : ℂ) + Complex.I * (w.im : ℂ) = w := by
    apply Complex.ext <;> simp
  simp only [source, Complex.ofReal_zero, mul_zero, sub_zero, zero_mul, Complex.exp_zero,
    mul_one, PhasePolynomialComplex.phaseComplex_real, hw]

/-- On the real slice, the vector coefficient is the bare production-phase Gaussian integral. -/
theorem coefficient_real_zero (j : ℕ) (r a : ℝ) (i : ℕ × ℕ) :
    coefficient j (r : ℂ) a 0 i =
      ∫ w, conj (hfun i w) * (Complex.I * (phiT ((r : ℂ), w) : ℂ)) ^ j *
        Haag.ph ((a : ℂ) + w) ∂gaussC := by
  rw [coefficient_zero]
  calc
    _ = ∫ w, conj (hfun i w) * source j (r : ℂ) a 0 w ∂gaussC :=
      inner_toLp (memLp_hfun i) (source_memLp j (r : ℂ) a 0)
    _ = _ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun w ↦ by
        dsimp only
        rw [source_real_zero]
        ring

/-- The squared coefficient-vector bound has no factor for the number of selected modes. -/
theorem sum_coefficient_sq_le (j : ℕ) (hj : 0 < j) {τ : ℝ}
    (hτ0 : 0 < τ) (hτ1 : τ < 1) (r : ℂ) (a b : ℝ)
    (D : ℕ) (S : Finset (ℕ × ℕ)) (hD : ∀ i ∈ S, i.1 + i.2 ≤ D) :
    ∑ i ∈ S, ‖coefficient j r a b i‖ ^ 2 ≤
      Real.exp (2 * b ^ 2 + 2 * |b| * Real.sqrt (2 * D)) * phaseEnvelopeSq j τ r b := by
  have hB := sum_inner_simultaneousShift_sq_le D (Complex.I * (b : ℂ)) S hD
    (sourceLp j r a b)
  simp only [norm_mul, Complex.norm_I, one_mul, Complex.norm_real, Real.norm_eq_abs] at hB
  have hsource := norm_sourceLp_sq_le j hj hτ0 hτ1 r a b
  have hbound :
      ∑ i ∈ S,
        ‖⟪evalL2 (simultaneousShift (Complex.I * (b : ℂ)) (normalizedPolynomial i)),
          sourceLp j r a b⟫_ℂ‖ ^ 2 ≤
        Real.exp (|b| * Real.sqrt (2 * D)) ^ 2 * phaseEnvelopeSq j τ r b :=
    hB.trans (mul_le_mul_of_nonneg_left hsource (sq_nonneg _))
  have hexp : Real.exp (b ^ 2) ^ 2 * Real.exp (|b| * Real.sqrt (2 * D)) ^ 2 =
      Real.exp (2 * b ^ 2 + 2 * |b| * Real.sqrt (2 * D)) := by
    rw [← Real.exp_nat_mul, ← Real.exp_nat_mul, ← Real.exp_add]
    congr 1
    ring
  calc
    _ = Real.exp (b ^ 2) ^ 2 *
        (∑ i ∈ S,
          ‖⟪evalL2 (simultaneousShift (Complex.I * (b : ℂ)) (normalizedPolynomial i)),
            sourceLp j r a b⟫_ℂ‖ ^ 2) := by
      simp only [coefficient, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs,
        abs_of_pos (Real.exp_pos _), Finset.mul_sum]
    _ ≤ Real.exp (b ^ 2) ^ 2 *
        (Real.exp (|b| * Real.sqrt (2 * D)) ^ 2 * phaseEnvelopeSq j τ r b) :=
      mul_le_mul_of_nonneg_left hbound (sq_nonneg _)
    _ = _ := by rw [← mul_assoc, hexp]

end

end Grothe.UpperQuad.GaussianShift

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound,
    `Grothe.UpperChaos.phi_cover_check_0._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_1._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_2._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_3._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_4._native.native_decide.ax_1_1,
    `Grothe.UpperChaos.phi_cover_check_5._native.native_decide.ax_1_1]
  for target in #[``Grothe.UpperQuad.GaussianShift.coefficient_zero,
      ``Grothe.UpperQuad.GaussianShift.coefficient_eq_integral,
      ``Grothe.UpperQuad.GaussianShift.coefficient_real_zero,
      ``Grothe.UpperQuad.GaussianShift.sum_coefficient_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
