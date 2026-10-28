import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part04608 = 37986306436423187274003855182257362498372287241495449918559685575476690458504888073049482039243380594049024 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part04672 = 29657781761897999991471117508629160283963424481067852541194320507850791594106511357377739446404365833732096 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part04736 = 30590953380610835105433618752221662115465882324854091679752218509207984030511009133946964890701117324787712 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part04800 = 26514072957320206535186204702457226973673434490860899556805683194303416371568034595631485275814468052320256 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part04864 = 13758668530058113823894635508220470158195885746434366824517050606560053390067664458070942765858075394965504 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part04928 = 12623236344381638998331058419013650349214238269142935584632387700044759838731936277710893766733066787618816 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part04992 = 23849496847648219309892857478013322345162129923790136500513558977313228896869330971096121480850667506499584 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part05056 = 27995119417326668441719029783225177494583884738160999846304449372297333526272007851667580131881013118763008 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group009.size = 512 := by
  simp only [firstCenterIntegerGrade075Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group009 = 202975635675666869479932377334038032218631167215806732452279354443054258106631382718551209797486154612736000 := by
  simp only [firstCenterIntegerGrade075Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
