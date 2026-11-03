import Mathlib.Tactic
import Mathlib.Data.Rat.BigOperators
import Lean.Util.CollectAxioms

/-! Exact little-endian IEEE754 binary64 normal-value decoding for the
exceptional-row slices. Generated records carry byte offsets and row ordinals;
their binding to selected Gaussian source nodes is a separate obligation. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionCenters

/-- The IEEE binary64 biased exponent and fraction. -/
def exponent (bits : ℕ) : ℕ := (bits / 2^52) % 2048
def fraction (bits : ℕ) : ℕ := bits % 2^52

/-- Exact magnitude of a normal binary64 value with exponent at most 1023. -/
def magnitude (bits : ℕ) : ℚ :=
  ((2^52 + fraction bits : ℕ) : ℚ) / (2 : ℚ)^(1075 - exponent bits)

/-- Exact signed binary64 value on the accepted normal range. -/
def value (bits : ℕ) : ℚ :=
  if bits / 2^63 = 0 then magnitude bits else -magnitude bits

/-- Check that the source word is normal and its exact decoded value has
magnitude at most one; this excludes infinities, NaNs and out-of-range words. -/
def validWord (bits : ℕ) : Bool :=
  decide (bits < 2^64 ∧ 1 ≤ exponent bits ∧ exponent bits ≤ 1023 ∧ |value bits| ≤ 1)

structure Row where
  ordinal : ℕ
  sourceStart : ℕ
  cutoff : ℕ
  words : List ℕ
  deriving DecidableEq

/-- The complete squared Euclidean norm of this node's decoded retained
real source values, prior to any later basis or smoothing transform. -/
def normSq (r : Row) : ℚ := (r.words.map fun w => value w ^ 2).sum

/-- The source `.npy` little-endian payload starts after its 128-byte header. -/
def firstByte (r : Row) : ℕ := 128 + 8 * r.sourceStart

def validRow (r : Row) : Bool :=
  decide (((r.cutoff = 1 ∧ r.words.length = 3) ∨
      (r.cutoff = 2 ∧ r.words.length = 5)) ∧
    r.sourceStart + r.words.length ≤ 421701618 ∧ normSq r ≤ 121 / 100) &&
    r.words.all validWord

theorem validWord_sound (bits : ℕ) (h : validWord bits = true) :
    bits < 2^64 ∧ 1 ≤ exponent bits ∧ exponent bits ≤ 1023 ∧ |value bits| ≤ 1 :=
  of_decide_eq_true h

theorem validRow_word (r : Row) (h : validRow r = true) (bits : ℕ)
    (hb : bits ∈ r.words) : |value bits| ≤ 1 := by
  simp only [validRow, Bool.and_eq_true] at h
  exact (validWord_sound bits ((List.all_eq_true.mp h.2) bits hb)).2.2.2

/-- The complete decoded retained row has squared norm at most 1.1². -/
theorem validRow_normSq (r : Row) (h : validRow r = true) : normSq r ≤ 121 / 100 := by
  simp only [validRow, Bool.and_eq_true] at h
  have hc : ((r.cutoff = 1 ∧ r.words.length = 3) ∨
      (r.cutoff = 2 ∧ r.words.length = 5)) ∧
      r.sourceStart + r.words.length ≤ 421701618 ∧ normSq r ≤ 121 / 100 :=
    of_decide_eq_true h.1
  exact hc.2.2

/-- The row cutoff is the source degree cutoff, not a mode count. -/
theorem validRow_cutoff (r : Row) (h : validRow r = true) :
    (r.cutoff = 1 ∧ r.words.length = 3) ∨
      (r.cutoff = 2 ∧ r.words.length = 5) := by
  simp only [validRow, Bool.and_eq_true] at h
  exact (of_decide_eq_true h.1).1

/-- The count refers to actual decoded source words, not Gaussian zeros. -/
theorem validRow_length_le_five (r : Row) (h : validRow r = true) :
    r.words.length ≤ 5 := by
  rcases validRow_cutoff r h with h | h <;> omega

theorem validRow_cutoff_le_two (r : Row) (h : validRow r = true) :
    r.cutoff ≤ 2 := by
  rcases validRow_cutoff r h with h | h <;> omega

/-- An actual retained scalar entry, addressed within the source row. -/
def center (r : Row) (i : Fin r.words.length) : ℚ := value (r.words.get i)

theorem center_abs_le_one (r : Row) (h : validRow r = true)
    (i : Fin r.words.length) : |center r i| ≤ 1 :=
  validRow_word r h _ (List.get_mem r.words i)

/-- Scalar bound used by the coarse exception ledger. -/
theorem center_abs_le_eleven_tenths (r : Row) (h : validRow r = true)
    (i : Fin r.words.length) : |((center r i : ℚ) : ℝ)| ≤ 11 / 10 := by
  have hq := center_abs_le_one r h i
  have hr : |((center r i : ℚ) : ℝ)| ≤ 1 := by exact_mod_cast hq
  linarith

/-- The same decoded scalar cast to ℂ. -/
theorem center_norm_le_eleven_tenths (r : Row) (h : validRow r = true)
    (i : Fin r.words.length) : ‖(center r i : ℂ)‖ ≤ (11 / 10 : ℝ) := by
  rw [Complex.norm_ratCast]
  exact center_abs_le_eleven_tenths r h i

/-- The same finite squared norm bound, interpreted over the reals. -/
theorem validRow_normSq_real (r : Row) (h : validRow r = true) :
    ((r.words.map fun w => ((value w : ℚ) : ℝ)^2).sum) ≤ (121 / 100 : ℝ) := by
  have hq := validRow_normSq r h
  unfold normSq at hq
  have hr : (((r.words.map fun w => value w ^ 2).sum : ℚ) : ℝ) ≤
      (((121 : ℚ) / 100 : ℚ) : ℝ) := by exact_mod_cast hq
  rw [Rat.cast_list_sum] at hr
  simpa only [List.map_map, Function.comp_def, Rat.cast_pow, Rat.cast_div,
    Rat.cast_ofNat] using hr

/-- Every decoded row has a valid byte span inside the source NPY file. -/
theorem validRow_byteBound (r : Row) (h : validRow r = true) :
    firstByte r + 8 * r.words.length ≤ 3373613072 := by
  simp only [validRow, Bool.and_eq_true] at h
  have hc : ((r.cutoff = 1 ∧ r.words.length = 3) ∨
      (r.cutoff = 2 ∧ r.words.length = 5)) ∧
      r.sourceStart + r.words.length ≤ 421701618 ∧ normSq r ≤ 121 / 100 :=
    of_decide_eq_true h.1
  unfold firstByte
  omega

end Grothe.UpperChaos.Q0SourceExceptionCenters

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionCenters.center_norm_le_eleven_tenths,
      ``Grothe.UpperChaos.Q0SourceExceptionCenters.validRow_cutoff,
      ``Grothe.UpperChaos.Q0SourceExceptionCenters.validRow_normSq_real] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Exception scalar audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
