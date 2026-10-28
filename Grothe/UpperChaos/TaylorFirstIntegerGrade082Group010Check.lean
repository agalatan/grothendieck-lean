import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part05120 = 17704445629365394180265073082904864386165105313796564405811615077783616587087394736692723365319656582676480 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part05184 = 23200935123009565300596592964568726611581744784113557692247255292917132850699045497853606184058039746691072 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part05248 = 19582746352665233722590171451390222031012838155276992352838064690445528904158503296119221914035133731569664 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part05312 = 10847184842394544831183772140450546125825959089966507694995128497937474553748508705425807766785918637178880 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part05376 = 8561183908964509950187104672943159014443727587794703476843023799710126334382852588938159950923007497601024 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part05440 = 17522425453756585484965464595465996403748745658267231525517586130763761312341219741703375799882901102788608 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part05504 = 15513351088997097634298344373234088834873993802370347292167456858092470289355551225012553806734987410538496 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part05568 = 9930383646572922302929050093382527184086700791632018215122621737672658303538570923577608599220330017325056 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group010.size = 512 := by
  simp only [firstCenterIntegerGrade082Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group010 = 122862656045725853407015573374340130591738815183217922655542752085322769135311646715323057386959974726369280 := by
  simp only [firstCenterIntegerGrade082Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
