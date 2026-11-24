import Grothe.Lower.Cert.SharpEnvelope
import Grothe.Lower.Support
import Grothe.Lower.RowParser
import Mathlib.Tactic.Eval

set_option warningAsError true

/-!
# Finite estimates for the two active rows with a common gate

At small residual scale a quadratic majorant of the row08 potential improves
its cap. At larger scale the Schur complement of the sum of the two gate
matrices improves on the two individual prices. Both estimates use the
original row data.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.SharedGate

def gain : ℚ := 2 / 1000000

def hatCap : ℚ := SharpEnvelope.hatCap - gain

def endpoint : ℚ := 1 / ((1 - 47 / 2000) * hatCap + 47 / 2000)

theorem endpoint_eq : endpoint =
    909157856627679665006951532318493526757143019079598080000000000000000000000000000000 /
    648511497777813650950008184495957803146263132239181429405354447721820234278296395631 := by
  decide +kernel

theorem rounded_lt : (140191478 : ℚ) / 100000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

def smallCut : ℚ := 21 / 100

def smallSaving : ℚ := 1 / 50000

def smallRect : Rect :=
  ⟨0, row08.delta * smallCut, ⟨41869510279 / 31250000000 + 24 / 100000, 0, 113 / 100, 0, 0⟩⟩

section DecodedNodes

set_option maxRecDepth 50000
set_option maxHeartbeats 1600000

-- The elaborator proposes numbers. Re-encoding them must reproduce the literal row exactly.
private def entries : List RowParser.NodeCode := eval% row08.nodeList.map fun (x, y) ↦
  ((x.num.natAbs, x.den), (y.num.natAbs, y.den))

private def decodedNodes : List (ℚ × ℚ) := eval% row08.nodeList

private theorem decodedNodes_eq : row08.nodeList = decodedNodes := by
  calc
    _ = entries.map RowParser.nodeValue :=
      RowParser.decodeRow (by rfl) (by decide +kernel) (by decide +kernel)
    _ = decodedNodes := by decide +kernel

theorem smallRectangle_ok :
    checkRect row08.nodeList row08.smax row08.kappa (row08.cap - smallSaving) 0 xMax smallRect = true := by
  rw [decodedNodes_eq]
  decide +kernel

end DecodedNodes

def baseline (r : Row) : ℚ := r.kappa * r.delta ^ 2 - r.delta

def sumMatrix (a b : Sym3) : Sym3 :=
  ⟨a.m11 + b.m11, a.m12 + b.m12, a.m13 + b.m13,
   a.m22 + b.m22, a.m23 + b.m23, a.m33 + b.m33⟩

def pairPrice (a b : Row) : ℚ :=
  gatePrice (sumMatrix a.N b.N) (a.g1 + b.g1) (a.g2 + b.g2) (a.g3 + b.g3)

def gateExcess : ℚ := 1018 / 10000000

def totalSaving : ℚ := gateExcess * smallCut ^ 2

theorem availableSaving : 0 ≤ gateExcess ∧ totalSaving ≤ smallSaving := by decide +kernel

theorem pair_ok : gateOK (sumMatrix row08.N row09.N) = true ∧
    gateExcess ≤ pairPrice row08 row09 - baseline row08 - baseline row09 := by
  decide +kernel

/-- Row intercept after a rational deduction. -/
def discount (a : EnvRow) (d : ℚ) : EnvRow := { a with C := a.C - d }

/-- Split the fixed row06/row07 interval at its midpoint to retain the stronger outer cap. -/
def cells : List AffineEnvCell := SharpEnvelope.cells.flatMap fun c =>
  if c.lo == 1614 / 2000 && c.hi == 1642 / 2000 then
    [{ c with hi := 1628 / 2000, offset := 1/4, slope := 0 },
     { c with lo := 1628 / 2000, offset := 83/100, slope := 0 }]
  else [c]

/-- Deduct the shared saving from either active row, whichever has smaller weight. -/
def sharedCellOK (c : AffineEnvCell) : Bool := decide
  (0 ≤ c.slope ∧ 0 ≤ c.offset + c.slope * c.lo ∧ c.offset + c.slope * c.hi ≤ 1 ∧
   affineCellCap (discount row08.env totalSaving) (discount row09.env 0) c ≤ hatCap ∧
   affineCellCap (discount row08.env 0) (discount row09.env totalSaving) c ≤ hatCap)

theorem check :
    chainTo AffineEnvCell.lo AffineEnvCell.hi 0 (9 / 10) cells = true ∧
    cells.all (fun c => affineCellOK rowData massS hatCap c || sharedCellOK c) = true := by
  decide +kernel

end Grothe.Lower.SharedGate
