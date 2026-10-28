import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part01024 = 5976941509643248829392067937409598323672974401548202770937613479657696156939134250685603046734235441682781831168 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part01088 = 5342256872461099057371070343649654680238416056228497866818406239876705852906929569620526373632173034373057085440 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part01152 = 4592503843047213144544656370300379622121272117448434947792593885498099314765838697386199416416552945102025129984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part01216 = 3816554551849475703067213130849237542730299991403805945037714778848810983742348812263010413314989337362472894464 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part01280 = 3081467538235448797547093562452857512344358989606624416791307708235618408649455348067869291614135237556060553216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part01344 = 2429745064864475601575248839823979556161552563276618245694468016152991547513007216402112849047091680261103943680 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part01408 = 1882100598927496165894214244118773005531201303311921634526306172440402579346175951981698926620527226492356132864 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade062Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade062Part01472 = 1441374204559693164209245155845147492329603564386687353332058036064844160322505627726948172802679258445743390720 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group002.size = 512 := by
  simp only [firstCenterIntegerGrade062Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade062Group002 = 28562944183588150463600809584449627735129678987210793180930468316775169004185395474133968490182384161275600961536 := by
  simp only [firstCenterIntegerGrade062Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
