import Grothe.UpperChaos.Q0ConditionalMetadataGroup000
import Grothe.UpperChaos.Q0ConditionalMetadataGroup001
import Grothe.UpperChaos.Q0ConditionalMetadataGroup002
import Grothe.UpperChaos.Q0ConditionalMetadataGroup003
import Grothe.UpperChaos.Q0ConditionalMetadataGroup004
import Grothe.UpperChaos.Q0ConditionalMetadataGroup005
import Grothe.UpperChaos.Q0ConditionalMetadataGroup006
import Grothe.UpperChaos.Q0ConditionalMetadataGroup007
import Grothe.UpperChaos.Q0ConditionalMetadataGroup008
import Grothe.UpperChaos.Q0ConditionalMetadataGroup009
import Grothe.UpperChaos.Q0ConditionalMetadataGroup010
import Grothe.UpperChaos.Q0ConditionalMetadataGroup011
import Grothe.UpperChaos.Q0ConditionalMetadataGroup012
import Grothe.UpperChaos.Q0ConditionalMetadataGroup013
import Grothe.UpperChaos.Q0ConditionalMetadataGroup014
import Grothe.UpperChaos.Q0ConditionalMetadataGroup015
import Grothe.UpperChaos.Q0ConditionalMetadataGroup016
import Grothe.UpperChaos.Q0ConditionalMetadataGroup017
import Grothe.UpperChaos.Q0ConditionalMetadataGroup018
import Grothe.UpperChaos.Q0ConditionalMetadataGroup019
import Grothe.UpperChaos.Q0ConditionalMetadataGroup020
import Grothe.UpperChaos.Q0ConditionalMetadataGroup021
import Grothe.UpperChaos.Q0OrdinalCoverage

/-! Source ordinal coverage for the complete original offset/cutoff table.
Numerical coefficient bounds and NPY payload decoding remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalMetadataAll

open Grothe.UpperChaos.Q0ConditionalMetadataCheck
open Grothe.UpperChaos.Q0GaussOrdinalEquiv

def rows : List Row := Grothe.UpperChaos.Q0ConditionalMetadataGroup000.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup001.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup002.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup003.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup004.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup005.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup006.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup007.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup008.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup009.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup010.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup011.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup012.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup013.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup014.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup015.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup016.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup017.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup018.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup019.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup020.rows ++ Grothe.UpperChaos.Q0ConditionalMetadataGroup021.rows

theorem checked : rows.all valid = true := by
  simp only [rows, List.all_append, Grothe.UpperChaos.Q0ConditionalMetadataGroup000.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup001.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup002.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup003.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup004.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup005.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup006.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup007.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup008.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup009.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup010.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup011.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup012.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup013.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup014.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup015.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup016.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup017.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup018.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup019.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup020.checked, Grothe.UpperChaos.Q0ConditionalMetadataGroup021.checked, Bool.and_self]

