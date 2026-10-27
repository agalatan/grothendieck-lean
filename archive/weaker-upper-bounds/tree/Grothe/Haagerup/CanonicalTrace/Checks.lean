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
    Grothe.HaagerupCanonical.weightedBudget ≤ 10^13 ∧
      Grothe.HaagerupCanonical.remainderBudget ≤ Grothe.HaagerupCanonical.remainderCap := by
  constructor
  · unfold Grothe.HaagerupCanonical.weightedBudget
    rw [weights_binding, differences_binding]
    simpa only [Grothe.HaagerupCanonical.majorantQ, Grothe.HaagerupCanonical.start,
      weights0, weights1, weights2, weights3, weights4, weights5, weights6, weights7, weights8, weights9, weights10, weights11, weights12, weights13, weights14, weights15, weights16, weights17, weights18, weights19, weights20, weights21, weights22, weights23, weights24, weights25, weights26, weights27, weights28, weights29, weights30, weights31, weights32, weights33, weights34, weights35, weights36, weights37, weights38, weights39, weights40, weights41, weights42, weights43, weights44, weights45, weights46, weights47, weights48, weights49, weights50, weights51, weights52, weights53, weights54, weights55, weights56, weights57, weights58, weights59, weights60, weights61, weights62, weights63, weights64, correctionWeights0, correctionWeights1, correctionWeights2, correctionWeights3, correctionWeights4, correctionWeights5, correctionWeights6, correctionWeights7, correctionWeights8, correctionWeights9, correctionWeights10, rat_abs_binding] using weighted_literal_ok
  · unfold Grothe.HaagerupCanonical.remainderBudget
    simp only [Grothe.HaagerupCanonical.order, Grothe.HaagerupCanonical.start,
      Finset.sum_range_succ, Finset.sum_range_zero, zero_add,
      differenceEq0_64, differenceEq1_64, differenceEq2_64, differenceEq3_64, differenceEq4_64, differenceEq5_64, differenceEq6_64, differenceEq7_64, differenceEq8_64, differenceEq9_64, differenceEq10_64, defectCap_binding]
    exact remainder_literal_ok.trans_eq (by
      norm_num [Grothe.HaagerupCanonical.remainderCap])

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 208: reached coefficient_check"
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
  out.putStrLn "Canonical trace 209: reached completed_check"
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
  out.putStrLn "Canonical trace 210: reached seed_check"
  out.flush

#print axioms seed_check

theorem defect_check :
    resolventNormOK Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl Grothe.HaagerupPower.defectCap = true := by
  unfold resolventNormOK
  rw [defect_binding, defectCap_binding]
  exact defect_literal_ok

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 211: reached defect_check"
  out.flush

#print axioms defect_check

end Grothe.HaagerupCanonical.Trace
