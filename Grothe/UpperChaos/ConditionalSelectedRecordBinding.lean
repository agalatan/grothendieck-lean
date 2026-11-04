import Grothe.UpperChaos.ConditionalSelectedPayload
import Grothe.UpperChaos.OriginalRow227ErrorBoundary
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
Symbolic original-payload field binding.

These symbolic bridges consume an actual successful original-payload lookup
for each error record. They do not establish that lookup from record metadata,
selected membership, equal list lengths, or the existence of some saved word.
Successful selected-payload lookup is supplied by ConditionalSelectedPayload.

Agent-ID: codex-aa04. Refs #293, #21.
-/

namespace Grothe.UpperChaos.ConditionalSelectedRecordBinding

open OriginalRow227ErrorBoundary Q0SourceExceptionCenters

/-- Both obligations needed to attach a stored record word to the production
address. The original full row, rank, and word remain explicit. -/
def PayloadBound (e : ErrorEntry) : Prop :=
  e.rank = Q0ConditionalPairRankCheck.rank e.c e.d ∧
    OriginalRow227Payload.row.words[e.rank]? = some e.word

/-- Reindex only by the proven production-rank identity. No list is reduced. -/
theorem lookup_at_rank (e : ErrorEntry)
    (hrank : e.rank = Q0ConditionalPairRankCheck.rank e.c e.d)
    (hlookup : OriginalRow227Payload.row.words[e.rank]? = some e.word) :
    OriginalRow227Payload.row.words[Q0ConditionalPairRankCheck.rank e.c e.d]? =
      some e.word := by
  rw [← hrank]
  exact hlookup

/-- Successful lookup identifies the concrete record word with the word
obtained by the proof-indexed selected lookup. -/
theorem selectedWord_eq (e : ErrorEntry)
    (hm : (e.c, e.d) ∈ ConditionalNodeIndices.modes)
    (hrank : e.rank = Q0ConditionalPairRankCheck.rank e.c e.d)
    (hlookup : OriginalRow227Payload.row.words[e.rank]? = some e.word) :
    ConditionalSelectedPayload.selectedWord (e.c, e.d) hm = e.word := by
  exact Option.some.inj
    ((ConditionalSelectedPayload.selected_lookup (e.c, e.d) hm).symm.trans
      (lookup_at_rank e hrank hlookup))

/-- The production rational center decodes the successfully bound record word.
Lookup success itself supplies range safety; no zero-completion case is used. -/
theorem storedScalar_eq (e : ErrorEntry)
    (hrank : e.rank = Q0ConditionalPairRankCheck.rank e.c e.d)
    (hlookup : OriginalRow227Payload.row.words[e.rank]? = some e.word) :
    Q0SourceSavedLinearModel.storedScalar OriginalRow227Payload.row (e.c, e.d) =
      value e.word :=
  OriginalRow227Payload.storedScalar_eq_of_lookup OriginalRow227Payload.row
    (e.c, e.d) e.word (lookup_at_rank e hrank hlookup)

/-- The existing complex center is the cast of the same rational decoder. -/
theorem storedModeCenter_eq (e : ErrorEntry)
    (hrank : e.rank = Q0ConditionalPairRankCheck.rank e.c e.d)
    (hlookup : OriginalRow227Payload.row.words[e.rank]? = some e.word) :
    storedModeCenter OriginalRow227Payload.row (e.c, e.d) = (value e.word : ℂ) := by
  exact (Q0SourceSavedLinearModel.storedScalar_cast
    OriginalRow227Payload.row (e.c, e.d)).symm.trans
      (congrArg (fun q : ℚ => (q : ℂ)) (storedScalar_eq e hrank hlookup))

/-- Every member retains its own rank and concrete successful word lookup. -/
def AllPayloadBound (entries : List ErrorEntry) : Prop :=
  ∀ e ∈ entries, PayloadBound e

theorem allPayloadBound_nil : AllPayloadBound [] := by
  intro e he
  cases he

/-- Cons composition can combine a bounded group of concrete leaf bindings. -/
theorem allPayloadBound_cons (e : ErrorEntry) (entries : List ErrorEntry)
    (he : PayloadBound e) (hentries : AllPayloadBound entries) :
    AllPayloadBound (e :: entries) := by
  intro x hx
  rcases List.mem_cons.mp hx with rfl | hx
  · exact he
  · exact hentries x hx

/-- Balanced append composition never evaluates the constituent record lists. -/
theorem allPayloadBound_append (left right : List ErrorEntry)
    (hleft : AllPayloadBound left) (hright : AllPayloadBound right) :
    AllPayloadBound (left ++ right) := by
  intro e he
  rcases List.mem_append.mp he with he | he
  · exact hleft e he
  · exact hright e he

/-- A completed list binding yields each production-address lookup directly. -/
theorem lookup_of_allPayloadBound (entries : List ErrorEntry)
    (hentries : AllPayloadBound entries) (e : ErrorEntry) (he : e ∈ entries) :
    OriginalRow227Payload.row.words[Q0ConditionalPairRankCheck.rank e.c e.d]? =
      some e.word := by
  have h := hentries e he
  exact lookup_at_rank e h.1 h.2

end Grothe.UpperChaos.ConditionalSelectedRecordBinding

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.lookup_at_rank,
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.selectedWord_eq,
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.storedScalar_eq,
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.storedModeCenter_eq,
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.allPayloadBound_nil,
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.allPayloadBound_cons,
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.allPayloadBound_append,
      ``Grothe.UpperChaos.ConditionalSelectedRecordBinding.lookup_of_allPayloadBound] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
