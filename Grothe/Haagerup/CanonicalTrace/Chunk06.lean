import Grothe.Haagerup.CanonicalTrace.Chunk05
import GrotheKernel.ResolventCompletion
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Checkpoint module 7 of 20.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress messages identify declarations reached.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep59 :
    c59 * (((2*59+1)^2 : Nat) : Rat) / ((4*(59+1)*(59+2) : Nat) : Rat) = c60 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 61: reached coefficientStep59"
  out.flush

theorem coefficientStep60 :
    c60 * (((2*60+1)^2 : Nat) : Rat) / ((4*(60+1)*(60+2) : Nat) : Rat) = c61 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 62: reached coefficientStep60"
  out.flush

theorem coefficientStep61 :
    c61 * (((2*61+1)^2 : Nat) : Rat) / ((4*(61+1)*(61+2) : Nat) : Rat) = c62 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 63: reached coefficientStep61"
  out.flush

theorem coefficientStep62 :
    c62 * (((2*62+1)^2 : Nat) : Rat) / ((4*(62+1)*(62+2) : Nat) : Rat) = c63 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 64: reached coefficientStep62"
  out.flush

theorem coefficientStep63 :
    c63 * (((2*63+1)^2 : Nat) : Rat) / ((4*(63+1)*(63+2) : Nat) : Rat) = c64 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 65: reached coefficientStep63"
  out.flush

theorem coefficientStep64 :
    c64 * (((2*64+1)^2 : Nat) : Rat) / ((4*(64+1)*(64+2) : Nat) : Rat) = c65 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 66: reached coefficientStep64"
  out.flush

theorem coefficientStep65 :
    c65 * (((2*65+1)^2 : Nat) : Rat) / ((4*(65+1)*(65+2) : Nat) : Rat) = c66 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 67: reached coefficientStep65"
  out.flush

theorem coefficientStep66 :
    c66 * (((2*66+1)^2 : Nat) : Rat) / ((4*(66+1)*(66+2) : Nat) : Rat) = c67 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 68: reached coefficientStep66"
  out.flush

theorem coefficientStep67 :
    c67 * (((2*67+1)^2 : Nat) : Rat) / ((4*(67+1)*(67+2) : Nat) : Rat) = c68 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 69: reached coefficientStep67"
  out.flush

theorem coefficientStep68 :
    c68 * (((2*68+1)^2 : Nat) : Rat) / ((4*(68+1)*(68+2) : Nat) : Rat) = c69 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 70: reached coefficientStep68"
  out.flush

end Grothe.HaagerupCanonical.Trace
