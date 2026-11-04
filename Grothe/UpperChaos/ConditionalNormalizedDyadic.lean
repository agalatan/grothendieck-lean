import LeanCert.Core.IntervalDyadic
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-!
# LeanCert operations for signed normalized coefficient checkpoints

Certificate infrastructure for the actual row227 selected-vector check.

The zero-row and forward-charge updates use outward-rounded LeanCert interval
operations. A checkpoint is accepted only when the computed interval is
contained in its recorded interval. All intermediate quantities retain their
signs; the charge is an integer, never truncated natural subtraction.

Positive denominator intervals are explicit obligations. Square-root leaves
are checked by exact squared inequalities. No finite transcript, original
saved-word table, physical parameter or final row radius is asserted here.

Agent-ID: codex-aa04. Refs #293, #21.
-/

open LeanCert.Core

namespace Grothe.UpperChaos.ConditionalNormalizedDyadic

/-- Rounding after each product keeps a fixed dyadic precision. -/
def roundedMul (prec : ℤ) (I J : IntervalDyadic) : IntervalDyadic :=
  (IntervalDyadic.mul I J).roundOut prec

def roundedAdd (prec : ℤ) (I J : IntervalDyadic) : IntervalDyadic :=
  (IntervalDyadic.add I J).roundOut prec

theorem mem_roundedMul {prec : ℤ} {x y : ℝ} {I J : IntervalDyadic}
    (hx : x ∈ I) (hy : y ∈ J) : x * y ∈ roundedMul prec I J :=
  IntervalDyadic.roundOut_contains (IntervalDyadic.mem_mul hx hy) prec

theorem mem_roundedAdd {prec : ℤ} {x y : ℝ} {I J : IntervalDyadic}
    (hx : x ∈ I) (hy : y ∈ J) : x + y ∈ roundedAdd prec I J :=
  IntervalDyadic.roundOut_contains (IntervalDyadic.mem_add hx hy) prec

/-- The reciprocal uses the reversed endpoints of a positive interval. -/
def positiveReciprocal (prec : ℤ) (I : IntervalDyadic) (hI : 0 < I.lo.toRat) :
    IntervalDyadic :=
  IntervalDyadic.ofIntervalRat
    ⟨I.hi.toRat⁻¹, I.lo.toRat⁻¹, inv_anti₀ hI I.le⟩ prec

theorem mem_positiveReciprocal {prec : ℤ} (hprec : prec ≤ 0)
    {x : ℝ} {I : IntervalDyadic} (hI : 0 < I.lo.toRat) (hx : x ∈ I) :
    x⁻¹ ∈ positiveReciprocal prec I hI := by
  have hlo : (0 : ℝ) < (I.lo.toRat : ℝ) := (Rat.cast_pos (K := ℝ)).mpr hI
  have hxpos : 0 < x := hlo.trans_le hx.1
  apply IntervalDyadic.mem_ofIntervalRat (prec := prec) (hprec := hprec)
  change ((I.hi.toRat⁻¹ : ℚ) : ℝ) ≤ x⁻¹ ∧ x⁻¹ ≤ ((I.lo.toRat⁻¹ : ℚ) : ℝ)
  rw [Rat.cast_inv, Rat.cast_inv]
  exact ⟨inv_anti₀ hxpos hx.2, inv_anti₀ hlo hx.1⟩

def roundedDiv (prec : ℤ) (I J : IntervalDyadic) (hJ : 0 < J.lo.toRat) :
    IntervalDyadic :=
  roundedMul prec I (positiveReciprocal prec J hJ)

theorem mem_roundedDiv {prec : ℤ} (hprec : prec ≤ 0)
    {x y : ℝ} {I J : IntervalDyadic} (hJ : 0 < J.lo.toRat)
    (hx : x ∈ I) (hy : y ∈ J) : x / y ∈ roundedDiv prec I J hJ := by
  simpa only [div_eq_mul_inv] using
    mem_roundedMul hx (mem_positiveReciprocal hprec hJ hy)

