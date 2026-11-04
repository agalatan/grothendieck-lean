import Grothe.UpperChaos.ActualSourceInsertionLinear
import Grothe.UpperChaos.RationalChargeOrthogonality
import Mathlib.Tactic.Abel

/-!
# Charge reversal under the actual rational coherent insertion

Agent-ID: codex-2ca4. Task #40.

The actual insertion reverses the charge of every homogeneous physical
multiplier, including at a zero rational rate. The proof uses the landed
insertion and rational source definitions.

The proof follows the existing liftedMomentQ coefficient recurrence, then
evaluates it at a homogeneous polynomial. No replacement insertion formula,
analytic Gaussian theorem, or positivity/nonzero premise on r is assumed.
The numerical Laguerre table and covariance diagonalization remain separate.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.ActualSourceInsertionCharge

open MvPolynomial ActualRationalSourcePolynomial ActualSourceInsertionLinear
open RationalChargeOrthogonality ScaledActualCoherentL2

noncomputable section

section GeneralWeight

variable {M : Type*} [AddCommGroup M]

/-- Before evaluation, degree n in the auxiliary polynomial variable carries
the missing n copies of the positive source charge. -/
theorem liftedMomentQ_coeff_homogeneous (w : Fin 8 → M) (a : M)
    (r : ℚ) (B : RationalSourcePolynomial)
    (hB : IsWeightedHomogeneous w B (-a)) (p q n : ℕ) :
    IsWeightedHomogeneous w ((liftedMomentQ r B p q).coeff n)
      (q • a - p • a - n • a) := by
  have hC : IsWeightedHomogeneous w (MvPolynomial.C r⁻¹ : RationalSourcePolynomial) 0 :=
    isWeightedHomogeneous_C w r⁻¹
  induction p generalizing n with
  | zero =>
      rw [liftedMomentQ, ← Polynomial.C_pow, Polynomial.coeff_C_mul_X_pow]
      by_cases hn : n = q
      · subst n
        rw [ite_eq_left (rfl : q = q)]
        simpa only [zero_nsmul, sub_zero, sub_self, nsmul_zero] using hC.pow q
      · rw [ite_eq_right hn]
        exact isWeightedHomogeneous_zero ℚ w _
  | succ p ih =>
      rw [liftedMomentQ, Polynomial.coeff_add, Polynomial.coeff_derivative,
        Polynomial.coeff_C_mul]
      have hNat : IsWeightedHomogeneous w
          ((n : RationalSourcePolynomial) + 1) 0 := by
        simpa only [map_add, map_natCast, map_one] using
          (isWeightedHomogeneous_C w ((n : ℚ) + 1) :
            IsWeightedHomogeneous w
              (MvPolynomial.C ((n : ℚ) + 1) : RationalSourcePolynomial) 0)
      have hd : (q • a - p • a - (n + 1) • a) + 0 =
          q • a - (p + 1) • a - n • a := by
        simp only [add_zero, add_nsmul, one_nsmul]
        abel
      have hm : (0 + -a) + (q • a - p • a - n • a) =
          q • a - (p + 1) • a - n • a := by
        simp only [zero_add, add_nsmul, one_nsmul]
        abel
      have hDerivative : IsWeightedHomogeneous w
          ((liftedMomentQ r B p q).coeff (n + 1) *
            ((n : RationalSourcePolynomial) + 1))
          (q • a - (p + 1) • a - n • a) := by
        simpa only [hd] using (ih (n + 1)).mul hNat
      have hMultiply : IsWeightedHomogeneous w
          ((MvPolynomial.C r⁻¹ * B) * (liftedMomentQ r B p q).coeff n)
          (q • a - (p + 1) • a - n • a) := by
        simpa only [hm] using (hC.mul hB).mul (ih n)
      exact hDerivative.add hMultiply

/-- Evaluation supplies the positive auxiliary charge and reverses the
physical insertion charge. This holds even when the rational rate is zero. -/
theorem insertedPolynomialQ_homogeneous (w : Fin 8 → M) (a : M)
    (r : ℚ) (A B : RationalSourcePolynomial)
    (hA : IsWeightedHomogeneous w A a)
    (hB : IsWeightedHomogeneous w B (-a)) (p q : ℕ) :
    IsWeightedHomogeneous w (insertedPolynomialQ r A B p q) (q • a - p • a) := by
  classical
  unfold insertedPolynomialQ
  rw [Polynomial.eval_eq_sum, Polynomial.sum_def]
  apply IsWeightedHomogeneous.sum
  intro n _hn
  simpa only [sub_add_cancel] using
    (liftedMomentQ_coeff_homogeneous w a r B hB p q n).mul (hA.pow n)

