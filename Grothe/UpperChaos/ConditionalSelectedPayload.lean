import Grothe.UpperChaos.ConditionalNodeIndices
import Grothe.UpperChaos.Q0ConditionalRetention
import Grothe.UpperChaos.OriginalRow227Payload

/-!
# Successful original-payload lookup for every selected conditional mode

No new table of decoded values or numerical error estimate is asserted.

Every selected pair has total degree at most 501. The established production
retention theorem bounds its rank by the degree-502 prefix, namely 35537.
The actual row retains its original cutoff 532 and all 35777 source words.
Proof-indexed lookup supplies a genuine word, without a fallback or a changed
payload. Production rational and complex centers decode that same word.

Agent-ID: codex-aa04. Refs #293, #21.
-/

namespace Grothe.UpperChaos.ConditionalSelectedPayload

open ConditionalNodeIndices Q0ConditionalPairRankCheck
open Q0SourceExceptionCenters Q0SourceSavedLinearModel

/-- The selected contraction is contained in degrees zero through 501. -/
theorem selected_degree_le {c d : ℕ} (h : (c, d) ∈ modes) : c + d ≤ 501 := by
  have hm := (mem_modes c d).mp h
  omega

/-- The complete production block through degree 501 ends at rank 35536.
This is a containing prefix bound, not an assertion that `modes` is a prefix. -/
theorem selected_rank_le {c d : ℕ} (h : (c, d) ∈ modes) :
    rank c d ≤ 35536 := by
  have hs := storage_bounds h
  have hr := (Q0ConditionalRetention.retained_iff_degree_le_cutoff c d 501
    hs.1 hs.2.1 hs.2.2.1 hs.2.2.2).mpr (selected_degree_le h)
  have hprefix : Q0ConditionalMetadataCheck.pairPrefix (min 501 531 + 1) =
      35537 := by decide
  rw [hprefix] at hr
  omega

/-- The selected boundary actually attains the symbolic rank upper bound. -/
theorem selected_rank_maximum :
    (251, 250) ∈ modes ∧ rank 251 250 = 35536 ∧
      ∀ c d : ℕ, (c, d) ∈ modes → rank c d ≤ rank 251 250 := by
  refine ⟨(mem_modes 251 250).mpr ⟨by decide, by decide⟩,
    OriginalRow227Payload.boundary_rank, ?_⟩
  intro c d h
  rw [OriginalRow227Payload.boundary_rank]
  exact selected_rank_le h

/-- A row containing this many words supports every selected production rank. -/
theorem selected_rank_lt_of_length (r : Q0SourceExceptionCenters.Row)
    (hlen : 35537 ≤ r.words.length)
    {c d : ℕ} (h : (c, d) ∈ modes) : rank c d < r.words.length := by
  have hr := selected_rank_le h
  omega

/-- The complete original row provides every selected lookup. Its length is
the cached payload theorem, so the list itself is not reduced here. -/
theorem selected_rank_lt {c d : ℕ} (h : (c, d) ∈ modes) :
    rank c d < OriginalRow227Payload.row.words.length := by
  apply selected_rank_lt_of_length OriginalRow227Payload.row _ h
  rw [OriginalRow227Payload.words_length]
  decide

/-- Coverage keeps the original source header and the full retained extent. -/
theorem selected_original_coverage :
    OriginalRow227Payload.row.ordinal = 227 ∧
      OriginalRow227Payload.row.sourceStart = 8121379 ∧
      OriginalRow227Payload.row.cutoff = 532 ∧
      OriginalRow227Payload.row.words.length = 35777 ∧
      ∀ c d : ℕ, (c, d) ∈ modes →
        rank c d < OriginalRow227Payload.row.words.length := by
  exact ⟨OriginalRow227Payload.row_header.1,
    OriginalRow227Payload.row_header.2.1,
    OriginalRow227Payload.row_header.2.2,
    OriginalRow227Payload.words_length, fun _ _ h => selected_rank_lt h⟩

/-- A successful lookup at a finite list index, stated without a default. -/
theorem lookup_eq_some_get {α : Type*} (xs : List α) (i : Fin xs.length) :
    xs[i.val]? = some (xs.get i) := by
  simpa only [List.get_eq_getElem] using (List.getElem?_eq_getElem i.isLt)

/-- The actual production address of a selected mode in the original row. -/
def selectedIndex (p : ℕ × ℕ) (hp : p ∈ modes) :
    Fin OriginalRow227Payload.row.words.length :=
  ⟨rank p.1 p.2, selected_rank_lt (c := p.1) (d := p.2) hp⟩

/-- An actual original word obtained through the proven finite address.
No `getD`, padding word, or failure branch occurs in this definition. -/
def selectedWord (p : ℕ × ℕ) (hp : p ∈ modes) : ℕ :=
  OriginalRow227Payload.row.words.get (selectedIndex p hp)

/-- Every selected safe lookup succeeds in the unchanged full payload. -/
theorem selected_lookup (p : ℕ × ℕ) (hp : p ∈ modes) :
    OriginalRow227Payload.row.words[rank p.1 p.2]? = some (selectedWord p hp) :=
  lookup_eq_some_get OriginalRow227Payload.row.words (selectedIndex p hp)

/-- The rational production lookup is exactly the decoder of that word. -/
theorem selected_storedScalar (p : ℕ × ℕ) (hp : p ∈ modes) :
    storedScalar OriginalRow227Payload.row p = value (selectedWord p hp) :=
  OriginalRow227Payload.storedScalar_eq_of_lookup OriginalRow227Payload.row p
    (selectedWord p hp) (selected_lookup p hp)

/-- The complex production lookup decodes the same successful source word. -/
theorem selected_storedModeCenter (p : ℕ × ℕ) (hp : p ∈ modes) :
    storedModeCenter OriginalRow227Payload.row p = (value (selectedWord p hp) : ℂ) := by
  exact (storedScalar_cast OriginalRow227Payload.row p).symm.trans
    (congrArg (fun q : ℚ => (q : ℂ)) (selected_storedScalar p hp))

/-- Every selected pair has one actual successful payload word, shared by
the rational and complex production decoders. The assertion never uses the
zero-completion branch or a replacement short row. -/
theorem selected_unique_decoded_word (p : ℕ × ℕ) (hp : p ∈ modes) :
    ∃! word : ℕ,
      OriginalRow227Payload.row.words[rank p.1 p.2]? = some word ∧
      storedScalar OriginalRow227Payload.row p = value word ∧
      storedModeCenter OriginalRow227Payload.row p = (value word : ℂ) := by
  refine ⟨selectedWord p hp,
    ⟨selected_lookup p hp, selected_storedScalar p hp, selected_storedModeCenter p hp⟩,
    ?_⟩
  intro word hword
  exact Option.some.inj (hword.1.symm.trans (selected_lookup p hp))

end Grothe.UpperChaos.ConditionalSelectedPayload
