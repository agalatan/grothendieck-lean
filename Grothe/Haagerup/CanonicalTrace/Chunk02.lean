import Grothe.Haagerup.CanonicalTrace.Chunk01
import GrotheKernel.ResolventCompletion
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Checkpoint module 3 of 20.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress messages identify declarations reached.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep19 :
    c19 * (((2*19+1)^2 : Nat) : Rat) / ((4*(19+1)*(19+2) : Nat) : Rat) = c20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 21: reached coefficientStep19"
  out.flush

theorem coefficientStep20 :
    c20 * (((2*20+1)^2 : Nat) : Rat) / ((4*(20+1)*(20+2) : Nat) : Rat) = c21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 22: reached coefficientStep20"
  out.flush

theorem coefficientStep21 :
    c21 * (((2*21+1)^2 : Nat) : Rat) / ((4*(21+1)*(21+2) : Nat) : Rat) = c22 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 23: reached coefficientStep21"
  out.flush

theorem coefficientStep22 :
    c22 * (((2*22+1)^2 : Nat) : Rat) / ((4*(22+1)*(22+2) : Nat) : Rat) = c23 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 24: reached coefficientStep22"
  out.flush

theorem coefficientStep23 :
    c23 * (((2*23+1)^2 : Nat) : Rat) / ((4*(23+1)*(23+2) : Nat) : Rat) = c24 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 25: reached coefficientStep23"
  out.flush

theorem coefficientStep24 :
    c24 * (((2*24+1)^2 : Nat) : Rat) / ((4*(24+1)*(24+2) : Nat) : Rat) = c25 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 26: reached coefficientStep24"
  out.flush

theorem coefficientStep25 :
    c25 * (((2*25+1)^2 : Nat) : Rat) / ((4*(25+1)*(25+2) : Nat) : Rat) = c26 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 27: reached coefficientStep25"
  out.flush

theorem coefficientStep26 :
    c26 * (((2*26+1)^2 : Nat) : Rat) / ((4*(26+1)*(26+2) : Nat) : Rat) = c27 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 28: reached coefficientStep26"
  out.flush

theorem coefficientStep27 :
    c27 * (((2*27+1)^2 : Nat) : Rat) / ((4*(27+1)*(27+2) : Nat) : Rat) = c28 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 29: reached coefficientStep27"
  out.flush

theorem coefficientStep28 :
    c28 * (((2*28+1)^2 : Nat) : Rat) / ((4*(28+1)*(28+2) : Nat) : Rat) = c29 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 30: reached coefficientStep28"
  out.flush

end Grothe.HaagerupCanonical.Trace
