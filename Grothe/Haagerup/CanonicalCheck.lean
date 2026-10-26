import Grothe.Haagerup.CanonicalTrace.Checks

/-!
# Kernel checks for the canonical resolvent completion

Exact literal arithmetic steps and recurrence identities discharge each finite
check. The existing native certificate is not used by these proofs.
-/

namespace Grothe.HaagerupCanonical

open GrotheKernel HaagerupPower Upper.FiniteDifference

lemma defect_check : resolventNormOK pl rl defectCap = true :=
  Trace.defect_check

lemma seed_check : seedNormOK pl rl seedPower seedCap = true :=
  Trace.seed_check

lemma coefficient_check : haagR start ≤ 1/10000 ∧
    iterDiff order haagR start ≤ 37/10000000000000 :=
  Trace.coefficient_check

lemma completed_check :
    completedHeadOK cutoff start pl rl (haagList start) differences slope prefixCap = true :=
  Trace.completed_check

end Grothe.HaagerupCanonical
