import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part01024 = 1111887027237972153077228609081705194127980196610937579601799313531271739771972252687988339730048137597963730944 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part01088 = 135303488128902005782200340352368143652209459224614321552896542626869929783776179626947788163392430021585928192 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part01152 = 871724701762364497022852865050869139620531382303149570778663949624780003927679616374219022512642149753454329856 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part01216 = 945578480920450167330985201910686744824450094920935644900278238157186607235581178490662934915894431962688913408 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part01280 = 887494246946739271044612156612645049118032886105768733450960238652871568531768803331761661613133239703975231488 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part01344 = 813027148854082666755665346670090110045504484484059513154646402216129618546705521171903976326275129213896884224 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part01408 = 722666980442796396634673559844582832581602127199249089435942275136301656148051026892458167065739660075038932992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part01472 = 21869640368540387690190430656639724176862440939710828125415717479659527058039969756380167962319015492223762432 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group002.size = 512 := by
  simp only [firstCenterIntegerGrade075Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group002 = 5509551714661847545338408510179586938147173071788425281000602677425070651003574548332322058289444193820827713536 := by
  simp only [firstCenterIntegerGrade075Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
