import Grothe.UpperChaos.HardyArcData
import Grothe.UpperChaos.HardyArcEval

/-! Bounded native runtime comparison; results are measurements, not certificates.
Agent-ID: codex-7c2e -/

open GrotheKernel GrotheKernel.HardyArc
open Grothe.UpperChaos HardyArcSound HardyArcCover HardyArcEval

private def timed (label : String) (f : Unit → Option Int) : IO (Option Int) := do
  let start ← IO.monoMsNow
  let value := f ()
  let elapsed := (← IO.monoMsNow) - start
  IO.println s!"{label} ms={elapsed} value={repr value}"
  return value

def main : IO Unit := do
  let j := ofRatI jQ
  let rho := ofRatI rhoQ
  for neg in [false, true] do
    for k in [0, 128, 512, 900, 1023, 1024, 1536, 2047] do
      let lo := pieceLo 1024 k
      let hi := pieceLo 1024 (k + 1)
      let old ← timed s!"original sign={neg} index={k}" fun _ =>
        cover j rho hardyData neg (D / 1024) (D / 10) 26 lo hi
      let shared ← timed s!"shared sign={neg} index={k}" fun _ =>
        coverShared j rho hardyData neg (D / 1024) (D / 10) 26 lo hi
      unless old == shared do
        throw <| IO.userError s!"Checker mismatch at sign={neg}, index={k}"
  IO.println "All sampled adaptive covers agree exactly."
