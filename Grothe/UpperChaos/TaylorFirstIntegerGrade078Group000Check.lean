import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part00000 = 4191166772454723897847971049748291977883419785048937083391271435676591761075303475641953275341407632235985633280 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part00064 = 5154314412622681982874451585734613599869050757893822717868638166206091784118714736524340473013598993351018807296 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part00128 = 6394617395434757098131544679634915632134873871691291590296437043926799611101119222434559669555252963196876619776 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part00192 = 6381611693185102728787935086176245917295796814472249761588707714076133714336967652125489018194442890888678998016 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part00256 = 2019901962801511202086920744209209298806938787743637841109476768195355968142652388299956326620230348802275409920 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part00320 = 4130388901791138394917764758466374974001443717565919160734383622354311348733209942480418056453874147661669466112 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part00384 = 5810297657550888884777679882232930186892517017365781165008526161738448843904974892209071923788004620916764966912 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part00448 = 5364605730365595548229895537534430741553898954465259090932032275306423940561376653554097492891750193842559647744 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group000.size = 512 := by
  simp only [firstCenterIntegerGrade078Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group000 = 39446904526206399737654163323737012328437939706246898410929473187480156971974318963269886235858561790895829549056 := by
  simp only [firstCenterIntegerGrade078Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
