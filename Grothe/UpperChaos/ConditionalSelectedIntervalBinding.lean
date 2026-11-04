import Grothe.UpperChaos.OriginalRow227ErrorBoundary
import Grothe.UpperChaos.ConditionalNormalizedFiniteChecks
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
Exact selected-record interval bindings.
Every finite check compares an existing checkpoint to that record's signed
center/radius interval on the unchanged 2^768 grid. Table equality is a separate
required premise; a default table value cannot supply it.
Agent-ID: codex-aa04. Refs #293, #21.
-/

namespace Grothe.UpperChaos.ConditionalSelectedIntervalBinding

open LeanCert.Core ConditionalNormalizedFiniteChecks OriginalRow227ErrorBoundary

def centerRadiusInterval (e : ErrorEntry) (hr : 0 ≤ e.radius) : IntervalDyadic :=
  commonExponentInterval (e.center - e.radius) (e.center + e.radius) (-768) (by omega)

def enclosureCheck (e : ErrorEntry) (I : IntervalDyadic) : Bool :=
  if hr : 0 ≤ e.radius then I.subset (centerRadiusInterval e hr) else false

def Enclosed (T : ℕ → ℕ → IntervalDyadic) (e : ErrorEntry) : Prop :=
  (e.center : ℚ) / (2 : ℚ) ^ 768 - (e.radius : ℚ) / (2 : ℚ) ^ 768 ≤
      (T e.c e.d).lo.toRat ∧
    (T e.c e.d).hi.toRat ≤
      (e.center : ℚ) / (2 : ℚ) ^ 768 + (e.radius : ℚ) / (2 : ℚ) ^ 768

def AllEnclosed (T : ℕ → ℕ → IntervalDyadic) (es : List ErrorEntry) : Prop :=
  ∀ e ∈ es, Enclosed T e

theorem common_grid (n : ℤ) :
    (⟨n, -768⟩ : LeanCert.Core.Dyadic).toRat = (n : ℚ) / (2 : ℚ) ^ 768 := by
  rw [LeanCert.Core.Dyadic.toRat_eq]
  change (n : ℚ) * (2 : ℚ) ^ (-(768 : ℤ)) = (n : ℚ) / (2 : ℚ) ^ 768
  rw [zpow_neg, zpow_natCast, div_eq_mul_inv]

theorem enclosed_of_eq_check (T : ℕ → ℕ → IntervalDyadic) (e : ErrorEntry)
    (I : IntervalDyadic) (hT : T e.c e.d = I) (hcheck : enclosureCheck e I = true) :
    Enclosed T e := by
  by_cases hr : 0 ≤ e.radius
  · have hs : I.subset (centerRadiusInterval e hr) = true := by
      simpa only [enclosureCheck, dite_eq_left hr] using hcheck
    have hb := Bool.and_eq_true_iff.mp hs
    have hlo := (LeanCert.Core.Dyadic.le_iff_toRat_le
      (centerRadiusInterval e hr).lo I.lo).mp hb.1
    have hhi := (LeanCert.Core.Dyadic.le_iff_toRat_le
      I.hi (centerRadiusInterval e hr).hi).mp hb.2
    change (⟨e.center - e.radius, -768⟩ : LeanCert.Core.Dyadic).toRat ≤ I.lo.toRat at hlo
    change I.hi.toRat ≤ (⟨e.center + e.radius, -768⟩ : LeanCert.Core.Dyadic).toRat at hhi
    rw [common_grid] at hlo hhi
    rw [Enclosed, hT]
    exact ⟨by simpa only [Int.cast_sub, sub_div] using hlo,
      by simpa only [Int.cast_add, add_div] using hhi⟩
  · simp only [enclosureCheck, dite_eq_right hr] at hcheck

theorem allEnclosed_nil (T : ℕ → ℕ → IntervalDyadic) : AllEnclosed T [] := by
  intro e he
  cases he

theorem allEnclosed_cons {T : ℕ → ℕ → IntervalDyadic} {e : ErrorEntry} {es : List ErrorEntry}
    (he : Enclosed T e) (hes : AllEnclosed T es) : AllEnclosed T (e :: es) := by
  intro a ha
  rcases List.mem_cons.mp ha with rfl | ha
  · exact he
  · exact hes a ha

theorem allEnclosed_append {T : ℕ → ℕ → IntervalDyadic} {xs ys : List ErrorEntry}
    (hx : AllEnclosed T xs) (hy : AllEnclosed T ys) : AllEnclosed T (xs ++ ys) := by
  intro e he
  rcases List.mem_append.mp he with he | he
  · exact hx e he
  · exact hy e he

end Grothe.UpperChaos.ConditionalSelectedIntervalBinding

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.ConditionalSelectedIntervalBinding.common_grid,
      ``Grothe.UpperChaos.ConditionalSelectedIntervalBinding.enclosed_of_eq_check,
      ``Grothe.UpperChaos.ConditionalSelectedIntervalBinding.allEnclosed_nil,
      ``Grothe.UpperChaos.ConditionalSelectedIntervalBinding.allEnclosed_cons,
      ``Grothe.UpperChaos.ConditionalSelectedIntervalBinding.allEnclosed_append] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
