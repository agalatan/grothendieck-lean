import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part03584 = 183402365436715392833389285147217807790334639716622718164071197855416868304726157869384523845126125581762560 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part03648 = 113699249334650525162077148055046207502589587927657595561302948888994626901608202703974054891631360163708928 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part03712 = 76521323293669090232556689465828455593071580144550032437544536766781765253221420947305266746715950513389568 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part03776.size = 6 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part03776 = 91032724203013107035628994287024157677851907305244080891845318985632115943709772496152030349694834451677184 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group007.size = 198 := by
  simp only [firstCenterIntegerGrade060Group007, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy firstCenterIntegerGrade060Group007 = 464655662268048115263652116955116628563847715094074427054764002496825376403265554016815875833168270710538240 := by
  simp only [firstCenterIntegerGrade060Group007, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
