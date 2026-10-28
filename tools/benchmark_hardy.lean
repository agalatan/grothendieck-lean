import Grothe.UpperChaos.HardyArcData
import Grothe.UpperChaos.HardyArcEval

/-! Bounded native runtime comparison; results are measurements, not certificates.
Agent-ID: codex-7c2e -/

open GrotheKernel GrotheKernel.HardyArc
open Grothe.UpperChaos HardyArcSound HardyArcCover HardyArcEval

private def timed (label : String) (index : Nat) (f : Nat → Option Int) : IO (Option Int) := do
  -- Reading the input and storing the result through IO prevent pure evaluation
  -- from moving outside the two clock reads.
  let input ← IO.mkRef index
  let start ← IO.monoMsNow
  let index ← input.get
  let output ← IO.mkRef (f index)
  let elapsed := (← IO.monoMsNow) - start
  let value ← output.get
  IO.println s!"{label} ms={elapsed} value={repr value}"
  (← IO.getStdout).flush
  return value

def main : IO Unit := do
  let j := ofRatI jQ
  let rho := ofRatI rhoQ
  for neg in [false, true] do
    for k in [0, 128, 512, 900, 1023, 1024, 1536, 2047] do
      let old ← timed s!"original sign={neg} index={k}" k fun index =>
        cover j rho hardyData neg (D / 1024) (D / 10) 26
          (pieceLo 1024 index) (pieceLo 1024 (index + 1))
      let shared ← timed s!"shared sign={neg} index={k}" k fun index =>
        coverShared j rho hardyData neg (D / 1024) (D / 10) 26
          (pieceLo 1024 index) (pieceLo 1024 (index + 1))
      unless old == shared do
        throw <| IO.userError s!"Checker mismatch at sign={neg}, index={k}"
  IO.println "All sampled adaptive covers agree exactly."
