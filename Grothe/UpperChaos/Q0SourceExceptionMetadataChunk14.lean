import Grothe.UpperChaos.Q0SourceExceptionCentersChunk14
import Grothe.UpperChaos.Q0SourceExceptionMetadata
import Grothe.UpperChaos.Q0ConditionalMetadataGroup017

/-! Generated source cutoff alignment. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionMetadataChunk14

open Grothe.UpperChaos.Q0SourceExceptionCenters
open Grothe.UpperChaos.Q0SourceExceptionCentersChunk14

set_option maxRecDepth 65536
set_option maxHeartbeats 0

def metadataRows : List Q0ConditionalMetadataCheck.Row :=
  (Q0ConditionalMetadataGroup017.rows0.drop 3).take 30

theorem metadata_aligned : rows.length = metadataRows.length ∧
    (rows.zip metadataRows).all (fun pair => matchesMetadata pair.1 pair.2) = true := by
  decide +kernel

theorem metadata_mem (m : Q0ConditionalMetadataCheck.Row) (hm : m ∈ metadataRows) :
    m ∈ Q0ConditionalMetadataGroup017.rows := by
  change m ∈ (Q0ConditionalMetadataGroup017.rows0.drop 3).take 30 at hm
  have hp : m ∈ Q0ConditionalMetadataGroup017.rows0 :=
    List.mem_of_mem_drop (List.mem_of_mem_take hm)
  have hg : m ∈ Q0ConditionalMetadataGroup017.rows := by
    simp only [Q0ConditionalMetadataGroup017.rows, List.mem_append]
    tauto
  exact hg

end Grothe.UpperChaos.Q0SourceExceptionMetadataChunk14
