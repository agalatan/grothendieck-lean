import Grothe.Haagerup.CanonicalTrace.Chunk00
import Grothe.Haagerup.CanonicalArithmetic
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Checkpoint module 2 of 20.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress messages identify declarations reached.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep9 :
    c9 * (((2*9+1)^2 : Nat) : Rat) / ((4*(9+1)*(9+2) : Nat) : Rat) = c10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 11: reached coefficientStep9"
  out.flush

theorem coefficientStep10 :
    c10 * (((2*10+1)^2 : Nat) : Rat) / ((4*(10+1)*(10+2) : Nat) : Rat) = c11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 12: reached coefficientStep10"
  out.flush

theorem coefficientStep11 :
    c11 * (((2*11+1)^2 : Nat) : Rat) / ((4*(11+1)*(11+2) : Nat) : Rat) = c12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 13: reached coefficientStep11"
  out.flush

theorem coefficientStep12 :
    c12 * (((2*12+1)^2 : Nat) : Rat) / ((4*(12+1)*(12+2) : Nat) : Rat) = c13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 14: reached coefficientStep12"
  out.flush

theorem coefficientStep13 :
    c13 * (((2*13+1)^2 : Nat) : Rat) / ((4*(13+1)*(13+2) : Nat) : Rat) = c14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 15: reached coefficientStep13"
  out.flush

theorem coefficientStep14 :
    c14 * (((2*14+1)^2 : Nat) : Rat) / ((4*(14+1)*(14+2) : Nat) : Rat) = c15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 16: reached coefficientStep14"
  out.flush

theorem coefficientStep15 :
    c15 * (((2*15+1)^2 : Nat) : Rat) / ((4*(15+1)*(15+2) : Nat) : Rat) = c16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 17: reached coefficientStep15"
  out.flush

theorem coefficientStep16 :
    c16 * (((2*16+1)^2 : Nat) : Rat) / ((4*(16+1)*(16+2) : Nat) : Rat) = c17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 18: reached coefficientStep16"
  out.flush

theorem coefficientStep17 :
    c17 * (((2*17+1)^2 : Nat) : Rat) / ((4*(17+1)*(17+2) : Nat) : Rat) = c18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 19: reached coefficientStep17"
  out.flush

theorem coefficientStep18 :
    c18 * (((2*18+1)^2 : Nat) : Rat) / ((4*(18+1)*(18+2) : Nat) : Rat) = c19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 20: reached coefficientStep18"
  out.flush

end Grothe.HaagerupCanonical.Trace
