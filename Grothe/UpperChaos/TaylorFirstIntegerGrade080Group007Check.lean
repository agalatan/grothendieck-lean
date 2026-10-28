import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part03584 = 1657580643591549353976752755694266905656618158590192267803151865379637531880857401961462555105104220452290560 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part03648 = 1155454018932243990770064434191859101835933840789489201537205600271292348077847193375979174554677658993557504 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part03712 = 728088639902084126074327384892396440202744352275670234046671201149024653799666164096662723941922332972417024 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part03776 = 82158218209111299844144095049078025340180698262982912779551127802535972738114242025597110993395773601742848 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part03840 = 561534091844803783949223581727868762671559987498141126725731718393759990239137779752517718344743163990638592 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part03904 = 379204729570374421144640773315554696361795330199878570951345832488300340127714615503048193539582788183785472 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part03968 = 239374538012923702510824246109082674235475610963386222574418898823862033476907031805723286021386889028698112 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part04032 = 15339923363354332677682849026422054955103256260998053161830851306265916507787556277728836051269713710284800 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group007.size = 512 := by
  simp only [firstCenterIntegerGrade080Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group007 = 4818734803426445010947660120006528661259411234840738589579907095614678786848031984798719598552082540933414912 := by
  simp only [firstCenterIntegerGrade080Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
