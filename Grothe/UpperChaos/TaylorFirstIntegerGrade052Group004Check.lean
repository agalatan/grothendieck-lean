import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade052Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade052Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade052Part02048 = 58211793043515718003156196451679307882414407976642432004487574120157482022086753360618205345655226883295412224 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade052Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade052Part02112 = 12161138407801433804785998506947260746739162181313894492658278308310695866229824414496547992776465858240184320 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade052Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade052Part02176 = 6480496225293762781731370335653640225170910956182322672367030162760043084845078132644956534266973532144533504 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade052Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade052Part02240 = 4715609808480004070673639642566207217238939060336794453638217960676974118082598770261546104818558655906447360 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade052Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade052Part02304 = 6652402210773305878636327330648552384717704239779700319949116685575262667183503905654029030391333836147392512 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade052Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade052Part02368 = 14162717370791135001372594620947352220463023485943336211174287184784850434909059574183141133516826133802254336 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade052Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade052Part02432 = 6734748197898444286507484694383383011832052041952482606529536578950679679070073671577458103348519910718308352 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade052Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade052Part02496 = 4310543886846698535179866966727334923870266780536557208546575627052062244322342392342090060503237498408796160 := by decide +kernel

theorem group_length : firstCenterIntegerGrade052Group004.size = 512 := by
  simp only [firstCenterIntegerGrade052Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade052Group004 = 113429449151400502362043478549553038612446466722687519969350616628268050116729234221777974305277142308663328768 := by
  simp only [firstCenterIntegerGrade052Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade052Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
