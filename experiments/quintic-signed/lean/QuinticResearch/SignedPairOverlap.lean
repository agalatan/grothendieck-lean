import QuinticResearch.SignedDiagonal
import QuinticResearch.SpectralPair

set_option warningAsError true

/-! Overlap tests on arbitrary phases for the physical signed witness. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open MeasureTheory Grothe.Lower
open scoped ComplexConjugate
noncomputable section

private theorem signed_symmetric (n : ℕ) (e ν d : ℝ) (u v : L2G n) :
    inner ℂ (signedFifthWitness n e ν d u) v = inner ℂ u (signedFifthWitness n e ν d v) := by
  change inner ℂ (witness n e ν u - (d:ℂ) • (H32 n).starProjection u) v =
    inner ℂ u (witness n e ν v - (d:ℂ) • (H32 n).starProjection v)
  simp only [witness,inner_sub_left,inner_sub_right,inner_smul_left,inner_smul_right,
    Complex.conj_ofReal,Submodule.inner_starProjection_left_eq_right,inner_witnessOf_symm]

private theorem signed_spectral_range (n : ℕ) {d : ℝ} (hd : 0 ≤ d) (hdν : d ≤ 47/2000) (u : L2G n) :
    -(191/250)*‖u‖^2 ≤ (inner ℂ u (signedFifthWitness n (191/250) (47/2000) d u)).re ∧
    (inner ℂ u (signedFifthWitness n (191/250) (47/2000) d u)).re ≤ ‖u‖^2 := by
  have hb := quintic_projection_energy_le n u
  have hlo := signedFifth_diagonal (e:=191/250) hd hdν u
  rw [witness,re_inner_witnessOf] at hlo
  constructor
  · nlinarith only [hlo,hb,sq_nonneg ‖(H10 n).starProjection u‖,sq_nonneg ‖(H32 n).starProjection u‖]
  · change (inner ℂ u (witness n (191/250) (47/2000) u-(d:ℂ) • (H32 n).starProjection u)).re ≤ _
    rw [inner_sub_right,inner_smul_right,Complex.sub_re,Complex.re_ofReal_mul,re_inner_starProjection,
      witness,re_inner_witnessOf]
    nlinarith only [hb,sq_nonneg ‖(H21 n).starProjection u‖,sq_nonneg ‖(H32 n).starProjection u‖,
      mul_nonneg hd (sq_nonneg ‖(H32 n).starProjection u‖)]

/-- Absolute payoffs on arbitrary pairs are priced by their true diagonal
values and the phase-invariant overlap. -/
theorem signed_pair_overlap (n : ℕ) {d : ℝ} (hd : 0 ≤ d) (hdν : d ≤ 47/2000)
    {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n))) :
    let S := signedFifthWitness n (191/250) (47/2000) d
    ‖inner ℂ f (S g)‖^2 ≤ (inner ℂ f (S f)).re*(inner ℂ g (S g)).re +
      (191/250)*(1-‖inner ℂ f g‖^2) := by
  let S := signedFifthWitness n (191/250) (47/2000) d
  have hs (u v : L2G n) : inner ℂ (S u) v = inner ℂ u (S v) := signed_symmetric _ _ _ _ u v
  have hnorm (u : L2G n) : (inner ℂ u u).re = ‖u‖^2 := by rw [inner_self_eq_norm_sq_to_K]; norm_cast
  have lo : (S+((191/250:ℝ):ℂ) • (1 : L2G n →L[ℂ] L2G n)).IsPositive := by
    constructor
    · intro x y
      change inner ℂ (S x+((191/250:ℝ):ℂ) • x) y = inner ℂ x (S y+((191/250:ℝ):ℂ) • y)
      simp only [inner_add_left,inner_add_right,inner_smul_left,inner_smul_right,Complex.conj_ofReal,hs]
    · intro x
      change 0 ≤ (inner ℂ (S x+((191/250:ℝ):ℂ) • x) x).re
      rw [inner_add_left,inner_smul_left,Complex.conj_ofReal,Complex.add_re,Complex.re_ofReal_mul,
        hnorm,hs]
      linarith only [(signed_spectral_range n hd hdν x).1]
  have hi : ((1 : L2G n →L[ℂ] L2G n)-S).IsPositive := by
    constructor
    · intro x y
      change inner ℂ (x-S x) y = inner ℂ x (y-S y)
      rw [inner_sub_left,inner_sub_right,hs]
    · intro x
      change 0 ≤ (inner ℂ (x-S x) x).re
      rw [inner_sub_left,Complex.sub_re,hs,hnorm]
      exact sub_nonneg.mpr (signed_spectral_range n hd hdν x).2
  simpa only [norm_sq_of_mem_unimod n hf,norm_sq_of_mem_unimod n hg,one_mul] using
    spectral_pair_gram S (by norm_num : (0:ℝ) ≤ 191/250) lo hi f g

/-- A quantitative absolute-payoff test, with both individual cubic projections
and the relative phase unrestricted. -/
theorem signed_pair_overlap_14023 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hover : 1-‖inner ℂ f g‖^2 ≤ 133626/100000000) :
    ‖inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) g)‖ < 10000/14023 := by
  let S := signedFifthWitness (n+1) (191/250) (47/2000) (1/50)
  have hs := signed_pair_overlap (n+1) (d:=1/50) (by norm_num) (by norm_num) hf hg
  have hprod : (inner ℂ f (S f)).re*(inner ℂ g (S g)).re ≤ (712398/1000000:ℝ)^2 := calc
    _ ≤ abs (inner ℂ f (S f)).re * abs (inner ℂ g (S g)).re := by rw [← abs_mul]; exact le_abs_self _
    _ ≤ (712398/1000000:ℝ)^2 := by
      rw [sq]
      exact mul_le_mul ((Complex.abs_re_le_norm _).trans (signed_absolute_diagonal_cap hf))
        ((Complex.abs_re_le_norm _).trans (signed_absolute_diagonal_cap hg)) (abs_nonneg _) (by norm_num)
  dsimp only at hs
  change ‖inner ℂ f (S g)‖ < 10000/14023
  nlinarith only [hs,hprod,hover,norm_nonneg (inner ℂ f (S g))]

end
end Grothe.LowerAnalytic
