import Grothe.UpperChaos.TaylorFirstIntegerGrade056Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade056Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade056Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade056Part00000 = 183570945343564298470411442114984559468576414394906088013647432250660324127914657841651921438972874406091504484352 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade056Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade056Part00064 = 170850461148385245312383118246653967969654640579426914280392339267399216387689956555711007076785952800446036836352 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade056Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade056Part00128 = 156632140595285147506850396595243684562964607688179430088155283493545854008848926280013758626992808527973496913920 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade056Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade056Part00192 = 143507388217230235744024284589670351859162304772125320818267372437640835768979181307437439951007350998628239933440 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade056Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade056Part00256 = 124309737684639262537358624804521935204566576900850654547926930781053824293541046302352274873298002785690621837312 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade056Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade056Part00320 = 103640849544223229230361397717510462190320608534079111869718486126180195713550515172853080683944680470194818121728 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade056Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade056Part00384 = 81395133010441748397244970837398170318556238153887689956734661945015574530337500584834326263424304419766653681664 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade056Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade056Part00448 = 58978600593561873517592634295891312995463122243633506023092518451657480019486807589372862219424286956234668507136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade056Group000.size = 512 := by
  simp only [firstCenterIntegerGrade056Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade056Group000 = 1022885256137331040716226869201874444569264513267088715597935024753153304850348591634226671133850261365026040315904 := by
  simp only [firstCenterIntegerGrade056Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade056Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade056Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
