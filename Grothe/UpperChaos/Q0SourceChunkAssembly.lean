import Grothe.UpperChaos.Q0LiteralChunkAssembly
import Grothe.UpperChaos.Q0ChunkDenominators
import Mathlib.Data.List.SplitLengths
import Grothe.UpperChaos.Q0Chunk_o0_n32
import Grothe.UpperChaos.Q0ChunkDen_o0_n32
import Grothe.UpperChaos.Q0Chunk_o32_n16
import Grothe.UpperChaos.Q0ChunkDen_o32_n16
import Grothe.UpperChaos.Q0Chunk_o48_n16
import Grothe.UpperChaos.Q0ChunkDen_o48_n16
import Grothe.UpperChaos.Q0Chunk_o64_n16
import Grothe.UpperChaos.Q0ChunkDen_o64_n16
import Grothe.UpperChaos.Q0Chunk_o80_n16
import Grothe.UpperChaos.Q0ChunkDen_o80_n16
import Grothe.UpperChaos.Q0Chunk_o96_n16
import Grothe.UpperChaos.Q0ChunkDen_o96_n16
import Grothe.UpperChaos.Q0Chunk_o112_n16
import Grothe.UpperChaos.Q0ChunkDen_o112_n16
import Grothe.UpperChaos.Q0Chunk_o128_n32
import Grothe.UpperChaos.Q0ChunkDen_o128_n32
import Grothe.UpperChaos.Q0Chunk_o160_n32
import Grothe.UpperChaos.Q0ChunkDen_o160_n32
import Grothe.UpperChaos.Q0Chunk_o192_n32
import Grothe.UpperChaos.Q0ChunkDen_o192_n32
import Grothe.UpperChaos.Q0Chunk_o224_n16
import Grothe.UpperChaos.Q0ChunkDen_o224_n16
import Grothe.UpperChaos.Q0Chunk_o240_n16
import Grothe.UpperChaos.Q0ChunkDen_o240_n16
import Grothe.UpperChaos.Q0Chunk_o256_n16
import Grothe.UpperChaos.Q0ChunkDen_o256_n16
import Grothe.UpperChaos.Q0Chunk_o272_n16
import Grothe.UpperChaos.Q0ChunkDen_o272_n16
import Grothe.UpperChaos.Q0Chunk_o288_n32
import Grothe.UpperChaos.Q0ChunkDen_o288_n32
import Grothe.UpperChaos.Q0Chunk_o320_n32
import Grothe.UpperChaos.Q0ChunkDen_o320_n32
import Grothe.UpperChaos.Q0Chunk_o352_n32
import Grothe.UpperChaos.Q0ChunkDen_o352_n32
import Grothe.UpperChaos.Q0Chunk_o384_n32
import Grothe.UpperChaos.Q0ChunkDen_o384_n32
import Grothe.UpperChaos.Q0Chunk_o416_n32
import Grothe.UpperChaos.Q0ChunkDen_o416_n32
import Grothe.UpperChaos.Q0Chunk_o448_n32
import Grothe.UpperChaos.Q0ChunkDen_o448_n32
import Grothe.UpperChaos.Q0Chunk_o480_n32
import Grothe.UpperChaos.Q0ChunkDen_o480_n32
import Grothe.UpperChaos.Q0Chunk_o512_n32
import Grothe.UpperChaos.Q0ChunkDen_o512_n32
import Grothe.UpperChaos.Q0Chunk_o544_n32
import Grothe.UpperChaos.Q0ChunkDen_o544_n32
import Grothe.UpperChaos.Q0Chunk_o576_n32
import Grothe.UpperChaos.Q0ChunkDen_o576_n32
import Grothe.UpperChaos.Q0Chunk_o608_n32
import Grothe.UpperChaos.Q0ChunkDen_o608_n32
import Grothe.UpperChaos.Q0Chunk_o640_n32
import Grothe.UpperChaos.Q0ChunkDen_o640_n32
import Grothe.UpperChaos.Q0Chunk_o672_n32
import Grothe.UpperChaos.Q0ChunkDen_o672_n32
import Grothe.UpperChaos.Q0Chunk_o704_n32
import Grothe.UpperChaos.Q0ChunkDen_o704_n32
import Grothe.UpperChaos.Q0Chunk_o736_n32
import Grothe.UpperChaos.Q0ChunkDen_o736_n32
import Grothe.UpperChaos.Q0Chunk_o768_n32
import Grothe.UpperChaos.Q0ChunkDen_o768_n32
import Grothe.UpperChaos.Q0Chunk_o800_n32
import Grothe.UpperChaos.Q0ChunkDen_o800_n32
import Grothe.UpperChaos.Q0Chunk_o832_n32
import Grothe.UpperChaos.Q0ChunkDen_o832_n32
import Grothe.UpperChaos.Q0Chunk_o864_n32
import Grothe.UpperChaos.Q0ChunkDen_o864_n32
import Grothe.UpperChaos.Q0Chunk_o896_n32
import Grothe.UpperChaos.Q0ChunkDen_o896_n32
import Grothe.UpperChaos.Q0Chunk_o928_n32
import Grothe.UpperChaos.Q0ChunkDen_o928_n32
import Grothe.UpperChaos.Q0Chunk_o960_n32
import Grothe.UpperChaos.Q0ChunkDen_o960_n32
import Grothe.UpperChaos.Q0Chunk_o992_n32
import Grothe.UpperChaos.Q0ChunkDen_o992_n32
import Grothe.UpperChaos.Q0Chunk_o1024_n32
import Grothe.UpperChaos.Q0ChunkDen_o1024_n32
import Grothe.UpperChaos.Q0Chunk_o1056_n32
import Grothe.UpperChaos.Q0ChunkDen_o1056_n32
import Grothe.UpperChaos.Q0Chunk_o1088_n32
import Grothe.UpperChaos.Q0ChunkDen_o1088_n32
import Grothe.UpperChaos.Q0Chunk_o1120_n20
import Grothe.UpperChaos.Q0ChunkDen_o1120_n20

