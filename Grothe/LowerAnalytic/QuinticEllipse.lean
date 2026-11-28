import Grothe.LowerAnalytic.QuinticSmallAmplitude

/-!
# The elliptic cubic lift in the degree-five scalar payoff

For every direction and accuracy, the finite-dimensional lift requests an orthogonal pair
of genuine charge-one cubics. Their linear combination has a prescribed lower bound on its
first absolute moment. A dimension-free cubic radius then bounds the physical ellipse.
The lift realizations, the sharper radius, and the Gram-row price are explicit hypotheses.
The scalar cutoff 0.30629 uses only the sharper radius. The full and remote ellipses
price the visible dependence of the cubic in the same phase pair.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- A dimension-free homogeneous first-moment bound for the actual Gaussian cubic chaos. -/
def CubicFirstMomentRadius (r : ℝ) : Prop :=
  ∀ (d : ℕ) (q : L2G d), q ∈ H21 d → ∫ x, ‖q x‖ ∂(stdGaussian (d + d)) ≤ r * ‖q‖

theorem cubicFirstMomentRadius_93 : CubicFirstMomentRadius (93 / 100) :=
  fun d _ hq => integral_norm_le_93_mul_norm_of_mem_H21 d hq

/-- The support test on two orthogonal genuine cubics in a finite Gaussian extension.
Their dimensions may vary with the direction and the error tolerance. The two parameters
are the visible pairing and the L² norm of the unscaled cubic. -/
def HasCubicSupportLift (x a : ℝ) : Prop :=
  ∀ ℓ : ℝ, 0 ≤ ℓ → ∀ δ : ℝ, 0 < δ →
    ∃ (d : ℕ) (U V : L2G d), U ∈ H21 d ∧ V ∈ H21 d ∧
      ‖U‖ = a ∧ ‖V‖ = 1 ∧ inner ℂ V U = 0 ∧
      ℓ * x + a ^ 2 - δ ≤ ∫ w, ‖(((ℓ : ℂ) • V + U : L2G d) w)‖ ∂(stdGaussian (d + d))

/-- For the full cubic, the paper's centred quadratic carrier multiplied by the visible
linear form gives the unit test cubic. Its visible pairing is reduced by the factor `c`. -/
abbrev HasEllipticCubicLift (n : ℕ) (c : ℝ) (f g : L2G n) : Prop :=
  HasCubicSupportLift (c * tOf n f g) ‖QkOf n f g‖

/-- A finite-dimensional lift and a homogeneous cubic radius give each directional constraint. -/
theorem cubic_support_of_lift {x a r : ℝ} (hlift : HasCubicSupportLift x a)
    (hr : CubicFirstMomentRadius r) (ℓ : ℝ) (hℓ : 0 ≤ ℓ) :
    ℓ * x + a ^ 2 ≤ r * √(ℓ ^ 2 + a ^ 2) := by
  apply le_of_forall_sub_le
  intro δ hδ
  obtain ⟨d, U, V, hU, hV, hUn, hVn, horth, htest⟩ := hlift ℓ hℓ δ hδ
  have hort : inner ℂ ((ℓ : ℂ) • V) U = 0 := by rw [inner_smul_left, horth, mul_zero]
  have hnorm : ‖(ℓ : ℂ) • V + U‖ ^ 2 = ℓ ^ 2 + a ^ 2 := by
    simp only [pow_two]
    rw [norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero _ _ hort, norm_smul, hUn, hVn,
      Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hℓ, mul_one]
  have hn : ‖(ℓ : ℂ) • V + U‖ = √(ℓ ^ 2 + a ^ 2) := by
    rw [← hnorm, Real.sqrt_sq (norm_nonneg _)]
  exact htest.trans ((hr d _ ((H21 d).add_mem ((H21 d).smul_mem _ hV) hU)).trans_eq
    (congrArg (r * ·) hn))

