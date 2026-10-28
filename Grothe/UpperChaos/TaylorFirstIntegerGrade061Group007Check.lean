import Grothe.UpperChaos.TaylorFirstIntegerGrade061Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade061Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade061Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade061Part03584 = 162577681957259684840018176724417372917266550949191619235028065966698149884767824056822811291061413113495552 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade061Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade061Part03648 = 175959030561239354212871514757340304391584558213201520452748410532053256456956354468441183366599152737714176 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade061Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade061Part03712 = 116504497701898561914952973927296824749430881198984325279340688321778418749467548228969849267245653115797504 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade061Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade061Part03776 = 72695639499375682020006822241230378082591835649459827746368237222025296642033646480059752286045802967597056 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade061Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade061Part03840 = 45641674016532644854935817369992110626936396306360943604505198881424876269343138910030461487983766127247360 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade061Part03904.size = 2 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade061Part03904 = 35743059542913171272943997174907125200171205703179347081093244754611735393803058648232743159674817686274048 := by decide +kernel

theorem group_length : firstCenterIntegerGrade061Group007.size = 322 := by
  simp only [firstCenterIntegerGrade061Group007, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade061Group007 = 609121583279219099115729302195184115967981428020377583399083845678591733396371570792556800858610605748125696 := by
  simp only [firstCenterIntegerGrade061Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade061Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade061Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
