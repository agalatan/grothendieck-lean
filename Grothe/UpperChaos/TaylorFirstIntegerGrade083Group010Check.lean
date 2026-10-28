import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part05120 = 11158006949588178490604525654191714868450528987741886222347442391637537292861132427520844293675928717885440 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part05184 = 17358017122356156213864196890870792622612926001183380815373549871625972320784364549945897142470041806045184 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part05248 = 22705531463477007827010509448854507619080629387359704233094414335333433716628498268486612887605441833467904 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part05312 = 19509254796073162485223403683317912872864671342540350556449517942395638575133614359384808086884848804823040 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part05376 = 9018218458512319181790598290783270932857436400099103430579703294444031975588202911763749960783912367030272 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part05440 = 8202344426505052408553847468592619765557120528673772830379627902369278345212033324689199458817251704045568 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part05504 = 16878162074338084396195377716836498111369216203548980357155006497743044629707774911497199117970646484647936 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part05568 = 16152803440279547877865939808712158152873363751412948421579690158201634608747289968233942044090566570934272 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group010.size = 512 := by
  simp only [firstCenterIntegerGrade083Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group010 = 120982338731129508881108398962159474945665892602560126866958952393750571464662910721522252992298638288879616 := by
  simp only [firstCenterIntegerGrade083Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
