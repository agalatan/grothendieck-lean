import Grothe.LowerAnalytic.SparseSteinWitness
import Mathlib.Tactic.Eval
import Grothe.LowerAnalytic.AntiRows.Row08NodeToks
import Grothe.LowerAnalytic.AntiRows.Row09NodeToks

/-! # The eleven ordinary polynomial witnesses used at fourteen new scale ordinates

The elaborator extracts the selected ordinary nodes and only their used cuts from
the original Lean row data. Each resulting candidate must independently satisfy
the pointwise and price checks; source parsing is outside the trust boundary.
Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.SparseStein
open Grothe.Lower

set_option Elab.async false
set_option maxRecDepth 40000
set_option maxHeartbeats 2000000

def sparseMesh : List ℚ := eval% row08.vs

theorem sparseMesh_ok : meshOK 0 sparseMesh := by decide +kernel

private structure EncodedWitness where
  sigma : ℚ
  a0 : ℚ
  a1 : ℚ
  a2 : ℚ
  a4 : ℚ
  a6 : ℚ
  cuts : List (ℚ × List ℚ)
  deriving Lean.ToExpr

private def pickWitness (r : Row) (i j : ℕ) : EncodedWitness :=
  let c := parseXCell (r.cells.getD i "")
  let n := c.nodes.getD j ⟨0,⟨0,0,0,0,0⟩,[]⟩
  ⟨n.sigma,n.y.a0,n.y.a1,n.y.a2,n.y.a4,n.y.a6,nodeCutList c.bank n⟩

private def EncodedWitness.decode (w : EncodedWitness) : Witness :=
  ⟨w.cuts.map Prod.snd, ⟨w.sigma, ⟨w.a0,w.a1,w.a2,w.a4,w.a6⟩,
    (w.cuts.map Prod.fst).zipIdx⟩⟩


def w8_5_6 : Witness := EncodedWitness.decode (eval% pickWitness row08 5 6)
def w8_6_6 : Witness := EncodedWitness.decode (eval% pickWitness row08 6 6)
def w8_8_6 : Witness := EncodedWitness.decode (eval% pickWitness row08 8 6)
def w8_13_6 : Witness := EncodedWitness.decode (eval% pickWitness row08 13 6)
def w8_15_5 : Witness := EncodedWitness.decode (eval% pickWitness row08 15 5)
def w9_5_11 : Witness := EncodedWitness.decode (eval% pickWitness row09 5 11)
def w9_6_15 : Witness := EncodedWitness.decode (eval% pickWitness row09 6 15)
def w9_7_18 : Witness := EncodedWitness.decode (eval% pickWitness row09 7 18)
def w9_8_17 : Witness := EncodedWitness.decode (eval% pickWitness row09 8 17)
def w9_9_21 : Witness := EncodedWitness.decode (eval% pickWitness row09 9 21)
def w9_10_19 : Witness := EncodedWitness.decode (eval% pickWitness row09 10 19)

def plans08 : List Plan := [
  ⟨w8_5_6, extra08.getD 0 ⟨0,0,0,0⟩, mkRat 47 46, mkRat 0 1, mkRat 1 4⟩,
  ⟨w8_6_6, extra08.getD 1 ⟨0,0,0,0⟩, mkRat 47 46, mkRat 1 4, mkRat 316227766017 1000000000000⟩,
  ⟨w8_6_6, extra08.getD 2 ⟨0,0,0,0⟩, mkRat 47 46, mkRat 316227766017 1000000000000, mkRat 173205080757 500000000000⟩,
  ⟨w8_8_6, extra08.getD 3 ⟨0,0,0,0⟩, mkRat 47 46, mkRat 173205080757 500000000000, mkRat 53033008589 125000000000⟩,
  ⟨w8_8_6, extra08.getD 4 ⟨0,0,0,0⟩, mkRat 47 46, mkRat 53033008589 125000000000, mkRat 489897948557 1000000000000⟩,
  ⟨w8_13_6, extra08.getD 5 ⟨0,0,0,0⟩, mkRat 45 46, mkRat 2683281573 4000000000, mkRat 707106781187 1000000000000⟩,
  ⟨w8_15_5, extra08.getD 6 ⟨0,0,0,0⟩, mkRat 45 44, mkRat 707106781187 1000000000000, mkRat 173205080757 200000000000⟩]

theorem planTargets08 : plans08.map Plan.target = extra08 := rfl

theorem planPrices08 : plans08.all (fun p => p.priced sparseMesh) := by decide +kernel

def plans09 : List Plan := [
  ⟨w9_5_11, extra09.getD 0 ⟨0,0,0,0⟩, mkRat 245 239, mkRat 0 1, mkRat 1 4⟩,
  ⟨w9_6_15, extra09.getD 1 ⟨0,0,0,0⟩, mkRat 53 54, mkRat 1 4, mkRat 316227766017 1000000000000⟩,
  ⟨w9_7_18, extra09.getD 2 ⟨0,0,0,0⟩, mkRat 53 54, mkRat 316227766017 1000000000000, mkRat 173205080757 500000000000⟩,
  ⟨w9_8_17, extra09.getD 3 ⟨0,0,0,0⟩, mkRat 53 52, mkRat 173205080757 500000000000, mkRat 53033008589 125000000000⟩,
  ⟨w9_9_21, extra09.getD 4 ⟨0,0,0,0⟩, mkRat 53 54, mkRat 53033008589 125000000000, mkRat 489897948557 1000000000000⟩,
  ⟨w9_10_19, extra09.getD 5 ⟨0,0,0,0⟩, mkRat 265 259, mkRat 489897948557 1000000000000, mkRat 796721799 1562500000⟩,
  ⟨w9_10_19, extra09.getD 6 ⟨0,0,0,0⟩, mkRat 265 259, mkRat 796721799 1562500000, mkRat 11313708499 20000000000⟩]

theorem planTargets09 : plans09.map Plan.target = extra09 := rfl

theorem planPrices09 : plans09.all (fun p => p.priced sparseMesh) := by decide +kernel

end Grothe.LowerAnalytic.SparseStein