theorem indices : rows.map Row.index = List.range' 0 21577 := by
  simp only [rows, List.map_append, Grothe.UpperChaos.Q0ConditionalMetadataGroup000.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup001.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup002.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup003.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup004.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup005.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup006.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup007.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup008.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup009.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup010.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup011.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup012.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup013.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup014.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup015.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup016.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup017.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup018.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup019.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup020.indices, Grothe.UpperChaos.Q0ConditionalMetadataGroup021.indices, List.append_assoc]
  rw [← List.range'_append_1 (s := 0) (m := 1024) (n := 20553),
    ← List.range'_append_1 (s := 1024) (m := 1024) (n := 19529),
    ← List.range'_append_1 (s := 2048) (m := 1024) (n := 18505),
    ← List.range'_append_1 (s := 3072) (m := 1024) (n := 17481),
    ← List.range'_append_1 (s := 4096) (m := 1024) (n := 16457),
    ← List.range'_append_1 (s := 5120) (m := 1024) (n := 15433),
    ← List.range'_append_1 (s := 6144) (m := 1024) (n := 14409),
    ← List.range'_append_1 (s := 7168) (m := 1024) (n := 13385),
    ← List.range'_append_1 (s := 8192) (m := 1024) (n := 12361),
    ← List.range'_append_1 (s := 9216) (m := 1024) (n := 11337),
    ← List.range'_append_1 (s := 10240) (m := 1024) (n := 10313),
    ← List.range'_append_1 (s := 11264) (m := 1024) (n := 9289),
    ← List.range'_append_1 (s := 12288) (m := 1024) (n := 8265),
    ← List.range'_append_1 (s := 13312) (m := 1024) (n := 7241),
    ← List.range'_append_1 (s := 14336) (m := 1024) (n := 6217),
    ← List.range'_append_1 (s := 15360) (m := 1024) (n := 5193),
    ← List.range'_append_1 (s := 16384) (m := 1024) (n := 4169),
    ← List.range'_append_1 (s := 17408) (m := 1024) (n := 3145),
    ← List.range'_append_1 (s := 18432) (m := 1024) (n := 2121),
    ← List.range'_append_1 (s := 19456) (m := 1024) (n := 1097),
    ← List.range'_append_1 (s := 20480) (m := 1024) (n := 73)]

/-- All 21,577 records form a continuous ordinal and offset chain. -/
theorem chain : rows.IsChain adjacent := by
  simp [rows, List.isChain_append, adjacent, Grothe.UpperChaos.Q0ConditionalMetadataGroup000.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup001.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup002.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup003.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup004.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup005.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup006.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup007.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup008.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup009.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup010.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup011.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup012.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup013.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup014.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup015.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup016.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup017.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup018.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup019.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup020.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup021.chain, Grothe.UpperChaos.Q0ConditionalMetadataGroup001.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup002.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup003.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup004.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup005.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup006.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup007.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup008.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup009.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup010.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup011.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup012.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup013.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup014.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup015.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup016.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup017.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup018.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup019.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup020.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup021.first, Grothe.UpperChaos.Q0ConditionalMetadataGroup000.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup001.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup002.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup003.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup004.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup005.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup006.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup007.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup008.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup009.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup010.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup011.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup012.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup013.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup014.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup015.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup016.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup017.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup018.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup019.last, Grothe.UpperChaos.Q0ConditionalMetadataGroup020.last]

/-- Every actual source panel/rule address has exactly one metadata row. -/
theorem unique_row_for_address (a : Address) :
    ∃! r : Row, r ∈ rows ∧ r.index = (fromAddress a).val :=
  Grothe.UpperChaos.Q0OrdinalCoverage.exists_unique_of_map_range Row.index
    rows 21577 indices (fromAddress a).val (fromAddress a).isLt

noncomputable def rowAt (a : Address) : Row :=
  Classical.choose (unique_row_for_address a).exists

/-- The actual-address row preserves the original ordinal and its
stored offset/cutoff integer invariants. -/
theorem rowAt_spec (a : Address) :
    rowAt a ∈ rows ∧ (rowAt a).index = (fromAddress a).val ∧
    (rowAt a).cutoff ≤ 532 ∧
    (rowAt a).last = (rowAt a).first + pairPrefix (min (rowAt a).cutoff 531 + 1) ∧
    (rowAt a).last ≤ 421701618 := by
  have h := Classical.choose_spec (unique_row_for_address a).exists
  have hv := valid_sound (rowAt a) ((List.all_eq_true.mp checked) (rowAt a) h.1)
  exact ⟨h.1, h.2, hv.2.1, hv.2.2.1, hv.2.2.2⟩

/-- A retained rank resolves to a valid value-record and byte span in
the original little-endian NPY payload (which starts after 128 bytes). -/
theorem retained_index_bounds (a : Address) (rank : ℕ)
    (h : rank < (rowAt a).last - (rowAt a).first) :
    (rowAt a).first ≤ (rowAt a).first + rank ∧
    (rowAt a).first + rank < (rowAt a).last ∧
    (rowAt a).first + rank < 421701618 ∧
    128 + 8 * ((rowAt a).first + rank) + 8 ≤ 3373613072 := by
  have hl := (rowAt_spec a).2.2.2.2
  omega

/-- The original table has exactly the recorded first and final offsets. -/
theorem first_offset : (Grothe.UpperChaos.Q0ConditionalMetadataGroup000.rows0.head!).first = 0 := by decide +kernel
theorem final_offset : (Grothe.UpperChaos.Q0ConditionalMetadataGroup021.rows0.getLast!).last = 421701618 := by decide +kernel

end Grothe.UpperChaos.Q0ConditionalMetadataAll
