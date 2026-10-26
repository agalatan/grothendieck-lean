import Grothe.Haagerup.CanonicalTrace.Chunk04
import GrotheKernel.ResolventCompletion
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Checkpoint module 6 of 20.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress messages identify declarations reached.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep49 :
    c49 * (((2*49+1)^2 : Nat) : Rat) / ((4*(49+1)*(49+2) : Nat) : Rat) = c50 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 51: reached coefficientStep49"
  out.flush

theorem coefficientStep50 :
    c50 * (((2*50+1)^2 : Nat) : Rat) / ((4*(50+1)*(50+2) : Nat) : Rat) = c51 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 52: reached coefficientStep50"
  out.flush

theorem coefficientStep51 :
    c51 * (((2*51+1)^2 : Nat) : Rat) / ((4*(51+1)*(51+2) : Nat) : Rat) = c52 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 53: reached coefficientStep51"
  out.flush

theorem coefficientStep52 :
    c52 * (((2*52+1)^2 : Nat) : Rat) / ((4*(52+1)*(52+2) : Nat) : Rat) = c53 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 54: reached coefficientStep52"
  out.flush

theorem coefficientStep53 :
    c53 * (((2*53+1)^2 : Nat) : Rat) / ((4*(53+1)*(53+2) : Nat) : Rat) = c54 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 55: reached coefficientStep53"
  out.flush

theorem coefficientStep54 :
    c54 * (((2*54+1)^2 : Nat) : Rat) / ((4*(54+1)*(54+2) : Nat) : Rat) = c55 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 56: reached coefficientStep54"
  out.flush

theorem coefficientStep55 :
    c55 * (((2*55+1)^2 : Nat) : Rat) / ((4*(55+1)*(55+2) : Nat) : Rat) = c56 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 57: reached coefficientStep55"
  out.flush

theorem coefficientStep56 :
    c56 * (((2*56+1)^2 : Nat) : Rat) / ((4*(56+1)*(56+2) : Nat) : Rat) = c57 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 58: reached coefficientStep56"
  out.flush

theorem coefficientStep57 :
    c57 * (((2*57+1)^2 : Nat) : Rat) / ((4*(57+1)*(57+2) : Nat) : Rat) = c58 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 59: reached coefficientStep57"
  out.flush

theorem coefficientStep58 :
    c58 * (((2*58+1)^2 : Nat) : Rat) / ((4*(58+1)*(58+2) : Nat) : Rat) = c59 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 60: reached coefficientStep58"
  out.flush

end Grothe.HaagerupCanonical.Trace
