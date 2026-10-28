import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Rat.Defs
import Grothe.UpperChaos.TaylorBandData
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Concrete arithmetic on candidate grade values. No source binding asserted;
these checks are independent of parser and coefficient identities.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.ThirdGradeCandidateNumerics

def candidates : List ℤ := [60572309227101571288882613528741628634097254400, 6281891909463200469449438898227293552905902096384, 107082066966185791338608105289233816874741252751360, 1086624141504107079196183411508983821739085319372800, 3265362349938420117886554384694877003371544909447168, 2939757548211040834628685072859828444170766782562304, 1280435015243042885270478213627019373938238147264512, 1165623431964595447947173303427870672413344116244480, 1185892668593026553869581926733243243163926512271360, 939953132152710504399870037703615382361061529223168, 1009137162886639841382407083365856631073591835754496, 853025116247805692861925829871705055766171827044352, 625785305858991510315277327744395465456503419305984, 801362595405236946846814965921072146782405334663168, 500193459831387416921884747655450320933825810530304, 585359377947707388293377147284865776821699602284544, 609216604836878913702225044193645511744173652312064, 456654108865457990905209302928691636703679756632064, 520877281720642052191049957386735865657310434033664, 574889909897015654960655322871003692932605254041600, 452976310944994602653520163865190912710256644587520, 411986005990471885279114228819387168647053058244608, 515846671833216925257902097444880127789877558247424, 462022960110086194303931657409630158314224987668480, 318708704024484425105962287075187188991386348038081, 365194447708022706840596720968599347214805041954816]
def grade (q : ℕ) : ℤ := candidates[q]?.getD 0

set_option maxRecDepth 8192 in
theorem total_arithmetic : (((∑ q ∈ Finset.range 26, grade q : ℤ) : ℚ) / (2 : ℚ)^210) = Grothe.UpperChaos.thirdCenterEnergyQ := by
  decide +kernel

#print axioms total_arithmetic

set_option maxRecDepth 8192 in
theorem band0_arithmetic : (((∑ q ∈ Finset.range 26, if 0 < 2*q+1 ∧ 2*q+1 ≤ 11 then grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = Grothe.UpperChaos.thirdCenterBandEnergyQ 0 := by
  decide +kernel

#print axioms band0_arithmetic

set_option maxRecDepth 8192 in
theorem band1_arithmetic : (((∑ q ∈ Finset.range 26, if 11 < 2*q+1 ∧ 2*q+1 ≤ 21 then grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = Grothe.UpperChaos.thirdCenterBandEnergyQ 1 := by
  decide +kernel

#print axioms band1_arithmetic

set_option maxRecDepth 8192 in
theorem band2_arithmetic : (((∑ q ∈ Finset.range 26, if 21 < 2*q+1 ∧ 2*q+1 ≤ 31 then grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = Grothe.UpperChaos.thirdCenterBandEnergyQ 2 := by
  decide +kernel

#print axioms band2_arithmetic

set_option maxRecDepth 8192 in
theorem band3_arithmetic : (((∑ q ∈ Finset.range 26, if 31 < 2*q+1 ∧ 2*q+1 ≤ 51 then grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = Grothe.UpperChaos.thirdCenterBandEnergyQ 3 := by
  decide +kernel

#print axioms band3_arithmetic

end Grothe.UpperChaos.ThirdGradeCandidateNumerics
open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.ThirdGradeCandidateNumerics.total_arithmetic,
    ``Grothe.UpperChaos.ThirdGradeCandidateNumerics.band0_arithmetic,
    ``Grothe.UpperChaos.ThirdGradeCandidateNumerics.band1_arithmetic,
    ``Grothe.UpperChaos.ThirdGradeCandidateNumerics.band2_arithmetic,
    ``Grothe.UpperChaos.ThirdGradeCandidateNumerics.band3_arithmetic]
  for target in targets do
    for ax in ← Lean.collectAxioms target do
      unless allowed.contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
