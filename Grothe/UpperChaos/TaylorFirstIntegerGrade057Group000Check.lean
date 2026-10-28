import Grothe.UpperChaos.TaylorFirstIntegerGrade057Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade057Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade057Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade057Part00000 = 173143029325127371660824576048223864935818407012693632260517696968979159571087543665977762195048420914144357646336 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade057Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade057Part00064 = 168552848456997123213417223216692880452532080715799411877209065638884480240793672632102557845941831399119532326912 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade057Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade057Part00128 = 156404435261178181119586664754592039341857549060483090869421010818489846137739403895303234364730484753427861602304 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade057Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade057Part00192 = 146306451763860285153562490728077724584126720270677586457747190252659958771453456295594418135077863804627048202240 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade057Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade057Part00256 = 126962751164374929443004599916373814751351821407468823799548192276769061817603078104394915558924815967142805504000 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade057Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade057Part00320 = 103601937776523254134490871520192933373743216716508088764818962925392926648385479067681626348765361996596472971264 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade057Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade057Part00384 = 79622895304397861314880874497364933800960343698663158787344396736990873535783868840115991683788215107215027077120 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade057Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade057Part00448 = 56735451073326223606279771380293243032967493196218054603956881872244738330726591857913876781568362791265437220864 := by decide +kernel

theorem group_length : firstCenterIntegerGrade057Group000.size = 512 := by
  simp only [firstCenterIntegerGrade057Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade057Group000 = 1011329800125785229646047072061811434273357632078511847420563397490411045053573094359084382913845356733538542551040 := by
  simp only [firstCenterIntegerGrade057Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade057Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade057Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
