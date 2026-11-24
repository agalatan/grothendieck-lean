module

public import Init.Data.String.Legacy
import all Init.Data.String.Legacy
public import Batteries.Data.String.Lemmas
public import Grothe.Lower.RowDataTypes
import Std.Data.String.ToInt
import Init.Data.List.SplitOn.Lemmas
import Mathlib.Tactic

/-!
# Legacy single-character splitting of row certificate strings

The row data use Lean's legacy `String.splitOn`. For a single delimiter its
output agrees with a structural pass over the character list. This identity
allows verified evaluation without repeatedly seeking from the start of the string.
Decimal node pairs can then be checked by a round trip through the original bytes.

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

private theorem splitFields (c : Char) (xs : List (List Char))
    (h : ∀ v ∈ xs, c ∉ v) (hne : xs ≠ []) :
    (String.ofList ([c].intercalate xs)).splitOn (String.singleton c) = xs.map String.ofList := by
  rw [splitSingle, String.toList_ofList, ← List.splitOn_eq_splitOnP,
    List.splitOn_intercalate c h hne]

private theorem digit_avoids (n : Nat) (c : Char) (h : c.isDigit = false) : c ∉ Nat.toDigits 10 n := by
  intro hc
  have hd := Nat.isDigit_of_mem_toDigits (b := 10) (by decide) (by decide) hc
  simp [h] at hd

private theorem nat_read (n : Nat) : n.repr.toNat! = n := by
  have yes : n.repr.toSlice.isNat = true := Nat.isNat_repr n
  have hn : n.repr.toSlice.toNat? = some n := Nat.toNat?_repr n
  simpa only [String.toNat!, String.Slice.toNat!, String.Slice.toNat?, yes, ↓reduceIte,
    Option.some.injEq] using hn

private theorem int_read (n : Nat) : n.repr.toInt! = (n : Int) := by
  have hn : n.repr.toSlice.toInt? = some (n : Int) := Nat.toInt?_repr n
  simp [String.toInt!, String.Slice.toInt!, hn]

/-- Nonnegative rational numerator and denominator in a decimal certificate. -/
abbrev RatCode := Nat × Nat
/-- An encoded pair of node abscissa and upper height. -/
abbrev NodeCode := RatCode × RatCode

private def ratParts (p : RatCode) : List (List Char) :=
  if p.2 = 1 then [Nat.toDigits 10 p.1] else [Nat.toDigits 10 p.1, Nat.toDigits 10 p.2]
private def ratChars (p : RatCode) : List Char := ['/'].intercalate (ratParts p)
private def ratValue (p : RatCode) : ℚ := (p.1 : ℚ) / (p.2 : ℚ)

private theorem rat_read (p : RatCode) : parseQ (String.ofList (ratChars p)) = ratValue p := by
  have hs : ∀ v ∈ ratParts p, '/' ∉ v := by
    unfold ratParts
    split <;> simp [digit_avoids _ '/' (by decide)]
  have hn : ratParts p ≠ [] := by unfold ratParts; split <;> simp
  unfold parseQ ratChars
  change (match (String.ofList (['/'].intercalate (ratParts p))).splitOn (String.singleton '/') with
    | [n] => (n.toInt! : ℚ) | [n,d] => (n.toInt! : ℚ) / (d.toNat! : ℚ) | _ => 0) = _
  rw [splitFields '/' _ hs hn]
  by_cases ho : p.2 = 1
  · simp [ratParts, ho, ← Nat.repr_eq_ofList_toDigits, int_read, ratValue]
  · simp [ratParts, ho, ← Nat.repr_eq_ofList_toDigits, nat_read, int_read, ratValue]

private theorem rat_avoids (p : RatCode) (c : Char) (hd : c.isDigit = false) (hs : c ≠ '/') :
    c ∉ ratChars p := by
  have hp := digit_avoids p.1 c hd
  have hq := digit_avoids p.2 c hd
  unfold ratChars ratParts
  split <;> simp [hp, hq, hs, List.intercalate]

/-- Characters in a decimal node entry. -/
def nodeChars (u : NodeCode) : List Char := [':'].intercalate [ratChars u.1, ratChars u.2]
/-- Value represented by the two fractions of one decimal node. -/
def nodeValue (u : NodeCode) : ℚ × ℚ := (ratValue u.1, ratValue u.2)

private theorem node_read (u : NodeCode) : parseCap (String.ofList (nodeChars u)) = nodeValue u := by
  unfold parseCap nodeChars
  change (match (String.ofList ([':'].intercalate [ratChars u.1, ratChars u.2])).splitOn
      (String.singleton ':') with
    | [n,d] => (parseQ n, parseQ d) | _ => (0,0)) = _
  rw [splitFields ':' _ (by simp [rat_avoids _ ':' (by decide) (by decide)]) (by simp)]
  simp [nodeValue, rat_read]

private theorem node_avoids (u : NodeCode) : ';' ∉ nodeChars u := by
  simp [nodeChars, List.intercalate, rat_avoids _ ';' (by decide) (by decide)]

/-- A byte-for-byte match with the committed row proves the value of every node. -/
theorem decodeRow {r : Row} {xs : List NodeCode}
    (encoded : String.ofList ([';'].intercalate (xs.map nodeChars)) = r.nodes)
    (hne : r.nodes ≠ "") (hxs : xs ≠ []) : r.nodeList = xs.map nodeValue := by
  simp only [Row.nodeList, splitL, hne, ↓reduceIte]
  change (r.nodes.splitOn (String.singleton ';')).map parseCap = _
  have hno : ∀ v ∈ xs.map nodeChars, ';' ∉ v := by
    intro v hv
    obtain ⟨u, _, rfl⟩ := List.mem_map.mp hv
    exact node_avoids u
  rw [← encoded, splitFields ';' _ hno (by simpa using hxs)]
  simp [List.map_map, Function.comp_def, node_read]

end Grothe.Lower.RowParser
