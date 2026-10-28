import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group014Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group014Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part07168.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part07168 = 8700490977883726074421303752936713330287930121170767336155220603747870116282139845221621307340441711017984 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part07232.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part07232 = 5247316999653587905157502591619693278161828197152507544899540968804863541229902882268118490405414889324544 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part07296.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part07296 = 9856755871142379459587317035893052734981305749714250351659177977229632666214962962784613348763069990305792 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part07360.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part07360 = 18377196061435406978730314342520661472708249433187063716152154062449651266286902474711534074799597746651136 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part07424.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part07424 = 12623786571132910620314797451586133950490324447584581642506783940248847465070440909950669301228324748525568 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part07488.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part07488 = 1120255143837537450428476770187907749845476989893548959717368332563796990333454171856068987995069266001920 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part07552.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part07552 = 4991322447356328051173912561768882760252428110922833305008839030594999070627439744691828859593088554762240 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part07616.size = 40 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part07616 = 2564053999520538093038972684573275922654991800581547212236452616811192162405881727435041732884041180381184 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group014.size = 488 := by
  simp only [firstCenterIntegerGrade086Group014, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group014 = 63481178071962414632852597191086321199382534850207100068335537532450853278451124718919496103009048086970368 := by
  simp only [firstCenterIntegerGrade086Group014, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group014Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group014Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
