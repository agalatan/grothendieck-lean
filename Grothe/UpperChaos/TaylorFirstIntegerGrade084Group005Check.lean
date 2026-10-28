import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part02560 = 48101878914366379650928431355139655328126359954229657002926648250796318425544496102977391843093069660178874368 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part02624 = 39783683216475613802410236314592641686498616922441720481376198110776648125059550595506471767899077314980347904 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part02688 = 7114434877205572529934217029268251821439925958830500248309291864150348336319246120269493333613400439337779200 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part02752 = 25896411595664944687389439851857465741888381643304693638034294161775699835807801609030285030129418860178178048 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part02816 = 27374059856797689239420523837531215166916951235143495894199832558699546538633139984127638341135285043849068544 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part02880 = 22589315434542522598635249053334360864511357752328803396949033125229801117908667467910547164455441578225303552 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part02944 = 2020644542945035546481305706378476250632183487517592733236617448233258435411945390767958843410209361302126592 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part03008 = 16471238441012892064053781155749650656318056083320937204483831253130437404223929561602482971941436188268691456 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group005.size = 512 := by
  simp only [firstCenterIntegerGrade084Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group005 = 189351666879010650119253184303851717516331833037117400599515746772792058218908776832192269295677338446320369664 := by
  simp only [firstCenterIntegerGrade084Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
