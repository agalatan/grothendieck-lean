import Grothe.UpperChaos.PhiSourceDenLiteralAssembly
import Grothe.UpperChaos.PhiDegreeChunksDraft
import Grothe.UpperChaos.PhiSourceDenChunk_o0_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o32_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o64_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o96_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o128_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o160_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o192_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o224_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o256_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o288_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o320_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o352_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o384_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o416_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o448_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o480_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o512_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o544_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o576_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o608_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o640_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o672_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o704_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o736_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o768_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o800_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o832_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o864_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o896_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o928_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o960_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o992_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o1024_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o1056_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o1088_n32
import Grothe.UpperChaos.PhiSourceDenChunk_o1120_n20

/-! Source-bound phase denominator assembly. All imported chunk equalities,
coverage, and candidate LCM must be checked before this theorem is evidence.
Source SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.PhiSourceDenBinding
open GrotheKernel Grothe.UpperChaos.PhiSourceDenLiteralAssembly
open Grothe.UpperChaos.PhiDegreeChunksDraft

set_option maxRecDepth 65536 in
set_option maxHeartbeats 12000000 in
/-- The literal chunk denominators are exactly those of the parsed source. -/
theorem source_chunk_denominators :
    ((candidateSizes.splitLengths (Grothe.Upper.phaseStrs.map parseTerm)).map commonDen) =
      candidateDenominators := by
  rw [splitLengths_eq_offsetChunks]
  simp only [candidateSizes, candidateDenominators, offsetChunks, List.map_cons,
    List.map_nil, Nat.zero_add, Nat.reduceAdd, ← List.map_drop, ← List.map_take,
    PhiSourceDenChunk_o0_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o32_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o64_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o96_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o128_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o160_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o192_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o224_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o256_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o288_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o320_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o352_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o384_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o416_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o448_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o480_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o512_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o544_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o576_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o608_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o640_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o672_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o704_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o736_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o768_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o800_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o832_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o864_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o896_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o928_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o960_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o992_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o1024_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o1056_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o1088_n32.source_chunk_commonDen,
    PhiSourceDenChunk_o1120_n20.source_chunk_commonDen]

/-- Full source common denominator, contingent on the imported checks passing. -/
theorem source_common_den :
    commonDen (Grothe.Upper.phaseStrs.map parseTerm) =
      302002543697172916153771578242367488000 :=
  source_commonDen_if_chunks_checked source_chunk_denominators

#print axioms source_chunk_denominators
#print axioms source_common_den
end Grothe.UpperChaos.PhiSourceDenBinding
