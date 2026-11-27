import Grothe.LowerAnalytic.CoupledSteinCheck
import Grothe.LowerAnalytic.AntiRows.Row08Cells
import Grothe.LowerAnalytic.AntiRows.Row09Cells
import Grothe.LowerAnalytic.WeightedSchurRows

set_option warningAsError true

/-! # The two concrete Stein law tables and their weighted common-coordinate discount

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.CoupledStein

open Grothe.Lower
open Grothe.Lower.SharedGate.WeightedSchur (pairGainQ)

def leftChords := rowChords (row08SubNodes.headD (0,0)).2 row08Cells

def rightChords := rowChords (row09SubNodes.headD (0,0)).2 row09Cells

def stop : ℚ := row08.delta*(93/100)

def rowDiscount (w : ℚ) : ℚ :=
  discount (overlay stop leftChords rightChords) w row08.kappa row09.kappa
    cap08Tight cap09Tight row08.delta (pairGainQ w)

end Grothe.LowerAnalytic.CoupledStein
