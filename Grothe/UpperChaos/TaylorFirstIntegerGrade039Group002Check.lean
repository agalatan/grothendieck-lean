import Grothe.UpperChaos.TaylorFirstIntegerGrade039Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade039Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade039Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade039Part01024 = 274141605179722301491330005712831001020649190102280397345029566128411280812388110922286023172905629380627136512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade039Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade039Part01088 = 332775039028265810590614020612544192391946953198087430287893688841957722295177176468526027230341235332916183040 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade039Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade039Part01152 = 164335013842762383119505257331337880127848656834698004212243021636093978365939912680301952188182101170059214848 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade039Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade039Part01216 = 197685470242896308741357899085278372200119111387350592812578615077899122276671194214746079102397662569454108672 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade039Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade039Part01280 = 58475362782565664577399543604692673891831382244534796396327096945775481311986311949390100671507885304013914112 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade039Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade039Part01344 = 81788457586381160312865252167143612035436911317079437376746723369979806948201185758590955808591594911107645440 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade039Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade039Part01408 = 26815223632477756188497335520662813836153475689941514192291556132651530822259929132413349310461768899915415552 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade039Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade039Part01472 = 25493866584399093029956985706823474644826667086853197942278533644001905723970043520938223688816823328372162560 := by decide +kernel

theorem group_length : firstCenterIntegerGrade039Group002.size = 512 := by
  simp only [firstCenterIntegerGrade039Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade039Group002 = 1161510038879470478051526299741314020148812347860825370565388801776770828556593864647192711173204700896465780736 := by
  simp only [firstCenterIntegerGrade039Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade039Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade039Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
