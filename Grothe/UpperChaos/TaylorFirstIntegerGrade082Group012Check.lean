import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part06144 = 4104895713544381305346782224569951957049084475989708628859481009533157146180362216144559846555849611804672 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part06208 = 10547752160457865160704138917130283335891668125970430001073911488502591857615721590212919105441900328386560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part06272 = 12816046252454645708306805601066843481175532540104706921266475986947505284479395253154226483808302476034048 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part06336 = 11193573758522567889147161475265592724202961807523404621804366740920020356867737879956976184715084398854144 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part06400 = 11735051192456050705243680347049770201197039584982838681543772643524735613954694901879475503538907448868864 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part06464 = 1584568403726192844168140301626166284567070644579801543465499294436275238810080536344960755167869142040576 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part06528 = 10256661043978628343309886842362200543581315245896796179615333761935571628715643507652461980670875880390656 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part06592 = 18767853545663071148495742289336672971779698430120133933088090478541237509928432049003235959026092576079872 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group012.size = 512 := by
  simp only [firstCenterIntegerGrade082Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group012 = 81006402070803403104722337998407481499444370855167820510716931404341094636552067934348815818924881862459392 := by
  simp only [firstCenterIntegerGrade082Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
