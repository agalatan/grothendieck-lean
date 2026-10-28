import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade056Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade056Part01536 = 390549127648113560812933188457489994914577388946245781537961932643965260742096943455683481061631225412940988416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade056Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade056Part01600 = 338561782191267650501805670716788982810285774210781661321615021269576240598693100840323590985878773791369199616 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade056Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade056Part01664 = 297429599370770749809779030917958070385536629608294974963089395928631880173331228859675896030938247469438337024 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade056Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade056Part01728 = 262830487032973003836467218856696091013243540929497937865345672827610431704281352139396229252873362899629768704 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade056Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade056Part01792 = 287177975228089064760445691638137165061789191587190311569964589007824095380368172733365370447159677800748679168 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade056Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade056Part01856 = 230942323912275214509692110016837371088523193501032436615876640727619692715468058900177606377594751759826288640 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade056Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade056Part01920 = 96021919043065919634538029575355918020377568905683292682132230617846141141392988519303708536029946517420769280 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade056Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade056Part01984 = 67640896750052548380880457853246948292365076069607872930563844442285416435493179373980808286453310077949444096 := by decide +kernel

theorem group_length : firstCenterIntegerGrade056Group003.size = 512 := by
  simp only [firstCenterIntegerGrade056Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade056Group003 = 1971154111176607712246541398032510541586698363758334269486549327465359158891125024821906690978559295729323474944 := by
  simp only [firstCenterIntegerGrade056Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
