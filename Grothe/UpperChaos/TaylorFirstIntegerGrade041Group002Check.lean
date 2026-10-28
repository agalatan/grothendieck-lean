import Grothe.UpperChaos.TaylorFirstIntegerGrade041Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade041Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade041Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade041Part01024 = 339339946718593266565387815078523474019904853850000731677382292955617997252126276316718684253824983794232328192 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade041Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade041Part01088 = 158006925590248605167688763085904038849385884492801609309672231760721287716617942643523131097843925650992267264 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade041Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade041Part01152 = 265154124412568451730287327970696776096078651334115857073433026911611287138849171388354110627990794444994510848 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade041Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade041Part01216 = 117273760596501091320122677732951767435354226227405281275834444647054575122794042757808320778390287038229250048 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade041Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade041Part01280 = 183638387842486320573180425173187298534706150545629915723129499556274468996475020264817417628366894594833514496 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade041Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade041Part01344 = 65784563632386192960691150232784233330497509475912891188473245870311317936382069484451298650785303826224119808 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade041Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade041Part01408 = 79289724077796706849342858946465119763297025745185398797125679279384525980116275907492034317919576395337433088 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade041Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade041Part01472 = 20688213421734865386646088004269267693874125350048151989183976788993621746002983521807819882359190965222113280 := by decide +kernel

theorem group_length : firstCenterIntegerGrade041Group002.size = 512 := by
  simp only [firstCenterIntegerGrade041Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade041Group002 = 1229175646292315500553347106224781975723098427021099837034234397769969081889363782284972817237480956710065537024 := by
  simp only [firstCenterIntegerGrade041Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade041Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade041Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