/-- Testing in direction `ℓ = x` gives the closed ball, including the zero-energy case. -/
theorem cubic_support_ball {x a r : ℝ} (hx : 0 ≤ x) (hr₀ : 0 ≤ r)
    (hlift : HasCubicSupportLift x a) (hr : CubicFirstMomentRadius r) :
    a ^ 2 + x ^ 2 ≤ r ^ 2 := by
  let D := x ^ 2 + a ^ 2
  have hD : 0 ≤ D := add_nonneg (sq_nonneg _) (sq_nonneg _)
  have hs : D ≤ r * √D := by simpa only [D, ← sq] using cubic_support_of_lift hlift hr x hx
  have hroot : √D ≤ r := by
    by_contra! h
    have hh := mul_pos (sub_pos.mpr h) (hr₀.trans_lt h)
    nlinarith only [hs, hh, Real.sq_sqrt hD]
  have hsq := pow_le_pow_left₀ (Real.sqrt_nonneg _) hroot 2
  rw [Real.sq_sqrt hD] at hsq
  simpa only [D, add_comm] using hsq

/-- The total projected energy of the physical half-difference obeys the elliptic bound. -/
theorem cubic_energy_ellipse_of_lift {n : ℕ} {c r : ℝ} {f g : L2G n} (hc : 0 ≤ c) (hr₀ : 0 ≤ r)
    (hlift : HasEllipticCubicLift n c f g) (hr : CubicFirstMomentRadius r) :
    ‖QkOf n f g‖ ^ 2 + (c * tOf n f g) ^ 2 ≤ r ^ 2 :=
  cubic_support_ball (mul_nonneg hc (show 0 ≤ tOf n f g from norm_nonneg _)) hr₀ hlift hr

/-- Keeping the negative full mass of the difference in the physical projection envelope,
and applying the mass law before the ellipse, gives its scalar payoff for any ellipse. -/
theorem quinticPayoff_le_of_cubic_energy_ellipse {n : ℕ} (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (c r : ℝ) (hE : ‖QkOf n f g‖ ^ 2 + (c * tOf n f g) ^ 2 ≤ r ^ 2) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤
      779 / 10000 * (1 + (massS : ℝ) / (massC : ℝ)) +
      (39 / 50 - 779 / 10000 * (ε : ℝ) / (massC : ℝ)) * r ^ 2 +
      (1 - 779 / 10000 - (39 / 50 - 779 / 10000 * (ε : ℝ) / (massC : ℝ)) * c ^ 2) *
        tOf n f g ^ 2 := by
  obtain ⟨hi, hlaw⟩ := integral_phiMass_QkOf_le n hn hf hg
  have hdual := twice_normSq_QkOf_le n epsR_pos massC_pos hf hg hi
  have hmass : (ε : ℝ) * ‖QkOf n f g‖ ^ 2 - (massC : ℝ) * ‖kOf n f g‖ ^ 2 ≤
      (massS : ℝ) := by linarith only [hlaw, hdual]
  have hproj := quinticPayoff_projection_envelope n hf hg
  rw [mul_pow] at hE
  norm_num [ε, massC, massS] at hmass ⊢
  linarith only [hE, hmass, hproj, sq_nonneg ‖QhOf n f g‖, sq_nonneg ‖PkOf n f g‖,
    sq_nonneg ‖(H32 n).starProjection (kOf n f g)‖]

/-- Projection duality applies any available homogeneous cubic radius to the
half-difference of an actual pair, independently of an elliptic lift. -/
theorem normQk_le_of_cubicFirstMomentRadius {n : ℕ} {f g : L2G n} {r : ℝ}
    (hr₀ : 0 ≤ r) (hr : CubicFirstMomentRadius r)
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n))) :
    ‖QkOf n f g‖ ≤ r := by
  have hq := hr n (QkOf n f g) ((H21 n).starProjection_apply_mem (kOf n f g))
  have hdual : ‖QkOf n f g‖ ^ 2 ≤ ∫ x, ‖QkOf n f g x‖ ∂(stdGaussian (n + n)) := by
    calc ‖QkOf n f g‖ ^ 2 = (inner ℂ (kOf n f g) (QkOf n f g)).re :=
          (re_inner_starProjection (H21 n) (kOf n f g)).symm
      _ ≤ ‖inner ℂ (kOf n f g) (QkOf n f g)‖ := Complex.re_le_norm _
      _ ≤ ∫ x, ‖conj (kOf n f g x) * QkOf n f g x‖ ∂(stdGaussian (n + n)) := by
        rw [inner_L2]; exact norm_integral_le_integral_norm _
      _ ≤ _ := integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
        ((Lp.memLp (QkOf n f g)).integrable one_le_two).norm (by
          filter_upwards [norm_kOf_le n hf hg] with x hx
          rw [norm_mul, Complex.norm_conj]
          exact mul_le_of_le_one_left (norm_nonneg _) hx)
  by_contra! h
  nlinarith only [hdual, hq, mul_pos (sub_pos.mpr h) (hr₀.trans_lt h)]

