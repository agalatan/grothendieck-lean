import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part04608 = 15118058112959651600329858046044103130411738033182879236784817959467874039499970775212544399516301887799296 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part04672 = 41270190244140133652144057482966604873311561577444360616403471206762631091831757618687428602992514473918464 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part04736 = 42545318567148840370152436123226882739907562546361454126620322561359742153983587965144989994648899512434688 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part04800 = 25575341799234515598941661519678974639072733449754681472426036489672830119378284223268567702630785651572736 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part04864 = 11411402371164091167423899755525355142750468964450843520918611321410332142968115794003891919345614751531008 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part04928.size = 42 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part04928 = 4771978949731990038293619428998352083493558897649136618784075292632151896065118366153378567714959433662464 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group009.size = 362 := by
  simp only [firstCenterIntegerGrade069Group009, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade069Group009 = 140692290044379222427285532356440272608947623468843355591937334831305561443726834742470801186849075710918656 := by
  simp only [firstCenterIntegerGrade069Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
