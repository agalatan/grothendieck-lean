import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part04096 = 111401004862077655897784682492370272172637640371685657827122195628262048521371188832175502780007396566630400 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part04160 = 85618352692532574731091004053300796754763378321866250825058708628379281309047563901265315886645832895692800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part04224 = 20296296700865140030776325033166346001448593345083039200741557636503335364489318115768852146846337448542208 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part04288 = 52670275223326772333282095070478186718712637492313425933137577141291065639256256872331849036325942661742592 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part04352 = 54742321411604700423212481513594413929888065371424335278553493259095434815011513363044562097073756949184512 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part04416 = 42604883280196900655033280527054252289144211478699195960109725996389851027927681264301695036791372176687104 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part04480 = 34717862346605875705292773346352660580438944461359648470423258792621157975892877520857526390286517075443712 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part04544 = 30764740109108824443824369368040801869688481974207764643532984793997142193128724831159790550680556535808000 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group008.size = 512 := by
  simp only [firstCenterIntegerGrade072Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group008 = 432815736626318444220297011404357730316721952816639318138679501876539316846125124700905093924657712309731328 := by
  simp only [firstCenterIntegerGrade072Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
