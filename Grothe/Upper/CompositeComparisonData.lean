import Grothe.Upper.ComparisonGroups
import Grothe.Upper.Data
import Mathlib.Tactic
import Lean.Util.CollectAxioms

/-! A separate comparison budget for three low-band errors and three
whole Taylor residuals. Original comparison interfaces and data are unchanged.
The numerical source, quadrature and trust obligations remain open.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
namespace Grothe.Upper.CompositeComparisonData
open Finset GrotheKernel

abbrev OldIndex := GroupedComparisonIndex
abbrev PieceIndex := Fin 7

def oldBand (k : OldIndex) : ComparisonBand := comparisonBands[k]
def lowIndex (p : Fin 4) : OldIndex :=
  if p.val = 0 then ⟨0, by decide +kernel⟩ else
  if p.val = 1 then ⟨1, by decide +kernel⟩ else
  if p.val = 2 then ⟨8, by decide +kernel⟩ else ⟨13, by decide +kernel⟩
def lowBand (p : Fin 4) : ComparisonBand := oldBand (lowIndex p)
def highGroup (g : Fin 3) : Fin 4 := ⟨g.val + 1, by omega⟩
def cutoff (g : Fin 3) : ℕ := if g.val = 2 then 11 else 51
def wholeRadiusQ (p : Fin 4) : ℚ := comparisonGroupRadiusQ p
def highRadiusQ (g : Fin 3) : ℚ := if g.val = 2 then 199 / 1000 else 916 / 10000
def highBand (g : Fin 3) : ComparisonBand :=
  ⟨cutoff g, 0, wholeRadiusQ (highGroup g), highRadiusQ g⟩
def highOld (g : Fin 3) : Finset OldIndex :=
  if g.val = 0 then {2, 3, 4, 5, 6, 7} else
  if g.val = 1 then {9, 10, 11, 12} else {14, 15, 16, 17}

def source (j : PieceIndex) : Fin 4 :=
  if j.val = 0 then 0 else if j.val ≤ 2 then 1 else if j.val ≤ 4 then 2 else 3
def band (j : PieceIndex) : ComparisonBand :=
  if j.val = 0 then lowBand 0 else
  if j.val = 1 then lowBand 1 else
  if j.val = 2 then highBand 0 else
  if j.val = 3 then lowBand 2 else
  if j.val = 4 then highBand 1 else
  if j.val = 5 then lowBand 3 else highBand 2

def energyErrorQ : ℚ := 3 / 10 ^ 8
def normSlackQ : ℚ := 1 / 50000000
def comparisonCapQ : ℚ := 172 / 10 ^ 8
def rawCapQ : ℚ := 95 / 10 ^ 10
def projectedCapQ : ℚ := 96 / 10 ^ 10
def tableCapQ : ℚ := 1 / 10 ^ 8
def rawTailQ : ℚ := 36748 / 10 ^ 12
def upperQ : ℚ := 28091999 / 20000000
def lowRadiusQ (p : Fin 4) : ℚ := (lowBand p).norm + normSlackQ
def radiusQ (j : PieceIndex) : ℚ :=
  if j.val = 2 then highRadiusQ 0 else
  if j.val = 4 then highRadiusQ 1 else
  if j.val = 6 then highRadiusQ 2 else lowRadiusQ (source j)
def errorQ (j : PieceIndex) : ℚ := (band j).error

theorem low_contains (g : Fin 3) (n m : ℕ) :
    (lowBand (highGroup g)).contains n m = true ↔
      0 < n + m ∧ n + m ≤ cutoff g := by
  fin_cases g <;>
    norm_num [lowBand, lowIndex, oldBand, highGroup, cutoff, comparisonBands,
      ComparisonBand.contains, Bool.and_eq_true, Bool.or_eq_true,
      decide_eq_true_eq, beq_iff_eq]

theorem high_contains (g : Fin 3) (n m : ℕ) :
    (highBand g).contains n m = true ↔ cutoff g < n + m := by
  change (decide (cutoff g < n + m) && true) = true ↔ cutoff g < n + m
  constructor
  · intro h
    exact of_decide_eq_true (Bool.and_eq_true_iff.mp h).1
  · intro h
    exact Bool.and_eq_true_iff.mpr ⟨decide_eq_true h, rfl⟩

theorem cutoff_pos (g : Fin 3) : 0 < cutoff g := by
  fin_cases g <;> decide +kernel

theorem high_covered (g : Fin 3) (n m : ℕ) :
    (highBand g).contains n m = true ↔
      ∃ k ∈ highOld g, (oldBand k).contains n m = true := by
  fin_cases g <;>
    norm_num [highOld, highBand, oldBand, cutoff, comparisonBands,
      ComparisonBand.contains, Bool.and_eq_true, Bool.or_eq_true,
      decide_eq_true_eq, beq_iff_eq] <;>
    omega

theorem high_old_group : ∀ (g : Fin 3) (k : OldIndex),
    k ∈ highOld g → comparisonGroup k = highGroup g := by
  decide +kernel

theorem low_mass_budget (p : Fin 4) :
    (lowBand p).norm ^ 2 + energyErrorQ ≤ lowRadiusQ p ^ 2 := by
  fin_cases p <;> norm_num [lowBand, lowIndex, oldBand, comparisonBands,
    energyErrorQ, lowRadiusQ, normSlackQ]

/-- The coarse high radii have enough slack to pay the table discrepancy
once per old component. Their source unions are proved separately. -/
theorem high_mass_budget (g : Fin 3) :
    (∑ k ∈ highOld g, (oldBand k).norm ^ 2) +
      (highOld g).card * energyErrorQ ≤ highRadiusQ g ^ 2 := by
  fin_cases g <;> norm_num [highOld, oldBand, comparisonBands, energyErrorQ, highRadiusQ]

