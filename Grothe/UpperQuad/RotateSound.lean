import Grothe.UpperQuad.ProfileSound
import GrotheQuadKernel.Rotate
import Grothe.UpperChaos.ProductionSmoothingRounding

/-!
# Soundness of the saved smoothing matrices (the exact part of S9)

The kernel's `savedEntryNum` computes, with big integers, exactly the numerator over `S = 10²²`
of master's `productionSavedEntryQ n c e = savedEntryQ U V W D S n c e`
(`ProductionSmoothingRounding.lean`, `FixedChaosRoundedEntries.lean`), so the matrices the
rotation uses are master's `productionSavedMatrixQ`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

lemma powers_getD (base n i : ℕ) (hi : i ≤ n) : (powers base n).getD i 0 = base ^ i := by
  unfold powers
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hi' : i < n + 1 := by omega
  simp only [hi', ↓reduceDIte, Option.getD_some]

lemma natChoose_eq (n k : ℕ) : natChoose n k = Nat.choose n k := by
  unfold natChoose
  split_ifs with h
  · exact (Nat.choose_eq_zero_of_lt h).symm
  · rw [not_lt] at h
    suffices H : ∀ j, j ≤ n → (List.range j).foldl (fun acc i => acc * (n - i) / (i + 1)) 1 = Nat.choose n j
      from H k h
    intro j
    induction j with
    | zero => intro _; simp
    | succ j ih =>
      intro hj
      rw [foldl_range_succ, ih (by omega)]
      have := Nat.choose_succ_right_eq n j
      rw [← this, Nat.mul_div_cancel _ (by omega)]

lemma foldl_add_eq_sum (f : ℕ → ℕ) (n : ℕ) :
    (List.range n).foldl (fun acc i => acc + f i) 0 = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => simp
  | succ n ih => rw [foldl_range_succ, ih, Finset.sum_range_succ]

/-- The moment numerator from the power tables equals master's, when every exponent stays
within the tables (`a + c ≤ n`, `p ≤ n`). -/
lemma momentNumerator_eq (U V W n p r a c : ℕ) (hp : p ≤ n) (hac : a + c ≤ n) :
    momentNumerator (powers U n) (powers V n) (powers W n) p r a c =
      matrixMomentNumerator U V W p r a c := by
  unfold momentNumerator matrixMomentNumerator
  rw [factNat_eq, factNat_eq, foldl_add_eq_sum]
  congr 1
  rw [← Finset.Ico_succ_right_eq_Icc, Finset.sum_Ico_eq_sum_range]
  apply Finset.sum_congr rfl
  intro i hi
  rw [Finset.mem_range] at hi
  unfold momentSummand matrixMomentSummand
  rw [natChoose_eq, natChoose_eq]
  simp only [Nat.cast_id]
  have hk : p - c + i ≤ min a p := by omega
  rw [powers_getD U n _ (by omega), powers_getD V n _ (by omega), powers_getD W n _ (by omega)]
  rw [Nat.choose_eq_fast_choose]

lemma entryFact_eq (n c e : ℕ) (hc : c < n + 1) (he : e < n + 1) :
    entryFact n c e = entryFactorial n ⟨c, hc⟩ ⟨e, he⟩ := by
  unfold entryFact entryFactorial
  simp only [factNat_eq]
  ring

/-- The kernel's saved matrix entries are master's. -/
theorem savedEntryNum_eq (n c e : ℕ) (hc : c < n + 1) (he : e < n + 1) :
    ((savedEntryNum (powers smU n) (powers smV n) (powers smW n) n c e : ℕ) : ℚ) / (smS : ℚ) =
      productionSavedEntryQ n ⟨c, hc⟩ ⟨e, he⟩ := by
  unfold savedEntryNum productionSavedEntryQ savedEntryQ Grothe.UpperChaos.RationalSqrtFloor.sqrtFloor
  rw [momentNumerator_eq smU smV smW n (n - c) c (n - e) e (by omega) (by omega),
    entryFact_eq n c e hc he]
  rfl

end Grothe.UpperQuad
