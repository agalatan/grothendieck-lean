import Grothe.UpperChaos.PackedDyadic
import Std.Data.String.ToNat
import Std.Data.String.ToInt
import Init.Data.String.Lemmas.Pattern.Split.Char
import Init.Data.String.Lemmas.Pattern.TakeDrop.Char
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Structural decoding of packed dyadic tokens

The natural and integer readers agree with the existing standard-library
readers on every string, including malformed input and interior underscores.
The record and row readers operate on character lists. Their connection to
the public decoder retains the separate legacy `String.splitOn` obligation;
the modern split theorem alone does not discharge that obligation.

The public decoder, packed sources and center arrays are unchanged.
Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.PackedDyadic.Structural

set_option maxHeartbeats 1000000

/-- The exact natural-number grammar of `String.toNat?`. -/
def NatSyntax (cs : List Char) : Prop :=
  cs ≠ [] ∧
    (∀ c ∈ cs, c.isDigit = true ∨ c = '_') ∧
    ¬ ['_', '_'] <:+: cs ∧
    cs.head? ≠ some '_' ∧ cs.getLast? ≠ some '_'

instance (cs : List Char) : Decidable (NatSyntax cs) := by
  unfold NatSyntax
  infer_instance

/-- A total, strict character-list reader; all arithmetic is structural. -/
def natToken? (cs : List Char) : Option ℕ :=
  if NatSyntax cs then
    some (Nat.ofDigitChars 10 (cs.filter (· != '_')) 0)
  else none

theorem natSyntax_iff (s : String) : NatSyntax s.toList ↔ s.isNat = true := by
  rw [String.isNat_iff]
  simp only [NatSyntax, ne_eq, String.toList_eq_nil_iff]

/-- This equality covers invalid input as well as successful decoding. -/
theorem natToken?_eq (s : String) : natToken? s.toList = s.toNat? := by
  by_cases h : s.isNat = true
  · rw [natToken?, ite_eq_left ((natSyntax_iff s).mpr h),
      String.toNat?_eq_some_ofDigitChars h]
  · have hf : s.isNat = false := by cases hs : s.isNat <;> simp_all
    rw [natToken?, ite_eq_right (by simpa only [natSyntax_iff] using h),
      String.toNat?_eq_none hf]

/-- Only a leading minus is a sign; plus and embedded signs are rejected. -/
def intToken? (cs : List Char) : Option ℤ :=
  match cs with
  | [] => (natToken? []).map (fun n : ℕ => (n : ℤ))
  | c :: rest =>
      if c = '-' then (natToken? rest).map (fun n : ℕ => -(n : ℤ))
      else (natToken? cs).map (fun n : ℕ => (n : ℤ))

theorem intToken?_ofList (cs : List Char) :
    intToken? cs = (String.ofList cs).toInt? := by
  have hn (xs : List Char) : natToken? xs = (String.ofList xs).toNat? := by
    simpa only [String.toList_ofList] using natToken?_eq (String.ofList xs)
  cases cs with
  | nil =>
      rw [String.toInt?_eq_toNat?_of_startsWith_eq_false (by decide)]
      exact congrArg (Option.map (fun n : ℕ => (n : ℤ))) (hn [])
  | cons c cs =>
      by_cases hc : c = '-'
      · subst c
        simp only [intToken?, ite_eq_left rfl, String.ofList_cons, String.reduceSingleton,
          String.toInt?_minus_append, hn]
      · have hstart : (String.ofList (c :: cs)).startsWith '-' = false := by
          simp [String.startsWith_char_eq_head?, hc]
        rw [String.toInt?_eq_toNat?_of_startsWith_eq_false hstart]
        simpa only [intToken?, ite_eq_right hc] using
          congrArg (Option.map (fun n : ℕ => (n : ℤ))) (hn (c :: cs))

theorem intToken?_eq (s : String) : intToken? s.toList = s.toInt? := by
  simpa only [String.ofList_toList] using intToken?_ofList s.toList

/-- Decode exactly two fields, retaining both public range checks. -/
def recordFields? (E : ℕ) (fields : List (List Char)) : Option ℤ :=
  match fields with
  | [mantissaText, exponentText] => do
      let mantissa ← intToken? mantissaText
      let exponent ← natToken? exponentText
      if exponent ≤ E ∧ mantissa.natAbs < 2 ^ 53 then
        some (mantissa * (2 : ℤ) ^ (E - exponent))
      else none
  | _ => none

/-- Token decoding can already replace the numeric stage of the public parser. -/
theorem parseRecord_eq_fields (E : ℕ) (record : String) :
    parseRecord E record =
      recordFields? E ((record.splitOn ":").map String.toList) := by
  unfold parseRecord
  generalize record.splitOn ":" = fields
  match fields with
  | [] => rfl
  | [_] => rfl
  | [m, e] => simp only [List.map_cons, List.map_nil, recordFields?,
      intToken?_eq, natToken?_eq]
  | _ :: _ :: _ :: _ => rfl

