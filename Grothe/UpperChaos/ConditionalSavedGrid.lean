import LeanCert.Core.Dyadic
import Grothe.UpperChaos.Q0SourceExceptionCenters
import Grothe.UpperChaos.ConditionalSourceRow227Scalar
import Grothe.UpperChaos.OriginalRow227ErrorBoundary

/-!
# Exact production-decoder values on the saved-error integer grid

All identities concern integers and rationals, without floating-point
arithmetic or a numerical approximation premise.

The algebraic decoder identity requires only `exponent word ≤ 1023` and
`1075 ≤ L`. For an IEEE754 normal-word interpretation, callers additionally
need `word < 2^64` and `1 ≤ exponent word`; `validWord` supplies all three.
No validity of a concrete collection of words is asserted here.

The public definitions `Dyadic.shiftLeftInt` and `Dyadic.pow2Nat` suffice.
No private LeanCert power or rational-cast theorem is used.

Agent-ID: codex-aa04. Refs #293, #21.
-/

open LeanCert.Core

namespace Grothe.UpperChaos.ConditionalSavedGrid

open Q0SourceExceptionCenters

/-- The same signed normal significand used by the production decoder. -/
def signedMantissa (word : ℕ) : ℤ :=
  let mantissa : ℤ := (2 ^ 52 + fraction word : ℕ)
  if word / 2 ^ 63 = 0 then mantissa else -mantissa

/-- An integer on the `2^L` grid. The interpretation theorem guards the
natural subtraction by `1075 ≤ L` and the production exponent bound. -/
def normalScaled (L word : ℕ) : ℤ :=
  Dyadic.shiftLeftInt (signedMantissa word) (L - 1075 + exponent word)

/-- Public-definition proof of the integer shift's rational interpretation.
LeanCert's similarly named rational-cast helper is private at the pinned revision. -/
theorem shiftLeftInt_cast (m : ℤ) (n : ℕ) :
    (Dyadic.shiftLeftInt m n : ℚ) = (m : ℚ) * (2 : ℚ) ^ n := by
  simp only [Dyadic.shiftLeftInt, Dyadic.pow2Nat, Nat.shiftLeft_eq, one_mul,
    Int.cast_mul, Int.cast_natCast, Nat.cast_pow, Nat.cast_ofNat]

/-- Separate the production sign branch from its positive power denominator.
This is an identity of the total decoder definition; it needs no word-validity premise. -/
theorem value_eq_signedMantissa_div (word : ℕ) :
    value word = (signedMantissa word : ℚ) / (2 : ℚ) ^ (1075 - exponent word) := by
  by_cases hs : word / 2 ^ 63 = 0
  · simp only [value, magnitude, signedMantissa, ite_eq_left hs, Int.cast_natCast]
  · simp only [value, magnitude, signedMantissa, ite_eq_right hs, Int.cast_neg,
      Int.cast_natCast, neg_div]

/-- Exact signed binary64 decoding on an arbitrary sufficiently fine grid.
The low exponent bound and finite-word bound are unnecessary for this algebraic identity. -/
theorem normalScaled_cast (L word : ℕ) (hL : 1075 ≤ L)
    (hexp : exponent word ≤ 1023) :
    (normalScaled L word : ℚ) = value word * (2 : ℚ) ^ L := by
  have hsum : (L - 1075 + exponent word) + (1075 - exponent word) = L := by
    omega
  have hpower :
      (2 : ℚ) ^ (L - 1075 + exponent word) * (2 : ℚ) ^ (1075 - exponent word) =
        (2 : ℚ) ^ L := by
    rw [← pow_add, hsum]
  have hden : (2 : ℚ) ^ (1075 - exponent word) ≠ 0 :=
    pow_ne_zero _ (by decide : (2 : ℚ) ≠ 0)
  calc
    (normalScaled L word : ℚ) =
        (signedMantissa word : ℚ) * (2 : ℚ) ^ (L - 1075 + exponent word) :=
      shiftLeftInt_cast _ _
    _ = ((signedMantissa word : ℚ) / (2 : ℚ) ^ (1075 - exponent word)) *
        ((2 : ℚ) ^ (L - 1075 + exponent word) * (2 : ℚ) ^ (1075 - exponent word)) := by
      rw [mul_comm ((2 : ℚ) ^ (L - 1075 + exponent word))
          ((2 : ℚ) ^ (1075 - exponent word)),
        ← mul_assoc, div_mul_cancel₀ _ hden]
    _ = value word * (2 : ℚ) ^ L := by
      rw [hpower, value_eq_signedMantissa_div]

/-- Dividing the integer grid representation recovers the exact decoder. -/
theorem normalScaled_div_pow (L word : ℕ) (hL : 1075 ≤ L)
    (hexp : exponent word ≤ 1023) :
    (normalScaled L word : ℚ) / (2 : ℚ) ^ L = value word :=
  (div_eq_iff (pow_ne_zero _ (by decide : (2 : ℚ) ≠ 0))).mpr
    (normalScaled_cast L word hL hexp)

