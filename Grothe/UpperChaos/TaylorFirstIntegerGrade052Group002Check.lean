import Grothe.UpperChaos.TaylorFirstIntegerGrade052Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade052Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade052Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade052Part01024 = 1399169693822368353220329022098794908430299550027959723893484983825844398618369769490411893950290678221690109952 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade052Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade052Part01088 = 461037480497593128575760028841826415073183295223249663579557775316558188990382990033364661223434941713191272448 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade052Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade052Part01152 = 365825272829991744945644188830550803199125278803153405363634589507856369237639801605333082236570109687183179776 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade052Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade052Part01216 = 355240791396915099051309799443099149248782073814196324019189122927774423205644054841535082359856908904683274240 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade052Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade052Part01280 = 431279881097923870948394594817963167497517702561250042580440672544698759156168457831412516243962006166426353664 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade052Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade052Part01344 = 783680681405194166664676753782716261152899805638002567037781062686424704948635257919192869147909507309719519232 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade052Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade052Part01408 = 473875824995960953804654480281001871339077118915858584071710486149275334501829824486328591010095387477538766848 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade052Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade052Part01472 = 425938462705103579258393973248644682575136531278298310952183138536702715711259940049017344512289540087639703552 := by decide +kernel

theorem group_length : firstCenterIntegerGrade052Group002.size = 512 := by
  simp only [firstCenterIntegerGrade052Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade052Group002 = 4696048088751050896469162841344597258516021356261968621497981831495134894369930096256596040684409079568072179712 := by
  simp only [firstCenterIntegerGrade052Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade052Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade052Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
