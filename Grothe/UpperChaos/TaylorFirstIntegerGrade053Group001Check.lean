import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade053Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade053Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade053Part00512 = 42317045217512943704875390607901947880800154732777621160557452278458299733136764406108730843492765454146952232960 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade053Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade053Part00576 = 32920643821147175815096337550259312255835419683985848312942493970580077005044024601688189242258265848327637565440 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade053Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade053Part00640 = 26948023674086526582330648058227159461082118424971023726120812755827415672151068866075143871042949239400879357952 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade053Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade053Part00704 = 26745877480749951143375077980633424529971512364757843109801471744853964684919232489472103829588249377749052948480 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade053Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade053Part00768 = 23929848652335715089494756973477971183753269095405739181175223838133040153614144267590001109188249441479459602432 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade053Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade053Part00832 = 8810814599397973821359103941309114272786239061477098659454129262223890058960111170764519094248369422591751880704 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade053Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade053Part00896 = 5641906336680725374717043246785586159487540774125560941666765340688208961668924922229884696714026502541908377600 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade053Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade053Part00960 = 3503570506185450778185629157126553602837086683494891544029201640140609098880748181479684620206540893203063635968 := by decide +kernel

theorem group_length : firstCenterIntegerGrade053Group001.size = 512 := by
  simp only [firstCenterIntegerGrade053Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade053Group001 = 170817730288096462309433987515721069346553340820995626635747550830905505368375018905408257306739416179440705601536 := by
  simp only [firstCenterIntegerGrade053Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade053Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
