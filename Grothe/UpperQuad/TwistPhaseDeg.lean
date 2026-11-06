import Grothe.UpperQuad.TwistFactsSound

/-!
# The degree bound of the phase monomials

Every monomial `C U^i V^j W^k` of `phaseStrs` has total degree `i + j + k ≤ 17` (`phaseDegOK`, the
finite check `PhaseDegOK` used by the twisted node scalars through `TermsOK`), by kernel evaluation
of the string parser on the 1,140 committed strings in chunks of 32 (`decide +kernel`; the whole
list at once exhausts the memory).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad.PhaseDeg

open Grothe.UpperChaos

/-- The degree predicate on a parsed term. -/
def degOK (t : (ℕ × ℕ × ℕ) × ℚ) : Bool := decide (t.1.1 + t.1.2.1 + t.1.2.2 ≤ 17)

/-- The chunk `[32 k, 32 k + 32)` of the parsed strings. -/
def chunk (k : ℕ) : List ((ℕ × ℕ × ℕ) × ℚ) :=
  ((Grothe.Upper.phaseStrs.drop (32 * k)).take 32).map GrotheKernel.parseTerm

set_option maxRecDepth 100000 in
theorem chunk00 : (chunk 0).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk01 : (chunk 1).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk02 : (chunk 2).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk03 : (chunk 3).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk04 : (chunk 4).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk05 : (chunk 5).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk06 : (chunk 6).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk07 : (chunk 7).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk08 : (chunk 8).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk09 : (chunk 9).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk10 : (chunk 10).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk11 : (chunk 11).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk12 : (chunk 12).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk13 : (chunk 13).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk14 : (chunk 14).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk15 : (chunk 15).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk16 : (chunk 16).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk17 : (chunk 17).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk18 : (chunk 18).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk19 : (chunk 19).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk20 : (chunk 20).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk21 : (chunk 21).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk22 : (chunk 22).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk23 : (chunk 23).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk24 : (chunk 24).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk25 : (chunk 25).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk26 : (chunk 26).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk27 : (chunk 27).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk28 : (chunk 28).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk29 : (chunk 29).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk30 : (chunk 30).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk31 : (chunk 31).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk32 : (chunk 32).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk33 : (chunk 33).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk34 : (chunk 34).all degOK = true := by
  unfold chunk degOK
  decide +kernel

set_option maxRecDepth 100000 in
theorem chunk35 : (chunk 35).all degOK = true := by
  unfold chunk degOK
  decide +kernel

theorem phaseStrs_length : Grothe.Upper.phaseStrs.length ≤ 32 * 36 := by decide +kernel

theorem chunks_all : ∀ k, k < 36 → (chunk k).all degOK = true := by
  intro k hk
  interval_cases k
  exacts [chunk00, chunk01, chunk02, chunk03, chunk04, chunk05, chunk06, chunk07, chunk08, chunk09,
    chunk10, chunk11, chunk12, chunk13, chunk14, chunk15, chunk16, chunk17, chunk18, chunk19,
    chunk20, chunk21, chunk22, chunk23, chunk24, chunk25, chunk26, chunk27, chunk28, chunk29,
    chunk30, chunk31, chunk32, chunk33, chunk34, chunk35]

lemma all_take_of_chunks (L : List String) (m : ℕ)
    (h : ∀ k, k < m → (((L.drop (32 * k)).take 32).map GrotheKernel.parseTerm).all degOK = true) :
    ((L.take (32 * m)).map GrotheKernel.parseTerm).all degOK = true := by
  induction m with
  | zero => simp
  | succ m ih =>
    rw [show 32 * (m + 1) = 32 * m + 32 by ring, List.take_add, List.map_append, List.all_append,
      Bool.and_eq_true]
    exact ⟨ih fun k hk => h k (by omega), h m (by omega)⟩

end Grothe.UpperQuad.PhaseDeg

namespace Grothe.UpperQuad

open Grothe.UpperChaos

/-- **The phase monomials have total degree at most 17.** -/
theorem phaseDegOK : PhaseDegOK := by
  intro t ht
  have h := PhaseDeg.all_take_of_chunks Grothe.Upper.phaseStrs 36 PhaseDeg.chunks_all
  rw [List.take_of_length_le PhaseDeg.phaseStrs_length] at h
  have h2 := List.all_eq_true.mp h t ht
  simpa [PhaseDeg.degOK] using h2

end Grothe.UpperQuad