/-- The delimiter stage uses structural list splitting. -/
def record? (E : ℕ) (cs : List Char) : Option ℤ :=
  recordFields? E (cs.splitOn ':')

/-- Modern standard-library splitting agrees unconditionally with this stage. -/
theorem modern_split_tokens (s : String) (c : Char) :
    ((s.split c).toList.map String.Slice.copy).map String.toList =
      s.toList.splitOn c := by
  rw [String.toList_split_char]
  simp only [List.map_map, Function.comp_def, String.toList_ofList, List.map_id_fun', id_eq]

/-- The remaining legacy delimiter obligation is stated separately. -/
theorem parseRecord_eq_record (E : ℕ) (s : String)
    (hsplit : (s.splitOn ":").map String.toList = s.toList.splitOn ':') :
    parseRecord E s = record? E s.toList := by
  rw [parseRecord_eq_fields, hsplit]
  rfl

/-- Empty rows are allowed; empty records in nonempty rows are rejected. -/
def row? (E : ℕ) (cs : List Char) : Option (List ℤ) :=
  if cs = [] then some [] else (cs.splitOn ',').mapM (record? E)

/-- Nonempty source fragments can be checked separately and joined at a comma. -/
theorem row?_append (E : ℕ) (xs ys : List Char) (hx : xs ≠ []) (hy : ys ≠ []) :
    row? E (xs ++ ',' :: ys) = (do
      let a ← row? E xs
      let b ← row? E ys
      pure (a ++ b)) := by
  have hxy : xs ++ ',' :: ys ≠ [] := by simp
  rw [row?, ite_eq_right hxy, List.splitOn_append_cons_self, List.mapM_append]
  simp only [row?, ite_eq_right hx, ite_eq_right hy]

theorem row?_append_of_eq (E : ℕ) (xs ys : List Char) (a b : List ℤ)
    (hx : xs ≠ []) (hy : ys ≠ [])
    (ha : row? E xs = some a) (hb : row? E ys = some b) :
    row? E (xs ++ ',' :: ys) = some (a ++ b) := by
  simpa [ha, hb] using row?_append E xs ys hx hy

/-- A row certificate needs only delimiter compatibility, not numeric assumptions. -/
theorem parse_eq_row (E : ℕ) (s : String)
    (hrows : (s.splitOn ",").map String.toList = s.toList.splitOn ',')
    (hrecords : ∀ r ∈ s.splitOn ",",
      (r.splitOn ":").map String.toList = r.toList.splitOn ':') :
    parse E s = (row? E s.toList).map List.toArray := by
  by_cases hs : s = ""
  · subst s
    rfl
  · have hn : s.toList ≠ [] := by
      simpa only [ne_eq, String.toList_eq_nil_iff] using hs
    simp only [parse, beq_iff_eq, hs, ↓reduceIte, row?, hn]
    rw [← hrows, List.mapM_map]
    congr 1
    have h : ∀ r ∈ s.splitOn ",", parseRecord E r = record? E r.toList := by
      intro r hr
      exact parseRecord_eq_record E r (hrecords r hr)
    generalize s.splitOn "," = rows at h ⊢
    revert h
    induction rows with
    | nil => intro _; rfl
    | cons r rows ih =>
        intro h
        have hr := h r (by simp)
        have ht := ih (fun t ht => h t (by simp [ht]))
        simp only [List.mapM_cons, hr, ht, Function.comp_def]

/-- Structural rows of characters are concatenated only after every row succeeds. -/
def chunks? (E : ℕ) (chunks : List (List Char)) : Option (List ℤ) := do
  let rows ← chunks.mapM (row? E)
  pure rows.flatten

end Grothe.UpperChaos.PackedDyadic.Structural

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.PackedDyadic.Structural.natSyntax_iff,
      ``Grothe.UpperChaos.PackedDyadic.Structural.natToken?_eq,
      ``Grothe.UpperChaos.PackedDyadic.Structural.intToken?_ofList,
      ``Grothe.UpperChaos.PackedDyadic.Structural.intToken?_eq,
      ``Grothe.UpperChaos.PackedDyadic.Structural.parseRecord_eq_fields,
      ``Grothe.UpperChaos.PackedDyadic.Structural.modern_split_tokens,
      ``Grothe.UpperChaos.PackedDyadic.Structural.parseRecord_eq_record,
      ``Grothe.UpperChaos.PackedDyadic.Structural.row?_append,
      ``Grothe.UpperChaos.PackedDyadic.Structural.row?_append_of_eq,
      ``Grothe.UpperChaos.PackedDyadic.Structural.parse_eq_row] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
