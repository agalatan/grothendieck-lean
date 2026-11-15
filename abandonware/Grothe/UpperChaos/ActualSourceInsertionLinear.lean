import Grothe.UpperChaos.ActualRationalSourcePolynomial
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous

/-!
# Linear insertion before expanding the actual rational source

Agent-ID: codex-2ca4. Task #40.

The actual multiplier is split into
finite charge components before the eight-variable insertion is evaluated.
This avoids making the expanded source support an input to the decomposition.
The numerical Laguerre table and the Gram diagonalization remain separate.
-/

open MvPolynomial

namespace Grothe.UpperChaos.ActualSourceInsertionLinear

open ActualRationalSourcePolynomial ActualTaylorCoherent

noncomputable section

abbrev MultiplierPolynomial := MvPolynomial (Fin 4) ℚ

def insertedMonomial (r : ℚ) (s : Fin 4 →₀ ℕ) : RationalSourcePolynomial :=
  insertedPolynomialQ r (X 0 + X 1) (X 2 + X 3) (s 0) (s 1) *
    insertedPolynomialQ r (X 4 + X 5) (X 6 + X 7) (s 2) (s 3)

def insertion (r : ℚ) : MultiplierPolynomial →ₗ[ℚ] RationalSourcePolynomial :=
  (Finsupp.linearCombination ℚ (insertedMonomial r)).comp
    (AddMonoidAlgebra.coeffLinearEquiv ℚ).toLinearMap

theorem insertion_apply (r : ℚ) (P : MultiplierPolynomial) :
    insertion r P =
      ∑ s ∈ P.support, MvPolynomial.C (P.coeff s) * insertedMonomial r s := by
  classical
  change P.coeff.sum (fun s a => a • insertedMonomial r s) = _
  simp only [Finsupp.sum, MvPolynomial.finsupp_support_eq_support,
    MvPolynomial.smul_eq_C_mul]

theorem rationalSourcePolynomial_eq_insertion (power : ℕ) :
    rationalSourcePolynomial power = insertion (rateQ power) (multiplierQ power) := by
  rw [insertion_apply]
  rfl

/-- The two signed physical charges. Coherent insertion reverses these
charges; the reversal is a later homogeneity theorem, not assumed here. -/
def physicalChargeWeights : Fin 4 → ℤ × ℤ :=
  ![(1, 0), (-1, 0), (0, 1), (0, -1)]

def chargeSet (P : MultiplierPolynomial) : Finset (ℤ × ℤ) :=
  P.support.image (Finsupp.weight physicalChargeWeights)

def chargeBlock (P : MultiplierPolynomial) (k : ℤ × ℤ) : MultiplierPolynomial :=
  MvPolynomial.weightedHomogeneousComponent physicalChargeWeights k P

/-- Finite charge decomposition on the smaller physical multiplier. -/
theorem sum_chargeBlock (P : MultiplierPolynomial) :
    ∑ k ∈ chargeSet P, chargeBlock P k = P := by
  classical
  ext d
  simp only [MvPolynomial.coeff_sum, chargeBlock,
    MvPolynomial.coeff_weightedHomogeneousComponent]
  rw [Finset.sum_eq_single (Finsupp.weight physicalChargeWeights d)]
  · simp
  · intro k _ hk
    simp [Ne.symm hk]
  · intro hnot
    have hz : P.coeff d = 0 := by
      by_contra hd
      apply hnot
      exact Finset.mem_image.mpr ⟨d, MvPolynomial.mem_support_iff.mpr hd, rfl⟩
    simp [hz]

/-- An unconditional decomposition of the actual source, with the finite
index set taken from the original multiplier rather than its expansion. -/
theorem rationalSourcePolynomial_eq_sum_inserted_chargeBlock (power : ℕ) :
    rationalSourcePolynomial power =
      ∑ k ∈ chargeSet (multiplierQ power),
        insertion (rateQ power) (chargeBlock (multiplierQ power) k) := by
  rw [rationalSourcePolynomial_eq_insertion, ← map_sum, sum_chargeBlock]

open Lean Elab Command
run_cmd do
  for target in #[``rationalSourcePolynomial_eq_insertion,
      ``rationalSourcePolynomial_eq_sum_inserted_chargeBlock] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.ActualSourceInsertionLinear