/-! Conditional full-source assembly. Candidate data are untrusted; the
partition-size bound, each chunk/denominator equality, the denominator LCM,
and the combined literal-table equality are explicit hypotheses.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Agent-ID: codex-8c4d. -/

open GrotheKernel
namespace Grothe.UpperChaos.Q0SourceChunkAssembly
open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0RawWickDense
open Grothe.UpperChaos.Q0ChunkDenominators
open Grothe.UpperChaos.Q0LiteralSourceData
open Grothe.UpperChaos.Q0LiteralChunkAssembly

/-- Drop/take chunks with explicit increasing offsets. -/
def offsetChunks {α : Type} (xs : List α) : Nat → List Nat → List (List α)
  | _, [] => []
  | offset, n :: ns => (xs.drop offset).take n :: offsetChunks xs (offset + n) ns

theorem offsetChunks_eq_splitLengths {α : Type} (xs : List α) (sizes : List Nat)
    (offset : Nat) : offsetChunks xs offset sizes = sizes.splitLengths (xs.drop offset) := by
  induction sizes generalizing offset with
  | nil => rfl
  | cons n sizes ih =>
      simp only [offsetChunks, List.splitLengths_cons, ih, List.drop_drop]

def sizes : List Nat := [32,16,16,16,16,16,16,32,32,32,16,16,16,16,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,20]

