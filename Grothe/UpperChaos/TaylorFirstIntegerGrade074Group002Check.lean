import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part01024 = 1223075525566570885514966910713642244934372025727317085998818900379860195167107598865551268435027016119845126144 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part01088 = 1112537217768138720038688445572907620942396827543465350885496085681944458996400026512922781501844811343527411712 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part01152 = 233209134523777717295505052863744806783349942833494437435248299023487051569852380616657929168636968620177489920 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part01216 = 828038453733725233270831695661155073336953716135981782143573079724350957970719089171976318427574988790665576448 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part01280 = 974798317937409381732070567996236027147860730319537651815536325456423520886088978352717077707964819603646840832 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part01344 = 902319077551786825155476845386425584544066079290806064653190789582174028127914489542052103049542233712310091776 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part01408 = 802422928777475017161363458214302714068151998714947502870816362831070146349056478965467400571076193574780403712 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part01472 = 696660714458432970455084471919334234384393777434546088083793061804761198095132854070507577427395152995262922752 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group002.size = 512 := by
  simp only [firstCenterIntegerGrade074Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group002 = 6773061370317316750623987448327748306141545098000095963886472904484071557162271896097852456289062184760215863296 := by
  simp only [firstCenterIntegerGrade074Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
