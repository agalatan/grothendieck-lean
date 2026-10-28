import Grothe.UpperChaos.TaylorFirstIntegerGrade031Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade031Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade031Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade031Part00000 = 1059127088714639499280649215126326654206917542735791984080862526466841023302320879336582152195067395124800318865408 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade031Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade031Part00064 = 699079648894332121640957114060489657157244553613258379458460777760729237162181417774321194873940031788284593045504 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade031Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade031Part00128 = 666445178404262020513260106979558166983866629043974089590390565915795142898120895381889942896920891182572277596160 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade031Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade031Part00192 = 470632748932670659928629624383992948423413485757128666988937732136382158635795624703399263583629161767933057171456 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade031Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade031Part00256 = 221629203027103700591844954693414556620155017090477579759677476822004638062912168039304311110771013941426766479360 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade031Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade031Part00320 = 76916364658537287931996328177052522655585525758574583032340272924702048205196692268965736068972769798365391093760 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade031Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade031Part00384 = 41925442640788619646714953119977223140499742792295646501056180426820672908946513360344161301648785153262738210816 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade031Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade031Part00448 = 18617331367521814568583339734484340708259316327369134343842258936708204584397343949146382480679720727216841031680 := by decide +kernel

theorem group_length : firstCenterIntegerGrade031Group000.size = 512 := by
  simp only [firstCenterIntegerGrade031Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade031Group000 = 3254373006639855724102635636275296069895941813118870063755567791389983125759871534813953144511629769483861983494144 := by
  simp only [firstCenterIntegerGrade031Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade031Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade031Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade031Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