set_option maxRecDepth 65536 in
def pairs : List (List Grothe.UpperChaos.Q0WickChunking.SourceTerm × DenseWick) := [
  (((phaseTerms.drop 0).take 32), Grothe.UpperChaos.Q0Chunk_o0_n32.literal),
  (((phaseTerms.drop 32).take 16), Grothe.UpperChaos.Q0Chunk_o32_n16.literal),
  (((phaseTerms.drop 48).take 16), Grothe.UpperChaos.Q0Chunk_o48_n16.literal),
  (((phaseTerms.drop 64).take 16), Grothe.UpperChaos.Q0Chunk_o64_n16.literal),
  (((phaseTerms.drop 80).take 16), Grothe.UpperChaos.Q0Chunk_o80_n16.literal),
  (((phaseTerms.drop 96).take 16), Grothe.UpperChaos.Q0Chunk_o96_n16.literal),
  (((phaseTerms.drop 112).take 16), Grothe.UpperChaos.Q0Chunk_o112_n16.literal),
  (((phaseTerms.drop 128).take 32), Grothe.UpperChaos.Q0Chunk_o128_n32.literal),
  (((phaseTerms.drop 160).take 32), Grothe.UpperChaos.Q0Chunk_o160_n32.literal),
  (((phaseTerms.drop 192).take 32), Grothe.UpperChaos.Q0Chunk_o192_n32.literal),
  (((phaseTerms.drop 224).take 16), Grothe.UpperChaos.Q0Chunk_o224_n16.literal),
  (((phaseTerms.drop 240).take 16), Grothe.UpperChaos.Q0Chunk_o240_n16.literal),
  (((phaseTerms.drop 256).take 16), Grothe.UpperChaos.Q0Chunk_o256_n16.literal),
  (((phaseTerms.drop 272).take 16), Grothe.UpperChaos.Q0Chunk_o272_n16.literal),
  (((phaseTerms.drop 288).take 32), Grothe.UpperChaos.Q0Chunk_o288_n32.literal),
  (((phaseTerms.drop 320).take 32), Grothe.UpperChaos.Q0Chunk_o320_n32.literal),
  (((phaseTerms.drop 352).take 32), Grothe.UpperChaos.Q0Chunk_o352_n32.literal),
  (((phaseTerms.drop 384).take 32), Grothe.UpperChaos.Q0Chunk_o384_n32.literal),
  (((phaseTerms.drop 416).take 32), Grothe.UpperChaos.Q0Chunk_o416_n32.literal),
  (((phaseTerms.drop 448).take 32), Grothe.UpperChaos.Q0Chunk_o448_n32.literal),
  (((phaseTerms.drop 480).take 32), Grothe.UpperChaos.Q0Chunk_o480_n32.literal),
  (((phaseTerms.drop 512).take 32), Grothe.UpperChaos.Q0Chunk_o512_n32.literal),
  (((phaseTerms.drop 544).take 32), Grothe.UpperChaos.Q0Chunk_o544_n32.literal),
  (((phaseTerms.drop 576).take 32), Grothe.UpperChaos.Q0Chunk_o576_n32.literal),
  (((phaseTerms.drop 608).take 32), Grothe.UpperChaos.Q0Chunk_o608_n32.literal),
  (((phaseTerms.drop 640).take 32), Grothe.UpperChaos.Q0Chunk_o640_n32.literal),
  (((phaseTerms.drop 672).take 32), Grothe.UpperChaos.Q0Chunk_o672_n32.literal),
  (((phaseTerms.drop 704).take 32), Grothe.UpperChaos.Q0Chunk_o704_n32.literal),
  (((phaseTerms.drop 736).take 32), Grothe.UpperChaos.Q0Chunk_o736_n32.literal),
  (((phaseTerms.drop 768).take 32), Grothe.UpperChaos.Q0Chunk_o768_n32.literal),
  (((phaseTerms.drop 800).take 32), Grothe.UpperChaos.Q0Chunk_o800_n32.literal),
  (((phaseTerms.drop 832).take 32), Grothe.UpperChaos.Q0Chunk_o832_n32.literal),
  (((phaseTerms.drop 864).take 32), Grothe.UpperChaos.Q0Chunk_o864_n32.literal),
  (((phaseTerms.drop 896).take 32), Grothe.UpperChaos.Q0Chunk_o896_n32.literal),
  (((phaseTerms.drop 928).take 32), Grothe.UpperChaos.Q0Chunk_o928_n32.literal),
  (((phaseTerms.drop 960).take 32), Grothe.UpperChaos.Q0Chunk_o960_n32.literal),
  (((phaseTerms.drop 992).take 32), Grothe.UpperChaos.Q0Chunk_o992_n32.literal),
  (((phaseTerms.drop 1024).take 32), Grothe.UpperChaos.Q0Chunk_o1024_n32.literal),
  (((phaseTerms.drop 1056).take 32), Grothe.UpperChaos.Q0Chunk_o1056_n32.literal),
  (((phaseTerms.drop 1088).take 32), Grothe.UpperChaos.Q0Chunk_o1088_n32.literal),
  (((phaseTerms.drop 1120).take 20), Grothe.UpperChaos.Q0Chunk_o1120_n20.literal)
]

