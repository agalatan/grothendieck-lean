import Grothe.Haagerup.CanonicalProof
import Grothe.Haagerup.CanonicalCheck

/-!
# A hypothesis-free upper bound from canonical resolvent completion

Complete monotonicity controls the remainder of a finite resolvent expansion.
The finite head and its signed correction are combined before taking norms.
Every finite check used here is proved by Lean's kernel.
-/

namespace Grothe.HaagerupCanonical

/-- The rational upper endpoint, with all four finite checks discharged. -/
theorem upper : IsGrothendieckBound (1404909132791/1000000000000) :=
  upper_of_checks defect_check seed_check coefficient_check completed_check

end Grothe.HaagerupCanonical

namespace Grothe

/-- The public hypothesis-free upper bound for every finite complex matrix. -/
theorem haagerup_bound : IsGrothendieckBound (1404909132791/1000000000000) :=
  HaagerupCanonical.upper

end Grothe
