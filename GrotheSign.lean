import GrotheSign.Positivity
import GrotheSign.BetaStrict
import GrotheSign.HaagerupNumerical
import GrotheSign.HaagerupTailEstimate
import GrotheSign.KernelNormalization

/-!
# Standalone beta preservation and hypergeometric inverse signs

Build this target explicitly with `lake build GrotheSign`. It is separate from the `Grothe` target.
-/

/-! The target proves beta preservation for the actual compositional inverse and specializes it
to the hypergeometric kernels. The first eight nonlinear odd inverse coefficients have the
required signs for every real dimension at least two, strictly above dimension two. The all-orders
specialization retains the Haagerup starting signs as an explicit hypothesis: the starting-case
analytic contour argument has not been formalized. -/
