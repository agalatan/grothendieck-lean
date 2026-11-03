import Grothe.UpperChaos.PackedDyadicStructural
import Batteries.Data.String.Lemmas
import all Init.Data.String.Legacy

/-!
The public packed decoder uses the legacy string-separator API. For a single
character that scanner is the character-predicate scanner, whose list semantics
are already proved in Batteries. This closes the delimiter obligation without
changing the public decoder, its numeric grammar or the stored source bytes.
Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.PackedDyadic.Structural

set_option maxHeartbeats 1000000

theorem splitOnAux_singleton (s : String) (c : Char)
    (b i : String.Pos.Raw) (r : List String) :
    String.splitOnAux s (String.ofList [c]) b i 0 r =
      String.splitAux s (· == c) b i r := by
  have hget : (0 : String.Pos.Raw).get (String.ofList [c]) = c := by
    simp [String.Pos.Raw.get, String.Pos.Raw.utf8GetAux]
  have hnext : (0 : String.Pos.Raw).next (String.ofList [c]) = ⟨c.utf8Size⟩ := by
    simp only [String.Pos.Raw.next, hget]
    rfl
  have hend : (⟨c.utf8Size⟩ : String.Pos.Raw).atEnd (String.ofList [c]) = true := by
    simp [String.Pos.Raw.atEnd, String.utf8ByteSize_ofList]
  rw [String.splitOnAux.eq_1, String.splitAux.eq_1]
  by_cases he : i.atEnd s = true
  · simp only [he, ↓reduceIte]
  · simp only [he, ↓reduceIte, hget]
    by_cases hc : (i.get s == c) = true
    · have hchar : i.get s = c := by simpa only [beq_iff_eq] using hc
      have hback : (i.next s).unoffsetBy ⟨c.utf8Size⟩ = i := by
        apply String.Pos.Raw.ext
        simp [String.Pos.Raw.next, hchar]
      simp only [hc, ↓reduceIte, hnext, hend, hback]
      exact splitOnAux_singleton s c (i.next s) (i.next s) (b.extract s i :: r)
    · simp only [hc, ↓reduceIte, String.Pos.Raw.unoffsetBy_zero]
      exact splitOnAux_singleton s c b (i.next s) r
termination_by s.utf8ByteSize - i.byteIdx
decreasing_by
  all_goals
    exact Nat.sub_lt_sub_left
      (Nat.gt_of_not_le (mt decide_eq_true he)) (String.Pos.Raw.lt_next s i)

/-- The legacy splitter has exactly the structural list semantics, even for
empty fields and arbitrary Unicode input. -/
theorem legacy_split_tokens (s : String) (c : Char) :
    (s.splitOn (String.ofList [c])).map String.toList = s.toList.splitOn c := by
  have hsep : ((String.ofList [c]) == "") = false := by simp
  simp only [String.splitOn, hsep, Bool.false_eq_true, ite_false, splitOnAux_singleton]
  change (String.splitToList s (· == c)).map String.toList = s.toList.splitOn c
  rw [String.splitToList_of_valid]
  simp only [List.map_map, Function.comp_def, String.toList_ofList,
    List.map_id_fun', id_eq]

/-- Transfer the unchanged public parser to the checked structural reader with
no delimiter or numeric hypotheses. -/
theorem parse_eq_row_unconditional (E : ℕ) (s : String) :
    parse E s = (row? E s.toList).map List.toArray := by
  exact parse_eq_row E s (legacy_split_tokens s ',')
    (fun r _ => legacy_split_tokens r ':')

end Grothe.UpperChaos.PackedDyadic.Structural

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.PackedDyadic.Structural.splitOnAux_singleton,
      ``Grothe.UpperChaos.PackedDyadic.Structural.legacy_split_tokens,
      ``Grothe.UpperChaos.PackedDyadic.Structural.parse_eq_row_unconditional] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
