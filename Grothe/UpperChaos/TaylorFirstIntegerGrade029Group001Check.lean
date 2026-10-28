import Grothe.UpperChaos.TaylorFirstIntegerGrade029Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade029Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade029Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade029Part00512 = 3839681854937451323942699996616799250475099722857619546487641730432696789698469987888464867246546183143557169152 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade029Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade029Part00576 = 2018236656732063018191368426678568545129043869472431525004158317993183937882328761092997102671202263023319252992 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade029Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade029Part00640 = 1522862582999828986080486049531278088900237943212772136851229272657936250027443314455275403341550329070805319680 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade029Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade029Part00704 = 972221354068886887174454887946669496774435338909608487966554895483890431567171884495100873953439505958433718272 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade029Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade029Part00768 = 624959547848326985851921688152006180840751622950985755429786502848391008108826395145441474455646263268528357376 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade029Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade029Part00832 = 374060498411592213569002071940120075925892943422911871342556990299626368769578339254919263548453828733221994496 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade029Part00896.size = 34 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade029Part00896 = 118989281077797448733366086617413467290501928357251596636958063213210149452949558470524790919574931143091290112 := by decide +kernel

theorem group_length : firstCenterIntegerGrade029Group001.size = 418 := by
  simp only [firstCenterIntegerGrade029Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy firstCenterIntegerGrade029Group001 = 9471011776075946863543299207482855105335963369183580919718885772928934935506768240802723776136413304340957102080 := by
  simp only [firstCenterIntegerGrade029Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade029Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade029Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade029Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