/-- The sharper cubic radius alone suffices through 0.30629, before introducing a lift. -/
theorem quinticPayoff_le_of_cubic_radius_30629 {n : ℕ} (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (hr : CubicFirstMomentRadius (2221/2500)) (ht : tOf n f g ≤ 30629 / 100000) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000 := by
  have hA := pow_le_pow_left₀ (norm_nonneg _) (normQk_le_of_cubicFirstMomentRadius
    (by norm_num) hr hf hg) 2
  have hE : ‖QkOf n f g‖ ^ 2 + (0 * tOf n f g) ^ 2 ≤ (2221 / 2500) ^ 2 := by simpa using hA
  have hp := quinticPayoff_le_of_cubic_energy_ellipse hn hf hg _ _ hE
  have ht2 := pow_le_pow_left₀ (show 0 ≤ tOf n f g from norm_nonneg _) ht 2
  norm_num [ε, massC, massS] at hp ht2
  linarith only [hp, ht2]

/-- At radius 2221/2500 and lift coefficient 431/500, the entire amplitude interval through
0.44974 satisfies the physical payoff budget for 1.4023, including the 1/100000 reserve. -/
theorem quinticPayoff_le_of_elliptic_lift_44974 {n : ℕ} (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (hlift : HasEllipticCubicLift n (431/500) f g) (hr : CubicFirstMomentRadius (2221/2500))
    (ht : tOf n f g ≤ 44974 / 100000) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000 := by
  have hE := cubic_energy_ellipse_of_lift (by norm_num) (by norm_num) hlift hr
  have hp := quinticPayoff_le_of_cubic_energy_ellipse hn hf hg _ _ hE
  have ht2 := pow_le_pow_left₀ (show 0 ≤ tOf n f g from norm_nonneg _) ht 2
  norm_num [ε, massC, massS] at hp ht2
  linarith only [hp, ht2]

/-- With the existing Lean cubic radius, the same lift alone suffices through amplitude 0.29082. -/
theorem quinticPayoff_le_of_elliptic_lift_29082 {n : ℕ} (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (hlift : HasEllipticCubicLift n (431/500) f g) (ht : tOf n f g ≤ 29082 / 100000) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000 := by
  have hE := cubic_energy_ellipse_of_lift (by norm_num) (by norm_num) hlift cubicFirstMomentRadius_93
  have hp := quinticPayoff_le_of_cubic_energy_ellipse hn hf hg _ _ hE
  have ht2 := pow_le_pow_left₀ (show 0 ≤ tOf n f g from norm_nonneg _) ht 2
  norm_num [ε, massC, massS] at hp ht2
  linarith only [hp, ht2]

/-- A subspace realizing the independent-coordinate test can carry at most `r² - t²`
of projected energy. Its orthogonal complement must pay the excess. -/
theorem nonremote_energy_of_cubic_support {n : ℕ} {f g : L2G n} {r : ℝ}
    (W : Submodule ℂ (L2G n)) [W.HasOrthogonalProjection]
    (hremote : HasCubicSupportLift (tOf n f g) ‖W.starProjection (QkOf n f g)‖)
    (hr₀ : 0 ≤ r) (hr : CubicFirstMomentRadius r) :
    max 0 (‖QkOf n f g‖ ^ 2 + tOf n f g ^ 2 - r ^ 2) ≤
      ‖Wᗮ.starProjection (QkOf n f g)‖ ^ 2 := by
  have hb := cubic_support_ball (show 0 ≤ tOf n f g from norm_nonneg _) hr₀ hremote hr
  exact max_le (sq_nonneg _) (by linarith only [hb,
    Submodule.norm_sq_eq_add_norm_sq_starProjection (QkOf n f g) W])

/-- The Gram row tested on this pair and a candidate remote subspace. The base price
applies to the full cubic. The surcharge applies only to its orthogonal complement.
All costs on the right are projections of the actual Gaussian phase pair. -/
def QuinticGramPrice (n : ℕ) (f g : L2G n) (W : Submodule ℂ (L2G n))
    [W.HasOrthogonalProjection] (L pA p₀ γ : ℝ) : Prop :=
  pA * tOf n f g ^ 2 + p₀ * ‖QkOf n f g‖ ^ 2 +
        γ * ‖Wᗮ.starProjection (QkOf n f g)‖ ^ 2 ≤
      L + 779 / 10000 * (1 - ‖(H32 n).starProjection (hOf n f g)‖ ^ 2) +
        39 / 50 * ‖QhOf n f g‖ ^ 2 + ‖PkOf n f g‖ ^ 2 +
        779 / 10000 * ‖(H32 n).starProjection (kOf n f g)‖ ^ 2

/-- Retaining the measured total cubic energy gives the positive-part price in a row cell. -/
theorem quinticPayoff_le_of_nonremote_price {n : ℕ} {f g : L2G n} {r : ℝ}
    (W : Submodule ℂ (L2G n)) [W.HasOrthogonalProjection]
    (hremote : HasCubicSupportLift (tOf n f g) ‖W.starProjection (QkOf n f g)‖)
    (hr₀ : 0 ≤ r) (hr : CubicFirstMomentRadius r) (L pA p₀ γ : ℝ) (hγ : 0 ≤ γ)
    (hgram : QuinticGramPrice n f g W L pA p₀ γ) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 779 / 10000 + L +
      (1 - pA) * tOf n f g ^ 2 + (39 / 50 - p₀) * ‖QkOf n f g‖ ^ 2 -
      γ * max 0 (‖QkOf n f g‖ ^ 2 + tOf n f g ^ 2 - r ^ 2) := by
  unfold QuinticGramPrice at hgram
  rw [quinticPayoff, VOf_zero]
  linarith only [hgram, mul_le_mul_of_nonneg_left
    (nonremote_energy_of_cubic_support W hremote hr₀ hr) hγ]

/-- The two support tests use the same phase pair and the same remote projection. The
Gram-row premise bounds explicit projected energies for that pair. The smaller of the
additional nonremote price and the remaining cubic coefficient can be charged against the
stronger remote ball. -/
theorem quinticPayoff_le_of_two_cubic_supports {n : ℕ} {f g : L2G n} {c r : ℝ}
    (W : Submodule ℂ (L2G n)) [W.HasOrthogonalProjection] (hc : 0 ≤ c) (hr₀ : 0 ≤ r)
    (hr : CubicFirstMomentRadius r) (hlift : HasEllipticCubicLift n c f g)
    (hremote : HasCubicSupportLift (tOf n f g) ‖W.starProjection (QkOf n f g)‖)
    (L pA p₀ γ : ℝ) (hp₀ : p₀ ≤ 39 / 50) (hγ : 0 ≤ γ)
    (hgram : QuinticGramPrice n f g W L pA p₀ γ) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤
      779 / 10000 + L + (1 - pA) * tOf n f g ^ 2 +
      (39 / 50 - p₀) * (r ^ 2 - (c * tOf n f g) ^ 2) -
      min (39 / 50 - p₀) γ * (1 - c ^ 2) * tOf n f g ^ 2 := by
  unfold QuinticGramPrice at hgram
  let b := min (39 / 50 - p₀) γ
  have hb : 0 ≤ b := le_min (sub_nonneg.mpr hp₀) hγ
  have hA := cubic_energy_ellipse_of_lift hc hr₀ hlift hr
  have hR := cubic_support_ball (show 0 ≤ tOf n f g from norm_nonneg _) hr₀ hremote hr
  have hm := mul_le_mul_of_nonneg_right (min_le_right (39/50-p₀) γ)
    (sq_nonneg ‖Wᗮ.starProjection (QkOf n f g)‖)
  have ht := mul_le_mul_of_nonneg_left hA
    (sub_nonneg.mpr (min_le_left (39/50-p₀) γ))
  have hrb := mul_le_mul_of_nonneg_left hR hb
  have hs := congrArg (b * ·) (Submodule.norm_sq_eq_add_norm_sq_starProjection (QkOf n f g) W)
  dsimp [b] at hs hrb
  rw [quinticPayoff, VOf_zero]
  linarith only [hgram, hm, ht, hrb, hs]

end

end Grothe.LowerAnalytic
