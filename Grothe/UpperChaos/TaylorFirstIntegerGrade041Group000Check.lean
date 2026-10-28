import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade041Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade041Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade041Part00000 = 410009878380652540746075710994903530481276857429640131341124754933218607411916296315677802621735453144083813367808 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade041Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade041Part00064 = 323917937772394974679589870361063557431943209478987521620373564148253506849994184830388289429985310764098115338240 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade041Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade041Part00128 = 545512295517309688670906169548408880935208997411268269871143184601401196470000383658455122545855574647861311176704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade041Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade041Part00192 = 425874085567927965388242703185253619587046026788359364843322309274637593308403315665908513855887812988207911403520 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade041Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade041Part00256 = 321570054439341141216420258798834413951066606796188039173496401210577110287015672651008671785729919817925653430272 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade041Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade041Part00320 = 171776378461778414030496100397713099629169491516083330429391507844106118410144152259926981625513896039378143150080 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade041Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade041Part00384 = 78529488534701127114830813526299356910233474758126357332681503494348677418273586795477170385881785127680444727296 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade041Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade041Part00448 = 66738616198664455384269247753478735021084507424824040007446263040449872408426141237281821958643343861662548492288 := by decide +kernel

theorem group_length : firstCenterIntegerGrade041Group000.size = 512 := by
  simp only [firstCenterIntegerGrade041Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade041Group000 = 2343928734872770307230830874565955193947029171603477054618979488546992682564173733414124374209233096390897941086208 := by
  simp only [firstCenterIntegerGrade041Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade041Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
