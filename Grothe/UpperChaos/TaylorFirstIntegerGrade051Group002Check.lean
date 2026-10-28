import Grothe.UpperChaos.TaylorFirstIntegerGrade051Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade051Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade051Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade051Part01024 = 706014136187401195922466269638748063392169984291891935075000257414986425946748878980760997380504254560625229824 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade051Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade051Part01088 = 572298236065424510208040217007751816931256740299195461622019520700791870362160368027404678298865083417846874112 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade051Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade051Part01152 = 672547107732602219104770782632129172037791925297330902816788297362918628362741138128118233112611250925559873536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade051Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade051Part01216 = 899239200596955266100411952712903463019190522108453848035527433284376502253460366554828920076766740585126035456 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade051Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade051Part01280 = 544317622675281308613576289238928447867849247678341041404137687162380457475973534396410369454078926866048090112 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade051Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade051Part01344 = 545118064020243942177124671334861226241410706501718751584829700087272611298136425732911086841569397741931462656 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade051Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade051Part01408 = 520785675571500707606721792159183866127569699657264235068833299210837586848753218234002572917925343420317958144 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade051Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade051Part01472 = 609684599258831349846997008323660990223153125813847928775864981360705354980451629799945890503148282772971323392 := by decide +kernel

theorem group_length : firstCenterIntegerGrade051Group002.size = 512 := by
  simp only [firstCenterIntegerGrade051Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade051Group002 = 5070004642108240499580108983048167045840391951648044104383001176584269437528425559854382748585469280290426847232 := by
  simp only [firstCenterIntegerGrade051Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade051Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade051Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