def candidateDenominators : List Nat := [20282409603651670423947251286016,40564819207303340847894502572032,5070602400912917605986812821504,1267650600228229401496703205376,792281625142643375935439503360,1386492843999625907887019130880,346623210999906476971754782720,123917797932466565517402334822400,151001271848586458076885789121183744000,40564819207303340847894502572032,2535301200456458802993406410752,6338253001141147007483516026880,5545971375998503631548076523520,693246421999812953943509565440,867424585527265958621816343756800,1110303469474900427035924920008704000,40564819207303340847894502572032,88735542015976058104769224376320,305028425679917699735144208793600,555151734737450213517962460004352000,10141204801825835211973625643008,101412048018258352119736256430080,76257106419979424933786052198400,888242775579920341628739936006963200,20282409603651670423947251286016,1419768672255616929676307590021120,1982684766919465048278437357158400,6338253001141147007483516026880,3549421680639042324190768975052800,1525142128399588498675721043968000,126765060022822940149670320537600,195218192435147327830492293627904000,22183885503994014526192306094080,62114879411183240673338457063424000,88735542015976058104769224376320,49691903528946592538670765650739200,12422975882236648134667691412684800,31057439705591620336669228531712000,190642766049948562334465130496000,495671191729866262069609339289600,4608193110613600405178399326208000]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
/-- Symbolic list bookkeeping only; this does not parse or expand source terms. -/
theorem pairs_sources_eq_offsets :
    pairs.map Prod.fst = offsetChunks phaseTerms 0 sizes := by
  simp only [pairs, sizes, List.map_cons, List.map_nil, offsetChunks, Nat.reduceAdd]

/-- An explicit source-length bound yields the actual phase partition. -/
theorem partition_of_length_bound (hcover : phaseTerms.length ≤ sizes.sum) :
    (pairs.map Prod.fst).flatten = phaseTerms := by
  rw [pairs_sources_eq_offsets, offsetChunks_eq_splitLengths, List.drop_zero]
  exact List.flatten_splitLengths phaseTerms sizes hcover

/-- Individually checked chunk denominators and a checked integer LCM give
the actual canonical denominator; no numeric value is assumed implicitly. -/
theorem denominator_of_checked_chunks
    (hcover : phaseTerms.length ≤ sizes.sum)
    (hdenChunks : ((pairs.map Prod.fst).map
      (fun c => commonDen (rawWickEntries c))) = candidateDenominators)
    (hdenLCM : candidateDenominators.foldl Nat.lcm 1 = sourceDen) :
    q0RawWickDen = sourceDen := by
  rw [q0RawWickDen_eq_chunkLCM (pairs.map Prod.fst) (partition_of_length_bound hcover),
    hdenChunks, hdenLCM]

