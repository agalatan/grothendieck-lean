import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part04608 = 44765752093877829737584468715706347880259859643748594238152392253182278681748209873507343990406996092256256 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part04672 = 26828330621757641395630531947038340607768727060205403403795218802096114391916282860817632208725840735764480 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part04736 = 11985436301806695179826239170290410113568479623643981062791264292634848117573481165164754780593463064788992 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part04800.size = 30 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part04800 = 5370047949510805402460483601826777261481470823328346574073635072792261015241875687532511886883559277854720 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group009.size = 222 := by
  simp only [firstCenterIntegerGrade068Group009, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade068Group009 = 88949566966952971715501723434861875863078537150926325278812510420705502206479849587022242866609859170664448 := by
  simp only [firstCenterIntegerGrade068Group009, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
