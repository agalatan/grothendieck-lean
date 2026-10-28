import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part06656 = 9987076228407733152875750413947001606764709710599048323063618389098359335761220924831493730133798448791552 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part06720 = 585924224691214413074499951306772175279338003525175139831585534908978018470550199759678307149756646817792 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part06784 = 17202432054933416455533541982141575456229076974027910790672213821503158237040617433202493655395725020758016 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part06848 = 21085203532398258136833351342802511692975411003065340442133739044806591232992510676864771416757324792987648 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part06912 = 14090497609829686779060730600872923417663628092435727801340661622322983574118216092134247907392276802830336 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part06976 = 1726189540775344893190949084707751948819784364787377782174702487898540950164438603408433407359071853477888 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part07040 = 4981203749546541757589679341717919538972695250330855029817644657300816557147409439256486978392885804662784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part07104.size = 36 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part07104 = 2782745590030146399240690146318046300424890932280511591923156382415384114724483928738013051516184388698112 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group013.size = 484 := by
  simp only [firstCenterIntegerGrade083Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group013 = 72441272530612341987399192863814502137129534331051946900957321940254812020419447298195618454097023759024128 := by
  simp only [firstCenterIntegerGrade083Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
