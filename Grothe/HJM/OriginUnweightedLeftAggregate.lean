import Grothe.HJM.OriginUnweightedLeftCombined00
import Grothe.HJM.OriginUnweightedLeftCombined01
import Grothe.HJM.OriginUnweightedLeftCombined02
import Grothe.HJM.OriginUnweightedLeftCombined03
import Grothe.HJM.OriginUnweightedLeftCombined04
import Grothe.HJM.OriginUnweightedLeftCombined05
import Grothe.HJM.OriginUnweightedLeftCombined06
import Grothe.HJM.OriginUnweightedLeftCombined07
import Grothe.HJM.OriginUnweightedLeftCombined08
import Grothe.HJM.OriginUnweightedLeftCombined09
import Grothe.HJM.OriginUnweightedLeftCombined10
import Grothe.HJM.OriginUnweightedLeftCombined11
import Grothe.HJM.OriginUnweightedLeftCombined12
import Grothe.HJM.OriginUnweightedLeftCombined13
import Grothe.HJM.OriginVisibleEnergy
namespace Grothe.HJM.OriginUnweightedLeftAggregate
open Grothe.HJM.OriginUnweightedLeftChecks Grothe.HJM.OriginUnweightedLeftCells
open Grothe.HJM.OriginUnweightedLeftWitness
set_option maxRecDepth 1000000

private theorem blocks_cover : (List.range 98) = ([0, 1, 2, 3, 4, 5, 6] ++ [7, 8, 9, 10, 11, 12, 13] ++ [14, 15, 16, 17, 18, 19, 20] ++ [21, 22, 23, 24, 25, 26, 27] ++ [28, 29, 30, 31, 32, 33, 34] ++ [35, 36, 37, 38, 39, 40, 41] ++ [42, 43, 44, 45, 46, 47, 48] ++ [49, 50, 51, 52, 53, 54, 55] ++ [56, 57, 58, 59, 60, 61, 62] ++ [63, 64, 65, 66, 67, 68, 69] ++ [70, 71, 72, 73, 74, 75, 76] ++ [77, 78, 79, 80, 81, 82, 83] ++ [84, 85, 86, 87, 88, 89, 90] ++ [91, 92, 93, 94, 95, 96, 97] : List ℕ) := by decide +kernel

theorem allCombined : (List.range 98).all combinedCheck = true := by
  rw [blocks_cover]
  simp only [List.all_append, combinedBlock00, combinedBlock01, combinedBlock02, combinedBlock03, combinedBlock04, combinedBlock05, combinedBlock06, combinedBlock07, combinedBlock08, combinedBlock09, combinedBlock10, combinedBlock11, combinedBlock12, combinedBlock13, Bool.true_and]