/-- LeanCert's Boolean containment check promotes a computed interval to its
recorded checkpoint without evaluating the actual real number. -/
theorem mem_of_subset {I J : IntervalDyadic} (hcheck : I.subset J = true)
    {x : ℝ} (hx : x ∈ I) : x ∈ J := by
  have h := Bool.and_eq_true_iff.mp hcheck
  have hlo := (Dyadic.le_iff_toRat_le J.lo I.lo).mp h.1
  have hhi := (Dyadic.le_iff_toRat_le I.hi J.hi).mp h.2
  exact ⟨((Rat.cast_le (K := ℝ)).mpr hlo).trans hx.1,
    hx.2.trans ((Rat.cast_le (K := ℝ)).mpr hhi)⟩

def integerInterval (z : ℤ) : IntervalDyadic :=
  IntervalDyadic.singleton (Dyadic.ofInt z)

theorem mem_integerInterval (z : ℤ) : (z : ℝ) ∈ integerInterval z := by
  simpa only [integerInterval, Dyadic.toRat_ofInt, Rat.cast_intCast] using
    IntervalDyadic.mem_singleton (Dyadic.ofInt z)

/-- No square-root approximation is trusted: both endpoint squares are checked. -/
def sqrtCheck (n : ℕ) (I : IntervalDyadic) : Bool :=
  decide (0 ≤ I.lo.toRat ∧ I.lo.toRat ^ 2 ≤ (n : ℚ) ∧ (n : ℚ) ≤ I.hi.toRat ^ 2)

theorem sqrt_mem_of_check (n : ℕ) (I : IntervalDyadic)
    (hcheck : sqrtCheck n I = true) : Real.sqrt (n : ℝ) ∈ I := by
  have h := of_decide_eq_true hcheck
  have hlo : (0 : ℝ) ≤ (I.lo.toRat : ℝ) := (Rat.cast_nonneg (K := ℝ)).mpr h.1
  have hhi : (0 : ℝ) ≤ (I.hi.toRat : ℝ) :=
    hlo.trans ((Rat.cast_le (K := ℝ)).mpr I.le)
  have hl : (I.lo.toRat : ℝ) ^ 2 ≤ (n : ℝ) := by exact_mod_cast h.2.1
  have hu : (n : ℝ) ≤ (I.hi.toRat : ℝ) ^ 2 := by exact_mod_cast h.2.2
  exact ⟨(Real.le_sqrt hlo (Nat.cast_nonneg n)).mpr hl, (Real.sqrt_le_left hhi).mpr hu⟩

/-- The signed zero-row update. The input interval U is used with its sign. -/
def zeroStep (prec : ℤ) (IA IR IS IU : IntervalDyadic)
    (hS : 0 < IS.lo.toRat) : IntervalDyadic :=
  roundedDiv prec
    (roundedMul prec (roundedMul prec (IntervalDyadic.neg IA) IR) IU) IS hS

theorem zeroStep_sound {prec : ℤ} (hprec : prec ≤ 0)
    {A r s u : ℝ} {IA IR IS IU : IntervalDyadic} (hS : 0 < IS.lo.toRat)
    (hA : A ∈ IA) (hr : r ∈ IR) (hs : s ∈ IS) (hu : u ∈ IU) :
    ((-A) * r / s) * u ∈ zeroStep prec IA IR IS IU hS := by
  have h := mem_roundedDiv hprec hS
    (mem_roundedMul (mem_roundedMul (IntervalDyadic.mem_neg hA) hr) hu) hs
  have he : ((-A) * r / s) * u = (((-A) * r) * u) / s := by ring
  rw [he]
  exact h

def zeroStepOK (prec : ℤ) (IA IR IS IU next : IntervalDyadic)
    (hS : 0 < IS.lo.toRat) : Bool :=
  (zeroStep prec IA IR IS IU hS).subset next

