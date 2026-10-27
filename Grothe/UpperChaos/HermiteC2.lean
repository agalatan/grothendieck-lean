import Grothe.UpperChaos.Charge
import Grothe.UpperChaos.ProductComplete

/-!
# Tensor Hermite functions on `L²(gaussC ⊗ gaussC)`

`H2 ((p,q),(r,s)) (z₁,z₂) = H_{pq}(z₁) H_{rs}(z₂)`. Orthogonality is Fubini of
`integral_hermite`. Completeness in `HermiteC2Basis` applies one-coordinate
completeness twice through the general product-completeness theorem.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Multi-indices of `ℂ²`. -/
abbrev Idx2 := (ℕ × ℕ) × (ℕ × ℕ)

/-- The tensor Hermite function `H_{pq}(z₁) H_{rs}(z₂)`. -/
def H2 (i : Idx2) (u : ℂ × ℂ) : ℂ := ev u.1 (H i.1.1 i.1.2) * ev u.2 (H i.2.1 i.2.2)

/-- `p! q! r! s!`. -/
def fac2 (i : Idx2) : ℕ := i.1.1.factorial * i.1.2.factorial * (i.2.1.factorial * i.2.2.factorial)

lemma memLp_prod_mul {f g : ℂ → ℂ} (hf : MemLp f 2 gaussC) (hg : MemLp g 2 gaussC) :
    MemLp (fun u : ℂ × ℂ => f u.1 * g u.2) 2 mu2 := by
  exact ProductComplete.memLp_prod_mul hf hg

lemma memLp_H2 (i : Idx2) : MemLp (H2 i) 2 mu2 := by
  unfold H2
  exact memLp_prod_mul (f := fun z => ev z (H i.1.1 i.1.2)) (g := fun z => ev z (H i.2.1 i.2.2))
    (memLp_ev _) (memLp_ev _)

/-- **Orthogonality of the tensor Hermite functions.** -/
theorem integral_hermite2 (i j : Idx2) :
    ∫ u, conj (H2 i u) * H2 j u ∂mu2 = if i = j then (fac2 i : ℂ) else 0 := by
  have : ∀ u : ℂ × ℂ, conj (H2 i u) * H2 j u
      = (conj (ev u.1 (H i.1.1 i.1.2)) * ev u.1 (H j.1.1 j.1.2))
        * (conj (ev u.2 (H i.2.1 i.2.2)) * ev u.2 (H j.2.1 j.2.2)) := fun u => by
    simp only [H2, map_mul]; ring
  simp_rw [this]
  rw [integral_prod_mul (f := fun z => conj (ev z (H i.1.1 i.1.2)) * ev z (H j.1.1 j.1.2))
    (g := fun z => conj (ev z (H i.2.1 i.2.2)) * ev z (H j.2.1 j.2.2)),
    integral_hermite, integral_hermite]
  split_ifs <;> simp_all [Prod.ext_iff, fac2]

end

end Grothe.UpperChaos
