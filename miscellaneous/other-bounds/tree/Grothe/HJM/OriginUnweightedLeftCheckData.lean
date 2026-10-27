import Grothe.HJM.OriginUnweightedLeftWitness
import Grothe.HJM.OriginUnweightedLeftCells
import Grothe.HJM.OriginUnweightedMeanPolynomial
namespace Grothe.HJM.OriginUnweightedLeftChecks
open Grothe.HJM.OriginMoment Grothe.HJM.OriginUnweightedLeftCells
open Grothe.HJM.OriginUnweightedLeftWitness Grothe.HJM.OriginUnweightedMeanPolynomial
open Grothe.HJM.OriginPanel Grothe.HJM.OriginPanels

def signedBounds (i : ℕ) : ℚ × ℚ :=
  let c := panelCenter edges i
  let h := panelRadius edges i
  panelBounds (signedCellPolynomial polynomial Grothe.HJM.OriginData.leftReal
    Grothe.HJM.OriginData.leftImag (parent i) c h) c h 40

def meanBounds (part : List ℚ) (i : ℕ) : ℚ × ℚ :=
  let c := panelCenter edges i
  let h := panelRadius edges i
  panelBounds (meanCellPolynomial part (parent i) c h) c h 40

def signedCheck (i : ℕ) : Bool :=
  let v := signedBounds i
  decide (entry correlationLower i ≤ v.1 ∧ v.2 ≤ entry correlationUpper i)

def meanCheck (i : ℕ) : Bool :=
  let r := meanBounds Grothe.HJM.OriginData.leftReal i
  let z := meanBounds Grothe.HJM.OriginData.leftImag i
  decide (entry JreLower i ≤ r.1 ∧ r.2 ≤ entry JreUpper i ∧
    entry JimLower i ≤ z.1 ∧ z.2 ≤ entry JimUpper i)

/-- All lookups are in bounds and the cells form an ordered partition of
[0,8]. Per-cell parent and Taylor gates are part of the combined check. -/
def dataShape : Bool := decide (
  edgeList.length = 99 ∧ parentList.length = 98 ∧
  correlationLower.length = 98 ∧ correlationUpper.length = 98 ∧
  JreLower.length = 98 ∧ JreUpper.length = 98 ∧
  JimLower.length = 98 ∧ JimUpper.length = 98 ∧
  edges 0 = 0 ∧ edges 98 = 8 ∧ covers 0 8 leftPanels = true)

def geometryCheck (i : ℕ) : Bool := dataShape && decide (
  i < 98 ∧ parentList.getD i 0 < leftPanels.length ∧
  edges i < edges (i + 1) ∧ (parent i).a ≤ edges i ∧
  edges (i + 1) ≤ (parent i).b ∧
  0 ≤ panelCenter edges i ∧ 0 < panelRadius edges i ∧
  panelCenter edges i ≤ 8 ∧
  variation (panelCenter edges i) (panelRadius edges i) ≤ 1 ∧
  entry correlationLower i ≤ entry correlationUpper i ∧
  entry JreLower i ≤ entry JreUpper i ∧
  entry JimLower i ≤ entry JimUpper i)

def combinedCheck (i : ℕ) : Bool := geometryCheck i && (signedCheck i && meanCheck i)
end Grothe.HJM.OriginUnweightedLeftChecks
