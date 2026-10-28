import Grothe.UpperChaos.TaylorFirstIntegerGrade055Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade055Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade055Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade055Part00000 = 187679406590216013572034356488721738669365268558079656592875810624281957604276898319855032583742922522494228234240 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade055Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade055Part00064 = 166517642833391661523436374421739758927199976758516470608109744441206895424790254793451077659252630778932017233920 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade055Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade055Part00128 = 147858468573483492029987411940574453119843453630885525950688077257936978793124749985488688572239010740700067135488 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade055Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade055Part00192 = 131569502075695193314315392390527923909130666211227961126034207243759786288459897146647748620216471054559689572352 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade055Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade055Part00256 = 115191871888083962884008786810382730682848543310464455974395767170463236843958758507571789544274592270743110680576 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade055Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade055Part00320 = 100270894984724852139095575376132687694545432484479076707727961373933191775294200254915013592029836189817060196352 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade055Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade055Part00384 = 81897303583865538575762011354542602732433572799401812435459655709504104271240526976411804758301367815969381023744 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade055Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade055Part00448 = 85372754837048901317623532244224359210732035188896431070091732698423184213821822698672199264419682996487484080128 := by decide +kernel

theorem group_length : firstCenterIntegerGrade055Group000.size = 512 := by
  simp only [firstCenterIntegerGrade055Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade055Group000 = 1016357845366509615356263441026846254946098948941951390465382956519509335214967108683013354594476514369703038156800 := by
  simp only [firstCenterIntegerGrade055Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade055Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade055Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
