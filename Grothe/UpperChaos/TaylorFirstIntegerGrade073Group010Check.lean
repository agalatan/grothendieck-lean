import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part05120 = 17834360343510137260001861425898476878888916045949325586068830896559109084672821181474067689197828967497728 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part05184 = 31173691340827854432713985445442898412503873240477962160695342440423165871824092629054132822168670618779648 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part05248 = 2041631239516365024883011971253169121494789382978992444856100799594269568179703343519587544582037367160832 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part05312 = 32467761978806834470893848466601888204275219856949373893427071136083440292713410090350211293578934356017152 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part05376 = 20922445766286425973587127386516131149940940034792154404311757113937031478961321703337915778264035709943808 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part05440 = 9418087803768239014867995363053862392096472162539325179254244634985774723410343591287544729578662921240576 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part05504.size = 46 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part05504 = 3772055070873997412951537856268139364124400829178176851502771505238312168276002314655473749087637634809856 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group010.size = 430 := by
  simp only [firstCenterIntegerGrade073Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy firstCenterIntegerGrade073Group010 = 117630033543589853589899367915034565523324611552865310520116118526821103188037694853678933606457807575449600 := by
  simp only [firstCenterIntegerGrade073Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
