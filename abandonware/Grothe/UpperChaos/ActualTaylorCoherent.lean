import Grothe.UpperChaos.IndependentSourcePolynomial
import Grothe.UpperChaos.RationalPhaseImaginary
import Grothe.UpperChaos.Mehler

/-!
# The actual Taylor multiplier under independent coherent sources

Agent-ID: codex-2ca4.

The polynomial uses the production `phaseTerms` and physical variables
`(z, conjugate z, w, conjugate w)`. Its imaginary factor already contains
the factor `I`. The multiplier is `taylorPhasePower`; no `F0` is included.

The finite evaluator below is proved from the independent-source recurrence,
not supplied as a hypothesis. Both physical coordinates use the normalized
measure `gaussC`, retaining one inverse-rate factor per coordinate.

This identifies an actual coherent transform of the multiplier. The Hermite
coefficient/Fock identity and the historical numerical producer binding remain
separate obligations; no Hilbert--Schmidt cap is asserted here.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualTaylorCoherent

open RationalPhaseInvariant RationalPhaseImaginary
open IndependentSourceMoments IndependentSourcePolynomial

noncomputable section

/-- The actual undamped Taylor multiplier over the rational polynomial ring. -/
def multiplierQ (j : ℕ) : RatPoly4 :=
  (imaginaryFactorQ * phaseInvariantQ phaseTerms) ^ j

/-- The same finite polynomial over complex coefficients. -/
def multiplierPolynomial (j : ℕ) : P4 :=
  MvPolynomial.map (Rat.castHom ℂ) (multiplierQ j)

/-- The total radial rate, including the density of the standard Gaussian. -/
def rate (j : ℕ) : ℝ := 1 + (j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)

theorem rate_pos (j : ℕ) : 0 < rate j := by
  have hε : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by
    norm_num [Grothe.Upper.phaseEpsQ]
  have hj := mul_nonneg (Nat.cast_nonneg j) hε
  dsimp only [rate]
  linarith

/-- The rational imaginary factor already accounts for the Taylor factor I. -/
theorem eval_multiplierPolynomial (j : ℕ) (z w : ℂ) :
    ev4 (z, w) (multiplierPolynomial j) =
      (Complex.I * ((conj z * w).im : ℂ) *
        (Ssum phaseTerms (Complex.normSq z) (Complex.normSq w)
          (conj z * w).re : ℂ)) ^ j := by
  unfold multiplierPolynomial ev4
  rw [← MvPolynomial.eval₂_eq_eval_map]
  change evalQ z w (multiplierQ j) = _
  simp only [multiplierQ, map_pow, map_mul, eval_imaginaryFactorQ,
    eval_phaseInvariantQ]

