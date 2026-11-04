import Grothe.UpperChaos.OriginalMomentSeedCheckpoints
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Algebra.Order.Ring.Cast
import Mathlib.Tactic.Ring

/-!
# Integer certificates for the original J₀ integral

A common positive scale and parameter denominator convert integer guards
to rational checkpoint inequalities. Concrete checks use multiplication and
comparison only; no growing-denominator Taylor expression is evaluated.

Agent-ID: codex-aa04. Refs #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.OriginalMomentSeedInteger

/-- Rational interpretation of one scaled integer. Not used by the checker. -/
def scaledQ (D a : ℤ) : ℚ := (a : ℚ) / (D : ℚ)

/-- Exact rational parameter. Not used by the checker. -/
def parameterQ (Xnum Xden : ℤ) : ℚ := (Xnum : ℚ) / (Xden : ℚ)

/-- Integer numerator of a signed term update. -/
def factorZ (Xnum : ℤ) (n : ℕ) : ℤ := -Xnum * (2 * (n : ℤ) + 1)

/-- Integer update denominator, including the parameter denominator. -/
def denominatorZ (Xden : ℤ) (n : ℕ) : ℤ :=
  Xden * 2 * ((n : ℤ) + 1) * ((n : ℤ) + 2)

theorem denominatorZ_cast (Xden : ℤ) (n : ℕ) :
    (denominatorZ Xden n : ℚ) = (Xden : ℚ) * OriginalMomentSeedCheckpoints.denominatorQ n := by
  simp only [denominatorZ, OriginalMomentSeedCheckpoints.denominatorQ, Int.cast_mul, Int.cast_add,
    Int.cast_natCast, Int.cast_ofNat, Int.cast_one]
  ring

theorem factorZ_cast_div (Xnum Xden : ℤ) (n : ℕ) :
    (factorZ Xnum n : ℚ) / (Xden : ℚ) = OriginalMomentSeedCheckpoints.factorQ (parameterQ Xnum Xden) n := by
  simp only [factorZ, OriginalMomentSeedCheckpoints.factorQ, parameterQ, Int.cast_mul, Int.cast_neg,
    Int.cast_add, Int.cast_natCast, Int.cast_ofNat, Int.cast_one]
  ring

private theorem scaled_product_eq (a D T q : ℚ) (hT : T ≠ 0) :
    (a / D) * q = (a * (T * q)) / (D * T) := by
  calc
    _ = (a * q) / D := by ring
    _ = ((a * q) * T) / (D * T) := (mul_div_mul_right (a * q) D hT).symm
    _ = _ := by ring

private theorem split_product_eq (f D T b : ℚ) :
    (f / T) * (b / D) = (f * b) / (D * T) := by
  rw [div_mul_div_comm, mul_comm T D]

