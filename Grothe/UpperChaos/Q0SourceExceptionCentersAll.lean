import Grothe.UpperChaos.Q0SourceExceptionCentersChunk00
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk01
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk02
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk03
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk04
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk05
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk06
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk07
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk08
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk09
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk10
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk11
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk12
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk13
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk14
import Grothe.UpperChaos.Q0SourceExceptionCentersChunk15

/-! Exact exceptional-row support. Generated; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionCentersAll

open Grothe.UpperChaos.Q0SourceExceptionCenters

set_option maxRecDepth 65536
set_option maxHeartbeats 0

def rows : List Row := Q0SourceExceptionCentersChunk00.rows ++ Q0SourceExceptionCentersChunk01.rows ++ Q0SourceExceptionCentersChunk02.rows ++ Q0SourceExceptionCentersChunk03.rows ++ Q0SourceExceptionCentersChunk04.rows ++ Q0SourceExceptionCentersChunk05.rows ++ Q0SourceExceptionCentersChunk06.rows ++ Q0SourceExceptionCentersChunk07.rows ++ Q0SourceExceptionCentersChunk08.rows ++ Q0SourceExceptionCentersChunk09.rows ++ Q0SourceExceptionCentersChunk10.rows ++ Q0SourceExceptionCentersChunk11.rows ++ Q0SourceExceptionCentersChunk12.rows ++ Q0SourceExceptionCentersChunk13.rows ++ Q0SourceExceptionCentersChunk14.rows ++ Q0SourceExceptionCentersChunk15.rows

theorem all_valid : rows.all validRow = true := by
  simp only [rows, List.all_append, Q0SourceExceptionCentersChunk00.all_valid, Q0SourceExceptionCentersChunk01.all_valid, Q0SourceExceptionCentersChunk02.all_valid, Q0SourceExceptionCentersChunk03.all_valid, Q0SourceExceptionCentersChunk04.all_valid, Q0SourceExceptionCentersChunk05.all_valid, Q0SourceExceptionCentersChunk06.all_valid, Q0SourceExceptionCentersChunk07.all_valid, Q0SourceExceptionCentersChunk08.all_valid, Q0SourceExceptionCentersChunk09.all_valid, Q0SourceExceptionCentersChunk10.all_valid, Q0SourceExceptionCentersChunk11.all_valid, Q0SourceExceptionCentersChunk12.all_valid, Q0SourceExceptionCentersChunk13.all_valid, Q0SourceExceptionCentersChunk14.all_valid, Q0SourceExceptionCentersChunk15.all_valid, Bool.and_true]

theorem row_count : rows.length = 417 := by decide +kernel

theorem cutoff_counts :
    (rows.filter (fun r => r.cutoff == 1)).length = 411 ∧
    (rows.filter (fun r => r.cutoff == 2)).length = 6 := by decide +kernel

theorem ordinals : rows.map Row.ordinal =
    List.range' 3872 165 ++ List.range' 10910 128 ++ List.range' 17321 124 := by
  decide +kernel

theorem each_length_le_five (r : Row) (hr : r ∈ rows) : r.words.length ≤ 5 :=
  validRow_length_le_five r ((List.all_eq_true.mp all_valid) r hr)

theorem each_scalar (r : Row) (hr : r ∈ rows) (i : Fin r.words.length) :
    ‖(center r i : ℂ)‖ ≤ (11 / 10 : ℝ) :=
  center_norm_le_eleven_tenths r ((List.all_eq_true.mp all_valid) r hr) i

end Grothe.UpperChaos.Q0SourceExceptionCentersAll
