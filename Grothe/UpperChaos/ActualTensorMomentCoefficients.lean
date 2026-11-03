import Grothe.UpperChaos.ActualPairMomentCoefficients
import Grothe.UpperChaos.HermiteC2

/-!
# Actual eight-source coefficients of physical Gaussian monomials

Agent-ID: codex-2ca4.

The pair coefficient theorem is tensored in the actual gate order. Its source
index permutation is explicit and bijective; no equality with the generic
outgoing/incoming grouping is assumed. Only products of independent Gaussian
integrals are used, with no exchange of physical and source variables.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualTensorMomentCoefficients

open ActualTaylorCoherent IndependentSourceMoments GaussianFockBessel
open BipartitePolynomialL2 ScaledActualCoherentL2
open ActualSourceCoefficientExtraction ActualPairMomentCoefficients
open PairJetPolynomialOperations OriginalHSParameterGates

noncomputable section

/-- For each physical coordinate, the gate sources have order ((y,u),(x,v)).
The outgoing Hermite exponents therefore appear as (b,a), not (a,b). -/
def gateMatrixIndexEquiv : (Idx2 × Idx2) ≃ TensorPowers where
  toFun mn :=
    (((mn.1.1.2, mn.2.1.1), (mn.1.1.1, mn.2.1.2)),
      ((mn.1.2.2, mn.2.2.1), (mn.1.2.1, mn.2.2.2)))
  invFun ij :=
    (((ij.1.2.1, ij.1.1.1), (ij.2.2.1, ij.2.1.1)),
      ((ij.1.1.2, ij.1.2.2), (ij.2.1.2, ij.2.2.2)))
  left_inv := by rintro ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩; rfl
  right_inv := by rintro ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩; rfl

theorem gateMatrixIndexEquiv_apply (m n : Idx2) :
    gateMatrixIndexEquiv (m, n) =
      (((m.1.2, n.1.1), (m.1.1, n.1.2)),
        ((m.2.2, n.2.1), (m.2.1, n.2.2))) := rfl

/-- The actual product of the two independently scaled physical moments. -/
def scaledTensorMoment (g : Gate) (e : Fin 4 → ℕ) (Z : TensorSources) : ℂ :=
  scaledPairMoment g 0 (e 0) (e 1) Z.1 *
    scaledPairMoment g 1 (e 2) (e 3) Z.2

theorem memLp_scaledTensorMoment (g : Gate) (hg : gateOK g = true)
    (e : Fin 4 → ℕ) : MemLp (scaledTensorMoment g e) 2 sourceMeasure8 := by
  exact ProductComplete.memLp_prod_mul
    (memLp_scaledPairMoment g hg 0 (e 0) (e 1))
    (memLp_scaledPairMoment g hg 1 (e 2) (e 3))

theorem coefficient8_scaledTensorMoment (g : Gate) (e : Fin 4 → ℕ)
    (i : TensorPowers) :
    coefficient8 (scaledTensorMoment g e) i =
      (∫ s, conj (monomial4 i.1 s) *
        scaledPairMoment g 0 (e 0) (e 1) s ∂pairMeasure) *
      (∫ s, conj (monomial4 i.2 s) *
        scaledPairMoment g 1 (e 2) (e 3) s ∂pairMeasure) := by
  unfold coefficient8
  have hp (Z : TensorSources) :
      conj (monomial8 i Z) * scaledTensorMoment g e Z =
        (conj (monomial4 i.1 Z.1) * scaledPairMoment g 0 (e 0) (e 1) Z.1) *
        (conj (monomial4 i.2 Z.2) * scaledPairMoment g 1 (e 2) (e 3) Z.2) := by
    simp only [monomial8, tensorFamily, scaledTensorMoment, map_mul]
    ring
  simp_rw [hp]
  exact integral_prod_mul _ _

def tensorNormalization (m n : Idx2) : ℂ :=
  (normalization4 ((m.1.2, n.1.1), (m.1.1, n.1.2)) : ℂ) *
    (normalization4 ((m.2.2, n.2.1), (m.2.1, n.2.2)) : ℂ)

