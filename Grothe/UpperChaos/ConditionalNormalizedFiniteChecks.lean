import Grothe.UpperChaos.ConditionalNormalizedCertificate
import Mathlib.Data.List.FinRange

/-!
# Bounded extraction of normalized coefficient checks

Arrays and finite index ranges are the computational boundary. Concrete
certificates prove closed Boolean equalities with `decide`; the lemmas here
extract local guards without normalizing membership in a concrete data list.
The finite bridge covers the same indices as `LocalChecks`, including the
empty triangle, and keeps denominator positivity explicit.

Agent-ID: codex-aa04. Refs #293, #21.
-/

open LeanCert.Core

namespace Grothe.UpperChaos.ConditionalNormalizedFiniteChecks

open ConditionalNormalizedDyadic ConditionalNormalizedCertificate

/-- Raw common-exponent endpoints need only an integer order proof. -/
def commonExponentInterval (lo hi exp : ℤ) (h : lo ≤ hi) : IntervalDyadic where
  lo := ⟨lo, exp⟩
  hi := ⟨hi, exp⟩
  le := by
    rw [LeanCert.Core.Dyadic.toRat_eq, LeanCert.Core.Dyadic.toRat_eq]
    exact mul_le_mul_of_nonneg_right (Int.cast_le.mpr h)
      (le_of_lt (zpow_pos (by decide : (0 : ℚ) < 2) exp))

theorem commonExponentInterval_pos {lo hi exp : ℤ} (h : lo ≤ hi) (hlo : 0 < lo) :
    0 < (commonExponentInterval lo hi exp h).lo.toRat := by
  rw [LeanCert.Core.Dyadic.toRat_eq]
  exact mul_pos (Int.cast_pos.mpr hlo) (zpow_pos (by decide : (0 : ℚ) < 2) exp)

/-- A block check uses a finite data container, with no unbounded quantifier. -/
def blockCheck {α : Type*} (check : α → Bool) (entries : Array α) : Bool :=
  entries.all check

/-- Index extraction does not evaluate a concrete membership proposition. -/
theorem blockCheck_get {α : Type*} (check : α → Bool) (entries : Array α)
    (hcheck : blockCheck check entries = true) (i : Fin entries.size) :
    check entries[i.val] = true :=
  (Array.all_eq_true.mp hcheck) i.val i.isLt

def listCheck {α : Type*} (check : α → Bool) (entries : List α) : Bool :=
  entries.all check

theorem listCheck_get {α : Type*} (check : α → Bool) (entries : List α)
    (hcheck : listCheck check entries = true) (i : Fin entries.length) :
    check entries[i.val] = true :=
  (List.all_eq_true.mp hcheck) _ (List.getElem_mem i.isLt)

/-- A finite function can also be checked without quantifying over all naturals. -/
def finCheck {n : ℕ} (check : Fin n → Bool) : Bool :=
  (List.finRange n).all check

theorem finCheck_sound {n : ℕ} {check : Fin n → Bool}
    (hcheck : finCheck check = true) (i : Fin n) : check i = true :=
  (List.all_eq_true.mp hcheck) i (List.mem_finRange i)

/-- Assemble a finite check from local guards, including guards extracted
from separately certified blocks. -/
theorem finCheck_of_forall {n : ℕ} {check : Fin n → Bool}
    (hcheck : ∀ i, check i = true) : finCheck check = true :=
  List.all_eq_true.mpr (fun i _ => hcheck i)

/-- A zero-row entry retains the signed input and the positive denominator. -/
structure ZeroEntry (prec : ℤ) where
  IA : IntervalDyadic
  IR : IntervalDyadic
  IS : IntervalDyadic
  IU : IntervalDyadic
  next : IntervalDyadic
  hS : 0 < IS.lo.toRat

def ZeroEntry.check {prec : ℤ} (entry : ZeroEntry prec) : Bool :=
  zeroStepOK prec entry.IA entry.IR entry.IS entry.IU entry.next entry.hS

theorem ZeroEntry.mem_of_check {prec : ℤ} (entry : ZeroEntry prec)
    (hprec : prec ≤ 0) {A r s u : ℝ}
    (hA : A ∈ entry.IA) (hr : r ∈ entry.IR)
    (hs : s ∈ entry.IS) (hu : u ∈ entry.IU)
    (hcheck : entry.check = true) : ((-A) * r / s) * u ∈ entry.next :=
  zeroStep_mem_of_check hprec entry.hS hA hr hs hu hcheck

/-- A forward entry uses integer charge and both denominator guards. -/
structure ForwardEntry (prec : ℤ) where
  charge : ℤ
  IA : IntervalDyadic
  ID : IntervalDyadic
  IC : IntervalDyadic
  Inext : IntervalDyadic
  Icur : IntervalDyadic
  output : IntervalDyadic
  hC : 0 < IC.lo.toRat
  hAC : 0 < (roundedMul prec IA IC).lo.toRat

def ForwardEntry.check {prec : ℤ} (entry : ForwardEntry prec) : Bool :=
  forwardStepOK prec entry.charge entry.IA entry.ID entry.IC entry.Inext entry.Icur
    entry.output entry.hC entry.hAC

