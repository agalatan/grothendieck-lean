import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part04096 = 117170101607104280332133646430468581284295475277245558728650601727908542758601784416653212070065726233247744 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part04160 = 108829799036086315881666867720945607837828836381275868281472523485700768230915576617971697362065159186546688 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part04224 = 26141954104034632645624036613197996301513126493564251948004801611825569685286284276484465960365457433165824 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part04288 = 83505738650926294611641363348085764105593533768238861989078708473305019363046267062074494743477771904745472 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part04352 = 97453359188672288767797529974301149069367237799102853369612105865594602702070849200616530130534239794364416 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part04416 = 78139610224985209909099033597453439055064157997912802246771611524726259934956710080807673847743614447255552 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part04480 = 62784181462466355401730220544012750759137114279969925681441929543051767320667592408605956732167704629215232 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part04544 = 44452829113027371026687810844557552972150606956733682843489717439718673631415844018878904534717799463911424 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group008.size = 512 := by
  simp only [firstCenterIntegerGrade076Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group008 = 618477573387302748576380509073022841384950088954043805088521999671831203626960908082092935381137473092452352 := by
  simp only [firstCenterIntegerGrade076Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