end GeneralWeight

theorem insertedPolynomialQ_homogeneous_int (w : Fin 8 → ℤ)
    (r : ℚ) (A B : RationalSourcePolynomial)
    (hA : IsWeightedHomogeneous w A (1 : ℤ))
    (hB : IsWeightedHomogeneous w B (-1 : ℤ)) (p q : ℕ) :
    IsWeightedHomogeneous w (insertedPolynomialQ r A B p q) ((q : ℤ) - p) := by
  simpa only [Int.nsmul_eq_mul, mul_one] using
    insertedPolynomialQ_homogeneous w (1 : ℤ) r A B hA hB p q

/-- Actual eight-variable source order: (y0,u0,x0,v0,y1,u1,x1,v1). -/
def sourceChargeWeights : Fin 8 → ℤ × ℤ :=
  ![(1, 0), (1, 0), (-1, 0), (-1, 0), (0, 1), (0, 1), (0, -1), (0, -1)]

theorem weight_sourceChargeWeights (e : Fin 8 →₀ ℕ) :
    Finsupp.weight sourceChargeWeights e = sourceCharge e := by
  rw [Finsupp.weight_eq_sum, Fin.sum_univ_eight]
  apply Prod.ext
  · change e 0 • (1 : ℤ) + e 1 • (1 : ℤ) + e 2 • (-1 : ℤ) +
        e 3 • (-1 : ℤ) + e 4 • (0 : ℤ) + e 5 • (0 : ℤ) +
        e 6 • (0 : ℤ) + e 7 • (0 : ℤ) =
      ((e 0 : ℤ) + e 1) - ((e 2 : ℤ) + e 3)
    simp only [Int.nsmul_eq_mul, mul_one, mul_neg_one, mul_zero]
    omega
  · change e 0 • (0 : ℤ) + e 1 • (0 : ℤ) + e 2 • (0 : ℤ) +
        e 3 • (0 : ℤ) + e 4 • (1 : ℤ) + e 5 • (1 : ℤ) +
        e 6 • (-1 : ℤ) + e 7 • (-1 : ℤ) =
      ((e 4 : ℤ) + e 5) - ((e 6 : ℤ) + e 7)
    simp only [Int.nsmul_eq_mul, mul_one, mul_neg_one, mul_zero]
    omega

theorem weight_physicalChargeWeights (s : Fin 4 →₀ ℕ) :
    Finsupp.weight physicalChargeWeights s =
      (((s 0 : ℤ) - s 1), ((s 2 : ℤ) - s 3)) := by
  rw [Finsupp.weight_eq_sum, Fin.sum_univ_four]
  apply Prod.ext
  · change s 0 • (1 : ℤ) + s 1 • (-1 : ℤ) +
        s 2 • (0 : ℤ) + s 3 • (0 : ℤ) = (s 0 : ℤ) - s 1
    simp only [Int.nsmul_eq_mul, mul_one, mul_neg_one, mul_zero]
    omega
  · change s 0 • (0 : ℤ) + s 1 • (0 : ℤ) +
        s 2 • (1 : ℤ) + s 3 • (-1 : ℤ) = (s 2 : ℤ) - s 3
    simp only [Int.nsmul_eq_mul, mul_one, mul_neg_one, mul_zero]
    omega

