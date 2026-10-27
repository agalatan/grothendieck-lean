import Grothe.UpperChaos.InvariantMoments
import Grothe.UpperChaos.RadialCutoff

/-! # Restricted Gaussian invariant moments

Exact product Gaussian moments with a radial cutoff on one coordinate.
This does not assert a concrete phase-tail bound.

Agent-ID: codex-2ca4, codex-239c -/
open MeasureTheory Real Set Grothe.LowerAnalytic
open scoped ComplexConjugate
namespace Grothe.UpperChaos.RestrictedWick
noncomputable section

/-- A cutoff on the first coordinate, with no restriction on the second. -/
def muCut (L : ℝ) : Measure (ℂ × ℂ) :=
  (gaussC.restrict {z : ℂ | L < ‖z‖ ^ 2}).prod gaussC

private lemma factor_damped (a b c d : ℕ) (rate : ℝ) (z : ℂ × ℂ) :
    z.1 ^ a * conj z.1 ^ b * z.2 ^ c * conj z.2 ^ d *
      (exp (-(rate - 1) * Complex.normSq z.1 -
        (rate - 1) * Complex.normSq z.2) : ℂ) =
    (z.1 ^ a * conj z.1 ^ b * (exp (-(rate - 1) * Complex.normSq z.1) : ℂ)) *
      (z.2 ^ c * conj z.2 ^ d * (exp (-(rate - 1) * Complex.normSq z.2) : ℂ)) := by
  rw [sub_eq_add_neg, ← neg_mul, exp_add]
  push_cast
  ring

/-- In the unbalanced auxiliary coordinate the restricted product moment vanishes. -/
theorem integral_cut_unbalanced (a b c d : ℕ) (L rate : ℝ) (hr : 0 < rate)
    (hne : c ≠ d) :
    (∫ z : ℂ × ℂ, z.1 ^ a * conj z.1 ^ b * z.2 ^ c * conj z.2 ^ d *
      (exp (-(rate - 1) * Complex.normSq z.1 -
        (rate - 1) * Complex.normSq z.2) : ℂ) ∂muCut L) = 0 := by
  simp_rw [factor_damped]
  rw [muCut, integral_prod_mul
    (fun z : ℂ => z ^ a * conj z ^ b * (exp (-(rate - 1) * Complex.normSq z) : ℂ))
    (fun z : ℂ => z ^ c * conj z ^ d * (exp (-(rate - 1) * Complex.normSq z) : ℂ)),
    integral_moment_damped c d hr]
  simp [hne]

/-- Balanced moments reduce exactly to the radial tail and one ordinary Gaussian moment. -/
theorem integral_cut_balanced (a b : ℕ) (L rate : ℝ) (hL : 0 ≤ L) (hr : 0 < rate) :
    (∫ z : ℂ × ℂ, z.1 ^ a * conj z.1 ^ a * z.2 ^ b * conj z.2 ^ b *
      (exp (-(rate - 1) * Complex.normSq z.1 -
        (rate - 1) * Complex.normSq z.2) : ℂ) ∂muCut L) =
      ((exp (-(rate * L)) * ∑ k ∈ Finset.range (a + 1),
        ((a.choose k : ℝ) * L ^ (a - k)) * ((k.factorial : ℝ) / rate ^ (k + 1)) : ℝ) : ℂ) *
          ((b.factorial : ℂ) / (rate : ℂ) ^ (b + 1)) := by
  have hz : (∫ z : ℂ in {z | L < ‖z‖ ^ 2}, z ^ a * conj z ^ a *
      ((exp (-(rate - 1) * Complex.normSq z) : ℝ) : ℂ) ∂gaussC) =
      ((exp (-(rate * L)) * ∑ k ∈ Finset.range (a + 1),
        ((a.choose k : ℝ) * L ^ (a - k)) * ((k.factorial : ℝ) / rate ^ (k + 1)) : ℝ) : ℂ) := by
    simpa only [Complex.normSq_eq_norm_sq] using
      RadialCutoff.gaussC_diagonal_exp_tail a L rate hL hr
  simp_rw [factor_damped]
  rw [muCut, integral_prod_mul
    (fun z : ℂ => z ^ a * conj z ^ a * (exp (-(rate - 1) * Complex.normSq z) : ℂ))
    (fun z : ℂ => z ^ b * conj z ^ b * (exp (-(rate - 1) * Complex.normSq z) : ℂ)),
    hz, integral_moment_damped b b hr]
  simp

/-- Rational factor in a cutoff moment, with the exponential factored out. -/
def cutoffTailQ (rate L : ℚ) (n : ℕ) : ℚ :=
  ∑ k ∈ Finset.range (n + 1),
    ((n.choose k : ℚ) * L ^ (n - k)) * ((k.factorial : ℚ) / rate ^ (k + 1))

