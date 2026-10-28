import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part03584 = 1180826786627690975397845751649459875230569079084763815257988125928494483004070502477212670085426942983536640 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part03648 = 805053872136809267326746833631424744070827557370078044030853216974678499310509436444722004613146197866053632 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part03712 = 523101691930334269136936340553738536317166772051493889520565068965145519022991693362161969523823879154302976 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part03776 = 193737821068090354715383824905808198392357188159851521388258334140290710505070795792767236264439236402348032 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part03840 = 125712967420077809334732079658735685681824124453476254767749953310410941682564607599554378359439766780379136 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part03904 = 191967802843997116344961860569961911697839153803122000608182907620093844589216382461635544248890640243359744 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part03968 = 143227497273007163650833317552474895862552867071290126769890580895830121254886141490908345918052052737458176 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part04032 = 136357267233947908537520396239541592452112786663492044672113801865176590585763332543953370491976281099337728 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group007.size = 512 := by
  simp only [firstCenterIntegerGrade078Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group007 = 3299985706533954864444960404761145439705249528657567697015601989700120709955072892172915519505194997266776064 := by
  simp only [firstCenterIntegerGrade078Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
