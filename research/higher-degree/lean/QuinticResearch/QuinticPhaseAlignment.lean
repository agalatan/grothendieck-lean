import Grothe.LowerAnalytic.MassRowFrame

/-!
# Angular mass lost by the midpoint of a physical phase pair

Agent-ID: codex-a7c4.
-/

namespace Grothe.LowerAnalytic

open MeasureTheory Lower
open scoped ComplexConjugate

noncomputable section

/-- The midpoint and half-difference are real-orthogonal at almost every point. -/
theorem phase_pair_ae_re_orthogonal {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    ∀ᵐ x ∂stdGaussian (n+n), (conj (hOf n f g x) * kOf n f g x).re = 0 := by
  have hfg : ∀ᵐ x ∂stdGaussian (n+n), ‖f x‖ = 1 := hf
  have hgg : ∀ᵐ x ∂stdGaussian (n+n), ‖g x‖ = 1 := hg
  have hp := Lp.coeFn_add (hOf n f g) (kOf n f g)
  have hm := Lp.coeFn_sub (hOf n f g) (kOf n f g)
  rw [hOf_add_kOf] at hp
  rw [hOf_sub_kOf] at hm
  filter_upwards [hp, hm, hfg, hgg] with x hp hm hf hg
  simp only [Pi.add_apply, Pi.sub_apply] at hp hm
  have he : ‖hOf n f g x + kOf n f g x‖ ^ 2 = ‖hOf n f g x - kOf n f g x‖ ^ 2 := by
    rw [← hp, ← hm, hf, hg]
  simp only [Complex.sq_norm, Complex.normSq_apply, Complex.add_re, Complex.add_im,
    Complex.sub_re, Complex.sub_im] at he
  simp only [Complex.mul_re, Complex.conj_re, Complex.conj_im]
  nlinarith only [he]

/-- For any linear test u, its radial pairing with k costs squared distance from the
midpoint. The direction can vanish. -/
theorem phase_pair_radial_square_le {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (u : L2G n) :
    (∫ x, (conj (u x) * kOf n f g x).re ^ 2 ∂stdGaussian (n+n)) ≤ ‖hOf n f g - u‖ ^ 2 := by
  rw [norm_sq_eq_integral]
  apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun x => sq_nonneg _)
    (Lp.memLp (hOf n f g - u)).norm.integrable_sq
  filter_upwards [phase_pair_ae_re_orthogonal hf hg, norm_kOf_le n hf hg,
    Lp.coeFn_sub (hOf n f g) u] with x horth hk hsub
  simp only [Pi.sub_apply] at hsub
  have hreal : (conj (hOf n f g x - u x) * kOf n f g x).re = -(conj (u x) * kOf n f g x).re := by
    rw [map_sub, sub_mul, Complex.sub_re, horth, zero_sub]
  have hle := Complex.abs_re_le_norm (conj (hOf n f g x - u x) * kOf n f g x)
  rw [hreal, abs_neg, norm_mul, Complex.norm_conj] at hle
  have hb := hle.trans (mul_le_of_le_one_right (norm_nonneg _) hk)
  rw [hsub, ← sq_abs]
  exact pow_le_pow_left₀ (abs_nonneg _) hb 2

/-- The squared radial overlap of the actual visible projection consumes the unused
midpoint energy 1 - K - t². -/
theorem visible_phase_alignment_le_unused {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    (∫ x, (conj (((H10 n).starProjection (hOf n f g)) x) * kOf n f g x).re ^ 2
      ∂stdGaussian (n+n)) ≤ 1 - ‖kOf n f g‖ ^ 2 - tOf n f g ^ 2 := by
  have hbound := phase_pair_radial_square_le hf hg ((H10 n).starProjection (hOf n f g))
  have hsplit := Submodule.norm_sq_eq_add_norm_sq_starProjection (hOf n f g) (H10 n)
  rw [Submodule.starProjection_orthogonal_val] at hsplit
  unfold tOf
  linarith only [hbound, hsplit, normSq_hOf_add_normSq_kOf n hf hg]

end
end Grothe.LowerAnalytic
