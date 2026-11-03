import Grothe.UpperChaos.Q0LegendreDyadic
import Grothe.UpperChaos.Q0LegendreGap

/-! A kernel-computable LeanCert weight upper-bound checker. The connection
to the original Gauss weights and source arrays remains separate.
Agent-ID: codex-aa04. -/

open LeanCert.Core

namespace Grothe.UpperChaos.Q0LegendreInteger

def weightCheck (k : ℕ) (I : IntervalDyadic) (upper : ℚ) : Bool :=
  let v := intervalGap I.toIntervalRat
  let t := intervalGap (dyadicPair I k).1.toIntervalRat
  decide (0 < t ∧ 0 ≤ upper ∧
    2 * (1 - v ^ 2) ≤ upper * (((k + 1 : ℕ) : ℚ) ^ 2 * t ^ 2))

/-- A successful check bounds the explicit Legendre weight for every point
in the input interval, not merely at its midpoint. -/
theorem weightCheck_sound (k : ℕ) (I : IntervalDyadic) (upper : ℚ)
    (hcheck : weightCheck k I upper = true) {x : ℝ} (hx : x ∈ I) :
    weight k x ≤ (upper : ℝ) := by
  let J := (dyadicPair I k).1.toIntervalRat
  let v := intervalGap I.toIntervalRat
  let t := intervalGap J
  have hc : 0 < t ∧ 0 ≤ upper ∧
      2 * (1 - v ^ 2) ≤ upper * (((k + 1 : ℕ) : ℚ) ^ 2 * t ^ 2) := by
    exact of_decide_eq_true hcheck
  have hx' : x ∈ I.toIntervalRat := IntervalDyadic.mem_toIntervalRat.mp hx
  have hp' : (realPair x k).1 ∈ J :=
    IntervalDyadic.mem_toIntervalRat.mp (dyadicPair_sound I hx k).1
  have hv : (0 : ℝ) ≤ v := by exact_mod_cast intervalGap_nonneg I.toIntervalRat
  have ht : (0 : ℝ) < t := by exact_mod_cast hc.1
  have hu : (0 : ℝ) ≤ upper := by exact_mod_cast hc.2.1
  have hbound : 2 * (1 - (v : ℝ) ^ 2) ≤ (upper : ℝ) *
      (((k + 1 : ℕ) : ℝ) ^ 2 * (t : ℝ) ^ 2) := by
    exact_mod_cast hc.2.2
  exact weight_le_of_gaps k x v t upper hv (intervalGap_le_abs _ hx') ht
    (intervalGap_le_abs _ hp') hu hbound

end Grothe.UpperChaos.Q0LegendreInteger
