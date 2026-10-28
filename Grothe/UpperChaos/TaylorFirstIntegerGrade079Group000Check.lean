import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part00000 = 4302312546574321578221121164445901506505290638775617299060868032773277501469334715496041486754966000178403737600 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part00064 = 5113947184976761177244987877992994533327413901004579634962297627654439097496063492851547341355258300493262225408 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part00128 = 5927855363928753782869788175061549432172377568996970425474212913158841368644596638386158174789057935454242865152 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part00192 = 5759646417722431071787750770895052048180711230740625024384098066276733359558387375732231001044468051259265384448 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part00256 = 655320391721506336040684969713885453573548817458884587070222971876037617616869034252744408929833145126092800 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part00320 = 5499955821512382718035594263741266217503271820744374702565455610754511459608688531688090180337033563568517152768 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part00384 = 5168853706513812139254673887865140984060591167109720411257068818376039329600476161411488583228393898611711148032 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part00448 = 4759867744235769505277567630607077445243550172621762583590433164521210522305723208814077907846440563846535970816 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group000.size = 512 := by
  simp only [firstCenterIntegerGrade079Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group000 = 36533094105855953479027524455578696052446780048811108965881504456486928676300886993413887419764548146557064577024 := by
  simp only [firstCenterIntegerGrade079Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
