import QuinticResearch.SignedCubicDebit

set_option warningAsError true

/-! Absolute diagonal payoffs for signed fifth witnesses. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- Only the cubic eigenspace can contribute a negative diagonal payoff. The
global certified radius for the cubic projection controls that side of the absolute value. -/
theorem signed_diagonal_norm_le_of_cap {n : ℕ} {u : L2G n}
    (hu : u ∈ Unimod (stdGaussian (n+n))) {e ν d B : ℝ}
    (he : 0 ≤ e) (hd : 0 ≤ d) (hdν : d ≤ ν) (hB : e*(93/100)^2 ≤ B)
    (hpos : (inner ℂ u (signedFifthWitness n e ν d u)).re ≤ B) :
    ‖inner ℂ u (signedFifthWitness n e ν d u)‖ ≤ B := by
  let z := inner ℂ u (signedFifthWitness n e ν d u)
  have hc : conj z = z := by
    dsimp [z]
    rw [inner_conj_symm]
    change inner ℂ (witness n e ν u - (d:ℂ) • (H32 n).starProjection u) u =
      inner ℂ u (witness n e ν u - (d:ℂ) • (H32 n).starProjection u)
    simp only [witness,inner_sub_left,inner_sub_right,inner_smul_left,inner_smul_right,
      Complex.conj_ofReal,Submodule.inner_starProjection_left_eq_right,inner_witnessOf_symm]
  have hlow := signedFifth_diagonal (n:=n) (e:=e) hd hdν u
  rw [witness,re_inner_witnessOf] at hlow
  have hq := norm_starProjection_H21_le_93 n (show ∀ᵐ x ∂stdGaussian (n+n), ‖u x‖ ≤ 1 from
    Filter.Eventually.mono hu fun _ h => h.le)
  have hq2 := mul_le_mul_of_nonneg_left
    (sq_le_sq' ((by norm_num : -(93/100:ℝ) ≤ 0).trans (norm_nonneg _)) hq) he
  have hneg : -B ≤ z.re := by
    dsimp [z]
    nlinarith only [hB,hq2,hlow,sq_nonneg ‖(H10 n).starProjection u‖]
  change ‖z‖ ≤ B
  rw [← Complex.conj_eq_iff_re.1 hc,Complex.norm_real,Real.norm_eq_abs]
  exact abs_le.mpr ⟨hneg,hpos⟩

/-- The absolute payoff on every unimodular diagonal pair. -/
theorem signed_absolute_diagonal_cap {n : ℕ} {f : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    ‖inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) f)‖ ≤
      712398/1000000 := by
  apply signed_diagonal_norm_le_of_cap hf (by norm_num) (by norm_num) (by norm_num) (by norm_num)
  exact signed_zero_cubic_cap hf hf (by simp [QkOf,kOf])

/-- A phase-invariant sufficient condition for the absolute 1.4023 test. Both raw
cubic projections remain small when the second argument is rotated. -/
theorem signed_absolute_small_cubics_14023 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hsmall : ‖(H21 (n+1)).starProjection f‖+‖(H21 (n+1)).starProjection g‖ ≤ 62/1000) :
    ‖inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) g)‖ < 10000/14023 := by
  obtain ⟨θ,hθ,hphase⟩ := exists_phase (inner ℂ f (signedFifthWitness (n+1) (191/250) (47/2000) (1/50) g))
  have hdist := norm_sub_le ((H21 (n+1)).starProjection f)
    (θ • (H21 (n+1)).starProjection g)
  rw [norm_smul,hθ,one_mul] at hdist
  have hq : ‖QkOf (n+1) f (θ • g)‖ ≤ 31/1000 := by
    rw [QkOf,kOf,map_smul,map_sub,map_smul,norm_smul,norm_inv]
    norm_num only [Complex.norm_ofNat]
    linarith only [hdist,hsmall]
  have h := signed_small_cubic_14023 hf (smul_mem_unimod (n+1) hθ hg) hq
  rwa [map_smul,inner_smul_right,hphase,Complex.ofReal_re] at h

end
end Grothe.LowerAnalytic
