import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part04096 = 66226386147446670517949686278020952624595349299791021003921122870075922302246625701440070741914574095646720 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part04160 = 46854436594547910892503128514033037844972748642720516442850873126552434840310921028698851138554493017260032 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part04224 = 27790127465391108588495844098294726382102164517132459793962584103167633910440561026826570455054569107881984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part04288 = 32983943599409716800872418244918250412008675133184351474549278072231591699250212580440115682495333448810496 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part04352 = 30101751582827842351969411631962597442542286469315445234142759152405391891194148352652132561714328658509824 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part04416 = 24407012987517249290819225705191906877533989721659470392424142451759988320035247537397239362049848092131328 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part04480 = 37463481482259491466012479707553270827315082300117832019076113001059822891552242642421714645551034839072768 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part04544 = 13253273976425837066170347205133933431071873982054618942946564872251675081086925786674029517398817938341888 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group008.size = 512 := by
  simp only [firstCenterIntegerGrade068Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group008 = 279080413835825826974792541385108675842142170065975715303873437649504460936116884656550724104732999197655040 := by
  simp only [firstCenterIntegerGrade068Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
