import Grothe.UpperChaos.TaylorFirstIntegerGrade033Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade033Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade033Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade033Part00512 = 12006570174739966707182508741927407219002647553592926650046896059807986457635654559068981762494042857129296003072 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade033Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade033Part00576 = 5504323668896467433185045794836772355040959470178591397989147175696844707837550855327302725296452397490713395200 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade033Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade033Part00640 = 2277673332004045180023792410897228330647578747142022917897377347001263452762197279256020839389913167976351137792 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade033Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade033Part00704 = 1019036315535703576563695863739536728007864865787699315607392771588772100407972016407753397774751595509533638656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade033Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade033Part00768 = 819300410836335656844255878708085099064202770903480287443273321761999805675792605388259360649577611222904209408 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade033Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade033Part00832 = 623120854094510957892183934990307413513280753853203709370700333159328130409946611829166661756100996333863698432 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade033Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade033Part00896 = 445727803384987736439083316401702933794688584465027662086867401213110097450037012546863589349761950348310740992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade033Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade033Part00960 = 292862641523568933409687938017976624792297761462165855600457604914772233342281599809546414787847333645576568832 := by decide +kernel

theorem group_length : firstCenterIntegerGrade033Group001.size = 512 := by
  simp only [firstCenterIntegerGrade033Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade033Group001 = 22988615201015586181540253879519016703863520507385117796042112015144076985521432539633894751498447909656549392384 := by
  simp only [firstCenterIntegerGrade033Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade033Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade033Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade033Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
