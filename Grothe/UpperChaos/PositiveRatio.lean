import Mathlib.Basic.Real.Basic

import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity

/-! Elementary order facts for a positive moment-ratio recurrence.
The connection to the integral moments and any numerical enclosure is not
asserted here. Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.PositiveRatio

noncomputable section

def denominator (h : ℕ) (x r : ℝ) : ℝ := (h : ℝ) + 2 + x - x * r

def next (h : ℕ) (x r : ℝ) : ℝ := ((h : ℝ) + 1 / 2) / denominator h x r

theorem denominator_pos (h : ℕ) {x r : ℝ} (hx : 0 ≤ x) (hr : r ≤ 1) :
    0 < denominator h x r := by
  have hnat : (0 : ℝ) ≤ h := Nat.cast_nonneg h
  have hprod : 0 ≤ x * (1 - r) := mul_nonneg hx (sub_nonneg.mpr hr)
  unfold denominator
  nlinarith

theorem next_mem_unit (h : ℕ) {x r : ℝ} (hx : 0 ≤ x) (hr : r ≤ 1) :
    0 ≤ next h x r ∧ next h x r ≤ 1 := by
  have hd := denominator_pos h hx hr
  have hnat : (0 : ℝ) ≤ h := Nat.cast_nonneg h
  have hprod : 0 ≤ x * (1 - r) := mul_nonneg hx (sub_nonneg.mpr hr)
  have hn : (0 : ℝ) ≤ (h : ℝ) + 1 / 2 := by linarith
  have hle : (h : ℝ) + 1 / 2 ≤ denominator h x r := by
    unfold denominator
    nlinarith
  unfold next
  exact ⟨div_nonneg hn hd.le, (div_le_one hd).2 hle⟩

theorem next_monotone (h : ℕ) {x r s : ℝ} (hx : 0 ≤ x)
    (hrs : r ≤ s) (hs : s ≤ 1) : next h x r ≤ next h x s := by
  have hdr := denominator_pos h hx (hrs.trans hs)
  have hds := denominator_pos h hx hs
  have hnat : (0 : ℝ) ≤ h := Nat.cast_nonneg h
  have hn : (0 : ℝ) ≤ (h : ℝ) + 1 / 2 := by linarith
  have hden : denominator h x s ≤ denominator h x r := by
    have hmul := mul_le_mul_of_nonneg_left hrs hx
    unfold denominator
    linarith
  unfold next
  exact div_le_div_of_nonneg_left hn hds hden


/-- One exact interval step encloses every intermediate ratio. -/
theorem next_interval (h : ℕ) {x lo r hi : ℝ} (hx : 0 ≤ x)
    (hlr : lo ≤ r) (hrh : r ≤ hi) (hhi : hi ≤ 1) :
    next h x lo ≤ next h x r ∧ next h x r ≤ next h x hi :=
  ⟨next_monotone h hx hlr (hrh.trans hhi), next_monotone h hx hrh hhi⟩

/-- Finite downward recurrence, from a terminal ratio to index `h`.
No integral identity or numerical value for the terminal ratio is asserted. -/
def backward (x : ℝ) : ℕ → ℕ → ℝ → ℝ
  | 0, _, terminal => terminal
  | n + 1, h, terminal => next h x (backward x n (h + 1) terminal)

theorem backward_mem_unit {x terminal : ℝ} (hx : 0 ≤ x)
    (ht : 0 ≤ terminal ∧ terminal ≤ 1) :
    ∀ n h, 0 ≤ backward x n h terminal ∧ backward x n h terminal ≤ 1 := by
  intro n
  induction n with
  | zero => intro h; exact ht
  | succ n ih =>
    intro h
    exact next_mem_unit h hx (ih (h + 1)).2

theorem backward_monotone {x lo hi : ℝ} (hx : 0 ≤ x)
    (hlo : 0 ≤ lo) (hle : lo ≤ hi) (hhi : hi ≤ 1) :
    ∀ n h, backward x n h lo ≤ backward x n h hi := by
  have hhi0 : 0 ≤ hi := hlo.trans hle
  intro n
  induction n with
  | zero => intro h; exact hle
  | succ n ih =>
    intro h
    exact next_monotone h hx (ih (h + 1))
      (backward_mem_unit hx ⟨hhi0, hhi⟩ n (h + 1)).2

/-- Starting from any valid terminal ratio, the downward recursion lies between
its two endpoint evaluations. -/
theorem backward_interval {x lo terminal hi : ℝ} (hx : 0 ≤ x)
    (hlo : 0 ≤ lo) (hlt : lo ≤ terminal) (hth : terminal ≤ hi) (hhi : hi ≤ 1)
    (n h : ℕ) :
    backward x n h lo ≤ backward x n h terminal ∧
      backward x n h terminal ≤ backward x n h hi := by
  have ht0 : 0 ≤ terminal := hlo.trans hlt
  exact ⟨backward_monotone hx hlo hlt (hth.trans hhi) n h,
    backward_monotone hx ht0 hth hhi n h⟩

end
end Grothe.UpperChaos.PositiveRatio

#print axioms Grothe.UpperChaos.PositiveRatio.denominator_pos
#print axioms Grothe.UpperChaos.PositiveRatio.next_mem_unit
#print axioms Grothe.UpperChaos.PositiveRatio.next_monotone

#print axioms Grothe.UpperChaos.PositiveRatio.backward_interval