/-- The existing inserted monomial has exactly the reversed pair of charges. -/
theorem insertedMonomial_homogeneous (r : ℚ) (s : Fin 4 →₀ ℕ) :
    IsWeightedHomogeneous sourceChargeWeights (insertedMonomial r s)
      (-(Finsupp.weight physicalChargeWeights s)) := by
  have hX0 : IsWeightedHomogeneous sourceChargeWeights
      (X 0 : RationalSourcePolynomial) ((1, 0) : ℤ × ℤ) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 0
  have hX1 : IsWeightedHomogeneous sourceChargeWeights
      (X 1 : RationalSourcePolynomial) ((1, 0) : ℤ × ℤ) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 1
  have hX2 : IsWeightedHomogeneous sourceChargeWeights
      (X 2 : RationalSourcePolynomial) (-((1, 0) : ℤ × ℤ)) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 2
  have hX3 : IsWeightedHomogeneous sourceChargeWeights
      (X 3 : RationalSourcePolynomial) (-((1, 0) : ℤ × ℤ)) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 3
  have hX4 : IsWeightedHomogeneous sourceChargeWeights
      (X 4 : RationalSourcePolynomial) ((0, 1) : ℤ × ℤ) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 4
  have hX5 : IsWeightedHomogeneous sourceChargeWeights
      (X 5 : RationalSourcePolynomial) ((0, 1) : ℤ × ℤ) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 5
  have hX6 : IsWeightedHomogeneous sourceChargeWeights
      (X 6 : RationalSourcePolynomial) (-((0, 1) : ℤ × ℤ)) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 6
  have hX7 : IsWeightedHomogeneous sourceChargeWeights
      (X 7 : RationalSourcePolynomial) (-((0, 1) : ℤ × ℤ)) :=
    isWeightedHomogeneous_X ℚ sourceChargeWeights 7
  have h0 := insertedPolynomialQ_homogeneous sourceChargeWeights ((1, 0) : ℤ × ℤ)
    r (X 0 + X 1) (X 2 + X 3) (hX0.add hX1) (hX2.add hX3) (s 0) (s 1)
  have h1 := insertedPolynomialQ_homogeneous sourceChargeWeights ((0, 1) : ℤ × ℤ)
    r (X 4 + X 5) (X 6 + X 7) (hX4.add hX5) (hX6.add hX7) (s 2) (s 3)
  have hd : ((s 1) • ((1, 0) : ℤ × ℤ) - (s 0) • ((1, 0) : ℤ × ℤ)) +
      ((s 3) • ((0, 1) : ℤ × ℤ) - (s 2) • ((0, 1) : ℤ × ℤ)) =
      -(Finsupp.weight physicalChargeWeights s) := by
    rw [weight_physicalChargeWeights]
    apply Prod.ext <;>
      simp [sub_eq_add_neg, add_comm] <;> omega
  simpa only [insertedMonomial, hd] using h0.mul h1

/-- Linearity preserves the charge reversal on an arbitrary homogeneous
physical multiplier, without expanding its inserted source support. -/
theorem insertion_homogeneous (r : ℚ) (P : MultiplierPolynomial) (k : ℤ × ℤ)
    (hP : IsWeightedHomogeneous physicalChargeWeights P k) :
    IsWeightedHomogeneous sourceChargeWeights (insertion r P) (-k) := by
  classical
  rw [insertion_apply]
  apply IsWeightedHomogeneous.sum
  intro s hs
  have hk : Finsupp.weight physicalChargeWeights s = k :=
    hP (MvPolynomial.mem_support_iff.mp hs)
  have h := insertedMonomial_homogeneous r s
  rw [hk] at h
  exact h.C_mul (P.coeff s)

/-- The actual finite charge projection is sent to the reversed source charge. -/
theorem insertion_chargeBlock_homogeneous (r : ℚ) (P : MultiplierPolynomial)
    (k : ℤ × ℤ) :
    IsWeightedHomogeneous sourceChargeWeights (insertion r (chargeBlock P k)) (-k) := by
  apply insertion_homogeneous
  exact MvPolynomial.weightedHomogeneousComponent_isWeightedHomogeneous k P

/-- Support formulation in the same sourceCharge used by the actual Gram
orthogonality theorem. In particular this applies to P = multiplierQ power. -/
theorem sourceCharge_mem_support_inserted_chargeBlock (r : ℚ)
    (P : MultiplierPolynomial) (k : ℤ × ℤ) (e : Fin 8 →₀ ℕ)
    (he : e ∈ (insertion r (chargeBlock P k)).support) :
    sourceCharge e = -k := by
  rw [← weight_sourceChargeWeights]
  exact insertion_chargeBlock_homogeneous r P k (MvPolynomial.mem_support_iff.mp he)

open Lean Elab Command
run_cmd do
  for target in #[``liftedMomentQ_coeff_homogeneous,
      ``insertedPolynomialQ_homogeneous,
      ``insertion_chargeBlock_homogeneous,
      ``sourceCharge_mem_support_inserted_chargeBlock] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.ActualSourceInsertionCharge
