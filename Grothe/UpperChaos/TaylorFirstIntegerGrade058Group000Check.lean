import Grothe.UpperChaos.TaylorFirstIntegerGrade058Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade058Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade058Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade058Part00000 = 161099720806657031594647280973516754299752540948288595099653920995301618954955228737437667259161574539625163128832 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade058Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade058Part00064 = 151632545261775819886002030655037891584064373295867871876728329337112228114016798947183456815317663840120764104704 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade058Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade058Part00128 = 149675917247929540945891399733305800701104355795516501530608092415441926173679719142226451211280438357751685447680 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade058Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade058Part00192 = 140677694477719845214908006844025032331954377131366692625830402943487244938082299383374860463785271017206055960576 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade058Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade058Part00256 = 123117000948102251650445442885476813673107529795964488339102839019703462693891792409869553603922982999074296299520 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade058Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade058Part00320 = 99741847443737558724606064320651757546339661029494289254195665054860441502921862861891158424000775328927320113152 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade058Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade058Part00384 = 75929433402940660797567864057178796553000711556871496872557395211554481789502941212283212870913586474110538481664 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade058Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade058Part00448 = 53899273792222375213809504432532908233676786715328573574592624113533808121799770312618086618902040384472090673152 := by decide +kernel

theorem group_length : firstCenterIntegerGrade058Group000.size = 512 := by
  simp only [firstCenterIntegerGrade058Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade058Group000 = 955773433381085084027877593901725754923000336268698509173269269090995212288850413006884447267284332941287914209280 := by
  simp only [firstCenterIntegerGrade058Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade058Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade058Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
