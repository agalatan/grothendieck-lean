import Grothe.Lower.Envelope

/-! # Lookup of a scalar row or the mass tangent in the amplitude envelope -/

namespace Grothe.Lower

open LowerAnalytic

/-- Scalar row lookup in a pure `List EnvRow`: `0` is the mass tangent at `m`, `k + 1` is `rows[k]?`. -/
def envRowAtPure (rows : List EnvRow) (S m : ℚ) : ℕ → Option EnvRow
  | 0 => some (massTangent S m)
  | k + 1 => rows[k]?

end Grothe.Lower
