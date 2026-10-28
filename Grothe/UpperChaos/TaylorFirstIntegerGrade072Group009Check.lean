import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part04608 = 35855507535234606179910386510135342936041522763067799612812498256385974376879362798777002522943992251809792 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part04672 = 18980224666987221709195076140320376857568591969677807983773351280158329874938178174540325851727524085628928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part04736 = 12825706972039422618146781675643767964191283968601106582348864357483608285120783210476538613558139808645120 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part04800 = 18147563310766295805482375121239143831895302646124466270755191167390278719833117794729734345832568272715776 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part04864 = 21687790435754593813059768299408829770138712567026236951570068223123674887359335423972667283792211289833472 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part04928 = 21193004498767731703614451609343575523180153828821119579183032184709428944504227937671412127292840906588160 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part04992 = 19121532246226607791481934953629284115317954948978767151672173820102362235867041592027234457421577436790784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part05056 = 33533373666114593815658621992805715805822153905011937046247251304839988282593490435067603018889388852510720 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group009.size = 512 := by
  simp only [firstCenterIntegerGrade072Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group009 = 181344703331891073436549396302526036804155676597309241178362430594193645607095537367262518221458242904522752 := by
  simp only [firstCenterIntegerGrade072Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
