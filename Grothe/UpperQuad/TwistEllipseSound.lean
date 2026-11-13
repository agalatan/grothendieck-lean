import Grothe.UpperQuad.TwistEllipseCheck
import Grothe.UpperQuad.IntervalSound

/-!
# Soundness of upper-endpoint selection in the twisted ellipse checker

The rational endpoint comparison used by `TwistEllCheck` agrees with the real interpretation
of a dyadic interval. Taking a maximum preserves every disk upper bound; taking a minimum of
successful candidates preserves a bound when each successful candidate is valid.

These lemmas concern interval selection only. They do not establish the twisted analytic
majorants or the analytic continuation required by the quadrature remainder theorem.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- The executable rational endpoint is the interval's real upper endpoint. -/
theorem upperQ_cast (a : Ival) :
    (upperQ a : ℝ) = (a.hi : ℝ) * (2 : ℝ) ^ a.e := by
  unfold upperQ
  split_ifs with h
  · push_cast
    rw [pow2_cast_zpow, Int.toNat_of_nonneg h]
  · push_cast
    rw [pow2_cast_zpow, Int.toNat_of_nonneg (by omega : 0 ≤ -a.e), zpow_neg, div_inv_eq_mul]

/-- Making the upper endpoint thin does not change its value. -/
@[simp] theorem upperQ_upperI (a : Ival) : upperQ (upperI a) = upperQ a := rfl

/-- Membership in the thin upper-endpoint interval means equality to that endpoint. -/
theorem mem_upperI_iff {x : ℝ} {a : Ival} :
    mem x (upperI a) ↔ x = (upperQ a : ℝ) := by
  rw [upperQ_cast]
  change ((a.hi : ℝ) * (2 : ℝ) ^ a.e ≤ x ∧
    x ≤ (a.hi : ℝ) * (2 : ℝ) ^ a.e) ↔ x = (a.hi : ℝ) * (2 : ℝ) ^ a.e
  exact ⟨fun h ↦ le_antisymm h.2 h.1, fun h ↦ ⟨h.ge, h.le⟩⟩

/-- The real upper endpoint belongs to its thin interval. -/
theorem mem_upperI (a : Ival) : mem (upperQ a : ℝ) (upperI a) :=
  mem_upperI_iff.mpr rfl

/-- Every enclosed real number lies below the executable upper endpoint. -/
theorem le_upperQ_of_mem {x : ℝ} {a : Ival} (h : mem x a) : x ≤ (upperQ a : ℝ) := by
  rw [upperQ_cast]
  exact h.2

/-- The selected maximum has exactly the larger rational upper endpoint. -/
theorem upperQ_maxUpper (a b : Ival) :
    upperQ (maxUpper a b) = max (upperQ a) (upperQ b) := by
  unfold maxUpper
  split_ifs with h
  · rw [upperQ_upperI, max_eq_right h]
  · rw [upperQ_upperI, max_eq_left (not_le.mp h).le]

/-- The maximum dominates the first real upper endpoint. -/
theorem le_maxUpper_left (a b : Ival) :
    (upperQ a : ℝ) ≤ (upperQ (maxUpper a b) : ℝ) := by
  exact_mod_cast (le_max_left _ _).trans_eq (upperQ_maxUpper a b).symm

/-- The maximum dominates the second real upper endpoint. -/
theorem le_maxUpper_right (a b : Ival) :
    (upperQ b : ℝ) ≤ (upperQ (maxUpper a b) : ℝ) := by
  exact_mod_cast (le_max_right _ _).trans_eq (upperQ_maxUpper a b).symm

/-- Taking the maximum preserves both supplied real upper bounds. -/
theorem maxUpper_sound {x y : ℝ} {a b : Ival}
    (hx : x ≤ (upperQ a : ℝ)) (hy : y ≤ (upperQ b : ℝ)) :
    max x y ≤ (upperQ (maxUpper a b) : ℝ) :=
  max_le (hx.trans (le_maxUpper_left a b)) (hy.trans (le_maxUpper_right a b))

/-- With two successful candidates, the result has the smaller upper endpoint. -/
theorem upperQ_minResult {a b r : Ival} (h : minResult (some a) (some b) = some r) :
    upperQ r = min (upperQ a) (upperQ b) := by
  simp only [minResult] at h
  split_ifs at h with hab
  · have hr : upperI a = r := Option.some.inj h
    rw [← hr, upperQ_upperI, min_eq_left hab]
  · have hr : upperI b = r := Option.some.inj h
    rw [← hr, upperQ_upperI, min_eq_right (not_le.mp hab).le]

/-- Selecting among valid successful candidates preserves their common real bound.
No premise is required of a failed candidate. -/
theorem minResult_sound {a b : Option Ival} {r : Ival} {x : ℝ}
    (ha : ∀ u, a = some u → x ≤ (upperQ u : ℝ))
    (hb : ∀ u, b = some u → x ≤ (upperQ u : ℝ))
    (h : minResult a b = some r) : x ≤ (upperQ r : ℝ) := by
  cases a with
  | none =>
    cases b with
    | none => simp [minResult] at h
    | some b =>
      obtain rfl : b = r := Option.some.inj h
      exact hb b rfl
  | some a =>
    cases b with
    | none =>
      obtain rfl : a = r := Option.some.inj h
      exact ha a rfl
    | some b =>
      simp only [minResult] at h
      split_ifs at h with hab
      · obtain rfl : upperI a = r := Option.some.inj h
        exact ha a rfl
      · obtain rfl : upperI b = r := Option.some.inj h
        exact hb b rfl

end Grothe.UpperQuad.TwistEllCheck