/-- Pointwise identification of the actual multiplier, with its exact damping.
There is no bound hypothesis and no base-response factor. -/
theorem taylorPhasePower_eq_polynomial (j : ℕ) (z w : ℂ) :
    taylorPhasePower j (z, w) =
      ev4 (z, w) (multiplierPolynomial j) *
        Complex.exp (-((rate j - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ)) *
        Complex.exp (-((rate j - 1 : ℝ) : ℂ) * (Complex.normSq w : ℂ)) := by
  let ε : ℝ := Grothe.Upper.phaseEpsQ
  let B : ℂ := Complex.I * ((conj z * w).im : ℂ) *
    (Ssum phaseTerms (Complex.normSq z) (Complex.normSq w)
      (conj z * w).re : ℂ)
  have hφ : phiT (z, w) = (conj z * w).im *
      Real.exp (-ε * (Complex.normSq z + Complex.normSq w)) *
        Ssum phaseTerms (Complex.normSq z) (Complex.normSq w)
          (conj z * w).re := by
    simp only [phiT, Sphase, Ssum, ε, Complex.normSq_eq_norm_sq]
  have hphase : Complex.I * (phiT (z, w) : ℂ) =
      B * (Real.exp (-ε * (Complex.normSq z + Complex.normSq w)) : ℂ) := by
    rw [hφ]
    dsimp only [B]
    push_cast
    ring
  have he : Real.exp (-ε * (Complex.normSq z + Complex.normSq w)) ^ j =
      Real.exp (-(j : ℝ) * ε * Complex.normSq z) *
        Real.exp (-(j : ℝ) * ε * Complex.normSq w) := by
    rw [← Real.exp_nat_mul, ← Real.exp_add]
    congr 1
    ring
  have heC := congrArg (fun r : ℝ => (r : ℂ)) he
  simp only [Complex.ofReal_pow, Complex.ofReal_mul] at heC
  have hd (t : ℝ) : (Real.exp (-(j : ℝ) * ε * t) : ℂ) =
      Complex.exp (-((rate j - 1 : ℝ) : ℂ) * (t : ℂ)) := by
    rw [Complex.ofReal_exp]
    congr 1
    simp only [rate, add_sub_cancel_left, Complex.ofReal_mul, Complex.ofReal_neg]
    dsimp only [ε]
    ring
  rw [taylorPhasePower, hphase, mul_pow, heC, hd, hd, eval_multiplierPolynomial]
  dsimp only [B]
  ring

/-- Outgoing sources `(x,y)` and incoming sources `(u,v)` in one physical coordinate.
The source coefficients of z and conjugate z are respectively y+u and x+v. -/
def coherentPair (x y u v z : ℂ) : ℂ :=
  Complex.exp (x * conj z + y * z - x * y) *
    Complex.exp (u * z + v * conj z - u * v)

/-- The coherent transform integrand of the actual two-coordinate multiplier. -/
def coherentIntegrand (j : ℕ) (x y u v : ℂ × ℂ) (zw : ℂ × ℂ) : ℂ :=
  taylorPhasePower j zw * coherentPair x.1 y.1 u.1 v.1 zw.1 *
    coherentPair x.2 y.2 u.2 v.2 zw.2

/-- Constant coherent normalization from the two physical coordinates. -/
def sourceNormalization (x y u v : ℂ × ℂ) : ℂ :=
  Complex.exp (-x.1 * y.1 - u.1 * v.1) *
    Complex.exp (-x.2 * y.2 - u.2 * v.2)

private theorem ev4_eq_support (P : P4) (zw : ℂ × ℂ) :
    ev4 zw P = ∑ s ∈ P.support, P.coeff s *
      ((zw.1 ^ s 0 * conj zw.1 ^ s 1) * (zw.2 ^ s 2 * conj zw.2 ^ s 3)) := by
  classical
  have h := congrArg (fun Q : P4 => ev4 zw Q) P.as_sum
  simp only [ev4, map_sum] at h
  change ev4 zw P = ∑ s ∈ P.support, ev4 zw (monomial s (P.coeff s)) at h
  simpa only [ev4_monomial] using h

private theorem damp_mul_coherentPair (r : ℝ) (x y u v z : ℂ) :
    Complex.exp (-((r - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ)) *
        coherentPair x y u v z =
      Complex.exp (-x * y - u * v) *
        Complex.exp (-((r - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ) +
          (y + u) * z + (x + v) * conj z) := by
  simp only [coherentPair, ← Complex.exp_add]
  congr 1
  ring

private def monomialPair (j : ℕ) (x y u v : ℂ × ℂ) (s : Fin 4 →₀ ℕ)
    (zw : ℂ × ℂ) : ℂ :=
  integrand (rate j) (y.1 + u.1) (x.1 + v.1) (s 0) (s 1) zw.1 *
    integrand (rate j) (y.2 + u.2) (x.2 + v.2) (s 2) (s 3) zw.2

private theorem integrable_monomialPair (j : ℕ) (x y u v : ℂ × ℂ)
    (s : Fin 4 →₀ ℕ) : Integrable (monomialPair j x y u v s) mu2 := by
  exact (integrable_integrand (s 0) (s 1) (rate_pos j) _ _).mul_prod
    (integrable_integrand (s 2) (s 3) (rate_pos j) _ _)

private theorem coherentIntegrand_eq_sum (j : ℕ) (x y u v zw : ℂ × ℂ) :
    coherentIntegrand j x y u v zw =
      sourceNormalization x y u v *
        ∑ s ∈ (multiplierPolynomial j).support,
          (multiplierPolynomial j).coeff s * monomialPair j x y u v s zw := by
  classical
  rw [coherentIntegrand, taylorPhasePower_eq_polynomial]
  calc
    _ = ev4 zw (multiplierPolynomial j) *
        (Complex.exp (-((rate j - 1 : ℝ) : ℂ) * (Complex.normSq zw.1 : ℂ)) *
          coherentPair x.1 y.1 u.1 v.1 zw.1) *
        (Complex.exp (-((rate j - 1 : ℝ) : ℂ) * (Complex.normSq zw.2 : ℂ)) *
          coherentPair x.2 y.2 u.2 v.2 zw.2) := by ring
    _ = _ := by
      rw [damp_mul_coherentPair, damp_mul_coherentPair, ev4_eq_support]
      simp only [Finset.sum_mul, Finset.mul_sum, sourceNormalization,
        monomialPair, integrand]
      apply Finset.sum_congr rfl
      intro s hs
      ring

/-- Absolute integrability of the actual coherent multiplier for all eight
independent complex sources, with no additional assumptions. -/
theorem integrable_coherentIntegrand (j : ℕ) (x y u v : ℂ × ℂ) :
    Integrable (coherentIntegrand j x y u v) mu2 := by
  classical
  have h := (integrable_finsetSum (multiplierPolynomial j).support
    (fun s _ => (integrable_monomialPair j x y u v s).const_mul
      ((multiplierPolynomial j).coeff s))).const_mul (sourceNormalization x y u v)
  exact h.congr (Filter.Eventually.of_forall fun zw =>
    (coherentIntegrand_eq_sum j x y u v zw).symm)

/-- The actual coherent transform is a finite support sum of the independently
proved one-coordinate moment evaluators. Each momentValue retains its rate inverse. -/
theorem integral_coherentIntegrand_eq_moments (j : ℕ) (x y u v : ℂ × ℂ) :
    (∫ zw, coherentIntegrand j x y u v zw ∂mu2) =
      sourceNormalization x y u v *
        ∑ s ∈ (multiplierPolynomial j).support,
          (multiplierPolynomial j).coeff s *
            (momentValue (rate j) (y.1 + u.1) (x.1 + v.1) (s 0) (s 1) *
              momentValue (rate j) (y.2 + u.2) (x.2 + v.2) (s 2) (s 3)) := by
  classical
  simp_rw [coherentIntegrand_eq_sum]
  rw [integral_const_mul, integral_finsetSum _ (fun s _ =>
    (integrable_monomialPair j x y u v s).const_mul ((multiplierPolynomial j).coeff s))]
  congr 1
  apply Finset.sum_congr rfl
  intro s hs
  rw [integral_const_mul]
  congr 1
  unfold monomialPair
  rw [integral_prod_mul, integral_eq_momentValue (s 0) (s 1) (rate_pos j),
    integral_eq_momentValue (s 2) (s 3) (rate_pos j)]

/-- One-coordinate Gaussian coherent factor, in the producer's source pairing.
With ν = 1/r and a = 1-ν this is ν exp(-a(xy+uv)+ν(xu+yv)). -/
def gaussianCoherent (r : ℝ) (x y u v : ℂ) : ℂ :=
  (r : ℂ)⁻¹ * Complex.exp
    (-(1 - (r : ℂ)⁻¹) * (x * y + u * v) + (r : ℂ)⁻¹ * (x * u + y * v))

private theorem normalized_momentValue (r : ℝ) (x y u v : ℂ) (p q : ℕ) :
    Complex.exp (-x * y - u * v) * momentValue r (y + u) (x + v) p q =
      gaussianCoherent r x y u v *
        (momentPolynomial r (x + v) p q).eval (y + u) := by
  have he : -x * y - u * v + (y + u) * (x + v) / (r : ℂ) =
      -(1 - (r : ℂ)⁻¹) * (x * y + u * v) + (r : ℂ)⁻¹ * (x * u + y * v) := by
    simp only [div_eq_mul_inv]
    ring
  unfold momentValue gaussianCoherent
  calc
    _ = (r : ℂ)⁻¹ *
        (Complex.exp (-x * y - u * v) * Complex.exp ((y + u) * (x + v) / (r : ℂ))) *
          (momentPolynomial r (x + v) p q).eval (y + u) := by ring
    _ = _ := by rw [← Complex.exp_add, he]

/-- The finite source polynomial multiplying the two Gaussian coherent factors.
This uses the actual phase polynomial, rather than an assumed transform. -/
def coherentPolynomial (j : ℕ) (x y u v : ℂ × ℂ) : ℂ :=
  ∑ s ∈ (multiplierPolynomial j).support,
    (multiplierPolynomial j).coeff s *
      ((momentPolynomial (rate j) (x.1 + v.1) (s 0) (s 1)).eval (y.1 + u.1) *
        (momentPolynomial (rate j) (x.2 + v.2) (s 2) (s 3)).eval (y.2 + u.2))

/-- Exact coherent-transform equality for the production Taylor multiplier.
The physical order is (z, conjugate z, w, conjugate w). The product of the
two Gaussian factors has normalization (1+j*phaseEpsQ)^(-2). -/
theorem integral_coherentIntegrand (j : ℕ) (x y u v : ℂ × ℂ) :
    (∫ zw, coherentIntegrand j x y u v zw ∂mu2) =
      gaussianCoherent (rate j) x.1 y.1 u.1 v.1 *
        gaussianCoherent (rate j) x.2 y.2 u.2 v.2 * coherentPolynomial j x y u v := by
  classical
  rw [integral_coherentIntegrand_eq_moments]
  simp only [coherentPolynomial, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro s hs
  calc
    _ = (multiplierPolynomial j).coeff s *
        ((Complex.exp (-x.1 * y.1 - u.1 * v.1) *
            momentValue (rate j) (y.1 + u.1) (x.1 + v.1) (s 0) (s 1)) *
          (Complex.exp (-x.2 * y.2 - u.2 * v.2) *
            momentValue (rate j) (y.2 + u.2) (x.2 + v.2) (s 2) (s 3))) := by
      unfold sourceNormalization
      ring
    _ = _ := by rw [normalized_momentValue, normalized_momentValue]; ring

end
end Grothe.UpperChaos.ActualTaylorCoherent
