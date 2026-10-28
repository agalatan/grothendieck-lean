import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade048Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade048Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade048Part02048 = 14777971014446131923622840411948448107911206210319585965953919364513492012289345300248666206615756593661214720 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade048Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade048Part02112 = 7901249432336790670036489136488224601943542822533607849873195990789614757683502519848634417329475650762833920 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade048Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade048Part02176 = 5096378080103774774212689638289459532203033957744208342021161858528352885397017234905175028696159068627140608 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade048Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade048Part02240 = 9042752586134147110848455586732622608941169454930579413074648426455977039120710153108949264493695310971797504 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade048Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade048Part02304 = 2516548816816145366125348228092627734664601487929950978769577085223290384136652970891962553357631118062387200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade048Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade048Part02368 = 4528050644790030237178548467190929474831940328184857921469177523526671425910307357045377132479624277563277312 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade048Part02432.size = 18 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade048Part02432 = 5258756808032218311009090170244439285708920136923940985361426460053491817977367500384085033323453446449266688 := by decide +kernel

theorem group_length : firstCenterIntegerGrade048Group004.size = 402 := by
  simp only [firstCenterIntegerGrade048Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy firstCenterIntegerGrade048Group004 = 49121707382659238393033461638986751346204414398566731456523106709090890322514903036432849636295795466097917952 := by
  simp only [firstCenterIntegerGrade048Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade048Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