/-- Full source-sum binding, conditional on every remaining checked piece. -/
theorem sourceSum_of_checked_assembly
    (hcover : phaseTerms.length ≤ sizes.sum)
    (hdenChunks : ((pairs.map Prod.fst).map
      (fun c => commonDen (rawWickEntries c))) = candidateDenominators)
    (hdenLCM : candidateDenominators.foldl Nat.lcm 1 = sourceDen)
    (hchunks : ∀ pair ∈ pairs, sourceChunkDense sourceDen pair.1 = pair.2)
    (hcombined : (pairs.map Prod.snd).foldr add3 [] = sourceCoefficients)
    (s b v : ℝ) :
    Ssum q0RawWickEntries s b v = he3 sourceCoefficients s b v / sourceDen :=
  q0_source_sum_eq_fullLiteral_of_checked_chunks pairs (partition_of_length_bound hcover)
    (denominator_of_checked_chunks hcover hdenChunks hdenLCM) hchunks hcombined s b v


/-! These are generated proof attempts. Their only remaining full-source
obligation, after successful checking of these declarations, is the separate
literal-table combination equality. -/

set_option maxRecDepth 100000 in
theorem concrete_cover : phaseTerms.length ≤ sizes.sum := by
  simp only [phaseTerms, List.length_map]
  decide +kernel

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
theorem concrete_chunk_denominators :
    ((pairs.map Prod.fst).map (fun c => commonDen (rawWickEntries c))) =
      candidateDenominators := by
  simp (config := { maxSteps := 1000000 }) only [pairs, candidateDenominators,
    List.map_cons, List.map_nil,
    Grothe.UpperChaos.Q0ChunkDen_o0_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o32_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o48_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o64_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o80_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o96_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o112_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o128_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o160_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o192_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o224_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o240_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o256_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o272_n16.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o288_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o320_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o352_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o384_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o416_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o448_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o480_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o512_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o544_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o576_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o608_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o640_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o672_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o704_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o736_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o768_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o800_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o832_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o864_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o896_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o928_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o960_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o992_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o1024_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o1056_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o1088_n32.raw_phaseTerms_commonDen,
    Grothe.UpperChaos.Q0ChunkDen_o1120_n20.raw_phaseTerms_commonDen]

set_option maxRecDepth 100000 in
theorem concrete_denominator_lcm : candidateDenominators.foldl Nat.lcm 1 = sourceDen := by
  decide +kernel

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
theorem concrete_chunk_tables :
    ∀ pair ∈ pairs, sourceChunkDense sourceDen pair.1 = pair.2 := by
  apply (List.forall_iff_forall_mem
    (p := fun (pair : List Grothe.UpperChaos.Q0WickChunking.SourceTerm × DenseWick) =>
      sourceChunkDense sourceDen pair.1 = pair.2)).mp
  simp only [pairs, List.Forall]
  exact ⟨Grothe.UpperChaos.Q0Chunk_o0_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o32_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o48_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o64_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o80_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o96_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o112_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o128_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o160_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o192_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o224_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o240_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o256_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o272_n16.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o288_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o320_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o352_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o384_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o416_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o448_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o480_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o512_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o544_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o576_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o608_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o640_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o672_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o704_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o736_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o768_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o800_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o832_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o864_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o896_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o928_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o960_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o992_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o1024_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o1056_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o1088_n32.check_phaseTerms,
    Grothe.UpperChaos.Q0Chunk_o1120_n20.check_phaseTerms⟩

/-- Conditional only on the separately checked literal-table combination. -/
theorem sourceSum_of_concrete_chunks
    (hcombined : (pairs.map Prod.snd).foldr add3 [] = sourceCoefficients)
    (s b v : ℝ) :
    Ssum q0RawWickEntries s b v = he3 sourceCoefficients s b v / sourceDen :=
  sourceSum_of_checked_assembly concrete_cover concrete_chunk_denominators
    concrete_denominator_lcm concrete_chunk_tables hcombined s b v

end Grothe.UpperChaos.Q0SourceChunkAssembly