/-- Exact finite restricted invariant moment, without its common exponential. -/
def cutoffInvariantMomentQ (rate L : ℚ) (a b j m : ℕ) : ℚ :=
  ∑ s ∈ Finset.range (2 * j + 1), ∑ t ∈ Finset.range (m + 1),
    if 2 * j - s + (m - t) = s + t then
      invariantCoeff j m s t * cutoffTailQ rate L (a + s + t) *
        ((b + s + t).factorial : ℚ) / rate ^ (b + s + t + 1)
    else 0

private def cutTerm (rate : ℝ) (a b j m s t : ℕ) (u : ℂ × ℂ) : ℂ :=
  (invariantCoeff j m s t : ℂ) *
    (u.1 ^ (a + (2 * j - s) + (m - t)) * conj u.1 ^ (a + s + t) *
      u.2 ^ (b + s + t) * conj u.2 ^ (b + (2 * j - s) + (m - t)) *
      (exp (-(rate - 1) * Complex.normSq u.1 -
        (rate - 1) * Complex.normSq u.2) : ℂ))

private theorem cutTerm_integrable (rate : ℝ) (hr : 0 < rate) (L : ℝ)
    (a b j m s t : ℕ) : Integrable (cutTerm rate a b j m s t) (muCut L) := by
  have hf := (integrable_monomial_damped_prod
    (a + (2 * j - s) + (m - t)) (a + s + t)
    (b + s + t) (b + (2 * j - s) + (m - t)) hr hr).const_mul
      (invariantCoeff j m s t : ℂ)
  change Integrable (cutTerm rate a b j m s t) (gaussC.prod gaussC) at hf
  rw [muCut, Measure.restrict_prod_eq_prod_univ]
  exact hf.mono_measure Measure.restrict_le_self

/-- Candidate restricted invariant-moment identity. Its integrand and cutoff
are the actual Gaussian source; the 35-term numerical certificate is separate. -/
theorem integral_cut_invariant (rate L : ℚ) (hr : 0 < rate) (hL : 0 ≤ L)
    (a b j m : ℕ) :
    (∫ u : ℂ × ℂ, invariantMonomial a b j m u *
      exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2))
        ∂muCut (L : ℝ)) =
      exp (-((rate : ℝ) * (L : ℝ))) *
        (cutoffInvariantMomentQ rate L a b j m : ℝ) := by
  have hp : (0 : ℝ) < rate := by exact_mod_cast hr
  have hLr : (0 : ℝ) ≤ L := by exact_mod_cast hL
  have hexpand (u : ℂ × ℂ) :
      ((invariantMonomial a b j m u *
        exp (-((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2)) : ℝ) : ℂ) =
        ∑ s ∈ Finset.range (2 * j + 1), ∑ t ∈ Finset.range (m + 1),
          cutTerm (rate : ℝ) a b j m s t u := by
    simp only [invariantMonomial, Complex.ofReal_mul, Complex.ofReal_pow]
    rw [invariant_monomial_expansion]
    simp only [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro s hs
    apply Finset.sum_congr rfl
    intro t ht
    have he : -((rate : ℝ) - 1) * (Complex.normSq u.1 + Complex.normSq u.2) =
        -((rate : ℝ) - 1) * Complex.normSq u.1 -
          ((rate : ℝ) - 1) * Complex.normSq u.2 := by ring
    rw [he]
    simp only [cutTerm]
    ring
  have hterm (s t : ℕ) :
      (∫ u, cutTerm (rate : ℝ) a b j m s t u ∂muCut (L : ℝ)) =
        ((exp (-((rate : ℝ) * (L : ℝ))) : ℝ) : ℂ) *
          ((if 2 * j - s + (m - t) = s + t then
            invariantCoeff j m s t * cutoffTailQ rate L (a + s + t) *
              ((b + s + t).factorial : ℚ) / rate ^ (b + s + t + 1)
            else 0 : ℚ) : ℂ) := by
    unfold cutTerm
    rw [integral_const_mul]
    by_cases hb : 2 * j - s + (m - t) = s + t
    · have ha : a + (2 * j - s) + (m - t) = a + s + t := by omega
      have hw : b + (2 * j - s) + (m - t) = b + s + t := by omega
      rw [ha, hw, integral_cut_balanced (a + s + t) (b + s + t) (L : ℝ)
        (rate : ℝ) hLr hp]
      simp only [ite_eq_left hb, cutoffTailQ]
      push_cast
      ring
    · have hw : b + s + t ≠ b + (2 * j - s) + (m - t) := by omega
      rw [integral_cut_unbalanced _ _ _ _ _ _ hp hw]
      simp [hb]
  apply Complex.ofReal_injective
  rw [← integral_complex_ofReal]
  simp_rw [hexpand]
  rw [integral_finsetSum _ fun s _ =>
    integrable_finsetSum _ fun t _ => cutTerm_integrable _ hp _ _ _ _ _ _ _]
  simp_rw [integral_finsetSum _ fun t _ => cutTerm_integrable _ hp _ _ _ _ _ _ _, hterm]
  simp only [cutoffInvariantMomentQ]
  push_cast
  simp only [Finset.mul_sum]


end
end Grothe.UpperChaos.RestrictedWick