def tensorSourceWeight (g : Gate) (m n : Idx2) : ℂ :=
  scaleWeight ((m.1.2, n.1.1), (m.1.1, n.1.2)) (pairScales g 0) *
    scaleWeight ((m.2.2, n.2.1), (m.2.1, n.2.2)) (pairScales g 1)

/-- The corresponding physical two-coordinate Hermite moment, retaining the
production radial rate and all four physical monomial exponents. -/
def tensorPhysicalMoment (g : Gate) (e : Fin 4 → ℕ) (m n : Idx2) : ℂ :=
  ∫ zw, integrand (rate g.power) 0 0 (e 0) (e 1) zw.1 *
    integrand (rate g.power) 0 0 (e 2) (e 3) zw.2 *
      conj (H2 m zw) * H2 n zw ∂mu2

theorem tensorPhysicalMoment_eq_product (g : Gate) (e : Fin 4 → ℕ)
    (m n : Idx2) :
    tensorPhysicalMoment g e m n =
      (∫ z, integrand (rate g.power) 0 0 (e 0) (e 1) z *
        conj (ev z (H m.1.1 m.1.2)) * ev z (H n.1.1 n.1.2) ∂gaussC) *
      (∫ z, integrand (rate g.power) 0 0 (e 2) (e 3) z *
        conj (ev z (H m.2.1 m.2.2)) * ev z (H n.2.1 n.2.2) ∂gaussC) := by
  unfold tensorPhysicalMoment
  have hp (zw : ℂ × ℂ) :
      integrand (rate g.power) 0 0 (e 0) (e 1) zw.1 *
        integrand (rate g.power) 0 0 (e 2) (e 3) zw.2 *
          conj (H2 m zw) * H2 n zw =
      (integrand (rate g.power) 0 0 (e 0) (e 1) zw.1 *
        conj (ev zw.1 (H m.1.1 m.1.2)) * ev zw.1 (H n.1.1 n.1.2)) *
      (integrand (rate g.power) 0 0 (e 2) (e 3) zw.2 *
        conj (ev zw.2 (H m.2.1 m.2.2)) * ev zw.2 (H n.2.1 n.2.2)) := by
    simp only [H2, map_mul]
    ring
  simp_rw [hp]
  exact integral_prod_mul _ _

/-- Every tensor monomial coefficient is its actual physical Hermite moment
with the exact source weights and factorial normalization. -/
theorem coefficient8_scaledTensorMoment_eq_Hermite (g : Gate)
    (hg : gateOK g = true) (e : Fin 4 → ℕ) (m n : Idx2) :
    coefficient8 (scaledTensorMoment g e) (gateMatrixIndexEquiv (m, n)) =
      tensorNormalization m n * tensorSourceWeight g m n *
        tensorPhysicalMoment g e m n := by
  rw [coefficient8_scaledTensorMoment, gateMatrixIndexEquiv_apply]
  rw [integral_scaledPairMoment_eq_Hermite g hg 0 (e 0) (e 1),
    integral_scaledPairMoment_eq_Hermite g hg 1 (e 2) (e 3),
    tensorPhysicalMoment_eq_product]
  simp only [tensorNormalization, tensorSourceWeight]
  ring

/-- Bessel's bound is invariant under the actual gate source permutation. -/
theorem tsum_gate_coefficient_sq_le {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) :
    (∑' mn : Idx2 × Idx2, ‖coefficient8 F (gateMatrixIndexEquiv mn)‖ ^ 2) ≤
      ∫ Z, ‖F Z‖ ^ 2 ∂sourceMeasure8 := by
  rw [gateMatrixIndexEquiv.tsum_eq (fun i => ‖coefficient8 F i‖ ^ 2)]
  exact tsum_coefficient8_sq_le hF

end
end Grothe.UpperChaos.ActualTensorMomentCoefficients
