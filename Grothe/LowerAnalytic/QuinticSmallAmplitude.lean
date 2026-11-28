import Grothe.LowerAnalytic.MassRowFrame
import Grothe.LowerAnalytic.QuinticWitness

/-!
# A scalar cap for the low-amplitude degree-five witness

The Gaussian mass row bounds the cubic energy of the difference of two phases.
Orthogonality then pays for the positive fifth-chaos energy from the unused
energy of their midpoint. All estimates apply in every positive finite dimension.
-/

namespace Grothe.LowerAnalytic

open Grothe.Lower

noncomputable section

/-- Bessel's inequality for the midpoint retains the full mass of the half-difference
and all three observable penalties in the payoff. -/
theorem quinticPayoff_projection_envelope (n : ℕ) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n))) :
    quinticPayoff n (39 / 50) (779 / 10000) f g +
        (39 / 50 + 779 / 10000) * ‖QhOf n f g‖ ^ 2 + ‖PkOf n f g‖ ^ 2 +
        779 / 10000 * ‖(H32 n).starProjection (kOf n f g)‖ ^ 2 ≤
      779 / 10000 + (1 - 779 / 10000) * tOf n f g ^ 2 +
        39 / 50 * ‖QkOf n f g‖ ^ 2 - 779 / 10000 * ‖kOf n f g‖ ^ 2 := by
  have hproj := quintic_projection_energy_le n (hOf n f g)
  change tOf n f g ^ 2 + ‖QhOf n f g‖ ^ 2 +
    ‖(H32 n).starProjection (hOf n f g)‖ ^ 2 ≤ ‖hOf n f g‖ ^ 2 at hproj
  rw [quinticPayoff, VOf_zero]
  linarith only [hproj, normSq_hOf_add_normSq_kOf n hf hg]

/-- The scalar estimate used to remove the small cubic energy region of a box. -/
theorem quinticPayoff_energy_envelope (n : ℕ) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n))) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤
      779 / 10000 + (1 - 779 / 10000) * tOf n f g ^ 2 +
        (39 / 50 - 779 / 10000) * ‖QkOf n f g‖ ^ 2 := by
  have hk : ‖QkOf n f g‖ ≤ ‖kOf n f g‖ :=
    (H21 n).norm_starProjection_apply_le (kOf n f g)
  linarith only [quinticPayoff_projection_envelope n hf hg,
    pow_le_pow_left₀ (norm_nonneg _) hk 2, sq_nonneg ‖QhOf n f g‖, sq_nonneg ‖PkOf n f g‖,
    sq_nonneg ‖(H32 n).starProjection (kOf n f g)‖]

/-- Through amplitude 0.42 the target holds for every pair with cubic energy at most 0.673. -/
theorem quinticPayoff_le_of_smallCubic (n : ℕ) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (ht : tOf n f g ≤ 21 / 50) (hA : ‖QkOf n f g‖ ^ 2 ≤ 673 / 1000) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000 := by
  linarith only [quinticPayoff_energy_envelope n hf hg, hA,
    pow_le_pow_left₀ (show 0 ≤ tOf n f g from norm_nonneg _) ht 2]

/-- The mass row at the cubic weight 39/50 gives an upper envelope for the quintic payoff.
The three negative projection terms are retained for use away from the small-amplitude interval. -/
theorem quinticPayoff_mass_envelope (n : ℕ) (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n))) :
    quinticPayoff n (39 / 50) (779 / 10000) f g +
        (39 / 50 + 779 / 10000) * ‖QhOf n f g‖ ^ 2 + ‖PkOf n f g‖ ^ 2 +
        779 / 10000 * ‖(H32 n).starProjection (kOf n f g)‖ ^ 2 ≤
      tOf n f g ^ 2 + (39 / 50) / (ε : ℝ) *
        ((massC : ℝ) * (1 - tOf n f g ^ 2) + (massS : ℝ)) := by
  obtain ⟨hi, hlaw⟩ := integral_phiMass_QkOf_le n hn hf hg
  have hdual := twice_normSq_QkOf_le n epsR_pos massC_pos hf hg hi
  have hmass : (ε : ℝ) * ‖QkOf n f g‖ ^ 2 - (massC : ℝ) * ‖kOf n f g‖ ^ 2 ≤
      (massS : ℝ) := by linarith only [hlaw, hdual]
  have hproj := quinticPayoff_projection_envelope n hf hg
  have hk := normSq_kOf_le n hf hg
  norm_num [ε, massC, massS] at hmass ⊢
  linarith only [hmass, hproj, hk]

/-- Up to amplitude 11/50, every unimodular pair satisfies the scalar budget for
the target 1.4023, including a uniform reserve of 1/100000. -/
theorem quinticPayoff_le_of_smallAmplitude (n : ℕ) (hn : 0 < n) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (ht : tOf n f g ≤ 11 / 50) :
    quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000 := by
  have hm := quinticPayoff_mass_envelope n hn hf hg
  have ht2 := pow_le_pow_left₀ (show 0 ≤ tOf n f g from norm_nonneg _) ht 2
  norm_num [ε, massC, massS] at hm ht2
  linarith only [hm, ht2, sq_nonneg ‖QhOf n f g‖, sq_nonneg ‖PkOf n f g‖,
    sq_nonneg ‖(H32 n).starProjection (kOf n f g)‖]

end

end Grothe.LowerAnalytic

namespace Grothe.Statement

open Grothe.LowerAnalytic Grothe.Lower

/-- It suffices to certify the same budget for the remaining amplitudes and cubic energies in positive
dimensions to obtain a strict improvement of the finite-matrix lower bound to 1.4023. -/
theorem lower_14023_of_quintic_largeAmplitude
    (hcap : ∀ n, 0 < n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → 11 / 50 < tOf n f g →
      10000 / 14023 - 1 / 100000 < 779 / 10000 + (1 - 779 / 10000) * tOf n f g ^ 2 +
        (39 / 50 - 779 / 10000) * ‖QkOf n f g‖ ^ 2 →
      quinticPayoff n (39 / 50) (779 / 10000) f g ≤ 10000 / 14023 - 1 / 100000)
    (hne : ∃ K, IsBound K) : 14023 / 10000 < complexGrothendieckConstant := by
  apply lt_of_lt_of_le _ (lower_of_quinticPayoff (e := 39 / 50) (η := 779 / 10000)
    (B := 10000 / 14023 - 1 / 100000) (by norm_num) (by norm_num) 1 ?_ hne)
  · norm_num
  · intro n hn f g hf hg
    have hn' : 0 < n := hn
    rcases le_or_gt (tOf n f g) (11 / 50) with ht | ht
    · exact quinticPayoff_le_of_smallAmplitude n hn' hf hg ht
    · rcases le_or_gt (779 / 10000 + (1 - 779 / 10000) * tOf n f g ^ 2 +
          (39 / 50 - 779 / 10000) * ‖QkOf n f g‖ ^ 2) (10000 / 14023 - 1 / 100000) with hA | hA
      · exact (quinticPayoff_energy_envelope n hf hg).trans hA
      · exact hcap n hn' f g hf hg ht hA

end Grothe.Statement
