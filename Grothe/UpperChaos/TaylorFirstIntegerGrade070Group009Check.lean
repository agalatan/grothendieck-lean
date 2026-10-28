import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part04608 = 14451677445800033474740072206636895965878855701373857101690652842445997416408430022858473132476600032428032 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part04672 = 15659526234808906830292712823121139316325693479394402911493472417682959100247231418508650633359797157625856 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part04736 = 21564117689661076432320832255556763018624296175779978689383169155520314102552988986894762067375035263221760 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part04800 = 38630666342062797161235868176900659169540265642571596020481570856325231345372146846741513886970991282749440 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part04864 = 40068486268535857345246918464143364308266465476962589164577110587347999118989773219444514025514602334257152 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part04928 = 24357240362062360660932993162764625829706959270778177777350979112591567530747902240785578197412997526192128 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part04992 = 10766746705764208297169142726994454013963785010598156643750127789886426223577263374614109999408661676425216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part05056.size = 56 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part05056 = 4385054971948541124847401959638318469841879654014933071599300307099654498681648961651216312252578165424128 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group009.size = 504 := by
  simp only [firstCenterIntegerGrade070Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group009 = 169883516020643781326785941775756220092148200411473691380326383068900149336577385071498818254771263438323712 := by
  simp only [firstCenterIntegerGrade070Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
