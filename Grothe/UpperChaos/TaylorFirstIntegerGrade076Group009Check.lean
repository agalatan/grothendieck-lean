import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part04608 = 8197686876279596356264317829544827355225336478653307187026308242873637163533945698623900713976379985625088 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part04672 = 32537758925131255453123154224799595364687150771669720788815085694367127518612386541086643260135215762243584 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part04736 = 31350812785021309562283403674916793446443098344280428743959115454503846525814880448618644436686928884006912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part04800 = 25032270295892847457521223218996007725624145770918983017000328398015885321876816344204012220996914744655872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part04864 = 26999723352888259589514243155860066266530500013545081342573651142227450393406580998738680754516235716132864 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part04928 = 13062256452052002664743314964239186175120929609606106502305141842653745836112240349943552389951136116768768 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part04992 = 11905609019452180556203695079226207440866719984319506924123515753144445683241270976686283558812442372866048 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part05056 = 22691855853422384885378908663297704451917477236249444119204176590600562609894074704285524727089383763607552 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group009.size = 512 := by
  simp only [firstCenterIntegerGrade076Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group009 = 171777973560139836525032260810880388226415358209242578625007323118386701052492196062187242062164637345906688 := by
  simp only [firstCenterIntegerGrade076Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
