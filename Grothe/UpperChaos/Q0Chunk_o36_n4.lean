import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 36, count 4; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o36_n4

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[[],[],[],[],[0,-2070707696924941603054087016112193536000],[-1577820873105840048134370972118548480000]],[[],[],[],[0,0,0,-1380471797949961068702724677408129024000],[0,0,-6311283492423360192537483888474193920000],[0,-1899541138504508114731275618657239040000],[-1285446960803933394609088554797629440000]],[[],[],[0,0,0,0,0,-172558974743745133587840584676016128000],[0,0,0,0,-2761186527935220084235149201207459840000],[0,0,0,-2849311707756762172096913427985858560000],[0,0,-8355405245225567064959075606184591360000]],[[],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,-262970145517640008022395162019758080000],[0,0,0,0,0,-854793512327028651629074028395757568000],[0,0,0,0,-6748596544220650321697714912687554560000]],[[],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,-63318037950150270491042520621907968000],[0,0,0,0,0,0,-1456839888911124513890300362103980032000]],[[],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,-85696464053595559640605903653175296000]],[[],[0,0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 36).take 4).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 36).take 4) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o36_n4
