import Grothe.LowerAnalytic.CapChords
import Grothe.LowerAnalytic.CapNodeDefs
import Grothe.LowerAnalytic.CapTablesData

/-!
# Admissible grids

`gridAdm`: the grid parameters `(radial cells, angular cells, radial step)` that the checker accepts (`pieceGrids_adm`).
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- A grid `(Nr, N, h)` is admissible for the tables. -/
def gridAdm (G : ℕ × ℕ × ℚ) : Bool :=
  decide (0 < G.2.2) && decide (1 ≤ (G.1 : ℚ) * G.2.2) && decide ((G.1 : ℚ) * G.2.2 ≤ 8) &&
    decide (4 ≤ G.2.1) && decide (G.2.1 ≤ 4096)

end Grothe.LowerAnalytic
