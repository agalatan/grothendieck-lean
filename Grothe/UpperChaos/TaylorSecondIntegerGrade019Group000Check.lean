import Grothe.UpperChaos.TaylorSecondIntegerGrade019Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade019Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade019Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade019Part00000 = 23949865296655063343992546552144303587268034621656073922242427376410164324822132288705138381743409648573976936448 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade019Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade019Part00064 = 1896442864620497698542691661867454434989153862916918967008308933375354201891412520326844504738456073510129238016 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade019Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade019Part00128 = 1363448822090224130517304055958683182949350497992934321609588479078147157559727081771404252892677189042131959808 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade019Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade019Part00192 = 666433845471770279629406650697576217133889671163134696060324094699991208519333166077908698104224789666201600000 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade019Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade019Part00256 = 320736433751276798465277779888046742729581725219865980708458462284243104018925501989031070666874299484066545664 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade019Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade019Part00320 = 256759657627833468063412066902248399320639994612986822197349001952378438692698671636110998950811626505274130432 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade019Part00384.size = 36 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade019Part00384 = 73253584851165691110716611730543342645389891457846488345091070743068735756575980234435687973984191295084560384 := by decide +kernel

theorem group_length : secondCenterIntegerGrade019Group000.size = 420 := by
  simp only [secondCenterIntegerGrade019Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6]

theorem group_energy : energy secondCenterIntegerGrade019Group000 = 28526940505067831410321355379188855907036040265019761198171547418543347171260805210740873595070437818076864970752 := by
  simp only [secondCenterIntegerGrade019Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade019Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade019Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade019Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
