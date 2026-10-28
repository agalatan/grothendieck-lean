import Grothe.UpperChaos.TaylorSecondIntegerGrade031Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade031Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade031Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade031Part00512 = 94890142684071357951513168480164500715732188295764171859210081689958676130005149887567061479792140622776762368 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade031Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade031Part00576 = 72290203194184325015851395504650293629229044187416892766616911159313971983875511591516598805655381037232947200 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade031Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade031Part00640 = 50417564130023709126662281629518543403276904885420733051827419065125812187992019202187332008681198372968726528 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade031Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade031Part00704 = 24125975097565241902114327008010242282299684869669926236674311356449404716563421335912588380331450656882688000 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade031Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade031Part00768 = 17066605253585358003257916689547661146651435789542270241536322360739203324804602688064294656632732980627898368 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade031Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade031Part00832 = 14021091337132622007502576105873173899862836276444015356450684237210745540228375316775294839382236542443454464 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade031Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade031Part00896 = 10939321566682295674169612638150085738150968474452144392321924310128028388413312022096740733115565723881570304 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade031Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade031Part00960 = 8608758270750417285479883095879890982017278800382497339557345425509797279387896573060529759976784718259552256 := by decide +kernel

theorem group_length : secondCenterIntegerGrade031Group001.size = 512 := by
  simp only [secondCenterIntegerGrade031Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade031Group001 = 292359661533995326966551161151794391797220341579092651244194999604435639551270288617180440663567490655073599488 := by
  simp only [secondCenterIntegerGrade031Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade031Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade031Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade031Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
