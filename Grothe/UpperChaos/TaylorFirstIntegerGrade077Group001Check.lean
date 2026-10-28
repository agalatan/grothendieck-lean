import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part00512 = 5243569995234443433829026487515269214971679341555655078796365169809439324545337418142604535830138436055856054272 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part00576 = 4283495938401825010902446742283770978451779955619602895025529868474195369801016305843759540360767925981060005888 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part00640 = 481100056225894952803806199500775082546155902732941707117024406377515368253347567365085058230618799458362589184 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part00704 = 3000244183665157600164618630169621646957901409418338996113923471683709033488223255490011097288399800108526338048 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part00768 = 2766671178853642187220285796647737988324952769396614878473788712425638145487948816847236781462291331994156531712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part00832 = 2123066712005075334404244826013571266743168870515251612804023260716243290825430711463170625221263125140048183296 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part00896 = 1554713859639432612226826938896491579731995725051334885130720226035878099282880169385057759056974978081787740160 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part00960 = 487831774811040503171469585323346764784233574150567617195237206664729746514937818011555821630094341716538556416 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group001.size = 512 := by
  simp only [firstCenterIntegerGrade077Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group001 = 19940693698836511634722725206350584522511867548440307670656612322187348378199122062548481219080548738536335998976 := by
  simp only [firstCenterIntegerGrade077Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
