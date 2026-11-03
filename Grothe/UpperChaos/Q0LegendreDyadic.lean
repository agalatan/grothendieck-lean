import Grothe.UpperChaos.Q0LegendreRoots
import LeanCert.Core.IntervalDyadic

/-! LeanCert outward-rounded interval evaluation of the actual Legendre
recurrence. Source brackets and weight comparisons are separate inputs.
Agent-ID: codex-aa04. -/

open LeanCert.Core

namespace Grothe.UpperChaos.Q0LegendreInteger

def dyadicInt (n : ℕ) : IntervalDyadic := IntervalDyadic.singleton (LeanCert.Core.Dyadic.ofInt n)

theorem mem_dyadicInt (n : ℕ) : (n : ℝ) ∈ dyadicInt n := by
  simpa [dyadicInt, LeanCert.Core.Dyadic.toRat_ofInt] using
    IntervalDyadic.mem_singleton (LeanCert.Core.Dyadic.ofInt n)

/-- Outward enclosure of the reciprocal of a natural number. -/
def dyadicReciprocal (n : ℕ) : IntervalDyadic :=
  IntervalDyadic.ofIntervalRat (IntervalRat.singleton (1 / (n : ℚ))) (-256)

theorem mem_dyadicReciprocal (n : ℕ) : (1 / (n : ℝ)) ∈ dyadicReciprocal n := by
  apply IntervalDyadic.mem_ofIntervalRat _ (-256) (by decide)
  simpa [dyadicReciprocal] using IntervalRat.mem_singleton (1 / (n : ℚ))

def roundedMul (a b : IntervalDyadic) : IntervalDyadic :=
  (IntervalDyadic.mul a b).roundOut (-256)

def roundedSub (a b : IntervalDyadic) : IntervalDyadic :=
  (IntervalDyadic.sub a b).roundOut (-256)

/-- Pair of outward enclosures for adjacent recurrence values. -/
def dyadicPair (I : IntervalDyadic) : ℕ → IntervalDyadic × IntervalDyadic
  | 0 => (dyadicInt 1, I)
  | k + 1 =>
      let p := dyadicPair I k
      (p.2, roundedMul
        (roundedSub (roundedMul (dyadicInt (2*k+3)) (roundedMul I p.2))
          (roundedMul (dyadicInt (k+1)) p.1))
        (dyadicReciprocal (k+2)))

theorem mem_roundedMul {x y : ℝ} {I J : IntervalDyadic} (hx : x ∈ I) (hy : y ∈ J) :
    x * y ∈ roundedMul I J := IntervalDyadic.roundOut_contains (IntervalDyadic.mem_mul hx hy) _

theorem mem_roundedSub {x y : ℝ} {I J : IntervalDyadic} (hx : x ∈ I) (hy : y ∈ J) :
    x - y ∈ roundedSub I J := IntervalDyadic.roundOut_contains (IntervalDyadic.mem_sub hx hy) _

/-- The interval recurrence encloses both actual real polynomial values. -/
theorem dyadicPair_sound (I : IntervalDyadic) {x : ℝ} (hx : x ∈ I) (k : ℕ) :
    (realPair x k).1 ∈ (dyadicPair I k).1 ∧
      (realPair x k).2 ∈ (dyadicPair I k).2 := by
  induction k with
  | zero => exact ⟨by simpa [realPair, dyadicPair] using mem_dyadicInt 1, by simpa [realPair, dyadicPair] using hx⟩
  | succ k ih =>
      simp only [realPair, dyadicPair]
      constructor
      · exact ih.2
      · have h1 := mem_roundedMul (mem_dyadicInt (2*k+3)) (mem_roundedMul hx ih.2)
        have h2 := mem_roundedMul (mem_dyadicInt (k+1)) ih.1
        have hnum := mem_roundedSub h1 h2
        have hfinal := mem_roundedMul hnum (mem_dyadicReciprocal (k+2))
        simpa [div_eq_mul_inv, mul_assoc] using hfinal

end Grothe.UpperChaos.Q0LegendreInteger
