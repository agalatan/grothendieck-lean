import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade044Group003Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade044Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade044Part01536 = 721228524778926576738426020774920041904943035690023571528004796634740578285048227033328973329473976750047232 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade044Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade044Part01600 = 522126181763681864873774961687310402755000116003646181967834593318115102087863168382529376578310950638059520 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade044Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade044Part01664 = 271230957838295493021422226844138510096942116832501568047137444666812331153251763360257205694818187581849600 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade044Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade044Part01728 = 413897554412550493342997575335722029513057039184090609880170871677655501768148767998625914184010306506719232 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade044Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade044Part01792 = 181527068497224890052832738355160516434215292718443367602443545102816272052145465086936579071271489157201920 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade044Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade044Part01856 = 224326745517004142735394737737392514485939818216213376581505002215851186050885344970340407454533116867117056 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade044Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade044Part01920 = 226524393560700451803172219747166574533992465779906596859906242732283859129961564278087605004103783442022400 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade044Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade044Part01984 = 109157977082423373890641394006260023630325014212034331683301229226074109453487846954809018909645895242874880 := by decide +kernel

theorem group_length : secondCenterIntegerGrade044Group003.size = 512 := by
  simp only [secondCenterIntegerGrade044Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade044Group003 = 2670019403450807286458661874488070613354414898636859604150303725574348939980792148064915080226167706185891840 := by
  simp only [secondCenterIntegerGrade044Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade044Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
