module

public import Init.Data.String.Legacy
import all Init.Data.String.Legacy
public import Batteries.Data.String.Lemmas
import Mathlib.Tactic

/-!
# Legacy single-character splitting of row certificate strings

The row data use Lean's legacy `String.splitOn`. For a single delimiter its
output agrees with a structural pass over the character list. This identity
allows verified evaluation without repeatedly seeking from the start of the string. The proof uses
`import all Init.Data.String.Legacy` to unfold `String.splitOnAux` and `String.splitAux`.
Recheck their recursion equations on toolchain upgrades.

Agent-ID: codex-a7c4
-/

@[expose] public section

namespace Grothe.Lower.RowParser
open String

private theorem splitSingleAux (s : String) (c : Char) (b i : Pos.Raw) (acc : List String) :
    s.splitOnAux (String.singleton c) b i 0 acc = s.splitAux (· == c) b i acc := by
  have hc : (0 : Pos.Raw).get (String.singleton c) = c := by
    simp [Pos.Raw.get, Pos.Raw.utf8GetAux]
  have he : ((0 : Pos.Raw).next (String.singleton c)).atEnd (String.singleton c) = true := by
    simp [atEnd_iff, Pos.Raw.next, hc, Pos.Raw.le_iff, rawEndPos, utf8ByteSize_singleton]
  rw [String.splitOnAux, String.splitAux]
  by_cases hend : i.atEnd s = true
  · simp [hend]
  · simp only [hend, ↓reduceIte, hc, he]
    by_cases hchar : i.get s = c
    · have hback : (i.next s).unoffsetBy ((0 : Pos.Raw).next (String.singleton c)) = i := by
        apply Pos.Raw.ext
        simp [Pos.Raw.next, hchar, hc]
      simp only [hchar, beq_self_eq_true, ↓reduceIte, hback]
      exact splitSingleAux s c (i.next s) (i.next s) _
    · have hz : i.unoffsetBy 0 = i := by cases i; rfl
      simp only [beq_eq_false_iff_ne.mpr hchar, Bool.false_eq_true, ↓reduceIte, hz]
      exact splitSingleAux s c b (i.next s) acc
termination_by s.rawEndPos.byteIdx - i.byteIdx
decreasing_by
  all_goals
    have hi : i.byteIdx < s.rawEndPos.byteIdx := Nat.lt_of_not_ge (fun h => hend ((atEnd_iff _ _).mpr h))
    have hn : i.byteIdx < (i.next s).byteIdx := Pos.Raw.lt_next s i
    omega

theorem splitSingle (s : String) (c : Char) :
    s.splitOn (String.singleton c) = (s.toList.splitOnP (· == c)).map String.ofList := by
  have hne : String.singleton c ≠ "" := by
    intro h
    have hlen := congrArg String.utf8ByteSize h
    simp [String.utf8ByteSize_singleton] at hlen
    exact (Nat.ne_of_gt (Char.utf8Size_pos c)) hlen
  simpa only [String.splitOn, beq_eq_false_iff_ne.mpr hne, Bool.false_eq_true, ↓reduceIte,
    String.splitToList, splitSingleAux] using String.splitToList_of_valid s (· == c)
end Grothe.Lower.RowParser