theorem allGeometry : (List.range 98).all geometryCheck = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have h := (List.all_eq_true.mp allCombined) i hi
  have h' : geometryCheck i && (signedCheck i && meanCheck i) = true := by
    simpa only [combinedCheck] using h
  exact (Bool.and_eq_true.mp h').1

theorem allSigned : (List.range 98).all signedCheck = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have h := (List.all_eq_true.mp allCombined) i hi
  have hfull : geometryCheck i && (signedCheck i && meanCheck i) = true := by
    simpa only [combinedCheck] using h
  have h' : signedCheck i && meanCheck i = true := (Bool.and_eq_true.mp hfull).2
  exact (Bool.and_eq_true.mp h').1

theorem allMean : (List.range 98).all meanCheck = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have h := (List.all_eq_true.mp allCombined) i hi
  have hfull : geometryCheck i && (signedCheck i && meanCheck i) = true := by
    simpa only [combinedCheck] using h
  have h' : signedCheck i && meanCheck i = true := (Bool.and_eq_true.mp hfull).2
  exact (Bool.and_eq_true.mp h').2

def rootLo : ℚ := ((2606633911 : ℚ) / 125000000000)
def rootHi : ℚ := ((20853071289 : ℚ) / 1000000000000)
def piLo : ℚ := ((221556731363 : ℚ) / 250000000000)
def piHi : ℚ := ((886226925453 : ℚ) / 1000000000000)
def endpointHi : ℚ := ((-23299627 : ℚ) / 100000000)
def endpointKUpper : ℚ := ((-1370610563 : ℚ) / 250000000000)
def urLo : ℚ := ((-428866824873336321 : ℚ) / 1000000000000000000)
def urHi : ℚ := ((-428866824852770197 : ℚ) / 1000000000000000000)
def uiLo : ℚ := ((-451683862490781127 : ℚ) / 500000000000000000)
def uiHi : ℚ := ((-180673544987648329 : ℚ) / 200000000000000000)
def delta : ℚ := (1001 : ℚ) / 10 ^ 15
def totalTarget : ℚ := ((582419 : ℚ) / 1250000)
def massTarget : ℚ := ((2329643 : ℚ) / 5000000)
def correlationTarget : ℚ := ((9318571 : ℚ) / 20000000)
def piLower : ℚ := ((157079632679489661923 : ℚ) / 50000000000000000000)
def piUpper : ℚ := ((314159265358979323847 : ℚ) / 100000000000000000000)
def r0 : ℚ := Grothe.HJM.OriginData.leftReal.getD 0 0
def i0 : ℚ := Grothe.HJM.OriginData.leftImag.getD 0 0
def q0 : ℚ := r0 ^ 2 + i0 ^ 2

def mass : ℚ := ((List.range 64).map fun n =>
  let a := alpha.getD n (0, 0)
  ((n : ℚ) + 1) * (2 * (n : ℚ) + 1) ^ 2 * (a.1 ^ 2 + a.2 ^ 2)).sum

def endpointK : ℚ := ((List.range 64).map fun n =>
  let a := alpha.getD n (0, 0)
  let b := if n % 2 = 0 then Grothe.HJM.Origin.phaseRatio n
    else -Grothe.HJM.Origin.phaseRatio n
  (2 * (n : ℚ) + 1) * b * (r0 * a.1 + i0 * a.2)).sum

def sumScaled (xs : List ℤ) : ℚ := (xs.sum : ℚ) / 10 ^ 18
def minProduct (a b c d : ℚ) : ℚ := min (min (a * c) (a * d)) (min (b * c) (b * d))
def innerLower : ℚ :=
  minProduct urLo urHi (sumScaled JreLower) (sumScaled JreUpper) +
  minProduct uiLo uiHi (sumScaled JimLower) (sumScaled JimUpper)
def totalUpper : ℚ := 2 - 2 * innerLower + 2 * delta
def certifiedCorrelationLower : ℚ := sumScaled correlationLower - endpointHi - delta

/-- Exact arithmetic only. Analytic endpoint, integration and residual
bindings are separate obligations, not conclusions of this native fact. -/
theorem rationalFacts :
    0 < rootLo ∧ rootLo ≤ rootHi ∧ rootLo ^ 2 ≤ q0 ∧ q0 ≤ rootHi ^ 2 ∧
    0 < piLo ∧ piLo ≤ piHi ∧ piLo ^ 2 ≤ piLower / 4 ∧ piUpper / 4 ≤ piHi ^ 2 ∧
    urLo ≤ min (r0 / rootLo) (r0 / rootHi) ∧ max (r0 / rootLo) (r0 / rootHi) ≤ urHi ∧
    uiLo ≤ min (i0 / rootLo) (i0 / rootHi) ∧ max (i0 / rootLo) (i0 / rootHi) ≤ uiHi ∧
    0 < mass ∧ mass ≤ massTarget ∧ massTarget ≤ 1 ∧
    0 < correlationTarget ∧ endpointK ≤ endpointKUpper ∧ endpointKUpper < 0 ∧
    piLo * endpointKUpper / rootHi ≤ endpointHi ∧
    totalUpper ≤ totalTarget ∧ correlationTarget ≤ certifiedCorrelationLower := by
  native_decide

/-- Extract the three rational target gates from the complete sign-safe
arithmetic check. -/
theorem targetBounds : mass ≤ massTarget ∧ totalUpper ≤ totalTarget ∧
    correlationTarget ≤ certifiedCorrelationLower := by
  have h := rationalFacts
  tauto

/-- Analytic bridge obligations may be supplied independently; the concrete
T/B/C target inequalities then follow from the checked rational arithmetic. -/
theorem dischargeRealTargets {T B C : ℝ}
    (htotal : T ≤ (totalUpper : ℝ)) (hmass : B ≤ (mass : ℝ))
    (hcorr : (certifiedCorrelationLower : ℝ) ≤ C) :
    T ≤ (totalTarget : ℝ) ∧ B ≤ (massTarget : ℝ) ∧ (correlationTarget : ℝ) ≤ C := by
  refine ⟨htotal.trans ?_, hmass.trans ?_, ?_⟩
  · exact_mod_cast targetBounds.2.1
  · exact_mod_cast targetBounds.1
  · exact (show (correlationTarget : ℝ) ≤ certifiedCorrelationLower by
      exact_mod_cast targetBounds.2.2).trans hcorr

theorem tailArithmetic : totalTarget - correlationTarget ^ 2 / massTarget < (53 / 20000 : ℚ) ^ 2 := by
  norm_num [totalTarget, correlationTarget, massTarget]
end Grothe.HJM.OriginUnweightedLeftAggregate
