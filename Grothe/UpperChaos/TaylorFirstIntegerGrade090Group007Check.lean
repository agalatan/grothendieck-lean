import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part03584 = 6677009550077267503471404245334842678448455801325577837943530029214374592174901881189235542686772240161177600 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part03648 = 5349145097764030572221565615939946929258560760599044237716228156201055019237942679136435456598597297953046528 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part03712 = 3894152301774888481009941371896464263735392061126663957258354140874313896322559813117628075999762123518377984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part03776 = 250805564174065381876997886487586957175471554232689716026207792997074044511898743238060562128041559977885696 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part03840 = 3144753530359938341802666580130992723755273099623682440760374212875790354767210674683413128500554173039771648 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part03904 = 2346603631377450840825225163441807256311649649551171905611876991487227041522105078869563807392569392218767360 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part03968 = 1623343026549591697066911100677096878682253298138988409532922765529519418319793447201561544996242182897664 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part04032 = 1726996561633677990378127974397073882336944520252997345859232599552752298299821654231298915129082636518031360 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group007.size = 512 := by
  simp only [firstCenterIntegerGrade090Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group007 = 23391089580187868703282995748729391787900429700009966429585336845968116766254760317912837049980375665569955840 := by
  simp only [firstCenterIntegerGrade090Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
