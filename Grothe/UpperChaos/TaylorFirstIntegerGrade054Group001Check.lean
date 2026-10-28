import Grothe.UpperChaos.TaylorFirstIntegerGrade054Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade054Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade054Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade054Part00512 = 35942043943736992590383717068486464639203523535637818955998718620029609511544024606763935353422646442056466038784 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade054Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade054Part00576 = 27761914902570488495739203014446659592800960313616915071262564312556796378153477781485881101686086126406947831808 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade054Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade054Part00640 = 23227085683732674711228377067964759875867353070828499944557276344222977370561012353396716357083734395091496730624 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade054Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade054Part00704 = 19967743463900415430271015285843776688377325658649659085769584374913883875313432047951638988463087347412307542016 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade054Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade054Part00768 = 16798434554813712968763660335998374015372697410644978155478686592987928032033423270985835587738857927275140087808 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade054Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade054Part00832 = 17440174152579164760968230357284186223114806723723120466804800861527414138077841929559296914018186265431856119808 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade054Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade054Part00896 = 12690895211580112306984639641487134575781357105337844171597585704504377785943694920187772586503143226342518030336 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade054Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade054Part00960 = 4782188391393460168675807960810998806485542702554646716110479265128013055521231852420618465997839887956141146112 := by decide +kernel

theorem group_length : firstCenterIntegerGrade054Group001.size = 512 := by
  simp only [firstCenterIntegerGrade054Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade054Group001 = 158610480304307021433014650732322354417003566520993482567579696075871000147148138762751695354913581617972873527296 := by
  simp only [firstCenterIntegerGrade054Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade054Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade054Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