/-- Clearing D and Xden converts a pair of integer guards into rational guards.
The multiplier need not have a prescribed sign for this algebraic conversion. -/
theorem rational_guards_of_integer (D Xnum Xden : ℤ)
    (hD : 0 < D) (hXden : 0 < Xden) (n : ℕ) (lo hi nextLo nextHi : ℤ)
    (hlower : nextLo * denominatorZ Xden n ≤ factorZ Xnum n * hi)
    (hupper : factorZ Xnum n * lo ≤ nextHi * denominatorZ Xden n) :
    scaledQ D nextLo * OriginalMomentSeedCheckpoints.denominatorQ n ≤
        OriginalMomentSeedCheckpoints.factorQ (parameterQ Xnum Xden) n * scaledQ D hi ∧
      OriginalMomentSeedCheckpoints.factorQ (parameterQ Xnum Xden) n * scaledQ D lo ≤
        scaledQ D nextHi * OriginalMomentSeedCheckpoints.denominatorQ n := by
  have hDQ : (0 : ℚ) < D := (Int.cast_pos (R := ℚ)).mpr hD
  have hXdenQ : (0 : ℚ) < Xden := (Int.cast_pos (R := ℚ)).mpr hXden
  have hcommon : (0 : ℚ) < (D : ℚ) * (Xden : ℚ) := mul_pos hDQ hXdenQ
  have hlQ : ((nextLo * denominatorZ Xden n : ℤ) : ℚ) ≤
      ((factorZ Xnum n * hi : ℤ) : ℚ) := (Int.cast_le (R := ℚ)).mpr hlower
  rw [Int.cast_mul nextLo (denominatorZ Xden n),
    Int.cast_mul (factorZ Xnum n) hi, denominatorZ_cast] at hlQ
  have huQ : ((factorZ Xnum n * lo : ℤ) : ℚ) ≤
      ((nextHi * denominatorZ Xden n : ℤ) : ℚ) := (Int.cast_le (R := ℚ)).mpr hupper
  rw [Int.cast_mul (factorZ Xnum n) lo,
    Int.cast_mul nextHi (denominatorZ Xden n), denominatorZ_cast] at huQ
  constructor
  · calc
      scaledQ D nextLo * OriginalMomentSeedCheckpoints.denominatorQ n =
          ((nextLo : ℚ) * ((Xden : ℚ) * OriginalMomentSeedCheckpoints.denominatorQ n)) /
            ((D : ℚ) * (Xden : ℚ)) :=
        scaled_product_eq _ _ _ _ hXdenQ.ne'
      _ ≤ ((factorZ Xnum n : ℚ) * (hi : ℚ)) / ((D : ℚ) * (Xden : ℚ)) :=
        div_le_div_of_nonneg_right hlQ hcommon.le
      _ = OriginalMomentSeedCheckpoints.factorQ (parameterQ Xnum Xden) n * scaledQ D hi := by
        simpa only [factorZ_cast_div, scaledQ] using
          (split_product_eq (factorZ Xnum n : ℚ) (D : ℚ) (Xden : ℚ) (hi : ℚ)).symm
  · calc
      OriginalMomentSeedCheckpoints.factorQ (parameterQ Xnum Xden) n * scaledQ D lo =
          ((factorZ Xnum n : ℚ) * (lo : ℚ)) / ((D : ℚ) * (Xden : ℚ)) := by
        rw [← factorZ_cast_div]
        exact split_product_eq _ _ _ _
      _ ≤ ((nextHi : ℚ) * ((Xden : ℚ) * OriginalMomentSeedCheckpoints.denominatorQ n)) /
          ((D : ℚ) * (Xden : ℚ)) := div_le_div_of_nonneg_right huQ hcommon.le
      _ = scaledQ D nextHi * OriginalMomentSeedCheckpoints.denominatorQ n :=
        (scaled_product_eq _ _ _ _ hXdenQ.ne').symm

/-- Numerator of the final lower bound, in the same scale as the checkpoints. -/
def lowerBoundZ (N : ℕ) (R : ℤ) (lo : ℕ → ℤ) : ℤ :=
  (∑ n ∈ Finset.range (N + 1), lo n) - R

/-- Numerator of the final upper bound, in the same scale as the checkpoints. -/
def upperBoundZ (N : ℕ) (R : ℤ) (hi : ℕ → ℤ) : ℤ :=
  (∑ n ∈ Finset.range (N + 1), hi n) + R

theorem lowerBoundQ_scaled (N : ℕ) (D R : ℤ) (lo : ℕ → ℤ) :
    OriginalMomentSeedCheckpoints.lowerBoundQ N (scaledQ D R) (fun n => scaledQ D (lo n)) =
      scaledQ D (lowerBoundZ N R lo) := by
  simp only [OriginalMomentSeedCheckpoints.lowerBoundQ, scaledQ, lowerBoundZ, Int.cast_sub,
    Int.cast_sum, sub_div, Finset.sum_div]

theorem upperBoundQ_scaled (N : ℕ) (D R : ℤ) (hi : ℕ → ℤ) :
    OriginalMomentSeedCheckpoints.upperBoundQ N (scaledQ D R) (fun n => scaledQ D (hi n)) =
      scaledQ D (upperBoundZ N R hi) := by
  simp only [OriginalMomentSeedCheckpoints.upperBoundQ, scaledQ, upperBoundZ, Int.cast_add,
    Int.cast_sum, add_div, Finset.sum_div]

/-- The integer conditions imply an enclosure of the actual original J₀ integral. -/
theorem moment_zero_mem_of_integer (N : ℕ) (D Xnum Xden R : ℤ) (lo hi : ℕ → ℤ)
    (hD : 0 < D) (hXden : 0 < Xden) (hXnum : 0 ≤ Xnum)
    (hzero : lo 0 ≤ D ∧ D ≤ hi 0)
    (hsteps : ∀ n, n < N + 1 →
      lo (n + 1) * denominatorZ Xden n ≤ factorZ Xnum n * hi n ∧
      factorZ Xnum n * lo n ≤ hi (n + 1) * denominatorZ Xden n)
    (hterminal : -R ≤ lo (N + 1) ∧ hi (N + 1) ≤ R) :
    (lowerBoundZ N R lo : ℝ) / (D : ℝ) ≤
        OriginalPositiveMoment.moment 0 ((Xnum : ℝ) / (Xden : ℝ)) ∧
      OriginalPositiveMoment.moment 0 ((Xnum : ℝ) / (Xden : ℝ)) ≤
        (upperBoundZ N R hi : ℝ) / (D : ℝ) := by
  have hDQ : (0 : ℚ) < D := (Int.cast_pos (R := ℚ)).mpr hD
  have hXdenQ : (0 : ℚ) < Xden := (Int.cast_pos (R := ℚ)).mpr hXden
  have hXnumQ : (0 : ℚ) ≤ Xnum := Int.cast_nonneg hXnum
  have hx : 0 ≤ parameterQ Xnum Xden := div_nonneg hXnumQ hXdenQ.le
  have hzeroQ : scaledQ D (lo 0) ≤ 1 ∧ 1 ≤ scaledQ D (hi 0) := by
    constructor
    · exact (div_le_one hDQ).mpr ((Int.cast_le (R := ℚ)).mpr hzero.1)
    · exact (one_le_div hDQ).mpr ((Int.cast_le (R := ℚ)).mpr hzero.2)
  have hstepsQ : ∀ n, n < N + 1 →
      scaledQ D (lo (n + 1)) * OriginalMomentSeedCheckpoints.denominatorQ n ≤
          OriginalMomentSeedCheckpoints.factorQ (parameterQ Xnum Xden) n * scaledQ D (hi n) ∧
      OriginalMomentSeedCheckpoints.factorQ (parameterQ Xnum Xden) n * scaledQ D (lo n) ≤
          scaledQ D (hi (n + 1)) * OriginalMomentSeedCheckpoints.denominatorQ n := by
    intro n hn
    have hs := hsteps n hn
    exact rational_guards_of_integer D Xnum Xden hD hXden n
      (lo n) (hi n) (lo (n + 1)) (hi (n + 1)) hs.1 hs.2
  have hterminalQ : -scaledQ D R ≤ scaledQ D (lo (N + 1)) ∧
      scaledQ D (hi (N + 1)) ≤ scaledQ D R := by
    have hl : ((-R : ℤ) : ℚ) ≤ (lo (N + 1) : ℚ) :=
      (Int.cast_le (R := ℚ)).mpr hterminal.1
    have hu : (hi (N + 1) : ℚ) ≤ (R : ℚ) := (Int.cast_le (R := ℚ)).mpr hterminal.2
    constructor
    · have hs := div_le_div_of_nonneg_right hl hDQ.le
      simpa only [scaledQ, Int.cast_neg, neg_div] using hs
    · exact div_le_div_of_nonneg_right hu hDQ.le
  have hm := OriginalMomentSeedCheckpoints.moment_zero_mem_of_checkpoints N (parameterQ Xnum Xden) (scaledQ D R)
    (fun n => scaledQ D (lo n)) (fun n => scaledQ D (hi n)) hx hzeroQ hstepsQ hterminalQ
  rw [lowerBoundQ_scaled, upperBoundQ_scaled] at hm
  simpa only [scaledQ, parameterQ, Rat.cast_div, Rat.cast_intCast] using hm

/-- Finite executable integer-only certificate. No rational normalization occurs here. -/
def certificateOK (N : ℕ) (D Xnum Xden R : ℤ) (lo hi : ℕ → ℤ) : Bool :=
  decide (0 < D ∧ 0 < Xden ∧ 0 ≤ Xnum ∧ lo 0 ≤ D ∧ D ≤ hi 0 ∧
    (∀ n : Fin (N + 1),
      lo (n.val + 1) * denominatorZ Xden n.val ≤ factorZ Xnum n.val * hi n.val ∧
      factorZ Xnum n.val * lo n.val ≤ hi (n.val + 1) * denominatorZ Xden n.val) ∧
    -R ≤ lo (N + 1) ∧ hi (N + 1) ≤ R)

/-- A finite integer check certifies the actual moment, not merely an abstract recurrence. -/
theorem moment_zero_mem_of_certificate (N : ℕ) (D Xnum Xden R : ℤ) (lo hi : ℕ → ℤ)
    (hcheck : certificateOK N D Xnum Xden R lo hi = true) :
    (lowerBoundZ N R lo : ℝ) / (D : ℝ) ≤
        OriginalPositiveMoment.moment 0 ((Xnum : ℝ) / (Xden : ℝ)) ∧
      OriginalPositiveMoment.moment 0 ((Xnum : ℝ) / (Xden : ℝ)) ≤
        (upperBoundZ N R hi : ℝ) / (D : ℝ) := by
  have hc := of_decide_eq_true hcheck
  rcases hc with ⟨hD, hXden, hXnum, hlo, hhi, hsteps, hterminalLo, hterminalHi⟩
  apply moment_zero_mem_of_integer N D Xnum Xden R lo hi hD hXden hXnum ⟨hlo, hhi⟩
  · intro n hn
    exact hsteps ⟨n, hn⟩
  · exact ⟨hterminalLo, hterminalHi⟩

end Grothe.UpperChaos.OriginalMomentSeedInteger

#print axioms Grothe.UpperChaos.OriginalMomentSeedInteger.rational_guards_of_integer
/-- info: 'Grothe.UpperChaos.OriginalMomentSeedInteger.moment_zero_mem_of_integer' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalMomentSeedInteger.moment_zero_mem_of_integer
/-- info: 'Grothe.UpperChaos.OriginalMomentSeedInteger.moment_zero_mem_of_certificate' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalMomentSeedInteger.moment_zero_mem_of_certificate
