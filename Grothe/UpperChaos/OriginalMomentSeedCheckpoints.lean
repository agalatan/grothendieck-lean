import Grothe.UpperChaos.OriginalMomentTaylorSeed
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Rounded rational checkpoints for the actual original J₀ integral

Multiplication guards enclose signed Taylor terms. Their finite sum and the
proved integrated next-term estimate enclose the actual moment, with no
assumed seed accuracy. The nonpositive update reverses interval endpoints.

Agent-ID: codex-aa04. Refs #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.OriginalMomentSeedCheckpoints

open OriginalPositiveMoment

/-- Signed numerator of the rational term update; it is nonpositive for x ≥ 0. -/
def factorQ (x : ℚ) (n : ℕ) : ℚ := (-x) * (2 * (n : ℚ) + 1)

/-- Positive denominator of the normalized Taylor term update. -/
def denominatorQ (n : ℕ) : ℚ := 2 * ((n : ℚ) + 1) * ((n : ℚ) + 2)

theorem factorQ_nonpos (x : ℚ) (hx : 0 ≤ x) (n : ℕ) : factorQ x n ≤ 0 := by
  unfold factorQ
  exact mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hx) (by positivity)

theorem denominatorQ_pos (n : ℕ) : 0 < denominatorQ n := by
  unfold denominatorQ
  positivity

/-- The previously identified analytic Taylor terms obey this exact update. -/
theorem term_recurrence (x : ℚ) (n : ℕ) :
    zeroTaylorTermQ x (n + 1) = factorQ x n * zeroTaylorTermQ x n / denominatorQ n := by
  rw [zeroTaylorTermQ_succ]
  unfold factorQ denominatorQ
  ring

/-- The negative factor reverses the two previous endpoints. -/
theorem rounded_step (x : ℚ) (hx : 0 ≤ x) (n : ℕ)
    {lo hi nextLo nextHi : ℚ}
    (hlo : lo ≤ zeroTaylorTermQ x n) (hhi : zeroTaylorTermQ x n ≤ hi)
    (hnextLo : nextLo * denominatorQ n ≤ factorQ x n * hi)
    (hnextHi : factorQ x n * lo ≤ nextHi * denominatorQ n) :
    nextLo ≤ zeroTaylorTermQ x (n + 1) ∧ zeroTaylorTermQ x (n + 1) ≤ nextHi := by
  have hf := factorQ_nonpos x hx n
  have hd := denominatorQ_pos n
  rw [term_recurrence]
  constructor
  · apply (le_div_iff₀ hd).2
    exact hnextLo.trans (mul_le_mul_of_nonpos_left hhi hf)
  · apply (div_le_iff₀ hd).2
    exact (mul_le_mul_of_nonpos_left hlo hf).trans hnextHi

/-- Every term through H lies in any checkpoints satisfying the finite updates. -/
theorem term_mem_of_checkpoints (H : ℕ) (x : ℚ) (lo hi : ℕ → ℚ)
    (hx : 0 ≤ x) (hzero : lo 0 ≤ 1 ∧ 1 ≤ hi 0)
    (hsteps : ∀ n, n < H →
      lo (n + 1) * denominatorQ n ≤ factorQ x n * hi n ∧
      factorQ x n * lo n ≤ hi (n + 1) * denominatorQ n)
    (n : ℕ) (hn : n ≤ H) :
    lo n ≤ zeroTaylorTermQ x n ∧ zeroTaylorTermQ x n ≤ hi n := by
  have hall : ∀ n, n ≤ H →
      lo n ≤ zeroTaylorTermQ x n ∧ zeroTaylorTermQ x n ≤ hi n := by
    intro n
    induction n with
    | zero =>
      intro _
      simpa only [zeroTaylorTermQ, pow_zero, zeroTaylorCoeffQ_zero, mul_one] using hzero
    | succ n ih =>
      intro hn
      have hlt : n < H := Nat.lt_of_succ_le hn
      have ht := ih (Nat.le_of_lt hlt)
      have hs := hsteps n hlt
      exact rounded_step x hx n ht.1 ht.2 hs.1 hs.2
  exact hall n hn

/-- Rational lower endpoint after summing the retained terms and paying the tail. -/
def lowerBoundQ (N : ℕ) (R : ℚ) (lo : ℕ → ℚ) : ℚ :=
  (∑ n ∈ Finset.range (N + 1), lo n) - R

/-- Rational upper endpoint after summing the retained terms and paying the tail. -/
def upperBoundQ (N : ℕ) (R : ℚ) (hi : ℕ → ℚ) : ℚ :=
  (∑ n ∈ Finset.range (N + 1), hi n) + R

