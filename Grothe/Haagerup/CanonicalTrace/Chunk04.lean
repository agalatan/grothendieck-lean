import Grothe.Haagerup.CanonicalTrace.Chunk03
import GrotheKernel.ResolventCompletion
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Checkpoint module 5 of 20.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress messages identify declarations reached.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep39 :
    c39 * (((2*39+1)^2 : Nat) : Rat) / ((4*(39+1)*(39+2) : Nat) : Rat) = c40 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 41: reached coefficientStep39"
  out.flush

theorem coefficientStep40 :
    c40 * (((2*40+1)^2 : Nat) : Rat) / ((4*(40+1)*(40+2) : Nat) : Rat) = c41 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 42: reached coefficientStep40"
  out.flush

theorem coefficientStep41 :
    c41 * (((2*41+1)^2 : Nat) : Rat) / ((4*(41+1)*(41+2) : Nat) : Rat) = c42 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 43: reached coefficientStep41"
  out.flush

theorem coefficientStep42 :
    c42 * (((2*42+1)^2 : Nat) : Rat) / ((4*(42+1)*(42+2) : Nat) : Rat) = c43 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 44: reached coefficientStep42"
  out.flush

theorem coefficientStep43 :
    c43 * (((2*43+1)^2 : Nat) : Rat) / ((4*(43+1)*(43+2) : Nat) : Rat) = c44 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 45: reached coefficientStep43"
  out.flush

theorem coefficientStep44 :
    c44 * (((2*44+1)^2 : Nat) : Rat) / ((4*(44+1)*(44+2) : Nat) : Rat) = c45 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 46: reached coefficientStep44"
  out.flush

theorem coefficientStep45 :
    c45 * (((2*45+1)^2 : Nat) : Rat) / ((4*(45+1)*(45+2) : Nat) : Rat) = c46 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 47: reached coefficientStep45"
  out.flush

theorem coefficientStep46 :
    c46 * (((2*46+1)^2 : Nat) : Rat) / ((4*(46+1)*(46+2) : Nat) : Rat) = c47 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 48: reached coefficientStep46"
  out.flush

theorem coefficientStep47 :
    c47 * (((2*47+1)^2 : Nat) : Rat) / ((4*(47+1)*(47+2) : Nat) : Rat) = c48 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 49: reached coefficientStep47"
  out.flush

theorem coefficientStep48 :
    c48 * (((2*48+1)^2 : Nat) : Rat) / ((4*(48+1)*(48+2) : Nat) : Rat) = c49 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 50: reached coefficientStep48"
  out.flush

end Grothe.HaagerupCanonical.Trace
