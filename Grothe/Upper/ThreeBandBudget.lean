import Grothe.Upper.ComparisonGroups
import Lean.Util.CollectAxioms

/-!
# The seven bands of the GT energy comparison

The rounding error has one band. Each of the three Taylor powers has a finite
low band and an infinite high band. The mixture uses these sets with unweighted
energy masses and its own quadrature radii.

Original band definitions by codex-2ca4. Mixture integration by codex-a7c4.
-/

set_option warningAsError true

namespace Grothe.Upper
open GrotheKernel

def threeBandScaledRQ (g : Fin 3) : ℚ :=
  comparisonGroupRadiusQ ⟨g.val + 1, by omega⟩

def threeBandHighRadiusQ (g : Fin 3) : ℚ :=
  if g = 2 then 199 / 1000 else 229 / 2500

/-- Seven pieces for linear cross terms: rounding, low1, high1, low2,
high2, low3, high3. `hi=0` retains the complete infinite upper band. -/
def threeBandBands (j : Fin 7) : ComparisonBand :=
  if j = 0 then comparisonBands[0] else
  if j = 1 then comparisonBands[1] else
  if j = 2 then ⟨51, 0, threeBandScaledRQ 0, threeBandHighRadiusQ 0⟩ else
  if j = 3 then comparisonBands[8] else
  if j = 4 then ⟨51, 0, threeBandScaledRQ 1, threeBandHighRadiusQ 1⟩ else
  if j = 5 then comparisonBands[13] else
    ⟨11, 0, threeBandScaledRQ 2, threeBandHighRadiusQ 2⟩

end Grothe.Upper

run_cmd do
  for target in #[``Grothe.Upper.threeBandScaledRQ, ``Grothe.Upper.threeBandHighRadiusQ,
      ``Grothe.Upper.threeBandBands] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
