import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.InnerProductSpace.l2Space
import Mathlib.Tactic.Ring

/-! # A diagonal pairing in a Hilbert basis -/

open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

/-- A bounded pairing diagonal on a Hilbert basis has the corresponding spectral expansion. -/
theorem hasSum_diagonal_pairing {ι E K : Type*} [DecidableEq ι]
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (b : HilbertBasis ι ℂ E) (P Q : E →L[ℂ] K) (lam : ι → ℂ)
    (hdiag : ∀ i j, ⟪P (b i), Q (b j)⟫_ℂ = if i = j then lam i else 0) (F G : E) :
    HasSum (fun i => conj ⟪b i, F⟫_ℂ * lam i * ⟪b i, G⟫_ℂ) ⟪P F, Q G⟫_ℂ := by
  classical
  have step : ∀ i, ⟪P (b i), Q G⟫_ℂ = lam i * ⟪b i, G⟫_ℂ := fun i => by
    have h := ((b.hasSum_repr G).mapL ((innerSL ℂ (P (b i))).comp Q)).tsum_eq.symm
    simp only [map_smul, smul_eq_mul, ContinuousLinearMap.comp_apply,
      innerSL_apply_apply, hdiag, mul_ite, mul_zero, tsum_ite_eq',
      HilbertBasis.repr_apply_apply] at h
    simpa only [mul_comm] using h
  have hs := b.hasSum_inner_mul_inner F (P.adjoint (Q G))
  simp only [ContinuousLinearMap.adjoint_inner_right, step] at hs
  convert hs using 1
  ext i
  rw [inner_conj_symm]
  ring

end Grothe.UpperChaos
