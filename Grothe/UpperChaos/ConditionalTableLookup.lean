import Grothe.UpperChaos.ConditionalNormalizedFiniteChecks
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
Bounded, exact partial-table lookup.
The data generator reuses named intervals in at-most-32-entry arrays. Balanced
dispatch only selects an existing row/block. Successful lookup is mandatory for
every use of the total extension; its outside-domain value proves no enclosure.
Agent-ID: codex-aa04. Refs #293, #21.
-/

namespace Grothe.UpperChaos.ConditionalTableLookup

open LeanCert.Core ConditionalNormalizedFiniteChecks

def segment {α : Type*} (first : ℕ) (values : Array α) (d : ℕ) : Option α :=
  if h : first ≤ d ∧ d < first + values.size then
    some (values[d - first]'(by omega))
  else none

def ExactDomain {α : Type*} (lookup : ℕ → Option α) (first past : ℕ) : Prop :=
  ∀ d, (∃ value, lookup d = some value) ↔ first ≤ d ∧ d < past

theorem segment_domain {α : Type*} (first : ℕ) (values : Array α) :
    ExactDomain (segment first values) first (first + values.size) := by
  intro d
  by_cases h : first ≤ d ∧ d < first + values.size
  · constructor
    · intro _
      exact h
    · intro _
      exact ⟨values[d - first]'(by omega), by rw [segment, dite_eq_left h]⟩
  · constructor
    · rintro ⟨value, hv⟩
      rw [segment, dite_eq_right h] at hv
      cases hv
    · intro hd
      exact (h hd).elim

theorem segment_get {α : Type*} (first : ℕ) (values : Array α)
    (i : Fin values.size) :
    segment first values (first + i.val) = some values[i.val] := by
  have hi := i.isLt
  have h : first ≤ first + i.val ∧ first + i.val < first + values.size := by omega
  have heq : first + i.val - first = i.val := by omega
  simp only [segment, dite_eq_left h, heq]

def split {α : Type*} (cut : ℕ) (left right : ℕ → α) (x : ℕ) : α :=
  if x < cut then left x else right x

theorem split_left {α : Type*} (cut : ℕ) (left right : ℕ → α)
    {x : ℕ} (hx : x < cut) : split cut left right x = left x := by
  exact ite_eq_left hx

theorem split_right {α : Type*} (cut : ℕ) (left right : ℕ → α)
    {x : ℕ} (hx : ¬ x < cut) : split cut left right x = right x := by
  exact ite_eq_right hx

theorem split_domain {α : Type*} {first cut past : ℕ}
    {left right : ℕ → Option α} (hfirst : first ≤ cut) (hpast : cut ≤ past)
    (hl : ExactDomain left first cut) (hr : ExactDomain right cut past) :
    ExactDomain (split cut left right) first past := by
  intro x
  by_cases hx : x < cut
  · rw [split_left cut left right hx, hl x]
    omega
  · rw [split_right cut left right hx, hr x]
    omega

def row {α : Type*} (c : ℕ) (lookup : ℕ → Option α)
    (x d : ℕ) : Option α := if x = c then lookup d else none

def ExactTriangleSlice {α : Type*} (M first past : ℕ)
    (lookup : ℕ → ℕ → Option α) : Prop :=
  ∀ c d, (∃ value, lookup c d = some value) ↔
    first ≤ c ∧ c < past ∧ c ≤ d + 1 ∧ c + d < M

theorem row_domain {α : Type*} {M c : ℕ} {lookup : ℕ → Option α}
    (hc : c < M) (hlookup : ExactDomain lookup (c - 1) (M - c)) :
    ExactTriangleSlice M c (c + 1) (row c lookup) := by
  intro x d
  by_cases hx : x = c
  · subst x
    rw [row, ite_eq_left rfl, hlookup d]
    omega
  · rw [row, ite_eq_right hx]
    constructor
    · rintro ⟨value, hv⟩
      cases hv
    · intro hd
      have hxc : x = c := by omega
      exact (hx hxc).elim

theorem split_triangle_domain {α : Type*} {M first cut past : ℕ}
    {left right : ℕ → ℕ → Option α}
    (hfirst : first ≤ cut) (hpast : cut ≤ past)
    (hl : ExactTriangleSlice M first cut left)
    (hr : ExactTriangleSlice M cut past right) :
    ExactTriangleSlice M first past (split cut left right) := by
  intro c d
  by_cases hc : c < cut
  · rw [split_left cut left right hc, hl c d]
    omega
  · rw [split_right cut left right hc, hr c d]
    omega

/-- A total function is required by `FiniteChecks`. The `none` branch is used
only outside the exact triangle; all numerical bindings require `some`. -/
def totalize (lookup : ℕ → ℕ → Option IntervalDyadic) (c d : ℕ) : IntervalDyadic :=
  match lookup c d with
  | some value => value
  | none => ConditionalNormalizedDyadic.integerInterval 0

theorem totalize_of_some {lookup : ℕ → ℕ → Option IntervalDyadic}
    {c d : ℕ} {value : IntervalDyadic} (h : lookup c d = some value) :
    totalize lookup c d = value := by
  simp only [totalize, h]

end Grothe.UpperChaos.ConditionalTableLookup

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.ConditionalTableLookup.segment_domain,
      ``Grothe.UpperChaos.ConditionalTableLookup.segment_get,
      ``Grothe.UpperChaos.ConditionalTableLookup.split_left,
      ``Grothe.UpperChaos.ConditionalTableLookup.split_right,
      ``Grothe.UpperChaos.ConditionalTableLookup.split_domain,
      ``Grothe.UpperChaos.ConditionalTableLookup.row_domain,
      ``Grothe.UpperChaos.ConditionalTableLookup.split_triangle_domain,
      ``Grothe.UpperChaos.ConditionalTableLookup.totalize_of_some] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
