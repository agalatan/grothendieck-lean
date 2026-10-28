import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part03584 = 5431826865453632387894316635375221737309118216959070778567639771598240369276298934329700847875157841711988736 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part03648 = 4161436272901401423890806362791047907850512264442392650435214686192197020907114162560484034451634508747767808 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part03712 = 25433841148184546693349919954611042594718633543863584553031267374874193061558536777562474040888829214195712 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part03776 = 3117534034669497710328175017612181651446284069288904585611132842247916863625670302941160743102650586155188224 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part03840 = 2341507220509249693380947435476792374057442994695053346748189523488325497145265422475540991634612973098500096 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part03904 = 1725436504243590826994746447804053430319277891432464621784404561724486444427712636701034698760813598302273536 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part03968 = 2064591676577388323451496175048560508948478205873947918875888615687950670884609819709659689835208252588032 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part04032 = 1264755779731150959165867356652599505038895121977087117173405128596183169582900883991267978143586322380488704 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group007.size = 512 := by
  simp only [firstCenterIntegerGrade088Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group007 = 18069995110333284936671660671841556209125197670544710632791893669837911508697405489596461427699179867862990848 := by
  simp only [firstCenterIntegerGrade088Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
