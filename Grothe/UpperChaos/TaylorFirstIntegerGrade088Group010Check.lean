import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part05120 = 40543838586860542828785658935192833123319087313833884019318425794894443728828970135898353689341363205701632 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part05184 = 38010081487498948641413353761772946590785060075661059603546601934422968694216412523753236839733995040145408 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part05248 = 22964688054400896762392359707602837059044525650202600024968444703882430881680143664138765995612828086566912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part05312 = 11167859255763838380801864171895090635854883898123066726586658113044328581841653647554627793949775745777664 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part05376 = 29562029208239792722719412471253415104690321515203257513981658831676218258244588086727787161206096561963008 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part05440 = 25253391772896565276087699371939192511429333612963783185989785611178319358576781822692074061206947954163712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part05504 = 1541557971317452184441371380550558118996434789597125605548770340387813276594929888614437604880733144350720 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part05568 = 21201745476344981390234911639389601561835501920054589564727196559162318370113952893572816069341909415362560 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group010.size = 512 := by
  simp only [firstCenterIntegerGrade088Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group010 = 190245191813323018186876631439596474705955148775639366244667541888648841150097432662952099215273649154031616 := by
  simp only [firstCenterIntegerGrade088Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
