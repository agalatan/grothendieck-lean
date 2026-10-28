import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade052Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade052Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade052Part00512 = 51739730686058869424613022551434571130798185796841100204991360943808943766954036934803544089039650143595288068096 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade052Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade052Part00576 = 42458788405716601487822439565204482470363757911227692592874010044723782414234221745841939784759886533712811130880 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade052Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade052Part00640 = 46668590802261254847865299808089291134562603450478920631019003492034528794273912305820945015425821929035484102656 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade052Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade052Part00704 = 20940173386219106114096501404984040638259491536670961107593178433936992654403713625204766007831126248028259745792 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade052Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade052Part00768 = 11211248700880657391745698237151513149973699762397091138085576173598985520401685481324632289075956054283920605184 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade052Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade052Part00832 = 7074040074377801657198388265211859137100948879615084619338718147433032141938582687573571580852264333536237977600 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade052Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade052Part00896 = 4195706041520399104125668964580190272767090579395551610922270693113880212797238969284300407705053134830501363712 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade052Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade052Part00960 = 2956812224964904816908476462366396414058422073673695665922533187090078649443311537856611908780773254947336617984 := by decide +kernel

theorem group_length : firstCenterIntegerGrade052Group001.size = 512 := by
  simp only [firstCenterIntegerGrade052Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade052Group001 = 187245090321999594844375495259022344347884199990300097570746651115740224154446703287710311083470531631969839611904 := by
  simp only [firstCenterIntegerGrade052Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade052Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
