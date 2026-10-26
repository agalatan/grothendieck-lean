import Grothe.Haagerup.CanonicalData

/-!
# Kernel checks for the canonical resolvent completion

The polynomial and resolvent are the existing rational data. All new finite
checks produce kernel proofs; the earlier native certificate is not used.
-/

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical

open GrotheKernel HaagerupPower Upper.FiniteDifference

lemma defect_check : resolventNormOK pl rl defectCap = true := by decide +kernel

lemma seed_check : seedNormOK pl rl seedPower seedCap = true := by decide +kernel

lemma coefficient_check : haagR start ≤ 1/10000 ∧
    iterDiff order haagR start ≤ 37/10000000000000 := by decide +kernel

lemma completed_check :
    completedHeadOK cutoff start pl rl (haagList start) differences slope prefixCap = true := by
  decide +kernel

end Grothe.HaagerupCanonical