/-- The accepted normal-word guard supplies the exact exponent hypothesis. -/
theorem normalScaled_cast_of_validWord (L word : ℕ) (hL : 1075 ≤ L)
    (hword : validWord word = true) :
    (normalScaled L word : ℚ) = value word * (2 : ℚ) ^ L :=
  normalScaled_cast L word hL (validWord_sound word hword).2.2.1

/-- The diagnostic's `717 + exponent` is exactly the specialization at
`L = 1024 + 768`, with the same sign branch and significand. -/
theorem savedScaled_eq_normalScaled (word : ℕ) :
    OriginalRow227ErrorBoundary.savedScaled word = normalScaled 1792 word := rfl

theorem savedScaled_cast (word : ℕ) (hexp : exponent word ≤ 1023) :
    (OriginalRow227ErrorBoundary.savedScaled word : ℚ) = value word * (2 : ℚ) ^ 1792 := by
  exact (congrArg (fun z : ℤ => (z : ℚ)) (savedScaled_eq_normalScaled word)).trans
    (normalScaled_cast 1792 word (by decide) hexp)

theorem savedScaled_div_pow (word : ℕ) (hexp : exponent word ≤ 1023) :
    (OriginalRow227ErrorBoundary.savedScaled word : ℚ) / (2 : ℚ) ^ 1792 = value word :=
  (div_eq_iff (pow_ne_zero _ (by decide : (2 : ℚ) ≠ 0))).mpr
    (savedScaled_cast word hexp)

/-- Multiplying grids of `a` and `b` bits gives the combined `a+b` grid.
The saved word contributes its exact decoded value on that same grid. -/
theorem grid_error_div_pow (a b : ℕ) (hscale : 1075 ≤ a + b)
    (scalar center : ℤ) (word : ℕ) (hexp : exponent word ≤ 1023) :
    ((scalar * center - normalScaled (a + b) word : ℤ) : ℚ) / (2 : ℚ) ^ (a + b) =
      ((scalar : ℚ) / (2 : ℚ) ^ a) * ((center : ℚ) / (2 : ℚ) ^ b) - value word := by
  rw [Int.cast_sub, Int.cast_mul, sub_div, normalScaled_div_pow (a + b) word hscale hexp]
  rw [pow_add, div_mul_div_comm]

/-- The actual accepted row227 scalar center uses the original 1024-bit
denominator, reusing the imported seed-scale identity. -/
theorem shat_eq_div_pow :
    ConditionalSourceRow227Scalar.shat =
      (ConditionalSourceRow227Scalar.shatNumerator : ℚ) / (2 : ℚ) ^ 1024 := by
  simp only [ConditionalSourceRow227Scalar.shat, OriginalMomentSeedCheck.scale_eq_power,
    Int.cast_pow, Int.cast_ofNat]

/-- Exact error represented by the diagnostic integer numerator, for an
arbitrary signed coefficient-center integer and a normal-range saved word. -/
theorem row227_error_div_pow (center : ℤ) (word : ℕ) (hexp : exponent word ≤ 1023) :
    ((ConditionalSourceRow227Scalar.shatNumerator * center -
        OriginalRow227ErrorBoundary.savedScaled word : ℤ) : ℚ) / (2 : ℚ) ^ 1792 =
      ConditionalSourceRow227Scalar.shat * ((center : ℚ) / (2 : ℚ) ^ 768) - value word := by
  simpa only [savedScaled_eq_normalScaled, shat_eq_div_pow] using
    grid_error_div_pow 1024 768 (by decide)
      ConditionalSourceRow227Scalar.shatNumerator center word hexp

/-- The diagnostic's own `errorNumerator` denotes the actual rational
saved-center difference, with both grid denominators accounted for. -/
theorem errorNumerator_div_pow (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (hexp : exponent e.word ≤ 1023) :
    (OriginalRow227ErrorBoundary.errorNumerator e : ℚ) / (2 : ℚ) ^ 1792 =
      ConditionalSourceRow227Scalar.shat * ((e.center : ℚ) / (2 : ℚ) ^ 768) - value e.word :=
  row227_error_div_pow e.center e.word hexp

theorem errorNumerator_div_pow_of_validWord (e : OriginalRow227ErrorBoundary.ErrorEntry)
    (hword : validWord e.word = true) :
    (OriginalRow227ErrorBoundary.errorNumerator e : ℚ) / (2 : ℚ) ^ 1792 =
      ConditionalSourceRow227Scalar.shat * ((e.center : ℚ) / (2 : ℚ) ^ 768) - value e.word :=
  errorNumerator_div_pow e (validWord_sound e.word hword).2.2.1

end Grothe.UpperChaos.ConditionalSavedGrid

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.shiftLeftInt_cast) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.value_eq_signedMantissa_div) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.normalScaled_cast) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.normalScaled_div_pow) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.normalScaled_cast_of_validWord) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.savedScaled_eq_normalScaled) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.savedScaled_cast) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.savedScaled_div_pow) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.grid_error_div_pow) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.shat_eq_div_pow) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.row227_error_div_pow) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.errorNumerator_div_pow) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.ConditionalSavedGrid.errorNumerator_div_pow_of_validWord) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
