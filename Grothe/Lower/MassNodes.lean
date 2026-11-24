import Grothe.Lower.MassRow

/-!
# Exact node values for the mass potential

The mass row uses the tabulated radii and evaluates its potential at each radius.
Both its spectral cell check and its analytic bound use this table.
-/

namespace Grothe.Lower

/-- `c = 2ν̂ + λ` with `ν̂ = 47/1953`, `λ = 1/2`. -/
def massC : ℚ := 2 * (47 / 1953) + 1 / 2

/-- The bound `S(1/2)` of the mass row (the certificate's exact value). -/
def massS : ℚ := 3798855002922010337121170986221578569 / 22939068096000000000000000000000000000

/-- `φ_c` on rationals. -/
def phiQ (e c r : ℚ) : ℚ := if r ≤ c / e then e ^ 2 * r ^ 2 / c else 2 * e * r - c

/-- The exact values of the mass potential at the radii of the mass row. -/
def massNodes : List (ℚ × ℚ) :=
  massRow.nodeList.map fun n ↦ (n.1, phiQ ε massC (n.1 / massRow.delta))

/-- Every stored value is the mass potential at its node. -/
theorem massCapsOK {n : ℚ × ℚ} (hn : n ∈ massNodes) :
    n.2 = phiQ ε massC (n.1 / massRow.delta) := by
  obtain ⟨_, _, rfl⟩ := List.mem_map.mp hn
  rfl

end Grothe.Lower
