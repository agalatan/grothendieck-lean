import QuinticResearch.QuinticWitness
import QuinticResearch.QuinticPhaseAlignment

set_option warningAsError true

/-! Physical residual Gram constraints for a signed fifth projection. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

private theorem split_inner (L : Submodule ℂ E) [L.HasOrthogonalProjection] (h k : E) :
    inner ℂ (L.starProjection h) (L.starProjection k) +
      inner ℂ (Lᗮ.starProjection h) (Lᗮ.starProjection k) = inner ℂ h k := by
  rw [Submodule.inner_starProjection_left_eq_right,Submodule.inner_starProjection_left_eq_right,
    Submodule.starProjection_eq_self_iff.2 (L.starProjection_apply_mem k),
    Submodule.starProjection_eq_self_iff.2 (Lᗮ.starProjection_apply_mem k),
    ← inner_add_right,Submodule.starProjection_add_starProjection_orthogonal]

/-- Sharp polynomial constraint on the difference of the two projected energies.
Both real and imaginary components of the original inner product contribute. -/
theorem projection_difference_gram (L : Submodule ℂ E) [L.HasOrthogonalProjection] (h k : E) :
    let Δ := ‖L.starProjection h‖^2 - ‖L.starProjection k‖^2
    ‖inner ℂ h k‖^2 ≤ (‖k‖^2+Δ)*(‖h‖^2-Δ) := by
  dsimp only
  have hi : ‖inner ℂ h k‖ ≤ ‖L.starProjection h‖*‖L.starProjection k‖+
      ‖Lᗮ.starProjection h‖*‖Lᗮ.starProjection k‖ := by
    rw [← split_inner L h k]
    exact (norm_add_le _ _).trans (add_le_add (norm_inner_le_norm _ _) (norm_inner_le_norm _ _))
  have hs : ‖inner ℂ h k‖^2 ≤
      (‖L.starProjection h‖*‖L.starProjection k‖+‖Lᗮ.starProjection h‖*‖Lᗮ.starProjection k‖)^2 :=
    pow_le_pow_left₀ (norm_nonneg _) hi 2
  rw [Submodule.norm_sq_eq_add_norm_sq_starProjection k L,
    Submodule.norm_sq_eq_add_norm_sq_starProjection h L]
  nlinarith only [hs,sq_nonneg
    (‖L.starProjection h‖*‖Lᗮ.starProjection h‖-‖L.starProjection k‖*‖Lᗮ.starProjection k‖)]

/-- Remove the first and cubic subspaces in the Gaussian witness. -/
def signedResidual (n : ℕ) (u : L2G n) : L2G n :=
  (H21 n)ᗮ.starProjection ((H10 n)ᗮ.starProjection u)

private theorem smaller_project_complement (K L : Submodule ℂ E) [K.HasOrthogonalProjection]
    [L.HasOrthogonalProjection] (h : K ≤ Lᗮ) (u : E) :
    K.starProjection (Lᗮ.starProjection u) = K.starProjection u := by
  rw [← ContinuousLinearMap.comp_apply,Submodule.starProjection_comp_starProjection_of_le h]

/-- This expression uses the actual complex cross terms of the two lower sectors. -/
theorem signedResidual_inner (n : ℕ) (h k : L2G n) :
    inner ℂ (signedResidual n h) (signedResidual n k) =
      inner ℂ h k - inner ℂ ((H10 n).starProjection h) ((H10 n).starProjection k)
        - inner ℂ ((H21 n).starProjection h) ((H21 n).starProjection k) := by
  have hp := split_inner (H10 n) h k
  have hq := split_inner (H21 n) ((H10 n)ᗮ.starProjection h) ((H10 n)ᗮ.starProjection k)
  rw [smaller_project_complement _ _ (H21_le_orthogonal n) h,
    smaller_project_complement _ _ (H21_le_orthogonal n) k] at hq
  unfold signedResidual
  rw [← hp,← hq]
  abel

/-- The remaining fifth-energy deficit is bounded by the retained residual Gram.
No orientation or amplitude assumption on the physical pair is needed. -/
theorem signed_fifth_residual_gram (n : ℕ) (h k : L2G n) :
    let H := ‖signedResidual n h‖^2
    let K := ‖signedResidual n k‖^2
    let Δ := ‖(H32 n).starProjection h‖^2-‖(H32 n).starProjection k‖^2
    ‖inner ℂ (signedResidual n h) (signedResidual n k)‖^2 ≤ (K+Δ)*(H-Δ) := by
  have hr := projection_difference_gram (H32 n) (signedResidual n h) (signedResidual n k)
  dsimp only at hr ⊢
  have keep (u : L2G n) : (H32 n).starProjection (signedResidual n u) = (H32 n).starProjection u := by
    unfold signedResidual
    rw [smaller_project_complement _ _ (H32_le_H21_orthogonal n),
      smaller_project_complement _ _ (H32_le_orthogonal n)]
  simpa only [keep] using hr

/-- The real alignment of the two actual cubic projections forces a residual
cross term, up to the first-chaos projection of the half-difference. -/
theorem cubic_alignment_le_residual {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    max 0 (|(inner ℂ (QhOf n f g) (QkOf n f g)).re| - tOf n f g*‖PkOf n f g‖) ≤
      ‖inner ℂ (signedResidual n (hOf n f g)) (signedResidual n (kOf n f g))‖ := by
  let h := hOf n f g
  let k := kOf n f g
  let J := inner ℂ (signedResidual n h) (signedResidual n k)
  let z := inner ℂ ((H10 n).starProjection h) ((H10 n).starProjection k)
  let w := inner ℂ (QhOf n f g) (QkOf n f g)
  have h0 : (inner ℂ h k).re = 0 := by
    rw [re_inner_eq_integral]
    exact integral_eq_zero_of_ae (phase_pair_ae_re_orthogonal hf hg)
  have hr : J.re = -z.re-w.re := by
    change (inner ℂ (signedResidual n h) (signedResidual n k)).re = _
    simp only [signedResidual_inner,Complex.sub_re,h0,zero_sub,z,w,QhOf,QkOf]
    rfl
  have hz : |z.re| ≤ tOf n f g*‖PkOf n f g‖ :=
    (Complex.abs_re_le_norm _).trans (norm_inner_le_norm _ _)
  have hw : |w.re| ≤ ‖J‖ + tOf n f g*‖PkOf n f g‖ := calc
    |w.re| = |-(J.re+z.re)| := congrArg abs (by linarith only [hr])
    _ ≤ |J.re|+|z.re| := by rw [abs_neg]; exact abs_add_le _ _
    _ ≤ _ := add_le_add (Complex.abs_re_le_norm _) hz
  exact max_le (norm_nonneg _) (sub_le_iff_le_add.mpr hw)

/-- A real target floor can be checked directly against the measured squared inner
product. The vertex hypothesis accounts for the two roots of the quadratic. -/
theorem signed_floor_of_gram {H K J₂ Δ floor : ℝ}
    (hgram : J₂ ≤ (K+Δ)*(H-Δ)) (hvertex : 2*floor ≤ H-K)
    (hmass : (K+floor)*(H-floor) ≤ J₂) : floor ≤ Δ := by
  by_contra! hbelow
  have ha : 0 < floor-Δ := sub_pos.mpr hbelow
  have hb : 0 < H-K-floor-Δ := by linarith only [hvertex,hbelow]
  nlinarith only [hgram,hmass,mul_pos ha hb]


end
end Grothe.LowerAnalytic
