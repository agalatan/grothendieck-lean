import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group014Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group014Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part07168.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part07168 = 12299919973029172320683360384986169916976190748798246193660904497338052782770399610944824108679648684015616 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part07232.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part07232 = 13652777689228851341690476978735777013116889438977728254119642281485346899347880844203379704169648929898496 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part07296.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part07296 = 1123680880917674072047951815196784150844705731774552444875562993336268350529520823541368759434286836219904 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part07360.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part07360 = 8750718427230563890510446989877438239290598650190432690127999006709628048603108509681659596139378245632000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part07424.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part07424 = 9208578722188658187197885656930285916463235773195228133173284959492789862424401394116881702155808629850112 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part07488.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part07488 = 6923937876145783932844662069394659019183500816370001993947563429950815498800127147095075425244754076499968 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part07552.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part07552 = 1056012932217016381531312679078559135158302891953254038867080194256894768654035347815816909568443921989632 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part07616.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part07616 = 9198127358933451572717560561192360086093732449513734190230307658342409437786715274900296129156706040020992 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group014.size = 512 := by
  simp only [firstCenterIntegerGrade089Group014, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group014 = 62213753859891171699223657135392033477127156500773177939002345020912205648916188952299302334548675364126720 := by
  simp only [firstCenterIntegerGrade089Group014, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group014Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group014Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