theorem ForwardEntry.mem_of_check {prec : ℤ} (entry : ForwardEntry prec)
    (hprec : prec ≤ 0) {A sd sc uNext uCur : ℝ}
    (hA : A ∈ entry.IA) (hd : sd ∈ entry.ID) (hc : sc ∈ entry.IC)
    (hn : uNext ∈ entry.Inext) (hu : uCur ∈ entry.Icur)
    (hcheck : entry.check = true) :
    (sd / sc) * uNext + ((entry.charge : ℝ) / (A * sc)) * uCur ∈ entry.output :=
  forwardStep_mem_of_check hprec entry.charge entry.hC entry.hAC hA hd hc hn hu hcheck

/-- Invalid denominators fail the check; out-of-domain indices impose no guard. -/
def zeroCheckAt (prec : ℤ) (M : ℕ) (IA : IntervalDyadic)
    (R S : ℕ → IntervalDyadic) (T : ℕ → ℕ → IntervalDyadic) (d : Fin M) : Bool :=
  if d.val + 1 < M then
    if hS : 0 < (S (d.val + 1)).lo.toRat then
      zeroStepOK prec IA (R d.val) (S (d.val + 1)) (T 0 d.val) (T 0 (d.val + 1)) hS
    else false
  else true

def forwardCheckAt (prec : ℤ) (M : ℕ) (IA : IntervalDyadic)
    (S : ℕ → IntervalDyadic) (T : ℕ → ℕ → IntervalDyadic) (c d : Fin M) : Bool :=
  if c.val + 1 ≤ d.val + 1 ∧ c.val + 1 + d.val < M then
    if hC : 0 < (S (c.val + 1)).lo.toRat then
      if hAC : 0 < (roundedMul prec IA (S (c.val + 1))).lo.toRat then
        forwardStepOK prec (charge c.val d.val) IA (S (d.val + 1)) (S (c.val + 1))
          (T c.val (d.val + 1)) (T c.val d.val) (T (c.val + 1) d.val) hC hAC
      else false
    else false
  else true

/-- Six finite Boolean certificates suffice for the natural-indexed interface.
Each field may be assembled from separately checked finite blocks. Only these
closed Boolean equalities, never `LocalChecks` itself, need computation. -/
structure FiniteChecks (prec : ℤ) (M : ℕ) (IA : IntervalDyadic)
    (R S : ℕ → IntervalDyadic) (T : ℕ → ℕ → IntervalDyadic) : Prop where
  roots : finCheck (fun n : Fin M =>
    if 0 < n.val then sqrtCheck n.val (S n.val) else true) = true
  rootPos : finCheck (fun n : Fin M => decide (0 < n.val → 0 < (S n.val).lo.toRat)) = true
  productPos : finCheck (fun c : Fin M =>
    decide (c.val + 1 < M → 0 < (roundedMul prec IA (S (c.val + 1))).lo.toRat)) = true
  base : (if 0 < M then (integerInterval 1).subset (T 0 0) else true) = true
  zero : finCheck (zeroCheckAt prec M IA R S T) = true
  forward : finCheck (fun c : Fin M => finCheck (forwardCheckAt prec M IA S T c)) = true

theorem FiniteChecks.toLocalChecks {prec : ℤ} {M : ℕ} {IA : IntervalDyadic}
    {R S : ℕ → IntervalDyadic} {T : ℕ → ℕ → IntervalDyadic}
    (checks : FiniteChecks prec M IA R S T) : LocalChecks prec M IA R S T := by
  have hroot : ∀ n, 0 < n → n < M → 0 < (S n).lo.toRat := by
    intro n hn hnM
    exact (of_decide_eq_true (finCheck_sound checks.rootPos ⟨n, hnM⟩)) hn
  have hproduct : ∀ c, c + 1 < M →
      0 < (roundedMul prec IA (S (c + 1))).lo.toRat := by
    intro c hc
    exact (of_decide_eq_true (finCheck_sound checks.productPos ⟨c, by omega⟩)) hc
  refine {
    roots := ?_
    rootPos := hroot
    productPos := hproduct
    base := ?_
    zero := ?_
    forward := ?_
  }
  · intro n hn hnM
    simpa only [ite_eq_left hn] using finCheck_sound checks.roots ⟨n, hnM⟩
  · intro hM
    simpa only [ite_eq_left hM] using checks.base
  · intro d hd
    have hS := hroot (d + 1) (by omega) hd
    have h := finCheck_sound checks.zero ⟨d, by omega⟩
    simpa only [zeroCheckAt, ite_eq_left hd, dite_eq_left hS] using h
  · intro c d hcd hsum
    have hC := hroot (c + 1) (by omega) (by omega)
    have hAC := hproduct c (by omega)
    have h := finCheck_sound
      (finCheck_sound checks.forward ⟨c, by omega⟩) ⟨d, by omega⟩
    simpa only [forwardCheckAt, ite_eq_left (And.intro hcd hsum), dite_eq_left hC,
      dite_eq_left hAC]
      using h

end Grothe.UpperChaos.ConditionalNormalizedFiniteChecks
