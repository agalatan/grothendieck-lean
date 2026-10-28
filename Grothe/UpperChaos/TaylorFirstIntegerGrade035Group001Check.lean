import Grothe.UpperChaos.TaylorFirstIntegerGrade035Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade035Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade035Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade035Part00512 = 9817580258727942205059027590356984312696868234379400056579662329563326243543318886011155272925093003890478022656 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade035Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade035Part00576 = 6096034464645366380395239530320954039755571708256089886673026210737432196968354075854126110454347907776584351744 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade035Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade035Part00640 = 3124077714641135816359303878521340804537403923078709678898589268065260269285155017247829486582539113341703421952 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade035Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade035Part00704 = 797835392532615793551085452139196744930631320213923485758644711722066896233286433583704609965998010152020606976 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade035Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade035Part00768 = 960654948416195262953667157874483611549340856188461641140676040183149342078110188431397640369031689157295996928 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade035Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade035Part00832 = 679501773816953048628310773084865611979767974095589449361535461811787536080447869060548029454292843268344381440 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade035Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade035Part00896 = 398078649117568692511212237155901320460895475567403708715202423042775592406310594732248538584054536826582466560 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade035Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade035Part00960 = 414170468110140467263174401135638682183517127255872467000863344574289918051711941794855709116067102125440630784 := by decide +kernel

theorem group_length : firstCenterIntegerGrade035Group001.size = 512 := by
  simp only [firstCenterIntegerGrade035Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade035Group001 = 22287933670007917666721021020589365128093996619035450374128199789700087994646695006715865397451424206538449879040 := by
  simp only [firstCenterIntegerGrade035Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade035Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade035Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade035Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
