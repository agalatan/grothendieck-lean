import Grothe.Lower.Basic

/-!
# Finite primal witnesses obstruct low-cost certificates using a fixed cut bank

An exact probability law in a finite relaxation is not a Gaussian cubic. It can,
however, disprove a proposed bound within that relaxation. Here `F` is the table
objective, `G j` a listed valid cut, and `P` a proposed pointwise majorant after
adding nonnegative multiples of the cuts. The numerical instances are externally
replayed by `tools/verify_radial_countermodel.py`; this file proves the separation
argument, not those numerical instances or a Grothendieck endpoint.
-/

namespace Grothe.Lower.PrimalAudit

open Finset

variable {α β : Type*} [Fintype α] [Fintype β]

/-- A law satisfying the listed cuts bounds the cost of every pointwise dual
majorant of its table objective. No realization as a cubic is assumed. -/
theorem primal_le_dual (w : α → ℚ) (hw : ∀ a, 0 ≤ w a)
    (F P : α → ℚ) (G : β → α → ℚ) (μ : β → ℚ) (hμ : ∀ j, 0 ≤ μ j)
    (hcut : ∀ j, 0 ≤ ∑ a, w a * G j a)
    (hpoint : ∀ a, F a + ∑ j, μ j * G j a ≤ P a) :
    ∑ a, w a * F a ≤ ∑ a, w a * P a := by
  have hs := sum_le_sum fun a (_ : a ∈ (univ : Finset α)) =>
    mul_le_mul_of_nonneg_left (hpoint a) (hw a)
  have hid : (∑ a, w a * (F a + ∑ j, μ j * G j a)) =
      (∑ a, w a * F a) + ∑ j, μ j * (∑ a, w a * G j a) := by
    simp_rw [mul_add, sum_add_distrib, mul_sum]
    congr 1
    rw [sum_comm]
    apply sum_congr rfl
    intro j _
    apply sum_congr rfl
    intro a _
    ring
  have hn : 0 ≤ ∑ j, μ j * (∑ a, w a * G j a) :=
    sum_nonneg fun j _ => mul_nonneg (hμ j) (hcut j)
  rw [hid] at hs
  linarith

/-- A strict finite primal value forbids a dual certificate of cost at most `B`.
This concerns the same table and cuts; it does not forbid stronger constraints. -/
theorem no_dual_below_primal (w : α → ℚ) (hw : ∀ a, 0 ≤ w a)
    (F P : α → ℚ) (G : β → α → ℚ) (μ : β → ℚ) (hμ : ∀ j, 0 ≤ μ j)
    (hcut : ∀ j, 0 ≤ ∑ a, w a * G j a)
    (hpoint : ∀ a, F a + ∑ j, μ j * G j a ≤ P a)
    (B : ℚ) (hB : B < ∑ a, w a * F a) :
    B < ∑ a, w a * P a :=
  lt_of_lt_of_le hB (primal_le_dual w hw F P G μ hμ hcut hpoint)

end Grothe.Lower.PrimalAudit
