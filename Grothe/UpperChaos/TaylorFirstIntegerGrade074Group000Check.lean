import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part00000 = 5039635881382760685050465113412646629402619695718071222881023168068098118074239964894307675563587691660611420160 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part00064 = 6487069123992788860785239651558974526455460537066487095655282395555171302427402451673541402675656840791025778688 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part00128 = 8217178068862383131766522367955627415520269078271249071813894356501061311346854152767140897309507449719256776704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part00192 = 9316139380421218508991434474224531716246634941303098317369135134005108443393665297954077465964986613585089134592 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part00256 = 9714946815838984096422971260168634151689044934746645315944610597054177062847429145767512881772263465159753728000 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part00320 = 9127852248232409698917459201507389721580721922106799064053011261878341983988149265742541721266584690356931002368 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part00384 = 335722068568663972738366330429635818592790152260589318490420324089072894602317518557179514066679108658201100288 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part00448 = 8567131041401611351801975669248706804895930810335384039259246494223300685458570144446244211104127421491431079936 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group000.size = 512 := by
  simp only [firstCenterIntegerGrade074Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group000 = 56805674628700820306474434068506146784383472071808323445466623731374331802138627941802545769723393281422300020736 := by
  simp only [firstCenterIntegerGrade074Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
