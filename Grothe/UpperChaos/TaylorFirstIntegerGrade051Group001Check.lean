import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade051Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade051Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade051Part00512 = 73467650792224491603745882262027411038460172270398064685026306652049382308471809532613980477155867323561060335616 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade051Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade051Part00576 = 71680014065110907959247327658625406739814793032969242133990001312014394772917347706861762219201960902382111948800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade051Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade051Part00640 = 25986419555231230796483621447558430949021466080076863828653171443401460848499603872653761467467886560316579905536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade051Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade051Part00704 = 16043306247103091771905131144335822887295206026659683296711892819093104872189309882913150411255228895203686350848 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade051Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade051Part00768 = 9908628100648524000432856921889922676264710880318814170456998230162680339300309261532439977103651929420359270400 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade051Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade051Part00832 = 6461797747989673082685901202904712025150995445014055762970545599549348426416694429066380922127493786429095411712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade051Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade051Part00896 = 4240685048548135959231520741511544730727752444569414664439255234776726802643400643249703962748035114599465353216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade051Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade051Part00960 = 1050517028904161399333628929658301256560085950152067060934726409990974181688478629454651275455281376141936427008 := by decide +kernel

theorem group_length : firstCenterIntegerGrade051Group001.size = 512 := by
  simp only [firstCenterIntegerGrade051Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade051Group001 = 208839018585760216573065870308511552303295182130158205603182897701038072552126953958345830712515405888054295003136 := by
  simp only [firstCenterIntegerGrade051Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade051Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