theorem radii_nonneg (j : PieceIndex) : 0 ≤ radiusQ j ∧ 0 ≤ errorQ j := by
  fin_cases j <;> norm_num [radiusQ, errorQ, band, source, lowRadiusQ,
    lowBand, lowIndex, oldBand, comparisonBands, highBand, highRadiusQ,
    wholeRadiusQ, comparisonGroupRadiusQ, highGroup, cutoff, normSlackQ]

theorem whole_nonneg (p : Fin 4) : 0 ≤ wholeRadiusQ p := by
  fin_cases p <;> norm_num [wholeRadiusQ, comparisonGroupRadiusQ]

/-- The quadratic cost uses the whole group residuals, rather than adding
the low-band radius to a redundant copy of the whole radius. -/
theorem comparison_budget :
    2 * (∑ j : PieceIndex, radiusQ j * errorQ j) +
      (∑ p : Fin 4, wholeRadiusQ p) ^ 2 ≤ comparisonCapQ := by
  norm_num [Fin.sum_univ_succ, radiusQ, errorQ, band, source, lowRadiusQ,
    lowBand, lowIndex, oldBand, comparisonBands, highBand, highRadiusQ,
    wholeRadiusQ, comparisonGroupRadiusQ, highGroup, cutoff, normSlackQ,
    comparisonCapQ]

def headResidualQ : ℚ := comparisonCapQ + headCapQ + energyErrorQ
def residualQ : ℚ := headResidualQ + rawTailQ

theorem residual_value : residualQ = 1814901 / 10 ^ 12 := by
  norm_num [residualQ, headResidualQ, comparisonCapQ, headCapQ, energyErrorQ, rawTailQ]

theorem denominator_pos : 0 < slopeQ - residualQ := by
  rw [residual_value]
  norm_num [slopeQ]

theorem transfer_value_lt :
    (1 / ((slopeQ - residualQ : ℚ) : ℝ)) < (upperQ : ℝ) := by
  rw [residual_value]
  norm_num [slopeQ, upperQ]

theorem upper_lt_decimal : (upperQ : ℝ) < 1.4046 := by norm_num [upperQ]

/-- Actual raw-source approximation pays its own finite smoothing reserve. -/
theorem raw_to_projected_budget :
    rawCapQ + (4 / 10 ^ 15 : ℚ) * (501 / 500 + rawCapQ) ≤ projectedCapQ := by
  norm_num [rawCapQ, projectedCapQ]

theorem projected_energy_budget :
    (2 * (501 / 500 : ℚ) + 3 * projectedCapQ) * projectedCapQ + tableCapQ ≤
      energyErrorQ := by
  norm_num [projectedCapQ, tableCapQ, energyErrorQ]

def massNormQ : ℚ := 45 / 10 ^ 12
def regularRawCapQ : ℚ := rawCapQ - massNormQ
def inputCapQ : ℚ := 36 / 10 ^ 11
def otherRawCapQ : ℚ := 1 / 10 ^ 10
private def u : ℚ := 1 / 2 ^ 53
private def relative : ℚ := u / (1 - u)
private def tiny : ℚ := 1 / 10 ^ 24
private def scale : ℚ := (26 / 25 + 147 * tiny) / (1 - relative)
private def scaleError : ℚ := relative * scale + 147 * tiny
def exceptionCenterQ : ℚ :=
  (1 + u) * (5 / 2) * (massNormQ + scaleError) + 147 * 179 * tiny
def exceptionErrorQ : ℚ :=
  (7 / 2) * massNormQ + (5 / 2) * scaleError +
    u * (5 / 2) * (massNormQ + scaleError) + 147 * 179 * tiny
def regularErrorQ : ℚ := (11 / 10) * 179 * (1 / 10 ^ 12)
def gamma749Q : ℚ := 749 * u / (1 - 749 * u)

/-- Source bounds must instantiate every term; the scalar check itself
does not prove physical weights, decoded centers or roundoff semantics. -/
theorem input_budget :
    exceptionCenterQ ≤ inputCapQ ∧ exceptionErrorQ + regularErrorQ ≤ inputCapQ := by
  constructor <;> norm_num [exceptionCenterQ, exceptionErrorQ, regularErrorQ,
    inputCapQ, massNormQ, scaleError, scale, relative, u, tiny]

/-- Includes the continuous omitted union and the remaining regular-source
raw-output costs. Physical regions must be assigned exactly once. -/
theorem raw_budget :
    massNormQ + (10 / 7 : ℚ) *
      (gamma749Q * 18 * inputCapQ + 18 * inputCapQ) + otherRawCapQ ≤ rawCapQ := by
  norm_num [massNormQ, gamma749Q, u, inputCapQ, otherRawCapQ, rawCapQ]

/-- After the continuous union is charged once, this is the budget left
for the actual regular-source approximation and its finite arithmetic. -/
theorem regular_raw_budget :
    (10 / 7 : ℚ) * (gamma749Q * 18 * inputCapQ + 18 * inputCapQ) +
      otherRawCapQ ≤ regularRawCapQ := by
  unfold regularRawCapQ
  linarith [raw_budget]

end Grothe.Upper.CompositeComparisonData

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.Upper.CompositeComparisonData.high_mass_budget,
      ``Grothe.Upper.CompositeComparisonData.comparison_budget,
      ``Grothe.Upper.CompositeComparisonData.transfer_value_lt,
      ``Grothe.Upper.CompositeComparisonData.input_budget,
      ``Grothe.Upper.CompositeComparisonData.raw_budget,
      ``Grothe.Upper.CompositeComparisonData.regular_raw_budget,
      ``Grothe.Upper.CompositeComparisonData.projected_energy_budget] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected composite-budget axioms: {unexpected}"
