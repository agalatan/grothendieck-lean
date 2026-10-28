import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part03584 = 2388285709743337602743038333319268653681040282935507689097302425822803997940221490207069051023197935063007232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part03648 = 1685949425846651212529857535649404091690742109756495176042633706519403105918442362928446831857895268671291392 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part03712 = 16973966819015002014163440938048336694870362616231182337428694146051133813215240960682951109792794805272576 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part03776 = 1148820097264333845254642995318293959001402128864804966579928147105542649666742406941987108108958002357207040 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part03840 = 792625167260388866972383528949653876246064646267890679989688793170112641514058454213386423627498827255119872 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part03904 = 544465299639187456512328530224975450257494055405604490523148334566113314378522263369241611514972003312336896 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part03968 = 188366650897451860853211032345194125827938603438353853049310329955389304859571279177831156294562465439547392 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part04032 = 195919784752674380785743487038795635272210097279014347957637648326124774464076419921499403295750879367397376 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group007.size = 512 := by
  simp only [firstCenterIntegerGrade082Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group007 = 6961406102223040227665368883783634128671762286563902385577078079611540922554849917720144536832628176271179776 := by
  simp only [firstCenterIntegerGrade082Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
