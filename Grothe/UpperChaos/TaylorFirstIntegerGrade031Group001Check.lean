import Grothe.UpperChaos.TaylorFirstIntegerGrade031Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade031Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade031Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade031Part00512 = 7369436707605077542870408220722622847217587034913343340971368179676035753812165248007155279125850908160998506496 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade031Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade031Part00576 = 3147061503157583320991553517838035976780687386081491662395914581355164304109084244951138562778626394982363168768 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade031Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade031Part00640 = 1730146167678355575530549386014203503664419042340081317004644949077712084592716751862428935953656887818758127616 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade031Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade031Part00704 = 1238410926781187315120871607966441709702463391435825448154605287885039810119968085643601945168617755997028483072 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade031Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade031Part00768 = 633618980488447115823618569228037703691527923343314660281349695474634217275702700540665964814880897121665417216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade031Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade031Part00832 = 504513877884300312774358063153253033930433787071369425137493106152327476257266615239234186317831917437605380096 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade031Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade031Part00896 = 309212789369960838053704684980751286616524047022183565223850772098174838640968648644656126488910002273866743808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade031Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade031Part00960 = 184677162662124513901847121553448567943633449252832661629063858377072946353870045410489708744816465416634236928 := by decide +kernel

theorem group_length : firstCenterIntegerGrade031Group001.size = 512 := by
  simp only [firstCenterIntegerGrade031Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade031Group001 = 15117078115627036535066911171456794629547276061460442080798290430096161431161742340299370709393191229208920064000 := by
  simp only [firstCenterIntegerGrade031Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade031Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade031Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade031Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
