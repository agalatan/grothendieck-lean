import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade039Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade039Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade039Part00000 = 334532377899722281511600693447421516886385515280366588223829157354709134642407781013698604720360419140750851178496 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade039Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade039Part00064 = 170961913974571849769585877556021723065947524191372148977223124968606539282046338548114155403185765352631355572224 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade039Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade039Part00128 = 186640488150942669150070605653989666874508805898127076126120695383670513875297532516256902009714221369950398840832 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade039Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade039Part00192 = 200197168209523226799754221276821162504688862789635075290679110698425274141623405234876509461549021140467427835904 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade039Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade039Part00256 = 96902982161523348156504607224750142959372169523628991204707817881523895027480688071927621599985715214110234247168 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade039Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade039Part00320 = 165911191427290260364128251416396948549437624696285255592051291607907169253117966791415474883993871274544004595712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade039Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade039Part00384 = 88461696486041400794409080759100922681658272673533418186502380269554025088607666210899521535274826547518356062208 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade039Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade039Part00448 = 38902274253516922498454916466212483295988863608393222048339904172503667032507297669206346414872316905013456666624 := by decide +kernel

theorem group_length : firstCenterIntegerGrade039Group000.size = 512 := by
  simp only [firstCenterIntegerGrade039Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade039Group000 = 1282510092563131959044508253800714566817987638661341775649453482336900218343088676056395136028936156944986084999168 := by
  simp only [firstCenterIntegerGrade039Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade039Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