/-- The checkpoint sums and terminal term enclose the actual original J₀ integral.
No sign alternation or monotonicity of successive term magnitudes is assumed. -/
theorem moment_zero_mem_of_checkpoints (N : ℕ) (x R : ℚ) (lo hi : ℕ → ℚ)
    (hx : 0 ≤ x) (hzero : lo 0 ≤ 1 ∧ 1 ≤ hi 0)
    (hsteps : ∀ n, n < N + 1 →
      lo (n + 1) * denominatorQ n ≤ factorQ x n * hi n ∧
      factorQ x n * lo n ≤ hi (n + 1) * denominatorQ n)
    (hterminal : -R ≤ lo (N + 1) ∧ hi (N + 1) ≤ R) :
    (lowerBoundQ N R lo : ℝ) ≤ moment 0 (x : ℝ) ∧
      moment 0 (x : ℝ) ≤ (upperBoundQ N R hi : ℝ) := by
  have hterms := term_mem_of_checkpoints (N + 1) x lo hi hx hzero hsteps
  have hsumLo : (∑ n ∈ Finset.range (N + 1), lo n) ≤ zeroTaylorSeedQ N x := by
    unfold zeroTaylorSeedQ
    apply Finset.sum_le_sum
    intro n hn
    exact (hterms n (Nat.le_of_lt (Finset.mem_range.mp hn))).1
  have hsumHi : zeroTaylorSeedQ N x ≤ ∑ n ∈ Finset.range (N + 1), hi n := by
    unfold zeroTaylorSeedQ
    apply Finset.sum_le_sum
    intro n hn
    exact (hterms n (Nat.le_of_lt (Finset.mem_range.mp hn))).2
  have hlast := hterms (N + 1) le_rfl
  have hradius : zeroTaylorRadiusQ N x ≤ R := by
    rw [zeroTaylorRadiusQ, ← abs_zeroTaylorTermQ x hx (N + 1)]
    exact abs_le.mpr ⟨hterminal.1.trans hlast.1, hlast.2.trans hterminal.2⟩
  have hradiusR : (zeroTaylorRadiusQ N x : ℝ) ≤ (R : ℝ) :=
    (Rat.cast_le (K := ℝ)).mpr hradius
  have herror := (moment_zero_rationalSeed_error N x hx).trans hradiusR
  have habs := abs_le.mp herror
  have hsumLoR : ((∑ n ∈ Finset.range (N + 1), lo n : ℚ) : ℝ) ≤
      (zeroTaylorSeedQ N x : ℝ) := (Rat.cast_le (K := ℝ)).mpr hsumLo
  have hsumHiR : (zeroTaylorSeedQ N x : ℝ) ≤
      ((∑ n ∈ Finset.range (N + 1), hi n : ℚ) : ℝ) :=
    (Rat.cast_le (K := ℝ)).mpr hsumHi
  constructor
  · rw [lowerBoundQ, Rat.cast_sub]
    linarith [hsumLoR, habs.1]
  · rw [upperBoundQ, Rat.cast_add]
    linarith [hsumHiR, habs.2]

/-- Executable finite rational certificate; exact terms and integrals never run here. -/
def certificateOK (N : ℕ) (x R : ℚ) (lo hi : ℕ → ℚ) : Bool :=
  decide (0 ≤ x ∧ lo 0 ≤ 1 ∧ 1 ≤ hi 0 ∧
    (∀ n : Fin (N + 1),
      lo (n.val + 1) * denominatorQ n.val ≤ factorQ x n.val * hi n.val ∧
      factorQ x n.val * lo n.val ≤ hi (n.val + 1) * denominatorQ n.val) ∧
    -R ≤ lo (N + 1) ∧ hi (N + 1) ≤ R)

/-- A checked rounded transcript encloses the actual integral, with no error premise. -/
theorem moment_zero_mem_of_certificate (N : ℕ) (x R : ℚ) (lo hi : ℕ → ℚ)
    (hcheck : certificateOK N x R lo hi = true) :
    (lowerBoundQ N R lo : ℝ) ≤ moment 0 (x : ℝ) ∧
      moment 0 (x : ℝ) ≤ (upperBoundQ N R hi : ℝ) := by
  have hc : 0 ≤ x ∧ lo 0 ≤ 1 ∧ 1 ≤ hi 0 ∧
      (∀ n : Fin (N + 1),
        lo (n.val + 1) * denominatorQ n.val ≤ factorQ x n.val * hi n.val ∧
        factorQ x n.val * lo n.val ≤ hi (n.val + 1) * denominatorQ n.val) ∧
      -R ≤ lo (N + 1) ∧ hi (N + 1) ≤ R := of_decide_eq_true hcheck
  apply moment_zero_mem_of_checkpoints N x R lo hi hc.1 ⟨hc.2.1, hc.2.2.1⟩
  · intro n hn
    exact hc.2.2.2.1 ⟨n, hn⟩
  · exact hc.2.2.2.2

end Grothe.UpperChaos.OriginalMomentSeedCheckpoints

#print axioms Grothe.UpperChaos.OriginalMomentSeedCheckpoints.term_mem_of_checkpoints
/-- info: 'Grothe.UpperChaos.OriginalMomentSeedCheckpoints.moment_zero_mem_of_checkpoints' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalMomentSeedCheckpoints.moment_zero_mem_of_checkpoints
/-- info: 'Grothe.UpperChaos.OriginalMomentSeedCheckpoints.moment_zero_mem_of_certificate' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalMomentSeedCheckpoints.moment_zero_mem_of_certificate