theorem zeroStep_mem_of_check {prec : ℤ} (hprec : prec ≤ 0)
    {A r s u : ℝ} {IA IR IS IU next : IntervalDyadic} (hS : 0 < IS.lo.toRat)
    (hA : A ∈ IA) (hr : r ∈ IR) (hs : s ∈ IS) (hu : u ∈ IU)
    (hcheck : zeroStepOK prec IA IR IS IU next hS = true) :
    ((-A) * r / s) * u ∈ next :=
  mem_of_subset hcheck (zeroStep_sound hprec hS hA hr hs hu)

/-- The coefficient of the second summand is an integer charge. Its sign
does not affect soundness of interval multiplication. -/
def forwardStep (prec : ℤ) (charge : ℤ)
    (IA ID IC Inext Icur : IntervalDyadic)
    (hC : 0 < IC.lo.toRat) (hAC : 0 < (roundedMul prec IA IC).lo.toRat) :
    IntervalDyadic :=
  roundedAdd prec
    (roundedMul prec (roundedDiv prec ID IC hC) Inext)
    (roundedMul prec
      (roundedDiv prec (integerInterval charge) (roundedMul prec IA IC) hAC) Icur)

theorem forwardStep_sound {prec : ℤ} (hprec : prec ≤ 0) (charge : ℤ)
    {A sd sc uNext uCur : ℝ} {IA ID IC Inext Icur : IntervalDyadic}
    (hC : 0 < IC.lo.toRat) (hAC : 0 < (roundedMul prec IA IC).lo.toRat)
    (hA : A ∈ IA) (hd : sd ∈ ID) (hc : sc ∈ IC)
    (hn : uNext ∈ Inext) (hu : uCur ∈ Icur) :
    (sd / sc) * uNext + ((charge : ℝ) / (A * sc)) * uCur ∈
      forwardStep prec charge IA ID IC Inext Icur hC hAC :=
  mem_roundedAdd
    (mem_roundedMul (mem_roundedDiv hprec hC hd hc) hn)
    (mem_roundedMul
      (mem_roundedDiv hprec hAC (mem_integerInterval charge) (mem_roundedMul hA hc)) hu)

def forwardStepOK (prec : ℤ) (charge : ℤ)
    (IA ID IC Inext Icur output : IntervalDyadic)
    (hC : 0 < IC.lo.toRat) (hAC : 0 < (roundedMul prec IA IC).lo.toRat) : Bool :=
  (forwardStep prec charge IA ID IC Inext Icur hC hAC).subset output

theorem forwardStep_mem_of_check {prec : ℤ} (hprec : prec ≤ 0) (charge : ℤ)
    {A sd sc uNext uCur : ℝ} {IA ID IC Inext Icur output : IntervalDyadic}
    (hC : 0 < IC.lo.toRat) (hAC : 0 < (roundedMul prec IA IC).lo.toRat)
    (hA : A ∈ IA) (hd : sd ∈ ID) (hc : sc ∈ IC)
    (hn : uNext ∈ Inext) (hu : uCur ∈ Icur)
    (hcheck : forwardStepOK prec charge IA ID IC Inext Icur output hC hAC = true) :
    (sd / sc) * uNext + ((charge : ℝ) / (A * sc)) * uCur ∈ output :=
  mem_of_subset hcheck (forwardStep_sound hprec charge hC hAC hA hd hc hn hu)

end Grothe.UpperChaos.ConditionalNormalizedDyadic

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedDyadic.sqrt_mem_of_check' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedDyadic.sqrt_mem_of_check

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedDyadic.zeroStep_mem_of_check' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedDyadic.zeroStep_mem_of_check

/-- info: 'Grothe.UpperChaos.ConditionalNormalizedDyadic.forwardStep_mem_of_check' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.ConditionalNormalizedDyadic.forwardStep_mem_of_check
