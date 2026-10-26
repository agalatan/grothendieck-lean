import Grothe.Haagerup.CanonicalTrace.Chunk02
import Grothe.Haagerup.CanonicalArithmetic
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Checkpoint module 4 of 20.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress messages identify declarations reached.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep29 :
    c29 * (((2*29+1)^2 : Nat) : Rat) / ((4*(29+1)*(29+2) : Nat) : Rat) = c30 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 31: reached coefficientStep29"
  out.flush

theorem coefficientStep30 :
    c30 * (((2*30+1)^2 : Nat) : Rat) / ((4*(30+1)*(30+2) : Nat) : Rat) = c31 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 32: reached coefficientStep30"
  out.flush

theorem coefficientStep31 :
    c31 * (((2*31+1)^2 : Nat) : Rat) / ((4*(31+1)*(31+2) : Nat) : Rat) = c32 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 33: reached coefficientStep31"
  out.flush

theorem coefficientStep32 :
    c32 * (((2*32+1)^2 : Nat) : Rat) / ((4*(32+1)*(32+2) : Nat) : Rat) = c33 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 34: reached coefficientStep32"
  out.flush

theorem coefficientStep33 :
    c33 * (((2*33+1)^2 : Nat) : Rat) / ((4*(33+1)*(33+2) : Nat) : Rat) = c34 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 35: reached coefficientStep33"
  out.flush

theorem coefficientStep34 :
    c34 * (((2*34+1)^2 : Nat) : Rat) / ((4*(34+1)*(34+2) : Nat) : Rat) = c35 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 36: reached coefficientStep34"
  out.flush

theorem coefficientStep35 :
    c35 * (((2*35+1)^2 : Nat) : Rat) / ((4*(35+1)*(35+2) : Nat) : Rat) = c36 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 37: reached coefficientStep35"
  out.flush

theorem coefficientStep36 :
    c36 * (((2*36+1)^2 : Nat) : Rat) / ((4*(36+1)*(36+2) : Nat) : Rat) = c37 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 38: reached coefficientStep36"
  out.flush

theorem coefficientStep37 :
    c37 * (((2*37+1)^2 : Nat) : Rat) / ((4*(37+1)*(37+2) : Nat) : Rat) = c38 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 39: reached coefficientStep37"
  out.flush

theorem coefficientStep38 :
    c38 * (((2*38+1)^2 : Nat) : Rat) / ((4*(38+1)*(38+2) : Nat) : Rat) = c39 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 40: reached coefficientStep38"
  out.flush

end Grothe.HaagerupCanonical.Trace
