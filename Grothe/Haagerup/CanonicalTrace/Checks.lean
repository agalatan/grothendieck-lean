import Grothe.Haagerup.CanonicalTrace.Bindings
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
The four final checks, with every literal tied to the source data.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress identifiers are stable across parallel modules.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel Grothe.Upper.FiniteDifference

theorem coefficient_check :
    Grothe.haagR Grothe.HaagerupCanonical.start ≤ 1/10000 ∧
      iterDiff Grothe.HaagerupCanonical.order Grothe.haagR Grothe.HaagerupCanonical.start ≤ 51/1000000000000000 := by
  change Grothe.haagR 64 ≤ 1/10000 ∧ iterDiff 8 Grothe.haagR 64 ≤ 51/1000000000000000
  rw [coefficientEq64, differenceEq8_64]
  exact coefficient_literal_ok

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 201: reached coefficient_check"
  out.flush

#print axioms coefficient_check

theorem completed_check :
    completedHeadOK Grothe.HaagerupCanonical.cutoff Grothe.HaagerupCanonical.start
      Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl (haagList Grothe.HaagerupCanonical.start)
      Grothe.HaagerupCanonical.differences Grothe.HaagerupPower.slope
      Grothe.HaagerupCanonical.prefixCap = true := by
  unfold completedHeadOK
  rw [completed_binding, slope_binding, prefixCap_binding]
  exact completed_literal_ok

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 202: reached completed_check"
  out.flush

#print axioms completed_check

theorem seed_check :
    seedNormOK Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl
      Grothe.HaagerupPower.seedPower Grothe.HaagerupPower.seedCap = true := by
  unfold seedNormOK
  rw [seed_binding, seedCap_binding]
  exact seed_literal_ok

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 203: reached seed_check"
  out.flush

#print axioms seed_check

theorem defect_check :
    resolventNormOK Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl Grothe.HaagerupPower.defectCap = true := by
  unfold resolventNormOK
  rw [defect_binding, defectCap_binding]
  exact defect_literal_ok

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 204: reached defect_check"
  out.flush

#print axioms defect_check

end Grothe.HaagerupCanonical.Trace
