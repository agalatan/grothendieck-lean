import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part02560 = 36401092716803310009072806858414447141561895633610700542251826767058181017410067877417364754108327079530463232 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part02624 = 46826903278907330621635260540103165452751462149157219181073859892591572304272430032824995930060195748642816 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part02688 = 28758327783016948489777344913887238884927964899260229940588166802374220461495133473630165799993820608494305280 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part02752 = 22395107972588881496176296182582630489481803380404304426472476154457969609519312708299952890411797098511990784 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part02816 = 17182748813724872146475488058475171455544470128977830522839693103391506366260420749331593784581809514422992896 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part02880 = 13008539632531494079652526341940364347578849038611225689841873843096411723155490826820396451003987529096495104 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part02944 = 9684258709508872152802645409347996354340834537719286034627322266174200819340457375929103532562272492003000320 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part03008 = 28682251646241637227831283249999629387978926781857637329897955222231993686659672047583014068675146418225152 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group005.size = 512 := by
  simp only [firstCenterIntegerGrade075Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group005 = 127505584783099527341806574308437951468276548007514592013132330751667313563171815113508985222660749664226115584 := by
  simp only [firstCenterIntegerGrade075Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
