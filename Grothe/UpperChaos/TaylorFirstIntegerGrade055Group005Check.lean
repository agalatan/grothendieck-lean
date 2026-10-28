import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade055Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade055Part02560 = 7528397000594158102635063870846737493380212761737883493168551975685576134611566492226876645037728951024222208 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade055Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade055Part02624 = 4518573272553332581162800940940886785192174235659244097493883201753200110446865321847531130573720715142365184 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade055Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade055Part02688 = 3068884426854376559538122571858067820578840191878349763259142483389061376827147712901165502050254964039614464 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade055Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade055Part02752 = 2303290145312948693716060871112426069030392345347193303616130587697958128079333959055017330576203760812425216 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade055Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade055Part02816 = 1787372922803683681358025978048336520533350093665474046463688088330772112067797037533988407274383421747494912 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade055Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade055Part02880 = 1164282119816221922924916296760739486172678315345323596468586876543421661259753093812671301824760518837010432 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade055Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade055Part02944 = 1088836072590796873751757967724291413806977078036752656868330430909025193285049522420134829829822397630382080 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade055Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade055Part03008 = 816033298877002738239654329733658370701598372995870069438105000333965371645111195209574241278855241395077120 := by decide +kernel

theorem group_length : firstCenterIntegerGrade055Group005.size = 512 := by
  simp only [firstCenterIntegerGrade055Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade055Group005 = 22275669259402521153326402827025143959396223394666091026776418644642980088222624335006959388445729970628591616 := by
  simp only [firstCenterIntegerGrade055Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
