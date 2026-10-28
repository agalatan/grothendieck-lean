import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part02560 = 10671923549757200031419530534462654817758549910720793832833252569540561586178369811907978880953730599959396352 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part02624 = 6821864384090227557270775451402220521583723462397423266976307278128174663629133826478286293401261710256373760 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade059Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade059Part02688 = 4402420606997672987157182638917422466054415480401559744048451018439101854303179637047647467693757208536809472 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade059Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade059Part02752 = 3321873038081592432615868075779642437935974798988559390642355353878665104813238655015642356715736609142603776 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade059Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade059Part02816 = 2620221065362071464559310466348503985503276496545865247411267082582451494427431637438715812146398829836500992 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade059Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade059Part02880 = 2172331432053695093464275140793418196737245096502884989337539624337748800825107740539252177853623988853407744 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade059Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade059Part02944 = 1704684462422475380521024476980661877811280098333879013291074448898503360867665195715735204848558306999926784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade059Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade059Part03008 = 1479639346165324138662884061435823772520442621419946587715333784935206985372567091982764389265573171439861760 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group005.size = 512 := by
  simp only [firstCenterIntegerGrade059Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade059Group005 = 33194957884930259085670850846120348075904907965310912072255581160740413850416693596126022582878640425024880640 := by
  simp only [firstCenterIntegerGrade059Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
