import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part00000 = 1928895938832746099429929279897299624394022601608010507130843543281457025944437833463527382564833503269571526656 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part00064 = 1775950744651738298892524885575700382581265987443317857880413437168589730135455887695555492209089331875073228800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part00128 = 1953374167269155594195932512396346904001031547620443739718503274504021695266116975790213565044918075475173048320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part00192 = 4943341372057953823671974310155629655394582487274193059812149190757089912754586692231270634311104791052288 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part00256 = 2181135648082271924751797903792809968115446780446772238845595261501950373321803758933236005551205298491497644032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part00320 = 2338375732604933695935773389345111124636746795026772478154764727594173881333968141921292832388819542119653834752 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part00384 = 2413754098471614932357182148099863910266652272865756274947353086126115394548185076370276943711935613945524518912 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part00448 = 4269675575492057612167367447114314612641938478572604714034347579183216162874393438954595444407183129337397248 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group000.size = 512 := by
  simp only [firstCenterIntegerGrade085Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group000 = 12595760948829324661129131158528556384237463318072132975584567489904682073802754822199749048185842859410622251008 := by
  simp only [firstCenterIntegerGrade085Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
