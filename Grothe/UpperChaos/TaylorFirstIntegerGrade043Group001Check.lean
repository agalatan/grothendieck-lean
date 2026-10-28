import Grothe.UpperChaos.TaylorFirstIntegerGrade043Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade043Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade043Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade043Part00512 = 53407725178890080011506807824219071852812590874633648817606487868711188378023793105648791368678680919702836871168 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade043Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade043Part00576 = 81605818180997957314732250212386019117481749841934463169113757159349702928726262600064660292200217546571282120704 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade043Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade043Part00640 = 27110188446672504892400740793631244034961449256937376362938005808709622058667934649461493933897398148592377528320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade043Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade043Part00704 = 29409391087574932036364655943911007430132963272324757790258914892673882470275858035940595082613485600148115423232 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade043Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade043Part00768 = 7225299849256101247561698506126473128113766053978716455232101876170546001157667616242009484843992564712651882496 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade043Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade043Part00832 = 5007486289165162184728604703808016467675265496677940324886301093823187625418504931931158634742731823805380952064 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade043Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade043Part00896 = 2476850982713056901565073804746892303200912800626012756887379979955351643255981492871280903253195550792387395584 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade043Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade043Part00960 = 556273194675643548335467551955559617902855554367622793489692104944024375911892730547572160535444142808966889472 := by decide +kernel

theorem group_length : firstCenterIntegerGrade043Group001.size = 512 := by
  simp only [firstCenterIntegerGrade043Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade043Group001 = 206799033209945438137195299340784283952281553151480538470412640784337505481437895162707561860765146297133999063040 := by
  simp only [firstCenterIntegerGrade043Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade043Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade043Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
