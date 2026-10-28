import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part02048 = 175775252112328852369233050731930553244615947397303545157746756720198851645472349104608890555889496000215121920 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part02112 = 142443175444743141974153272387768339576323565263795577231436448256297970144499646254642441463516365021459251200 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part02176 = 114737813700777067119844626518233528394886219582436680686823863556966081618398608174321125905094114789333925888 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part02240 = 92750384825903072460815413765428050628612716200179720631465873689645461913963537487061601852571830177547419648 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part02304 = 75108089434732772261025606996807563129813463963674732484223588599318756141208207051310744035688571511314055168 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part02368 = 15193333837484451576779746117463507083168085188560472489454718441173739300073283388648368443527254099716210688 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part02432 = 45510649216394973051806958621669099958389050917956066738256845168672319216834901691855135941929933086673338368 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part02496 = 48724609318181694589988508577288222922461306932640928118596885627825284580494922939841249957816241897319956480 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group004.size = 512 := by
  simp only [firstCenterIntegerGrade074Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group004 = 710243307890546025403647183716588864938270355446547723538004980060098464560945456092289558156033806583579279360 := by
  simp only [firstCenterIntegerGrade074Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
