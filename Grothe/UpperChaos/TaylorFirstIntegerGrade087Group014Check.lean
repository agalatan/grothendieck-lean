import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group014Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group014Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part07168.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part07168 = 8610922172189007601596463276820819610474481440427647593134563869331237374963420505392723229508584207286272 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part07232.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part07232 = 9874875016656709409355463633300631518922756529860959079152603314766532490978328242878564336756882631819264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part07296.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part07296 = 543099289239008672100759407475933784479178268986528716640972906572816875719835701824907764730295977246720 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part07360.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part07360 = 8165314726403096379468379405744693892490466789622222780234050911986403592529997884806774826158430999281664 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part07424.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part07424 = 14233873196515592317349878849799262053525832659872003512523771244014892875935828273655929594138580561690624 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part07488.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part07488 = 1133730097166562897808274545357714397576398363540581340852265610321963997013751145854904480059662463401984 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part07552.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part07552 = 16513624248671434464015750048306460226775307766430025518815398120333243491036598902711965170195721992798208 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part07616.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part07616 = 12178433841149451855065521226467069063650087759640795414576172272837849446578340758468897282385395559956480 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group014.size = 512 := by
  simp only [firstCenterIntegerGrade087Group014, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group014 = 71253872587990863596760490393272584547894509578380763955929798250164940144756101415594666683933554393481216 := by
  simp only [firstCenterIntegerGrade087Group014, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group014Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group014Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
