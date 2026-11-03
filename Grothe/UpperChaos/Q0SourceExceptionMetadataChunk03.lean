import Grothe.UpperChaos.Q0SourceExceptionCentersChunk03
import Grothe.UpperChaos.Q0SourceExceptionMetadata
import Grothe.UpperChaos.Q0ConditionalMetadataGroup003

/-! Generated source cutoff alignment. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionMetadataChunk03

open Grothe.UpperChaos.Q0SourceExceptionCenters
open Grothe.UpperChaos.Q0SourceExceptionCentersChunk03

set_option maxRecDepth 65536
set_option maxHeartbeats 0

def metadataRows : List Q0ConditionalMetadataCheck.Row :=
  (Q0ConditionalMetadataGroup003.rows6.drop 122).take 6 ++ (Q0ConditionalMetadataGroup003.rows7.drop 0).take 24

theorem metadata_aligned : rows.length = metadataRows.length ∧
    (rows.zip metadataRows).all (fun pair => matchesMetadata pair.1 pair.2) = true := by
  decide +kernel

theorem metadata_mem (m : Q0ConditionalMetadataCheck.Row) (hm : m ∈ metadataRows) :
    m ∈ Q0ConditionalMetadataGroup003.rows := by
  simp only [metadataRows, List.mem_append] at hm
  rcases hm with hm | hm
  · have hp : m ∈ Q0ConditionalMetadataGroup003.rows6 :=
      List.mem_of_mem_drop (List.mem_of_mem_take hm)
    have hg : m ∈ Q0ConditionalMetadataGroup003.rows := by
      simp only [Q0ConditionalMetadataGroup003.rows, List.mem_append]
      tauto
    exact hg
  · have hp : m ∈ Q0ConditionalMetadataGroup003.rows7 :=
      List.mem_of_mem_drop (List.mem_of_mem_take hm)
    have hg : m ∈ Q0ConditionalMetadataGroup003.rows := by
      simp only [Q0ConditionalMetadataGroup003.rows, List.mem_append]
      tauto
    exact hg

end Grothe.UpperChaos.Q0SourceExceptionMetadataChunk03
